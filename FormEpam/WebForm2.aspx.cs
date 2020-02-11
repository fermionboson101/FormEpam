using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace FormEpam
{
    public partial class WebForm2 : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            
    
        }

     

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployessConnectionString"].ConnectionString)) {
                var UN = userName.Text;
                var PW = password.Text;
                string qry = "select * from users where username='" + UN + "'and password='" + PW + "' ";
                var adpt = new SqlDataAdapter(qry, con);
                var dt = new DataTable();
                adpt.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    Response.Redirect("Registration.aspx");
                }
            }
        }
    }
}