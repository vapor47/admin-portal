using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace admin_portal
{
    public partial class About : Page
    {
        int count = 0, usertype = 0;
        string username = "";
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            lblNotify.Visible = false;
        }
       /* protected void btnCreateAcc_Click(object sender, EventArgs e)
        {
            if (txtCreateUsername.Text == "" || txtCreatePassword.Text == "")
            {
                lblNotify.Text = "Invalid Username or Password, try again";
                lblNotify.ForeColor = System.Drawing.Color.Red;
                lblNotify.Visible = true;

            }
            else {
                try
                {
                    using (con)
                    {
                        using (SqlCommand cmd = con.CreateCommand())
                        {
                            string checkUsernamesQuery = "SELECT COUNT(Username) FROM USER_INFO U WHERE U.Username = @inputUser";
                            cmd.CommandText = checkUsernamesQuery;
                            cmd.Parameters.AddWithValue("@inputUser", txtCreateUsername.Text);
                            con.Open();
                            int foundUser = Convert.ToInt32(cmd.ExecuteScalar());
                            if (foundUser == 1)
                            {
                                lblNotify.Text = "Username already in use.";
                                lblNotify.ForeColor = System.Drawing.Color.Red;
                                lblNotify.Visible = true;
                            }
                            else
                            {
                                
                                    string createAccQuery = "INSERT INTO USER_INFO (Username, Password, FirstName, LastName, Email, UserType) VALUES (@Username, @Password, @FName, @LName, @Email, @UserType)";
                                    cmd.CommandText = createAccQuery;
                                    cmd.Parameters.AddWithValue("@Username", txtCreateUsername.Text);
                                    cmd.Parameters.AddWithValue("@Password", txtCreatePassword.Text);
                                    cmd.Parameters.AddWithValue("@FName", txtCreateFName.Text);
                                    cmd.Parameters.AddWithValue("@LName", txtCreateLName.Text);
                                    cmd.Parameters.AddWithValue("@Email", txtCreateEmail.Text);
                                    cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedIndex);
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                    lblNotify.Text = "Account Creation Successful";
                                    lblNotify.ForeColor = System.Drawing.Color.Green;
                                    lblNotify.Visible = true;
                                
                            }

                        }
                        
                    }


                }
                catch (SqlException ex)
                {
                    lblNotify.Text = "There was an error with the database";
                    lblNotify.ForeColor = System.Drawing.Color.Red;
                    lblNotify.Visible = true;
                    System.Diagnostics.Debug.WriteLine(ex.ToString());
                }
            }
        
        }*/
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtloginUser.Text == "" || txtLoginPassword.Text == "")
            {
                lblNotify.Text = "Invalid Username or Password, try again";
                lblNotify.ForeColor = System.Drawing.Color.Red;
                lblNotify.Visible = true;

            }
            else
            {
                try
                {
                    using (con)
                    {
                        using (SqlCommand cmd = con.CreateCommand())
                        {
                            string checkUserQuery = "SELECT COUNT(1) AS cnt, U.UserType AS type, U.Username AS name FROM USER_INFO U WHERE U.Username = @Username AND U.Password = @Password GROUP BY U.Username, U.UserType";
                            cmd.CommandText = checkUserQuery;
                            cmd.Parameters.AddWithValue("@Username", txtloginUser.Text);
                            cmd.Parameters.AddWithValue("@Password", txtLoginPassword.Text);
                            con.Open();

                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.HasRows)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('HasRows');", true);
                                while (dr.Read())
                                {
                                    count = Convert.ToInt32(dr["cnt"]);
                                    usertype = Convert.ToInt32(dr["type"]);
                                    username = Convert.ToString(dr["name"]);

                                }
                            }
                            con.Close();
                            if(count == 1)
                            {
                                Session["Username"] = username;
                                Session["UserType"] = usertype;
                                System.Diagnostics.Debug.WriteLine(Session["username"]);
                                System.Diagnostics.Debug.WriteLine(Session["UserType"]);

                                if (usertype == 3)
                                {
                                    Response.Redirect("Admin.aspx");
                                }
                                else
                                    Response.Redirect("Default.aspx");

                            }
                            else
                            {
                                lblNotify.Text = "Invalid credentials, try again.";
                                lblNotify.ForeColor = System.Drawing.Color.Red;
                                lblNotify.Visible = true;
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    lblNotify.ForeColor = System.Drawing.Color.Red;
                    lblNotify.Text = "Account not found, try again";
                    lblNotify.Visible = true;
                    System.Diagnostics.Debug.WriteLine(ex.ToString());
                }
            }
        }
    }

}