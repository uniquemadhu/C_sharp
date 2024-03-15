<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/regMasterPage.master" AutoEventWireup="true" CodeFile="Studreg.aspx.cs" Inherits="WebPage_Studreg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <script src="../ASPX_Styles/js/jquery.min.js"></script>
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>
   
       
        <div class="container" style="border: 3px solid black; padding: 30px; background-color:lightsteelblue;">
                 <div class="row" style="font-size: 20px">
                      <br />
                        <div class="col-md-4">
                         </div>
                     <div class="col-md-4" style="text-align: center">
                     <asp:Label ID="Label6" runat="server" Text="REGISTRATION PAGE" ForeColor="blue"></asp:Label>
                     </div>
                     <br />
                     <br />
                      <div class="row" style="font-size: 19px">
                      <br />
                        <div class="col-md-4">
                         </div>
                      
                             <div class="col-md-2" style="text-align: center">
                        <asp:Label ID="Label4" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>     
                        <asp:Label ID="Lblname" runat="server" Text="Student Name  :" style="font-size:large" class="text-center p-2" ></asp:Label>
                             </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="Txtname" runat="server"  onkeypress="return isAlphabetKey(event)" Width="150px"></asp:TextBox>
                             <asp:requiredfieldvalidator runat="server" errormessage="Please Enter name" ControlToValidate="Txtname"></asp:requiredfieldvalidator>
                               <asp:RegularExpressionValidator ID="revStudentName" runat="server"
                                        ControlToValidate="Txtname"
                                        ValidationExpression="^[a-zA-Z\s]*$"
                                        ErrorMessage="Invalid student name. Only alphabets are allowed."
                                        CssClass="error-message"
                                        Display="Dynamic">
                            </asp:RegularExpressionValidator>

                            <script type="text/javascript">
                                function isAlphabetKey(evt) {
                                    var charCode = (evt.which) ? evt.which : event.keyCode;
                                    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode !== 32) {
                                        return false;
                                    }
                                    return true;
                                }
                            </script>        
                        <br />
                        <br />
                    </div>
                  </div>


       <div class="row" style="font-size: 19px">
            <div class="col-md-4">
            </div>
            <div class="col-md-2" style="text-align: center">
                    <asp:Label ID="Label5" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                    <asp:Label ID="Lblusn" runat="server" Text="Student USN  :" style="font-size:large" class="text-center p-3"></asp:Label>
                 </div>
            <div class="col-md-6">
                    <asp:TextBox ID="Txtusn" runat="server" Width="150px"></asp:TextBox>
                    <asp:requiredfieldvalidator runat="server" errormessage="Please Enter USN"  ControlToValidate="Txtusn"></asp:requiredfieldvalidator>
                    <br />
                    <br />
                </div>
        </div>
            


           <div class="row" style="font-size: 19px">
            <div class="col-md-4">
            </div>
               <div class="col-md-2" style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                    <asp:Label ID="Lblmail" runat="server" Text="Student Email  :" style="font-size:large" class="text-center p-3"></asp:Label>
                   </div>
             <div class="col-md-6">
                    <asp:TextBox ID="Txtmail" runat="server" Width="150px"  onkeypress="return validateEmailKeyPress(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter email Id" ControlToValidate="Txtmail"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Txtmail"></asp:RegularExpressionValidator>
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
                  </div>
              </div>     
                 
                  <br />
               
             
                         
          <div class="row" style="font-size: 19px">
            <div class="col-md-4">
            </div>
            <div class="col-md-2" style="text-align: center">
                        <asp:Label ID="Lblcon" runat="server" Text="Contact :" style="font-size:large" class="text-center p-3"></asp:Label>
                </div>
                     <div class="col-md-6">
                        <asp:TextBox ID="Txtcon" runat="server" MaxLength="10" onkeypress="return isNumberKey(event)" Width="150px"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="revContactNumber" runat="server" 
                                ControlToValidate="Txtcon" 
                                ValidationExpression="^\D*\d{10}\D*$" 
                                ErrorMessage="Invalid contact number. It should be 10 digits." 
                                CssClass="error-message"
                                Display="Dynamic">
                        </asp:RegularExpressionValidator>
                        <script type="text/javascript">
                            function isNumberKey(evt) {
                                var charCode = (evt.which) ? evt.which : event.keyCode;
                                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                                    return false;
                                }
                                return true;
                                    }
                            </script>
                    <br />
                    
                </div>
             </div>

            <div class="row" style="font-size: 15px">
            <div class="col-md-4">
            </div>
            <div class="col-md-2" style="text-align: center">
                    <asp:Label ID="Lbldep" runat="server" Text="Department  :" style="font-size:large" class="text-center p-3"></asp:Label>
                </div>
                 <div class="col-md-6">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="150px">
                         <asp:ListItem Text="Select Department" Value="select" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="MCA" Value="MCA"></asp:ListItem>
                            <asp:ListItem Text="MBA" Value="MBA"></asp:ListItem>
                            <asp:ListItem Text="BE" Value="BE"></asp:ListItem>
                    </asp:DropDownList>
                        <br />
                    <br />
              </div> 
                </div>


             <div class="row" style="font-size: 19px">
            <div class="col-md-4">
            </div>
            <div class="col-md-2" style="text-align: center">
                    <asp:Label ID="Lbladd" runat="server" Text="Address  :" style="font-size:large" class="text-center p-3"></asp:Label>
                </div>
                   <div class="col-md-6">
                    <asp:TextBox ID="Txtadd" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                             <br />
                         <br />
                       </div>
            </div>


            <div class="row" style="font-size: 19px">
            <div class="col-md-4">
            </div>
                  <div class="col-md-2" style="text-align: center">
                         <asp:Label ID="Label2" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                         <asp:Label ID="Lblpass" runat="server" Text="password  :" style="font-size:large" class="text-center p-3"></asp:Label>
                </div>
                <div class="col-md-6">
                         <asp:TextBox ID="Txtpass" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                        
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="Txtpass"></asp:RequiredFieldValidator>
                    <br />
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Password" ValidationExpression="^[a-zA-Z0-9!@#$%^&*()_+]+$" ControlToValidate="Txtpass"></asp:RegularExpressionValidator>
                        
                 </div>
            </div>
             <br />

         <div class="row" style="font-size: 19px">
            <div class="col-md-4">
            </div>
            <div class="col-md-2" style="text-align: center">
                         <asp:Label ID="Label3" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                         <asp:Label ID="LblConpass" runat="server" Text="Confirm password  :" style="font-size:large" class="text-center p-3"></asp:Label>
                </div>
             <div class="col-md-6">
                         <asp:TextBox ID="TxtConpass" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                        
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Confirm Password" ControlToValidate="TxtConpass"></asp:RequiredFieldValidator>
                         <asp:CompareValidator ID="cvPasswordMatch" runat="server" 
                                ControlToValidate="TxtConpass" 
                                ControlToCompare="Txtpass" 
                                 ErrorMessage="Password and Confirm Password must match." 
                                CssClass="error-message"
                                Display="Dynamic">
                         </asp:CompareValidator>
                 </div>
             </div>
                         <br />
                     <br />
                 <div class="row">
                        <div class="col-md-5 aligntext ">

                            <asp:Label ID="Label9" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lblPhoto" runat="server" Text="Upload Image:" Font-Bold="true" style="font-size:large"></asp:Label>
                            <br />
                           <asp:Label ID="lblPho" runat="server" Text="(Once you select photo, Please Wait for upload)" Font-Size="8.5pt" Font-Bold="true" CssClass="LabelStyle" ForeColor="blue"></asp:Label>
                            <br />
                            <asp:Label ID="lblP" runat="server" Text="(only .jpg, .png, .jpeg formats allowed)" Font-Size="8.5pt" Font-Bold="true" CssClass="LabelStyle" ForeColor="blue"></asp:Label>

                        </div>                  
                        <div class="col-md-4">

                            <asp:FileUpload ID="filephoto" onchange="ShowImagePreview(this);" runat="server" style="font-size:large"></asp:FileUpload>
                            <a id="A2" runat="server" visible="false" target="_blank"></a>
                            <br />
                            <asp:Image ID="PreviewImage" runat="server" Width="150px" ImageUrl="../ASPX_Images/Uploads-image.png" />
                         
                            <asp:Label ID="lblPath" runat="server" CssClass="LabelStyles" Visible="true"></asp:Label> <br />
                       
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="filephoto"
                                Enabled="true" CssClass="LabelStyleRequired" ErrorMessage="Upload Photo"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:label ID="lblPat" runat="server" text=""></asp:label>
                              </div>
                        </div>
                              <br />
                           
                          

            <br />
         <div class="col-md-9">
            <div class="col-md-6">
                <br />
            </div>
            <div class="col-md-2" style="text-align: center">
                             <asp:Button ID="Btnsub" runat="server" Text="SUBMIT"   style="font-size:medium" OnClick="Btnsub_Click"/>
             </div>
                               <div class="col-md-2" style="text-align: center">    
                             <asp:Button ID="Btnreset" runat="server" Text="RESET"  CausesValidation="false" style="font-size:medium" OnClick="Btnreset_Click">   
                             </asp:Button>
                            <br />
                            <br />
                       </div>
                     <br />
            </div>
            </div>
                         
            </div>
                  
                
        
  
      
            
</asp:Content>

