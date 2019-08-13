<%@ Page Language="C#" MasterPageFile="~/E-drive.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

<asp:Content runat="server" ContentPlaceHolderID="body" ID="content1">
    <form runat="server" id="form1">
       <div>
           <div style="margin-left:auto; margin-right:auto;border-radius:20px; margin-top:20px; text-align:center; height:450px; width:500px; background-color:lightgrey; border:2px solid grey">
                    <div style="margin-top:50px; margin-left:45px; margin-right:40px; margin-bottom:30px; text-align:center;border-radius:20px">
                       <asp:TextBox runat="server" CssClass="field" ID="txtusername" placeholder="USERNAME" required="required" width="400px"  BorderColor="#333333" BorderStyle="Solid" Height="80px" ></asp:TextBox>
                   </div> 
                   <div style="margin-top:20px; margin-left:45px; margin-right:40px; margin-bottom:30px; text-align:justify">
                   <asp:TextBox runat="server" ID="txtpassword" placeholder="PASSWORD" required="required" TextMode="Password" width="400px" BorderColor="#333333" BorderStyle="Solid" Height="80px" ></asp:TextBox>
                   </div>
               <asp:button runat="server" id="btnlogin" CssClass="alt" text="log-in" OnClick="btnlogin_Click" />&nbsp&nbsp&nbsp&nbsp&nbsp
               <asp:Button runat="server" ID="btnsignup" CssClass="alt" Text="sign-up" OnClick="btnsignup_Click" />
               <br /><br />
               <asp:Label runat="server" ID="lblmessage" ForeColor="Red" Font-Bold="True" Font-Size="Large"></asp:Label>
            </div>
        </div>                                        
    </form>

</asp:Content>