using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebApplication1
{
    public partial class AnimalsName : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("Login.aspx?type=AnimalName");
            }
            if (!IsPostBack)
            {
                gridAnimal.DataSource = gvuser();
                gridAnimal.DataBind();
            }
            if (!IsPostBack)
            {
                gridFeed.DataSource = gvfeed();
                gridFeed.DataBind();
            }
        }

        protected DataSet gvuser()
        {
            con.Close();
            SqlCommand sql = new SqlCommand("select * from AnimalsName where user_id = @userId", con);
            sql.Parameters.AddWithValue("@userId", Session["userId"]);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }

        protected DataSet gvfeed()
        {
            con.Close();
            SqlCommand sql = new SqlCommand("select * from Feeds Where user_id = @userId", con);
            sql.Parameters.AddWithValue("@userId", Session["userId"]);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }

        protected void btnSubmitAnimal_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("insert into AnimalsName (animal_name, user_id) values (@name,@id)", con);
            cmd.Parameters.AddWithValue("@name", animalName.Text);           
            cmd.Parameters.AddWithValue("@id", Session["userId"]);
            con.Open();
            cmd.ExecuteNonQuery();
            gridAnimal.DataSource = gvuser();
            gridAnimal.DataBind();

            animalName.Text = "";
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Cattle saved successfully','','success');", true);
        }

        protected void gridAnimal_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridAnimal.EditIndex = e.NewEditIndex;
            gridAnimal.DataSource = gvuser();
            gridAnimal.DataBind();
        }

        protected void gridAnimal_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridAnimal.EditIndex = -1;
            gridAnimal.DataSource = gvuser();
            gridAnimal.DataBind();
        }

        protected void gridAnimal_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridAnimal.Rows[e.RowIndex];
            string name = (row.FindControl("txtname") as TextBox).Text;

            con.Close();
            SqlCommand cmd = new SqlCommand("update AnimalsName set animal_name=@name where animal_id=@srno", con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@srno", gridAnimal.DataKeys[e.RowIndex].Value);
            con.Open();
            cmd.ExecuteNonQuery();
            gridAnimal.EditIndex = -1;
            gridAnimal.DataSource = gvuser();
            gridAnimal.DataBind();
        }

        protected void gridAnimal_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Close();
            SqlCommand sql = new SqlCommand("delete from AnimalsName where animal_id='" + gridAnimal.DataKeys[e.RowIndex].Value + "' ", con);
            con.Open();
            sql.ExecuteNonQuery();
            gridAnimal.EditIndex = -1;
            gridAnimal.DataSource = gvuser();
            gridAnimal.DataBind();
        }

        protected void btnSubmitFeed_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("insert into Feeds (feed_name, user_id) values (@name,@id)", con);
            cmd.Parameters.AddWithValue("@name", feedName.Text);
            cmd.Parameters.AddWithValue("@id", Session["userId"]);
            con.Open();
            cmd.ExecuteNonQuery();
            gridFeed.DataSource = gvfeed();
            gridFeed.DataBind();

            feedName.Text = "";
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Feed saved successfully','','success');", true);

        }

        protected void gridFeed_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridFeed.EditIndex = e.NewEditIndex;
            gridFeed.DataSource = gvfeed();
            gridFeed.DataBind();
        }

        protected void gridFeed_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridFeed.EditIndex = -1;
            gridFeed.DataSource = gvfeed();
            gridFeed.DataBind();
        }

        protected void gridFeed_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridFeed.Rows[e.RowIndex];
            string name = (row.FindControl("txtname") as TextBox).Text;

            con.Close();
            SqlCommand cmd = new SqlCommand("update Feeds set feed_name=@name where feed_id=@srno", con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@srno", gridFeed.DataKeys[e.RowIndex].Value);
            con.Open();
            cmd.ExecuteNonQuery();
            gridFeed.EditIndex = -1;
            gridFeed.DataSource = gvfeed();
            gridFeed.DataBind();
        }

        protected void gridFeed_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Close();
            SqlCommand sql = new SqlCommand("delete from Feeds where feed_id='" + gridFeed.DataKeys[e.RowIndex].Value + "' ", con);
            con.Open();
            sql.ExecuteNonQuery();
            gridFeed.EditIndex = -1;
            gridFeed.DataSource = gvfeed();
            gridFeed.DataBind();
        }
    }
}
