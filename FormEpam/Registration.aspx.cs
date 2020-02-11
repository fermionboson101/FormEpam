using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace FormEpam
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void CountryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {


        }

        protected void RadioButtonList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// puts data into data base if every value is validated in the form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click2(object sender, EventArgs e)
        {
            if (ViewState == null)
            {
                ViewState["Clicks"] = 0;

            }
            ViewState["Clicks"] = Convert.ToInt32(ViewState["Clicks"]) + 1;
            Response.Write("Server Called!" + ViewState["Clicks"]);

            if (Page.IsValid)
            {
                var fName = FirstName.Text;
                var lName = LastName.Text;
                var mName = MidName.Text;
                var email = Email.Text;
                // int phoneNum = Convert.To(Phone.Text);

                char gender = RadioButtonList1.SelectedValue.Equals("1") ? 'm' : 'f';
                var country = CountryDropDownList.SelectedValue;
                var state = StateDropDownList.SelectedValue;
                var city = CityDropDownList.SelectedValue;
                // Calendar calFromOrd = (Calendar)sender;
                //var date = calFromOrd.SelectedDate.ToShortDateString();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployessConnectionString"].ConnectionString))
                {
                    con.Open();
                    String cmdStr = "insert into [dbo].[EmpDetails] values('" + fName + "','" + lName + "','" + email + "','" + gender + "')";

                    SqlCommand sqlCommand = new SqlCommand(cmdStr, con);
                    sqlCommand.ExecuteNonQuery();
                    con.Close();
                }
                Response.Write("Data Registered!");

            }
        }

    }
}