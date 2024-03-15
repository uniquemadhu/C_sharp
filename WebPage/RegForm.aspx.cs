using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text; 

public partial class WebPage_RegForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStr"].ToString());
        if (!IsPostBack)
        {
            refresh();
            FillCaptcha();
          
        }
    }
    private void FillCaptcha()
    {
        Random r = new Random();
        int fn = r.Next(1, 9);
        int sn = r.Next(1, 9);
        int res = fn + sn;
        ViewState["Spam"] = res.ToString() ;
        Lblcap.Text = fn.ToString() + " + " + sn.ToString() + "=";
        Txtcap.Text = "";

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        refresh();
        FillCaptcha();
       
    }

   
    protected void Button1_Click(object sender, EventArgs e)
    {
            string connectionString = "Data Source=.;Initial Catalog=db_regForm;User ID=sa;Password=sql123;"; // Replace with your database connection string
            string email = Txtmail.Text;
            string password = Txtpass.Text;

        string stpspm = ViewState["Spam"].ToString();

        if (Txtcap.Text == stpspm)
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT sign_Masterid, sign_Emailid, sign_Password FROM dbo.tbl_SignIn WHERE sign_Emailid = @Email AND sign_Password = @Password AND sign_ActiveFlag = 1";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {

                            if (reader.Read())
                            {
                                // Login successful
                                //lblMessage.Text = "Login successful!";
                                //lblMessage.ForeColor = System.Drawing.Color.White;
                                //ShowMessageAndRedirect("Successful", "Info.aspx");
                                //Response.Write("Successful");
                                //Response.Redirect("Info.aspx");
                                ShowMessageAndRedirect("Login successful!", "Info.aspx");

                            }
                            else
                            {
                                // Invalid login credentials
                                //lblMessage.Text = "Invalid login credentials";
                                //lblMessage.ForeColor = System.Drawing.Color.White;
                                ShowMessage("Invalid login credentials");
                            }
                           
                        }
                       
                    }
                }
            }
            else
            {
                //lblMessage.Text = "Invalid Captcha";
                ShowMessage("Invalid Captcha");
                //Txtcap.Text = "";
            }
       
        }
 
    protected void Button1_Click1(object sender, EventArgs e)
    {
        refresh();
    }
    protected void refresh()
    {
        Txtmail.Text = "";
        Txtpass.Text = "";
        Txtcap.Text = "";
        lblMessage.Text = "";
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
