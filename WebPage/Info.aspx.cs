using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPage_Dem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            string conString = "Data Source=.;Initial Catalog=db_regForm;User ID=sa;Password=sql123;"; 

            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = "SELECT reg_StudentUsn as USN, reg_StudentName as Name, reg_StudentDept as Department, reg_StudentEmail as Mail_ID, reg_StudentContact as Phone,reg_Pass as Password, reg_StudentAdrs as Address, reg_StudentImage as Photo FROM dbo.tbl_registrationForm";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        stdgrid.DataSource = ds;
                        stdgrid.DataBind();
                    }
                }
            }
        }

    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Studreg.aspx");
    }
    protected void Btnout_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegForm.aspx");
    }
}
   