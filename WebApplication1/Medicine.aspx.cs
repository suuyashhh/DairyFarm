using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Medicine : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"]== null)
            {
                Response.Redirect("Login.aspx?type=Medicine");
            }

            if (!IsPostBack)
            {
                BindMedicinedata();
            }

        }

        private void BindMedicinedata()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT animal_id, animal_name FROM AnimalsName where user_id= @userId;", con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@userId", Session["userId"]);
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlmedicinename.DataSource = reader;
                        ddlmedicinename.DataTextField = "animal_name";
                        ddlmedicinename.DataValueField = "animal_name";
                        ddlmedicinename.DataBind();
                    }
                }
            }
            ddlmedicinename.Items.Insert(0, new ListItem("--Select Cattle--", ""));
        }
        protected DateTime GetCurrentTime()
        {
            DateTime serverTime = DateTime.Now;
            DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "India Standard Time");
            return _localTime;
        }

        protected void btnSubmitmedicine_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("insert into Expense (user_id,expense_name,animal_name,reason,price,date) values (@id,@exname,@animal,@reason,@rs,@dt)", con);


            cmd.Parameters.AddWithValue("@id", Session["userId"]);
            cmd.Parameters.AddWithValue("@exname", "Medicine");
            cmd.Parameters.AddWithValue("@animal", ddlmedicinename.Text);
            cmd.Parameters.AddWithValue("@reason", medicinersn.Text);
            cmd.Parameters.AddWithValue("@rs", medicinePrice.Text);


            DateTime selectedDate;
            if (DateTime.TryParse(medicineDate.Text, out selectedDate))
            {
                cmd.Parameters.AddWithValue("@dt", selectedDate);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Invalid date format!','','warning');", true);
                return;
            }


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close() ;

            medicinePrice.Text = "";
            medicinersn.Text = "";
            medicineDate.Text = "";
            BindMedicinedata();
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Record saved successfully','','success');", true);

        }
    }
}