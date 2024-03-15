<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/TestingMasterPage.master" AutoEventWireup="true" CodeFile="RegForm.aspx.cs" Inherits="WebPage_RegForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

   
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="container" style="border: 3px solid black; padding: 30px; background-color:darkslateblue;">
          <div class="row" style="font-size: 20px">
          
            <div class="col-md-4">
                </div>
            <div class="col-md-4" style="text-align: center">
            <asp:Label ID="Label6" runat="server" Text="LOGIN PAGE" ForeColor="LightBlue"></asp:Label>
            </div>
            <br />
     <div class="row" style="font-size: 15px">

       <br />
        <div class="col-md-4">
            </div>
                     
      <div class="col-md-2" style="text-align: center">
            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>  
            <asp:Label ID="Lblmail" style="font-size:medium" CssClass="alert-link" runat="server" Text="Email Id :"></asp:Label>
         </div>
     <div class="col-md-6">
         <asp:TextBox ID="Txtmail" runat="server" CssClass="alert-danger" Width="200px" onkeypress="return validateEmailKeyPress(event)"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter emailId" ControlToValidate="Txtmail"></asp:RequiredFieldValidator>
         <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txtmail"></asp:RegularExpressionValidator>
        </div>
  </div>
         <script type="text/javascript">
             function validateEmailKeyPress(event) {
                 var charCode = (event.which) ? event.which : event.keyCode;
                 if (charCode === 32) {
                     // Prevent space character (white space) from being entered
                     return false;
                 }
                 return true;
             }
</script>
        <br />

        <div class="row" style="font-size: 15px">
       <br />
        <div class="col-md-4">
            </div>
                     
      <div class="col-md-2" style="text-align: center">
        <asp:Label ID="Label4" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
    <asp:Label ID="Lblpass" runat="server" style="font-size:medium" Text="Password:"></asp:Label>
        </div>
     <div class="col-md-6">
    <asp:TextBox ID="Txtpass" runat="server"  style="font-size:medium" TextMode="Password" CssClass="alert-danger" Width="200px"></asp:TextBox>  
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="Txtpass"></asp:RequiredFieldValidator>
<br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Password" ValidationExpression="^[a-zA-Z0-9!@#$%^&*()_+]+$" ControlToValidate="Txtpass"></asp:RegularExpressionValidator>
           </div>
        </div>
         <br />
  
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

     <div class="row" style="font-size: 15px">
       <br />
        <div class="col-md-3">
            </div>
                     
      <div class="col-md-3" style="text-align: center">
            <asp:Label ID="Label5" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
        <asp:Label ID="Label1" runat="server" Text="Enter sum of 2 numbers :"  style="font-size:medium"></asp:Label>  
        <asp:Label ID="Lblcap" runat="server" Text="Label" style="font-size:medium"></asp:Label>
             </div>
     <div class="col-md-6">
        <asp:TextBox ID="Txtcap" runat="server" CssClass="alert-danger" Width="200px"></asp:TextBox> 
        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClick="LinkButton1_Click" >
            <i style="font-size:21px;" class="fa fa-refresh"></i>
        </asp:LinkButton>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Captcha" ControlToValidate="Txtcap"></asp:RequiredFieldValidator>
                 </div>
             
    </div>  
         </ContentTemplate>
    </asp:UpdatePanel>
    
        <br />
        <br />
       
        <div class="col-md-9">
            <div class="col-md-6">
            </div>
            <div class="col-md-3" style="text-align: center">
    <asp:Button ID="BtnSign" runat="server" Text="Login" style="font-size:medium; background-color:black"  OnClick="Button1_Click" />
         </div>
            <div class="col-md-1" style="text-align: center">  
        <asp:Button ID="Button1" runat="server" Text="Reset"  style="font-size:medium; background-color:black" CausesValidation="false" OnClick="Button1_Click1"/>
        <br />
        <br />
           </div>
         <div class="col-md-12">
            <div class="col-md-6">
            </div>
            <div class="col-md-5" style="text-align: center">
                     
        <asp:Label ID="Label2" runat="server" Text="Don't have account?"></asp:Label>
        <a href="Studreg.aspx" style="font-size:medium">SIGN UP</a>
                </div>
       
        <br />
        <br />
              </div>
            </div>
         <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="White"></asp:Label>
      
        <br />
            </div>
     
    </div>
    
</asp:Content>


