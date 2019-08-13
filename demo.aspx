<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/E-drive.master" CodeFile="demo.aspx.cs" Inherits="demo" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" type="text/css" />
     <style type="text/css">
         div {
         border-radius:20px
         }
        
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
      <div class="row">
       <div class="col-sm-8">
        <div class="div1">
            <asp:Table runat="server" BorderColor="White">
                <asp:TableHeaderRow BorderColor="White">
                    <asp:TableHeaderCell BorderColor="White">
                        Name
                    </asp:TableHeaderCell>
                    <asp:TableHeaderCell>
                        Roll no.
                    </asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableFooterRow>
                    <asp:TableCell>
                        Sumit
                    </asp:TableCell>
                    <asp:TableCell>
                        Naman
                    </asp:TableCell>
                </asp:TableFooterRow>
            </asp:Table>
        </div>
      </div>
    <div class="col-sm-4" >
    </div>
   </div>
 </form>

</asp:Content>
