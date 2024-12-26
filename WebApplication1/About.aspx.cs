using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class About : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("Login.aspx?type=About");
            }
            else
            {
                username.Text = Session["username"].ToString();
            }
           

        }

        protected DateTime GetCurrentTime()
        {
            DateTime serverTime = DateTime.Now;
            DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "India Standard Time");
            return _localTime;
        }
        protected void SubmitFeedback_Click(object sender, EventArgs e)
        {
               


            con.Close();
            SqlCommand cmd = new SqlCommand("insert into Feedback values (@userN,@contact,@Feedback,@dt)", con);


            cmd.Parameters.AddWithValue("@userN",username.Text );
            cmd.Parameters.AddWithValue("@contact", Session["contact"]);
            cmd.Parameters.AddWithValue("@Feedback", feedback.Text);
            cmd.Parameters.AddWithValue("@dt", GetCurrentTime());
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close() ;

            username.Text = "";
            feedback.Text = "";
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Thank You For Feedback...!','','success');", true);

        }
    }
}