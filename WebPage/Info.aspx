<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/InfoMasterPage.master" AutoEventWireup="true" CodeFile="Info.aspx.cs" Inherits="WebPage_Dem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
    .gridview-style {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .gridview-style th, .gridview-style td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    .gridview-style th {
        background-color: darkblue;
        color: white;
    }

    .gridview-style tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .gridview-style tr:hover {
        background-color: #ddd;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   
    <div class="container" style="font-size: 20px"> 
    <asp:gridview runat="server" id="stdgrid" CssClass="gridview-style">
        
    </asp:gridview>
     </div>
              <div style=" font-size:medium; margin-top:10px; text-align:right">
            <div>
                <asp:button id="BtnAdd" style="margin-top: 20px; margin-right: 5%; width: 90px" runat="server" text="Add" onclick="BtnAdd_Click"/>
                 <asp:button id="Btnout" style="margin-top: 20px; margin-right: 5%; width: 90px" runat="server" text="Log out" onclick="Btnout_Click"/>
            </div>
         </div>
    <br />
      
                                

</asp:Content>



