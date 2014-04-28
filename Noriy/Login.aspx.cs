using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            Connection.Open();
            string CheckUserName = "select count(*) from accounts where Username='" + Username.Text + "'";
            MySqlCommand Command = new MySqlCommand(CheckUserName, Connection);
            int count = Convert.ToInt32(Command.ExecuteScalar().ToString());

            if (count != 0) //if user exists
            {
                string PaswordQuery = "select Password from Accounts where Username='" + Username.Text + "'";
                MySqlCommand PassCheck = new MySqlCommand(PaswordQuery, Connection); ;
                string password = PassCheck.ExecuteScalar().ToString().Replace(" ", "");

                if (password == Password.Text)
                {
                    Session["New"] = Username.Text;
                    MySqlCommand GetGUID = new MySqlCommand("select ID from Accounts where Username='" + Username.Text + "'",Connection);
                    string GUID = GetGUID.ExecuteScalar().ToString();
                    Session["GUID"] = GUID;
                    Response.Redirect("Admin.aspx");
                }
                else Response.Write("<div class=\"alert alert-warning\">Password is invalid!</div>");
            }
            else Response.Write("<div class=\"alert alert-warning\">Username is not valid!</div>");

            Connection.Close();

        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}