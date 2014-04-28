using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;


public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            Guid myGuid = Guid.NewGuid();
            MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            Connection.Open();
            string CheckUserName = "select count(*) from Accounts where Username='" + UserName.Text + "'";
            MySqlCommand Command = new MySqlCommand(CheckUserName, Connection);

            int count = Convert.ToInt32(Command.ExecuteScalar().ToString());

            if (count != 0)
            {
                Response.Write("<div class=\"alert alert-danger\">User already exists!</div>");
            }
            else
            {
                string Insert = "insert into accounts (ID,Username, Email, Password) values ('" + myGuid.ToString() + "','" + UserName.Text + "','" + Email.Text + "','" + Password.Text + "' )";
                MySqlCommand InsertCommand = new MySqlCommand(Insert, Connection);
                InsertCommand.ExecuteNonQuery();
                string CreateTraffic = "CREATE TABLE `talexdev`.`" + UserName.Text + "_traffic` (`Url` VARCHAR(1024) NULL,`Time` VARCHAR(45) NULL,`Accepted` VARCHAR(10) NULL);";
                string CreateCustom = "CREATE TABLE `talexdev`.`" + UserName.Text + "_custom` ( `ID` INT NOT NULL AUTO_INCREMENT,`Url` VARCHAR(1023) NULL,PRIMARY KEY (`ID`));";

                MySqlCommand CreateTableCommand = new MySqlCommand(CreateTraffic, Connection);
                CreateTableCommand.ExecuteNonQuery();

                MySqlCommand CreateCustomCommand = new MySqlCommand(CreateCustom, Connection);
                CreateCustomCommand.ExecuteNonQuery();

                Response.Write("<div class=\"alert alert-success\">Registration successful!</div>");
            }

             Connection.Close();
            
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }


    }
}