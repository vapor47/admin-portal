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
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Luis F\Source\Repos\admin-portal\admin-portal\App_Data\Database1.mdf;Integrated Security = True");
        //string ConStr = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Luis F\Source\Repos\admin-portal\admin-portal\App_Data\Database1.mdf;Integrated Security=True"
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnCreateAcc_Click(object sender, EventArgs e)
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
                                    // SqlCommand cmd = new SqlCommand("INSERT INTO USER_INFO VALUES ('" + txtCreateUsername.Text + "','" + txtCreateFName.Text + "','" + txtCreateLName.Text + "','" + txtCreateEmail.Text + "','" + ddlUserType.SelectedIndex);

                                    System.Diagnostics.Debug.WriteLine("Hello World");
                                
                            }

                        }
                        
                    }


                }
                catch (SqlException ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex.ToString());
                }
            }
        
        }
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
                            string loginQuery = "SELECT U.UserType FROM USER_INFO U WHERE U.Username = @Username AND U.Password = @Password";
                            cmd.CommandText = loginQuery;
                            cmd.Parameters.AddWithValue("@Username", txtloginUser.Text);
                            cmd.Parameters.AddWithValue("@Password", txtLoginPassword.Text);
                            con.Open();

                            int type = Convert.ToInt32(cmd.ExecuteScalar());
                            System.Diagnostics.Debug.WriteLine("usertype: " + type + "\n\n");
                            con.Close();
                            if (type == 0)
                            {
                                //Response.Redirect("SamplePage.aspx?Scr=" + Variable1);
                                System.Diagnostics.Debug.WriteLine("User 0");
                            }
                            else if (type == 1)
                            {
                                System.Diagnostics.Debug.WriteLine("User 1");
                            }
                            else
                            {
                                System.Diagnostics.Debug.WriteLine("User 2");
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