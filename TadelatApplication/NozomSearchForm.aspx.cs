using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TadelatApplication.Models;
using TadelatApplication.Utility;

namespace TadelatApplication
{
    public partial class NozomSearchForm : System.Web.UI.Page
    {
        private readonly string TALABID = "TalabID";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[LoggedUser.UserID] == null)
            {
                Response.Redirect("LogoutForm.aspx");
            }

            if (!IsPostBack)
            {
                CalControl.Visible = false;
            } // end if


        } // end method Page_Load

        protected void ImgBtn_Click(object sender, ImageClickEventArgs e)
        {
            if(CalControl.Visible)
            {
                CalControl.Visible = false;
            }
            else
            {
                CalControl.Visible = true;
            }
        } // end method ImgBtn_Click

        protected void CalControl_SelectionChanged(object sender, EventArgs e)
        {
            TxtDate.Text = CalControl.SelectedDate.ToShortDateString().ToString();
            CalControl.Visible = false;
        } // end method CalControl_SelectionChanged

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && IsImageValid() && ViewState[TALABID] != null)
            {
                
                // check if directory is existed
                if (!Directory.Exists(Constants.IMAGE_PATH_TALABAT))
                {
                    //if not existed then create it
                    Directory.CreateDirectory(Constants.IMAGE_PATH_TALABAT);
                }

                //get file name from fileupload control
                string imageName = GetImageNameSequence().ToString();
                string imagePath = Path.Combine(Constants.IMAGE_PATH_TALABAT, imageName + Path.GetExtension(ImageUpload.PostedFile.FileName));
                // save image to selected folder
                ImageUpload.PostedFile.SaveAs(imagePath);

                InsertImage(ViewState[TALABID].ToString(), imageName, imagePath);
                ViewState[TALABID] = null;
                LblMsg.ForeColor = System.Drawing.Color.Green;
                LblMsg.Text = "تم تسجيل البيانات بنجاح";
                ClearLabels();
            } // end if
            else
            {
                LblMsg.ForeColor = System.Drawing.Color.Red;
                LblMsg.Text = "خطا في تسجيل البيانات ";
            }

        } // end method BtnSave_Click

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ClearLabels();
            string connectionString =
                                ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("GetTalabTadelBySolasyAndDateAndName", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Milad", TxtMilad.Text));
                    cmd.Parameters.Add(new SqlParameter("@Markaz", TXtMarkaz.Text));
                    cmd.Parameters.Add(new SqlParameter("@Mosalasal", TxtMosalsal.Text));

                if (!String.IsNullOrWhiteSpace(TxtDate.Text))
                {
                    cmd.Parameters.Add(new SqlParameter("@CreatedOn", DateTime.Parse(TxtDate.Text).Date ));
                      
                    }
                else
                {
                    cmd.Parameters.Add(new SqlParameter("@CreatedOn", DBNull.Value));
                }

                if (!String.IsNullOrWhiteSpace(TXtFullName.Text))
                {
                    cmd.Parameters.Add(new SqlParameter("@FullName", TXtFullName.Text));
                }
                else
                {
                    cmd.Parameters.Add(new SqlParameter("@FullName", DBNull.Value));
                }

                con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                            reader.Read();
                            ViewState[TALABID] = reader["TalabID"].ToString();
                            LblFullName.Text = reader["FullName"].ToString();
                            LblTadelType.Text = reader["TypeName"].ToString();
                            LblBayanatFalse.Text = reader["BayanatFalse"].ToString();
                            LblBayanbatTrue.Text = reader["BayanatTrue"].ToString();
    
                    } // end if

                else
                {
                    LblMsg.ForeColor = System.Drawing.Color.Red;
                    LblMsg.Text = "لا توجد نتيجة للبحث";
                }
                
            } // end using
            } // end if
        } // end method BtnSearch_Click

        private int GetImageNameSequence()
        {
            int imageSeq = -1;
            string connectionString =
                        ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetImageSequenceValue", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter outParam = new SqlParameter();
                outParam.ParameterName = "@ImageName";
                outParam.SqlDbType = SqlDbType.BigInt;
                outParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(outParam);

                con.Open();
                cmd.ExecuteNonQuery();

                int.TryParse(outParam.Value.ToString(), out imageSeq);
            } // end using
            return imageSeq;
        }

        private bool IsImageValid()
        {
            if (ImageUpload.HasFile)
            {
                string extension = Path.GetExtension(ImageUpload.FileName);
                if (extension.ToLower() != ".gif" && extension.ToLower() != ".png" && extension.ToLower() != ".jpg"
                    && extension.ToLower() != ".jpeg")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "popup", "alert('لم يتم اختيار صورة');", true);
                    return false;
                } // end inner if

            } // end outer if
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "popup", "alert('برجاء اختيار صورة');", true);

            } // end else

            return true;
        } // end method IsImageValid


        private void ClearLabels()
        {
            LblFullName.Text = string.Empty;
            LblTadelType.Text = string.Empty;
            LblBayanatFalse.Text = string.Empty;
            LblBayanbatTrue.Text = string.Empty;
        } // end class ClearLabels

        private void InsertImage(string talabId, string imageName, string imagePath)
        {
            string connectionString =
            ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertImageForTalab", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@TalabID", talabId));
                cmd.Parameters.Add(new SqlParameter("@ImageName", imageName));
                cmd.Parameters.Add(new SqlParameter("@ImagePath", imagePath));

                con.Open();
                cmd.ExecuteNonQuery();

            } // end using
        } // end method InsertImage

    } //end class NozomSearchForm
}