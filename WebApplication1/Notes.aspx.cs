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
    public partial class Notes : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("Login.aspx?type=Notes");
            }
            if (!IsPostBack)
            {
                showNotes();
            }
        }

        protected DateTime GetCurrentTime()
        {
            DateTime serverTime = DateTime.Now;
            DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "India Standard Time");
            return _localTime;
        }
        protected void showNotes()
        {
            try
            {

                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("Select note_id,user_id,title_note,body_note,date from Notes Where user_id=@userId ", con))
                    {
                        cmd.Parameters.AddWithValue("@userId", Session["userId"]);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            NoteRep.DataSource = dt;
                            NoteRep.DataBind();
                        }
                    }
                }
            }
            catch (Exception es)
            {

            }
        }
        protected void Btn_save_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("insert into Notes values (@user_id,@title_note,@body_note,@date)", con);
            cmd.Parameters.AddWithValue("@user_id", Session["userId"]);
            cmd.Parameters.AddWithValue("@title_note", txtNoteTitle.Text);
            cmd.Parameters.AddWithValue("@body_note", txtNoteBody.Text);
            cmd.Parameters.AddWithValue("@date", GetCurrentTime());
            con.Open();
            cmd.ExecuteNonQuery();
            showNotes();

            txtNoteTitle.Text = "";
            txtNoteBody.Text = "";
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Record saved successfully','','success');", true);
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            try
            {

                RepeaterItem a = (sender as LinkButton).Parent as RepeaterItem;

                int b = int.Parse((a.FindControl("DelRep") as Label).Text.ToString());



                con.Close();
                string qry = "delete from Notes where note_id=" + b;
                SqlCommand cmd = new SqlCommand(qry, con);
                con.Open();
                cmd.ExecuteNonQuery();
                showNotes();

                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Item deleted Successfully','','success');", true);

            }
            catch (Exception es)
            {

            }
            finally
            {
                con.Close();
            }
        }
    }
}