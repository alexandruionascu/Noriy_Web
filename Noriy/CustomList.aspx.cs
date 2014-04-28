using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

public partial class CustomList : System.Web.UI.Page
{ 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            NameLabel.Text = Session["New"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        try
        {
            MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            Connection.Open();
            MySqlDataAdapter Adapter = new MySqlDataAdapter("SELECT * FROM " + Session["New"] + "_custom", Connection);
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            try
            {
                MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
                Connection.Open();
                string Insert = "INSERT INTO " + Session["New"] + "_custom(Url) VALUES('" + TextBox1.Text + "');";
                MySqlCommand Command = new MySqlCommand(Insert, Connection);
                Command.ExecuteNonQuery();

                Connection.Close();
                //TODO: Replace with BindData()
                Page.Response.Redirect(Page.Request.Url.ToString(), true);

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }


        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string url = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1")).Text;
            string Delete = "DELETE FROM "+Session["New"]+"_custom  WHERE Url='"+url+"'";
            MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            Connection.Open();
            MySqlCommand Command = new MySqlCommand(Delete,Connection);
            Command.ExecuteNonQuery();
            Connection.Close();
            //TODO: Replace with BindData()  
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
          

        }
        catch(Exception ex)
        {
            Response.Write(ex.ToString());
        }
       
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindData();
       
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridView1.EditIndex = -1;
        //Check if is not null
        string url = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
        string ID = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label2")).Text;
        string Update = "UPDATE " + Session["New"] + "_custom SET Url='" + url + "' WHERE ID='"+ID+"';";
        MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
        Connection.Open();
       
        MySqlCommand Command = new MySqlCommand(Update, Connection);
        Command.ExecuteNonQuery();
        Connection.Close();
        BindData();
        
        
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