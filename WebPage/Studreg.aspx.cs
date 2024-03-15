using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class WebPage_Studreg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UploadImage();
        }
    }
    #region UploadImage
    public void UploadImage()
    {
        try
        {
            string filename = System.IO.Path.GetFileName(filephoto.PostedFile.FileName);
            string randomno = DateTime.Now.Ticks.ToString();
            HttpPostedFile file = filephoto.PostedFile;
            if ((file != null) && (file.ContentLength > 0))
            {
                int iFileSize = file.ContentLength;
                if (iFileSize <= 2097152)
                {
                    string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
                    if (sImageFileExtension == ".gif" || sImageFileExtension == ".png" || sImageFileExtension == ".jpg" || sImageFileExtension == ".jpeg" || sImageFileExtension == ".bmp")
                    {
                        string newfilename = randomno + sImageFileExtension;

                        string strFPath = "~/RegPhoto/" + newfilename;
                        filephoto.PostedFile.SaveAs(Server.MapPath(strFPath));
                        lblPath.Text = strFPath;

                    }
                    else
                    {
                        ShowMessage("Please Select Valid Photo");
                        // lblPath.Text = "Please Select Valid Photo";

                    }
                }
                else
                {
                    CompressAndUploadPhoto(filephoto);
                }
            }
            else
            {
                ShowMessage("Please Select Valid Photo");

                //lblPath.Text = "Please Select Valid Photo";

            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
    }
    #region CompressImage
    protected void CompressAndUploadPhoto(FileUpload FileUploadImg)
    {
        try
        {

            if (FileUploadImg.HasFile)
            {
                string filename = FileUploadImg.FileName;

                string directory = Server.MapPath("~/RegPhoto/");

                Bitmap originalBMP = new Bitmap(FileUploadImg.FileContent);

                int newWidth = 150;
                int newHeight = newWidth;

                double actualHeight = originalBMP.Height;
                double actualWidth = originalBMP.Width;
                double maxHeight = 600.0;
                double maxWidth = 800.0;
                double imgRatio = actualWidth / actualHeight;
                double maxRatio = maxWidth / maxHeight;
                double compressionQuality = 0.5;
                if (actualHeight > maxHeight || actualWidth > maxWidth)
                {
                    if (imgRatio < maxRatio)
                    {
                        imgRatio = maxHeight / actualHeight;
                        actualWidth = imgRatio * actualWidth;
                        actualHeight = maxHeight;
                    }
                    else if (imgRatio > maxRatio)
                    {
                        imgRatio = maxWidth / actualWidth;
                        actualHeight = imgRatio * actualHeight;
                        actualWidth = maxWidth;
                    }
                    else
                    {
                        actualHeight = maxHeight;
                        actualWidth = maxWidth;
                    }
                }

                newWidth = Convert.ToInt16(actualWidth);
                newHeight = Convert.ToInt16(actualHeight);
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                Graphics oGraphics = Graphics.FromImage(newBMP);
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

                Random rm = new Random();
                string randomno = rm.Next(11111, 99999).ToString();
                string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
                string newfilename = randomno + sImageFileExtension;
                string strPath = directory + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath = "~/RegPhoto/" + randomno + sImageFileExtension;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../oops.aspx");
        }
    }
    #endregion
    #endregion
  
    protected void Btnreset_Click(object sender, EventArgs e)
    {
        refresh();
    }
    protected void Btnsub_Click(object sender, EventArgs e)
    {
        string name = Txtname.Text;
        string usn = Txtusn.Text;
        string email = Txtmail.Text;
        string address = Txtadd.Text;
        string department = DropDownList1.Text;
        string phone = Txtcon.Text;
        string password = Txtpass.Text;
        string image = lblPath.Text;
        string confirmPassword = TxtConpass.Text;


        if (password != confirmPassword)
        {
            ShowMessage("Password and Confirm Password do not match.");
            return;
        }
        string connectionString = "Data Source=.;Initial Catalog=db_regForm;User ID=sa;Password=sql123;";
        if (filephoto.HasFile)
        {
            string fileExtension = System.IO.Path.GetExtension(filephoto.FileName).ToLower();

            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
            {
                string filePath = "~/RegPhoto/" + usn + fileExtension; // Update the path as needed
                filephoto.SaveAs(Server.MapPath(filePath));

                     using (SqlConnection connection = new SqlConnection(connectionString))
                     {
                           connection.Open();

                        // Insert user information into the Users table
                        string query = "INSERT INTO dbo.tbl_registrationForm (reg_StudentUsn,reg_StudentName,reg_StudentEmail,reg_StudentContact,reg_StudentDept,reg_StudentAdrs,reg_StudentImage,reg_Pass,reg_cnfrpass,reg_StudentActiveFlag)" +
                                       "VALUES (@usn,@Name,  @Email, @Phone, @Department,@Address,@image,@Password,@confirmPassword,1)";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@Name", name);
                            command.Parameters.AddWithValue("@usn", usn);
                            command.Parameters.AddWithValue("@Email", email);
                            command.Parameters.AddWithValue("@Address", address);
                            command.Parameters.AddWithValue("@Department", department);
                            command.Parameters.AddWithValue("@Phone", phone);
                            command.Parameters.AddWithValue("@image", filePath);
                            command.Parameters.AddWithValue("@confirmPassword", confirmPassword);
                            command.Parameters.AddWithValue("@Password", password);

                            command.ExecuteNonQuery();
                        }

              
                      }
            

                     string query1 = "INSERT INTO dbo.tbl_SignIn(sign_Emailid,sign_Password,sign_ActiveFlag)" +
                                             "VALUES (@Email,@Password,1)";
                     using (SqlConnection connection = new SqlConnection(connectionString))
                     {

                         using (SqlCommand command = new SqlCommand(query1, connection))
                         {
                             command.Parameters.AddWithValue("@Email", email);
                             command.Parameters.AddWithValue("@Password", password);

                             connection.Open();
                             command.ExecuteNonQuery();
                         }

             
                         //Response.Redirect("RegForm.aspx");
                     }

                        ShowMessageAndRedirect("Registration successful!", "RegForm.aspx");

        }
        else
            {
                lblPat.Text = "Invalid file type. Please upload a JPG or PNG image.";

            }
    }
        else
        {
            lblPat.Text = "Please select an image to upload.";
        }
    }





    protected void refresh()
    {
        Txtname.Text = "";
        Txtusn.Text = "";
        Txtmail.Text = "";
        Txtcon.Text = "";
        DropDownList1.SelectedIndex = -1;
        Txtadd.Text = "";
        Txtpass.Text = "";
        TxtConpass.Text = "";
        lblPath.Text = "";
    }

    
   

    public void ShowMessage(string msg)
    {
        String Message = "alert('" + msg + "');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", Message, true);
    }


    private void ShowMessageAndRedirect(string msg, string url)
    {
        try
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("function Redirect()");
            sb.Append("{");
            sb.Append(" window.location.href='" + url + "'");
            sb.Append("}");
            sb.Append("alert('" + msg + "');");
            sb.Append("setTimeout('Redirect()',1000);");
            Response.Write("<script>" + sb + "</script>");
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            //Response.Redirect("oops.aspx");
        }
    } 
}