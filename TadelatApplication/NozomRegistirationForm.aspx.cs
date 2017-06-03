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
    public partial class NozomUserForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[LoggedUser.UserID] == null)
            {
                Response.Redirect("LogoutForm.aspx");
            }

            LoadDDLTadelTypes(DDLTadelatTypes);

        } // end method


        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && IsImageValid())
            {
                
                
                // check if directory is existed
                if (!Directory.Exists(Constants.IMAGE_PATH_TALABAT))
                {
                    //if not existed then create it
                    Directory.CreateDirectory(Constants.IMAGE_PATH_TALABAT);
                }

                //get file name from fileupload control
                string imageName = GetImageNameSequence().ToString();
                string imagePath = Path.Combine(Constants.IMAGE_PATH_TALABAT, imageName + Path.GetExtension(ImageUploader.PostedFile.FileName));
                // save image to selected folder
                ImageUploader.PostedFile.SaveAs(imagePath);

                InsertTalabWithImageIntoDB(TxtFullName.Text, TxtMilad.Text, TXtMarkaz.Text,
                    TxtMosalsal.Text, DDLTadelatTypes.SelectedValue, 
                    TxtBayanatFalse.Text, TxtBayanatTrue.Text,imageName, imagePath);
                ClearTextBoxes();
        } // end if

    } // end method BtnSave_Click


        private void InsertTalabWithImageIntoDB(string fullname, string milad, string markaz,
                    string mosalsal, string typeid, string bayanatfalse, string bayanattrue,
                    string imageName, string imagePath)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertTalabWithImage", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FullName", fullname);
                cmd.Parameters.AddWithValue("@Milad", milad);
                cmd.Parameters.AddWithValue("@Markaz", markaz);
                cmd.Parameters.AddWithValue("@Mosalal", mosalsal);
                cmd.Parameters.AddWithValue("@TypeID", typeid);
                cmd.Parameters.AddWithValue("@BayanatFalse", bayanatfalse);
                cmd.Parameters.AddWithValue("@BayanatTrue", bayanattrue);
                cmd.Parameters.AddWithValue("@UserID", Session[LoggedUser.UserID]);
                cmd.Parameters.AddWithValue("@ImageName", imageName);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);

                con.Open();
                cmd.ExecuteNonQuery();

                LblMsg.ForeColor = System.Drawing.Color.Green;
                LblMsg.Text = "تم حفظ البيانات بنجاح";

            } // end using
        } // end method InsertTalabWithImageIntoDB

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

        // method to fill dropdownlist of type id with data
        private void LoadDDLTadelTypes(DropDownList ddl)
        {
            string connectionString =
                    ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetTadelatTypes", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                ddl.DataSource = cmd.ExecuteReader();
                ddl.DataTextField = "TypeName";
                ddl.DataValueField = "TypeId";
                ddl.DataBind();
            } // end using
        } // end method LoadDDLTadelTypes

        private void ClearTextBoxes()
        {
            TxtFullName.Text = string.Empty;
            TxtMilad.Text = string.Empty;
            TXtMarkaz.Text = string.Empty;
            TxtMosalsal.Text = string.Empty;
            DDLTadelatTypes.ClearSelection();
            TxtBayanatFalse.Text = string.Empty;
            TxtBayanatTrue.Text = string.Empty;
        }


    } // end class NozomUserForm
}