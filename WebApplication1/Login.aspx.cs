﻿using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null && Request.Cookies["UserAuth"] != null)
            {
                HttpCookie cookie = Request.Cookies["UserAuth"];
                Session["username"] = cookie["username"];
                Session["userId"] = cookie["userId"];
                Session["contact"] = cookie["contact"];

                Response.Redirect("WebPage.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand sqlCommand = new SqlCommand("select * from Users where contact=@contact and password=@pass", con);
            sqlCommand.Parameters.AddWithValue("@contact", UserContact.Text);
            sqlCommand.Parameters.AddWithValue("@pass", UserPassword.Text);

            con.Open();
            SqlDataReader reader = sqlCommand.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();
                Session["username"] = reader.GetValue(1);
                Session["userId"] = reader.GetValue(0);
                Session["contact"] = reader.GetValue(3);

                HttpCookie authCookie = new HttpCookie("UserAuth");
                authCookie["username"] = reader.GetValue(1).ToString();
                authCookie["userId"] = reader.GetValue(0).ToString();
                authCookie["contact"] = reader.GetValue(3).ToString();
                authCookie.Expires = DateTime.Now.AddDays(30); 
                Response.Cookies.Add(authCookie);

                UserContact.Text = "";
                UserPassword.Text = "";

                if (Request.QueryString["type"] != null)
                {
                    string type = Request.QueryString["type"];
                    Response.Redirect($"{type}.aspx");
                }
                else
                {
                    Response.Redirect("WebPage.aspx");
                }
            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Invalid Login..!','','error');", true);
            }

            con.Close();
        }
    }
}
