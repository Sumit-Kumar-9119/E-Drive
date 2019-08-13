<%@ Page Language="C#" MasterPageFile="~/E-drive.master" AutoEventWireup="true" CodeFile="help.aspx.cs" Inherits="help" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" type="text/css" />
   <style type="text/css">
       
       .div1 {
       margin-left:auto;
       margin-right:auto;
       margin-top:20px;
       margin-bottom:20px;
       text-align:center;
       height:400px;
       width:1000px;
       background-color:lightgrey;
       border:2px solid grey;
       }
      
    </style>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="body">
    <div>
         <div class="div1">
             <h1>Help</h1>
             <p>
                 The website is developed with an objective to provide a platform for its users which can keep them<br /> in touch with their precious documents <br />
                 ANYTIME, ANYWHERE
             </p>
             <p>
                 In order to Join our community, one must have an account. But don't worry if you don't have so.<br />
                 We'll make a for you<br />
                 For futhur queries Kindly Leave a mail for us at<br />
                 kumar.sumit.9119@gmail.com
             </p>
         </div>
   </div>
   
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="footers">
      <section id="footer">
				<div class="inner">
					<header>
						<h2>Get in Touch</h2>
					</header>
					<form method="post" action="thanks.aspx" runat="server">
						<div class="field half first">
							<label id="lblname" runat="server">Name</label>
							
                            <asp:TextBox runat="server" ID="msgname"></asp:TextBox>
						</div>
						<div class="field half">
							<label id="lblemail" runat="server" >Email</label>
                           
                            <asp:TextBox runat="server" ID="msgemail"></asp:TextBox>
						</div>
						<div class="field">
							<label id="lblmessage" runat="server">Message</label>
							
                            <asp:TextBox runat="server" ID="msgmessage" Height="200px"></asp:TextBox>
						</div>
						<ul class="actions">
							<li>
                                <asp:Button runat="server" ID="sendmessagess" Text="Send Message" CssClass="alt" OnClick="sendmessagess_Click"/>
							</li>
						</ul>
					</form>
					<div class="copyright">	&copy;  E-Drive.in An ISO 9000 2019 certified </div>
				</div>
			</section>
</asp:Content>