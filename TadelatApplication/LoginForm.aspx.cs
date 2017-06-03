using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TadelatApplication.Models;

namespace TadelatApplication
{
    public partial class LoginForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        } // end method Page_Load

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            // login is successfull
            if(AuthenticateUser(TxtUserName.Text, TxtPassword.Text))
            {
                // administrator
                if(int.Parse(Session[LoggedUser.BranchID].ToString() ) == 1 
                    && int.Parse( Session[LoggedUser.RoleID].ToString()) == 1)
                {
                    Response.Redirect("HomeForm.aspx");
                }
                // nozom User
                else if(int.Parse(Session[LoggedUser.BranchID].ToString()) == 1
                    && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("NozomRegistirationForm.aspx");
                }
                // other users
                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 2
                    && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("SalaForm.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 3
                                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("EntkaForm.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 4
                                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("KomsunForm.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 5
                                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("LagnaForm.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 6
                                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("MoragaaAlexForm.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 7
                                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("MoragaaBeheraForm.aspx");
                }
                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 8
                                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("Maktab44Form.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 9
                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("ShakawaForm.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 10
                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("AmnForm.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 1010
                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("SecretaryTagnedForm.aspx");
                }

                else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 1011
                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 2)
                {
                    Response.Redirect("MahfouzatRegisterationForm.aspx");
                }

            }
            // login is failed
            else
            {
                LblMsg.Text = "فشل تسجيل الدخول";
            }
        } // end method BtnLogin_Click

        private bool AuthenticateUser(string userName, string password)
        {
            bool result = false;
            string connectionString = 
                ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("AuthenticateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@UserName", userName));
                cmd.Parameters.Add(new SqlParameter("@Password", password));

                con.Open();
                bool isActive = false;
                SqlDataReader reader = cmd.ExecuteReader();
                if(reader.HasRows )
                {

                    if (reader.Read())
                        {
                        bool.TryParse(reader[LoggedUser.IsActive].ToString(), out isActive);
                        if (isActive)
                        {
                            result = true;
                            Session[LoggedUser.UserID] = reader[LoggedUser.UserID];
                            Session[LoggedUser.FullName] = reader[LoggedUser.FullName];
                            Session[LoggedUser.UserName] = reader[LoggedUser.UserName];
                            Session[LoggedUser.UserPassword] = reader[LoggedUser.UserPassword];
                            Session[LoggedUser.IsActive] = reader[LoggedUser.IsActive];
                            Session[LoggedUser.RoleID] = reader[LoggedUser.RoleID];
                            Session[LoggedUser.BranchID] = reader[LoggedUser.BranchID];

                        } // end if
                    } // end if
                } // end if
            } // end using
                return result;
        } // end method AuthenticateUser


    } // end class LoginForm
}