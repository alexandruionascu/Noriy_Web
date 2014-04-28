using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            using (MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString))
            {
                Connection.Open();
                string InsertQuery = "INSERT INTO feedback VALUES('"+ Name.Text+"' , '"+Email.Text +"' , '"+Message.Text +"');";
                MySqlCommand Command = new MySqlCommand(InsertQuery, Connection);
                Command.ExecuteNonQuery();

                Response.Write("Your message has been sent! Thank you!");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}