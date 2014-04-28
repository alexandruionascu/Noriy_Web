using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["New"] != null)
            {
                NameLabel.Text = Session["New"].ToString();
                LoadFirstRow();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }


    protected void LinkButtonSettings_Click(object sender, EventArgs e)
    {
        Response.Redirect("Settings.aspx");
    }

    protected void LinkButtonLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Login.aspx");
    }

    protected void LoadFirstRow()
    {
        string username = Session["New"].ToString();

        //Load Backlist Length Label Value
        string BlacklistQuery = "select count(*) from " + username + "_custom;";
        Blocked.Text = Count(BlacklistQuery).ToString();

        //Load Traffic Label Value
        string TrafficQuery = "select count(*) from " + username + "_traffic";
        Traffic.Text = Count(TrafficQuery).ToString();

        //Load Categories 
        string CategoriesQuery = "select count(*) from category_links where User_ID='" + Session["GUID"].ToString() + "';";
        Categories.Text = Count(CategoriesQuery).ToString();

        //Load Blocked Attempts
        string BlockedQuery = "select count(*) from " + username + "_traffic where Accepted=\"False\";";
        Attempts.Text = Count(BlockedQuery).ToString();


    }

    private int Count(string Query)
    {
        try
        {

            using (MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString))
            {
                Connection.Open();
                MySqlCommand Command = new MySqlCommand(Query, Connection);
                int count = Convert.ToInt32(Command.ExecuteScalar().ToString());
                return count;
            }
        }
        catch (Exception ex)
        {
            return 0;
            Response.Write(ex.ToString());
        }
    }
}