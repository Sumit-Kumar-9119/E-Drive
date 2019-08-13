using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class signup : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string gender = "";
        if (rdbtnmale.Checked)
            gender = rdbtnmale.Text;
        else
            gender = rdbtnfemale.Text;

        SqlConnection connect = new SqlConnection(str);
        connect.Open();
        SqlCommand cmd= new SqlCommand("insert into project values('"+txtname.Text+"','"+txtemail.Text+"','"+txtcontact.Text+"','"+gender+"','"+txtdob.Text+"','"+txtchooseusername.Text+"','"+txtcreatepassword.Text+"')",connect);
        int res = cmd.ExecuteNonQuery();
        if (res == 1)
        {
            //Response.Cookies["Name"].Value = txtname.Text;
            Response.Write("Registration Done");
            Response.Redirect("signin.aspx");
        }
        else
            Response.Write("Registration not Done");
        
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("signup.aspx");
    }
}