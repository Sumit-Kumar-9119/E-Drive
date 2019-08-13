<%@ Page Language="C#" MasterPageFile="~/E-drive.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
   <style type="text/css">
        .t{
        border-color:lightgrey;
        }
       .div1 {
       margin-left:auto;
       margin-right:auto;
       margin-top:20px;
       text-align:center;
       height:auto;
       width:660px;
       background-color:lightgrey;
       border:2px solid grey;
       }
       .table1 {
       border-color:lightgrey;
       width:100px;
       }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="body">


<form runat="server">
    <div>
         <div class="div1">
            <h1>SIGN-UP FORM</h1>
             <table class="table1">
      <tr class="t">
        <td>Name:</td>
        <td><asp:TextBox ID="txtname" runat="server" TextMode="SingleLine" Width="500px"></asp:TextBox></td>
        <td><asp:Label ID="lblname" runat="server" Text=" "></asp:Label></td>
      </tr>
 
      <tr class="t">
         <td>Email:</td>
         <td><asp:TextBox ID="txtemail" required="required" runat="server" Width="500px"></asp:TextBox></td>
         <td><asp:Label ID="lblemail" runat="server" Text=" "></asp:Label></td>
      </tr>
     
      <tr class="t">
        <td>Contact:</td>
        <td><asp:TextBox ID="txtcontact" required="required" runat="server" TextMode="SingleLine"  Width="500px" Text="+91"></asp:TextBox></td>
        <td><asp:Label ID="lblcontact" runat="server" Text=" "></asp:Label></td>
      </tr>
     
      <tr class="t">
            <td>Gender:</td>
            <td><asp:RadioButton ID="rdbtnmale" Text="Male" GroupName="gender" runat="server"  Width="90px" />
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:RadioButton ID="rdbtnfemale" Text="Female" GroupName="gender" runat="server"  Width="90px" /></td>
      </tr>
     
      <tr class="t">
           <td>Date of Birth:</td>
           <td><asp:TextBox ID="txtdob" required="required" runat="server" TextMode="Date"  Width="500px"></asp:TextBox> </td>   
           <td><asp:Label ID="lbldob" runat="server" Text=" "></asp:Label></td>          
      </tr>
      
      
      <tr class="t">
            <td>Choose username:</td>
            <td><asp:TextBox ID="txtchooseusername" required="required" runat="server"  Width="500px"></asp:TextBox></td>
            <td><asp:Label ID="lblchooseusername" runat="server" Text=" "></asp:Label></td> 
      </tr>
     
      <tr class="t">
          <td>Create Password:</td>
          <td><asp:TextBox ID="txtcreatepassword" required="required" runat="server" TextMode="Password"  Width="500px"></asp:TextBox></td>
          <td><asp:Label ID="lblcreatepassword" runat="server" Text=" "></asp:Label></td> 
      </tr>
     
      <tr class="t">
          <td>Confirm Password:</td>
          <td><asp:TextBox ID="txtconfirmpassword" required="required" runat="server"  Width="500px" TextMode="Password"></asp:TextBox>
              <asp:Label ID="lblconfirmpassword" runat="server" Text=" "></asp:Label>
              <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtcreatepassword" 
                ControlToValidate="txtconfirmpassword" ErrorMessage="Password does not match" ForeColor="Red"></asp:CompareValidator>
          </td>
     </tr>
     <tr class="t">
         <td></td>
         <td><asp:Button ID="btnsubmit" CssClass="alt"  OnClick="btnsubmit_Click" runat="server" Text="SUBMIT"/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
             <asp:Button ID="btnreset" CssClass="alt" OnClick="btnreset_Click" runat="server" Text="RESET"/>
             <%--<td></td>--%>
         </td>
     </tr>
    </table>
    </div>
 </div>
</form>
</asp:Content>