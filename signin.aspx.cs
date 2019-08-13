using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class signin : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlConnection connect = new SqlConnection(str);
        connect.Open();
        SqlCommand cmd= new SqlCommand("select * from project where Username='" + txtusername.Text + "' and Password='" + txtpassword.Text + "' ", connect);   
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Session["username"] = txtusername.Text;
            Application["user"] = txtusername.Text;
            Response.Redirect("userprofile.aspx?name=" + txtusername.Text);
        }
        else
            lblmessage.Text = "Incorrect UserName And Password.\nPlease Try Again";
    }
    protected void btnsignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("signup.aspx");
    }
}