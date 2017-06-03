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
    public partial class RecoveryForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[LoggedUser.UserID] == null)
            {
                Response.Redirect("LogoutForm.aspx");
            }

        } // end method Page_Load

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            if(Session[LoggedUser.BranchID].ToString() != null)
            { 
            // administrator
            if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 1
                && int.Parse(Session[LoggedUser.RoleID].ToString()) == 1)
            {
                Response.Redirect("HomeForm.aspx");
            }
            // nozom User
            else if (int.Parse(Session[LoggedUser.BranchID].ToString()) == 1
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

            }// end if

        } // end method BtnBack_Click

        protected void BtnRecovery_Click(object sender, EventArgs e)
        {
            if(Page.IsValid &&
                ! String.IsNullOrWhiteSpace(TxtPasswordNew.Text))
            {
                if(TxtUserPassword2.Text.ToString().Equals(Session[LoggedUser.UserPassword].ToString()))
                {
                    string connectionString =
                            ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        SqlCommand cmd = new SqlCommand("UpdateUserPassword", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@UserID", Session[LoggedUser.UserID].ToString()));
                        cmd.Parameters.Add(new SqlParameter("@UserPassword", TxtPasswordNew.Text));
                        con.Open();
                        int rowAffected = cmd.ExecuteNonQuery();
                        if(rowAffected > 0)
                        {
                            Session[LoggedUser.UserPassword] = TxtPasswordNew.Text;
                            LblMsg.ForeColor = System.Drawing.Color.Green;
                            LblMsg.Text = "تم تغيير كلمة المرور بنجاح";
                        }
                        
                    } // end using
                } // end if
                else
                {
                    LblMsg.ForeColor = System.Drawing.Color.Red;
                    LblMsg.Text = "كلمة المرور غير متطابقة";
                }

            } // end if

        } // end method BtnRecovery_Click

    } // end class RecoveryForm
}