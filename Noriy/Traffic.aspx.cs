using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

public partial class Manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
         {

            if (Session["New"] != null)
            {
                NameLabel.Text = Session["New"].ToString();
                BindData();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
         }
    }

    private void BindData()
    {
        try
        {
            MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            Connection.Open();
            MySqlDataAdapter Adapter = new MySqlDataAdapter("SELECT * FROM "+Session["New"]+"_traffic", Connection);
            DataTable Dt = new DataTable();

            Adapter.Fill(Dt);

            if (Dt.Rows.Count > 0)
            {
                GridView1.DataSource = Dt;
                GridView1.DataBind();
            }

            Connection.Close();

        }
        catch (Exception ex)
        {
            Response.Write("Database Connection failed!");
        }

    }

    protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Search();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Search();
    }

    private void Search()
    {
        //TODO: REMOVE THE SPACES AT THE BEGINNING OF THE TEXT!!!!!!!!
        //Search in the database and bind the results to the gridview
        Panel1.Visible = false;

        try
        {
            MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            Connection.Open();
            MySqlDataAdapter Adapter = new MySqlDataAdapter("SELECT * FROM " + Session["New"] + "_traffic WHERE Url LIKE '%" + TextBox1.Text + "%' ", Connection);
            DataTable Dt = new DataTable();

            Adapter.Fill(Dt);

            if (Dt.Rows.Count > 0)
            {
                // GridView1.DataSource = null; // clears the previous data
                GridView1.DataSource = Dt;
                GridView1.DataBind();
            }
            else
            {
                BindData();
                Panel1.Visible = true;

            }


            GridView1.PageIndex = 0;
            Connection.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Database Connection failed!");
        }
    }

    protected void LinkButtonProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("Profile.aspx");
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

}