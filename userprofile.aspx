<%@ Page Language="C#" MasterPageFile="~/E-drive.master" AutoEventWireup="true" CodeFile="userprofile.aspx.cs" Inherits="userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" type="text/css" />
   <style type="text/css">
     
       .div1 {
       background-color:lightgray;
       float:left;
       height:500px;
       width:400px;
       margin-left:10px;
       margin-top:10px;
       text-align:center;
       border-radius:10px;
       }
       .div12 {
       background-color:olive;
       margin-left:95px;
       margin-right:15px;
       margin-top:50px;
       margin-bottom:50px;
       height:200px;
       width:200px;
       border-radius:98px;
       }
       .div2 {
       background-color:lightgreen;
       height:auto;
       float:left;
       width:auto;
       margin-top:10px;
       margin-bottom:10px;
       margin-left:10px;
       margin-right:10px;
       text-align:center;
       border-radius:5px;
       padding:0px 30px 30px 30px;
       }
       .div21 {
       background-color:none;
       height:auto;
       width:auto;
       border-radius:30px;
       padding:0px 30px 30px 30px;
       }
       
       .uploaddata {
       background-color:lightgray;
       height:auto;
       width:700px;
       margin-left:90px;
       margin-top:40px;
       margin-right:50px;
       border-radius:50px;
       }
       .uploadtext {
        color:blueviolet;
        background-color:aliceblue;
        font-size:x-large;
        margin-top:20px;
        text-align:center;
        flex-align:center;
        width:200px;
        margin-left:250px;
        border-radius:20px;
       }
       .hidepic {
       height:300px;
       width:inherit;
       background-color:aquamarine;
       margin-top:1px;
       padding-top:10px;
       border-radius:20px;
       }
       
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">
    <form runat="server" id="form1">   
         <%--Content Area--%> 
     <div class="row">
        <div style="background-color:lightgoldenrodyellow; height:auto; width:auto">
       
         <%--Left Div--%>
         <div class="div1">


                <div class="div12" id="showprofilepic" runat="server" visible="true">
                    <asp:Image runat="server" ID="profileimg" Height="200px" Width="200px" BorderColor="SkyBlue"/><br />
                     <asp:Label runat="server" ID="lblmessage"></asp:Label><br />
                     <asp:Button runat="server" ID="changeprofilepicture" CssClass="alt" Text="Change Profile Picture" OnClick="changeprofilepicture_Click"/>  
                </div>
                <br />


             <div class="hidepic" id="hideprofilepic" runat="server" visible="false">
                 <p>
                     Choose your favourite picture to set as Profile Picture
                 </p>
                <asp:FileUpload ID="picupload" BorderStyle="Solid" CssClass="alt" runat="server"></asp:FileUpload><br/><br />
                <asp:Button ID="picuploadbtn" runat="server" Text="Change" CssClass="alt" OnClick="picuploadbtn_Click"></asp:Button><br />
                 <asp:Label ID="lblerror" runat="server"></asp:Label>
             </div>
             <br /><br /><br />


             <div style="margin-top:100px;padding-top:20px; background-color:limegreen; border-radius:20px; height:300px; width:auto" runat="server">
                 <p>
                     Upload a new Document
                 </p>
                   <asp:Button  ID="btnupload1" CssClass="alt" onclick="btnupload1_Click" Text="Add now" runat="server"></asp:Button>
                     <br />
             </div>

          </div>
   

         <%--Right div--%>

          <div class="div2">
         <%--Main Content Goes Here--%>      
        
         <div id="uploaded_content" runat="server" class="div21"><br />
            <div id="title" style="border-radius:30px;background-color:greenyellow">
                    <h2>Uploaded Data</h2>
            </div>
         <asp:Repeater ID="RepeaterDemo" runat="server"> 
           <HeaderTemplate >
                <table style="padding:20px 20px 20px 20px">
                   <tr style="background-color:wheat;border:double;height:10px;text-align:center">
                       <td style="border:double"><table style="border:hidden"><tr><td><h4>Name</h4></td></tr></table></td>
                       <td style="border:double"><table style="border:hidden"><tr><td><h4>Type</h4></td></tr></table></td>
                       <td style="border:double"><table style="border:hidden"><tr><td><h4>Preview</h4></td></tr></table></td>
                       <td style="border:double"><table style="border:hidden"><tr><td><h4>Download</h4></td></tr></table></td>                           
                   </tr>
           </HeaderTemplate>
             <ItemTemplate>
                <tr style="border:double;background-color:lightcoral;text-align:center">
                  <td style="border:double">
                     <asp:Label ID="lblName" Text='<%#Eval("Name") %>' runat="server"></asp:Label>
                  </td>
                  <td style="border:double">
                      <asp:Label ID="lblType" runat="server" Text='<%#Eval("Type") %>' Font-Bold="true"/>
                  </td>
                  <td style="border:double">
                    <asp:Image ID="imgPreview" runat="server" ImageUrl='<%# "data:image/jpeg;base64,"+Convert.ToBase64String((byte[])Eval("Data")) %>' Height="100px" Width="100px"/>
                  </td>    
                  <td style="border:double">
                   <asp:LinkButton ID="downloadbtn" runat="server" OnClick="downloadbtn" CommandArgument='<%# Eval ("ID") %>' Text="Download"> </asp:LinkButton>
                  </td>                          
              </tr>
            </ItemTemplate>
            <FooterTemplate>
            </table>
          </FooterTemplate>
         </asp:Repeater>
              </div>

    <%--New upload--%>
      <div runat="server" class="uploaddata" visible="false" id="fileuploading" enableviewstate="false">
       
         <div style="margin-left:100px;float:left;margin-right:100px;width:500px;height:50px;background-color:cornsilk;margin-top:10px;border-radius:20px;font-size:xx-large">
             <h4 style="color:darkslategrey">Data Upload</h4>
         </div>
         
           <div style="margin-left:100px;float:left;margin-right:100px;width:500px;height:60px;margin-bottom:20px;background-color:lavender;margin-top:20px;border-radius:20px;font-size:xx-large">
              <asp:TextBox ID="txtupload" runat="server" BorderColor="#ff0000" placeholder="FILE NAME" Height="60px" Width="500px" CssClass="alt"></asp:TextBox><br/ />
          </div>  
           
          <div style="margin-bottom:20px;">        
          <asp:FileUpload ID="FileUpload1" BorderStyle="Solid" CssClass="alt" Height="60px" Width="500px" runat="server"></asp:FileUpload><br/>
          </div> 
          <asp:Button ID="btnupload2" runat="server" Text="upload" CssClass="alt" OnClick="btnupload2_Click"></asp:Button><br />      
        <%--  <asp:Image ID="Image1" runat="server"></asp:Image>--%>
       </div>         
         </div>

         </div>
      </div>
   </form>
</asp:Content>