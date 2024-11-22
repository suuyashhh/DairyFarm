using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace WebApplication1
{
    public partial class Bill : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["userId"] == null)
            //{
            //    Response.Redirect("Login.aspx?type=Bill");
            //}
            
        }

        protected void btnSubmitBill_Click(object sender, EventArgs e)
        {
            //con.Close();
            //SqlCommand cmd = new SqlCommand("insert into Bill (user_id,animal_type,price,date) values (@id,@animal_type,@rs,@dt)", con);


            //cmd.Parameters.AddWithValue("@id", Session["userId"]);
            //cmd.Parameters.AddWithValue("@animal_type", ddlbill.Text);
            //cmd.Parameters.AddWithValue("@rs", billPrice.Text);


            //DateTime selectedDate;
            //if (DateTime.TryParse(billDate.Text, out selectedDate))
            //{
            //    cmd.Parameters.AddWithValue("@dt", selectedDate);
            //}
            //else
            //{
                
            //    Response.Write("<script>alert('Invalid date format!');</script>");
            //    return;
            //}


            //con.Open();
            //cmd.ExecuteNonQuery();


            //billPrice.Text = "";            
            //billDate.Text = "";
            //this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Record saved successfully','','success');", true);
        }
    }
}