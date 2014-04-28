using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class Categories : System.Web.UI.Page
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
            //Display Categories to Gridview
            MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
            Connection.Open();
            MySqlDataAdapter Adapter = new MySqlDataAdapter("SELECT * FROM categories", Connection);
            DataTable Dt = new DataTable();

            Adapter.Fill(Dt);

            if (Dt.Rows.Count > 0)
            {
                GridView1.DataSource = Dt;
                GridView1.DataBind();
            }
            
            //End of displaying categories
            if(Session["GUID"] != null)
            {
                MySqlDataAdapter Adapter2 = new MySqlDataAdapter("SELECT * FROM category_links WHERE User_ID='"+Session["GUID"].ToString()+"';",Connection);
                DataTable Dt2 = new DataTable();

                Adapter2.Fill(Dt2);
                if (Dt2.Rows.Count > 0)
                {
                    foreach (DataRow Row  in Dt2.Rows)
                    {
                        int index = (int)Row["Category_ID"];
                        CheckBox chk = (CheckBox)(GridView1.Rows[index].FindControl("checkBox1"));
                        chk.Checked = true;

                    }
                    
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Database Connection failed!");
        }

        
            
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (Session["GUID"] != null)
        {
            try
            {
                CheckBox chk = (CheckBox)sender;
                GridViewRow row = (GridViewRow)chk.Parent.Parent;
                int index = row.RowIndex;
                MySqlConnection Connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["RegisterConnectionString"].ConnectionString);
                Connection.Open();

                if (chk.Checked == true)
                {
                    string Insert = "INSERT INTO category_links(User_ID,Category_ID) VALUES('" + Session["GUID"].ToString() + "','" + index.ToString() + "');";
                    MySqlCommand Command = new MySqlCommand(Insert, Connection);
                    Command.ExecuteNonQuery();
                }
                else
                {
                    string Delete = "DELETE FROM category_links WHERE User_ID='"+Session["GUID"]+"' AND Category_ID='"+index.ToString()+"';";
                    MySqlCommand Command = new MySqlCommand(Delete,Connection);
                    Command.ExecuteNonQuery();

                }
                Connection.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
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