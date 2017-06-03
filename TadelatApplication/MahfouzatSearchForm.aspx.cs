using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TadelatApplication.Models;
using TadelatApplication.Utility;

namespace TadelatApplication
{
    public partial class MahfouzatSearchForm : System.Web.UI.Page
    {
        private readonly string KARARID = "KararID";

        private readonly string IMAGEPATH = "ImagePath";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[LoggedUser.UserID] == null)
            {
                Response.Redirect("LogoutForm.aspx");
            } // end if
        } // end method Page_Load

        protected void BtnSearchKarar_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                ClearLabels();
                string connectionString =
                    ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("GetKararBySolasyOrCode", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@KararNO", TextKararNo.Text));
                    cmd.Parameters.Add(new SqlParameter("@KararCode", TextKararCode.Text));
                    cmd.Parameters.Add(new SqlParameter("@KararYear", TextKararYear.Text));

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        LblMsg.Text = string.Empty;
                        reader.Read();
                        ViewState[KARARID] = reader["KrarID"].ToString();
                        ViewState[IMAGEPATH] = reader["ImagePath"].ToString();

                        LblFullName.Text = reader["Name"].ToString();

                        LblMilad.Text = reader["Milad"].ToString();
                        LblMarkaz.Text = reader["Markaz"].ToString();
                        LblMosalsal.Text = reader["Mosalsal"].ToString();

                        LblKararNo.Text = reader["KararNO"].ToString();
                        LblKararCode.Text = reader["KararCode"].ToString();
                        LblKararYear.Text = reader["KararYear"].ToString();

                        LblCreatedBy.Text = reader["FullName"].ToString();
                        LblCreatedDate.Text = reader["CreatedON"].ToString();
                         
                        KararImage.ImageUrl = Constants.KARARAT_READ_IMAGE_VD + Path.GetFileName(reader["ImagePath"].ToString());

                    } // end if

                    else
                    {
                        LblMsg.ForeColor = System.Drawing.Color.Red;
                        LblMsg.Text = "لا توجد نتيجة للبحث";
                    } // end else

                } // end using
            } // end if

        } // end method BtnSearchKarar_Click

        protected void BtnSEarchSolasy_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ClearLabels();
                string connectionString =
                    ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("GetKararBySolasyOrCode", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Milad", TextMilad.Text));
                    cmd.Parameters.Add(new SqlParameter("@Markaz", TextMarkaz.Text));
                    cmd.Parameters.Add(new SqlParameter("@Mosalsal", TextMosalsal.Text));

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        LblMsg.Text = string.Empty;
                        reader.Read();
                        ViewState[KARARID] = reader["KrarID"].ToString();
                        ViewState[IMAGEPATH] = reader["ImagePath"].ToString();

                        LblFullName.Text = reader["Name"].ToString();

                        LblMilad.Text = reader["Milad"].ToString();
                        LblMarkaz.Text = reader["Markaz"].ToString();
                        LblMosalsal.Text = reader["Mosalsal"].ToString();

                        LblKararNo.Text = reader["KararNO"].ToString();
                        LblKararCode.Text = reader["KararCode"].ToString();
                        LblKararYear.Text = reader["KararYear"].ToString();

                        LblCreatedBy.Text = reader["FullName"].ToString();
                        LblCreatedDate.Text = reader["CreatedON"].ToString();

                        KararImage.ImageUrl = Constants.KARARAT_READ_IMAGE_VD + Path.GetFileName(reader["ImagePath"].ToString());

                    } // end if

                    else
                    {
                        LblMsg.ForeColor = System.Drawing.Color.Red;
                        LblMsg.Text = "لا توجد نتيجة للبحث";
                    } // end else

                } // end using
            } // end if

        } // end method BtnSEarchSolasy_Click

        private void ClearLabels()
        {
            LblFullName.Text = string.Empty;

            LblMilad.Text = string.Empty;
            LblMarkaz.Text = string.Empty;
            LblMosalsal.Text = string.Empty;

            LblKararNo.Text = string.Empty;
            LblKararCode.Text = string.Empty;
            LblKararYear.Text = string.Empty;

            LblCreatedBy.Text = string.Empty;
            LblCreatedDate.Text = string.Empty;
            KararImage.ImageUrl = null;
        } // end method ClearLabels

    } // end class MahfouzatSearchForm
} 