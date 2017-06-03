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
    public partial class MahfouzatRegisterationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[LoggedUser.UserID] == null)
            {
                Response.Redirect("LogoutForm.aspx");
            } // end if

        } // end method Page_Load

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && IsImageValid())
            {


                // check if directory is existed
                if (!Directory.Exists(Constants.IMAGE_PATH_MAHFOUZAT))
                {
                    //if not existed then create it
                    Directory.CreateDirectory(Constants.IMAGE_PATH_MAHFOUZAT);
                }

                //get file name from fileupload control
                string imageName = GetImageNameSequence().ToString();
                string imagePath = Path.Combine(Constants.IMAGE_PATH_MAHFOUZAT, 
                    imageName + Path.GetExtension(ImageUploader.PostedFile.FileName));
                // save image to selected folder
                ImageUploader.PostedFile.SaveAs(imagePath);

                InsertKararWithImageIntoDB(TXtFullName.Text, TxtMilad.Text, TXtMarkaz.Text,
                    TxtMosalsal.Text, TextKararNo.Text,TextKararCode.Text, TextKararYear.Text, imagePath);
                ClearTextBoxes();
            } // end if

        } // end BtnSave_Click

        private void ClearTextBoxes()
        {
            TXtFullName.Text = string.Empty;
            TxtMilad.Text = string.Empty;
            TXtMarkaz.Text = string.Empty;
            TxtMosalsal.Text = string.Empty;
            TextKararNo.Text = string.Empty;
            TextKararCode.Text = string.Empty;
            TextKararYear.Text = string.Empty;

        } // end method ClearTextBoxes

        private void InsertKararWithImageIntoDB(string fullname, string milad, string markaz,
            string mosalsal, string kararNO, string kararCode, string kararYear, string imagePath)
        {
            string connectionString =
            ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertKararWithImage", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", fullname);
                cmd.Parameters.AddWithValue("@Milad", milad);
                cmd.Parameters.AddWithValue("@Markaz", markaz);
                cmd.Parameters.AddWithValue("@Mosalsal", mosalsal);
                cmd.Parameters.AddWithValue("@KararNO", kararNO);
                cmd.Parameters.AddWithValue("@KararCode", kararCode);
                cmd.Parameters.AddWithValue("@KararYear", kararYear);
                cmd.Parameters.AddWithValue("@UserID", Session[LoggedUser.UserID]);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);

                con.Open();
                cmd.ExecuteNonQuery();

                LblMsg.ForeColor = System.Drawing.Color.Green;
                LblMsg.Text = "تم حفظ البيانات بنجاح";

            } // end using
        } // end method InsertKararWithImageIntoDB

        private bool IsImageValid()
        {
            if (ImageUploader.HasFile)
            {
                string extension = Path.GetExtension(ImageUploader.FileName);
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
        } // ebd method GetImageNameSequence

    } // end class MahfouzatRegisterationForm
}