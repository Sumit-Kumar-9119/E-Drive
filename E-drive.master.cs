using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class E_drive : System.Web.UI.MasterPage
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void sendmessage_Click(object sender, EventArgs e)
    {
        //if(lblname==null){
        //    lblname.InnerText = "Please enter a Name";
            
        //}
        //if (lblemail == null)
        //{
        //    lblname.InnerText = "Please enter an E-Mail";
        //}
        //if (lblmessage == null)
        //{
        //    lblname.InnerText = "Please enter a Message";
        //}
        //SqlConnection con = new SqlConnection(str);
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //con.Open();
        //cmd.CommandText = "Insert into edrivefeedback values(@name,@email,@message)";
        //cmd.Parameters.AddWithValue("@name", msgname.Text);
        //cmd.Parameters.AddWithValue("@email",msgemail.Text);
        //cmd.Parameters.AddWithValue("@message",msgmessage.Text);
        //cmd.ExecuteNonQuery();
        //con.Close();
        //msgname.Text=null;
        //msgmessage.Text = null;
        //msgemail.Text=null;
    }
}
