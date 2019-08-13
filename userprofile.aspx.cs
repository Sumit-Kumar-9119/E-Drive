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


public partial class userprofile : System.Web.UI.Page
{
    
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            if (Request.QueryString["name"] != null)
                lblmessage.Text = "Welcome to E-Drive   " + Request.QueryString["name"].ToString();
                
            else
                Response.Write("Welcome user");
        }
        else
            Response.Redirect("signin.aspx");
        RepeterData();

        //Image for Profile Picture

        SqlConnection con = new SqlConnection(str);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        string Name = Application["user"].ToString();
        cmd.CommandText = "select * from project where Username=@name";
        cmd.Parameters.AddWithValue("@name", Name);
        con.Open();
        SqlDataReader dr = null;
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                byte[] img = (byte[])dr["Profilepic"];

                string base64string = Convert.ToBase64String(img, 0, img.Length);
                profileimg.ImageUrl = "data:image/jpg/png/jpeg;base64," + base64string;


            }
        }
        con.Close();
    }

    //New document's upload Button Control
    protected void btnupload1_Click(object sender, EventArgs e)
    {
        fileuploading.Visible = true;
        uploaded_content.Visible = false;
    }

    //New document's upload working
    protected void btnupload2_Click(object sender, EventArgs e)
    {
        string Name = Application["user"].ToString();
        if (FileUpload1.HasFile)
        {
            string folderPath = Server.MapPath("~/Files/");
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }
            string fname = txtupload.Text;
            //take name of uploaded file
            string strname = FileUpload1.FileName.ToString();
            //get the type of uploaded file
            string dop = FileUpload1.PostedFile.ContentType;
            //save this file on local machine
            FileUpload1.PostedFile.SaveAs(folderPath + strname);

            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    using (SqlConnection connect = new SqlConnection(str))
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.Connection = connect;
                            connect.Open();
                            cmd.CommandText = "insert into demons values(1,@Data, @Name,@Type,@Date,@username)";
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            cmd.Parameters.AddWithValue("@Name", fname);
                            cmd.Parameters.AddWithValue("@Type", dop);
                            cmd.Parameters.AddWithValue("@Date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@Username", Request.QueryString["name"].ToString());
                            cmd.ExecuteNonQuery();
                            connect.Close();
                            Response.Redirect(Request.Url.AbsoluteUri);
                        }
                    }
                }
            }
        }
        uploaded_content.Visible = true;
    }

    public void RepeterData()
    {
        string Name = Application["user"].ToString();
        SqlConnection connect = new SqlConnection(str);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = connect;
        connect.Open();
        cmd.CommandText = "select * from demons where Username=@name";
        cmd.Parameters.AddWithValue("@name", Name);
        RepeaterDemo.DataSource = cmd.ExecuteReader();
        RepeaterDemo.DataBind();
        connect.Close();
    }   

    //Download Controls through Repeater link
    protected void downloadbtn(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string fileName, contentType;
        using (SqlConnection con = new SqlConnection(str))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Name, Data, Type from demons where ID=@Id";
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["Data"];
                    contentType = sdr["Type"].ToString();
                    fileName = sdr["Name"].ToString();
                }
                con.Close();
            }
        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

    //Changing The Profile Picture
    public void changeprofilepic() {
        string Name = Application["user"].ToString();
        if (picupload.HasFile)
        {
            if (picupload.PostedFile.ContentType == "image/jpg" || picupload.PostedFile.ContentType == "image/jpeg" || picupload.PostedFile.ContentType == "image/png")
            {
                int filelenght = picupload.PostedFile.ContentLength;
                byte[] imagebytes = new byte[filelenght];
                picupload.PostedFile.InputStream.Read(imagebytes, 0, filelenght);
                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Update project set Profilepic=@img where Username=@name";
                cmd.Parameters.AddWithValue("@name", Name);
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@img", imagebytes);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.Url.AbsoluteUri);
                showprofilepic.Visible = true;
                hideprofilepic.Visible = false;
            }
        }
    }
    protected void changeprofilepicture_Click(object sender, EventArgs e)
    {
        showprofilepic.Visible = false;
        hideprofilepic.Visible = true;
    }
    protected void picuploadbtn_Click(object sender, EventArgs e)
    {
        changeprofilepic();
        showprofilepic.Visible = true;
    }
}
