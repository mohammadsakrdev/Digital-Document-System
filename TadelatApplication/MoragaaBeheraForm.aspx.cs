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
    public partial class MoragaaBeheraForm : System.Web.UI.Page
    {
        private const string CurrentTable = "CurrentTable";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[LoggedUser.UserID] == null)
            {
                Response.Redirect("LogoutForm.aspx");
            }

            if (!IsPostBack)
            {
                SetInitialRow();
            }
        } // end method Page_Load


        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGridView();
        } // end method ButtonAdd_Click

        protected void GridViewTalabTadelat_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = (DataTable)ViewState[CurrentTable];
                LinkButton lb = (LinkButton)e.Row.FindControl("LinkDelete");
                if (lb != null)
                {
                    if (dt.Rows.Count > 1)
                    {
                        if (e.Row.RowIndex == dt.Rows.Count - 1)
                        {
                            lb.Visible = false;
                        }
                    }
                    else
                    {
                        lb.Visible = false;
                    }
                }
            }
        } // end method GridViewTalabTadelat_RowCreated

        protected void LinkDelete_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
            int rowID = gvRow.RowIndex;
            if (ViewState[CurrentTable] != null)
            {

                DataTable dt = (DataTable)ViewState[CurrentTable];
                if (dt.Rows.Count > 1)
                {
                    if (gvRow.RowIndex < dt.Rows.Count - 1)
                    {
                        //Remove the Selected Row data and reset row number
                        dt.Rows.Remove(dt.Rows[rowID]);
                        ResetRowID(dt);
                    }
                }

                //Store the current data in ViewState for future reference
                ViewState[CurrentTable] = dt;

                //Re bind the GridView for the updated data
                GridViewTalabTadelat.DataSource = dt;
                GridViewTalabTadelat.DataBind();
            }

            //Set Previous Data on Postbacks
            SetPreviousData();
        } // end method LinkDelete_Click

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (GridViewTalabTadelat.Rows.Count > 0 && Page.IsValid)
            {

                for (int i = 0; i < GridViewTalabTadelat.Rows.Count; i++)
                {
                    string fullname =
                        ((TextBox)GridViewTalabTadelat.Rows[i].Cells[1].FindControl("TxtFullName")).Text;

                    string milad =
                        ((TextBox)GridViewTalabTadelat.Rows[i].Cells[2].FindControl("TxtMilad")).Text;

                    string markaz =
                        ((TextBox)GridViewTalabTadelat.Rows[i].Cells[3].FindControl("TxtMarkaz")).Text;

                    string mosalsal =
                        ((TextBox)GridViewTalabTadelat.Rows[i].Cells[4].FindControl("TxtMosalsal")).Text;

                    //extract the DropDownList Selected Items 
                    string typeid = ((DropDownList)GridViewTalabTadelat.Rows[i].Cells[5].FindControl("DDLTypeId")).SelectedValue;

                    string bayanatfalse =
                        ((TextBox)GridViewTalabTadelat.Rows[i].Cells[6].FindControl("TxtBayanatFalse")).Text;

                    string bayanattrue =
                        ((TextBox)GridViewTalabTadelat.Rows[i].Cells[7].FindControl("TxtBayanatTrue")).Text;

                    int id = InsertTalabIntoDB(fullname, milad, markaz,
                        mosalsal, typeid, bayanatfalse, bayanattrue);

                } // end for

                //disable addrow & save button and enable print button

                ButtonAdd.Enabled = false;
                BtnSave.Enabled = false;
                ButtonPrint.Enabled = true;
                SetSavedData();

            } //  end if
        } // end method BtnSave_Click

        private void ResetRowID(DataTable dt)
        {
            int rowNumber = 1;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    row[0] = rowNumber;
                    rowNumber++;
                }
            }
        } // end method ResetRowID


        private void SetInitialRow()
        {
            DataTable dataTable = new DataTable();
            DataRow datarow = null;

            dataTable.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dataTable.Columns.Add(new DataColumn(TalabTadelat.FullName, typeof(string)));
            dataTable.Columns.Add(new DataColumn(TalabTadelat.Milad, typeof(string)));
            dataTable.Columns.Add(new DataColumn(TalabTadelat.Markaz, typeof(string)));
            dataTable.Columns.Add(new DataColumn(TalabTadelat.Mosalsal, typeof(string)));
            dataTable.Columns.Add(new DataColumn(TalabTadelat.TypeID, typeof(string)));
            dataTable.Columns.Add(new DataColumn(TalabTadelat.BayanatFalse, typeof(string)));
            dataTable.Columns.Add(new DataColumn(TalabTadelat.BayanatTrue, typeof(string)));

            datarow = dataTable.NewRow();

            datarow["RowNumber"] = 1;
            datarow[TalabTadelat.FullName] = string.Empty;
            datarow[TalabTadelat.Milad] = string.Empty;
            datarow[TalabTadelat.Markaz] = string.Empty;
            datarow[TalabTadelat.Mosalsal] = string.Empty;
            datarow[TalabTadelat.TypeID] = string.Empty;
            datarow[TalabTadelat.BayanatFalse] = string.Empty;
            datarow[TalabTadelat.BayanatTrue] = string.Empty;

            // add the empty row to the table
            dataTable.Rows.Add(datarow);

            //Store the DataTable in ViewState for future reference 
            ViewState[CurrentTable] = dataTable;

            //Bind the Gridview 
            GridViewTalabTadelat.DataSource = dataTable;
            GridViewTalabTadelat.DataBind();

            //fill drop downlist with data
            DropDownList ddl =
                (DropDownList)GridViewTalabTadelat.Rows[0].Cells[5].FindControl("DDLTypeId");
        } // end method SetInitialRow

        private void AddNewRowToGridView()
        {
            if (ViewState[CurrentTable] != null)
            {
                DataTable dtCurrent = (DataTable)ViewState[CurrentTable];
                DataRow drCurrent = null;

                if (dtCurrent.Rows.Count > 0)
                {
                    drCurrent = dtCurrent.NewRow();
                    drCurrent["RowNumber"] = dtCurrent.Rows.Count + 1;

                    //add new row to DataTable 
                    dtCurrent.Rows.Add(drCurrent);

                    for (int i = 0; i < dtCurrent.Rows.Count - 1; i++)
                    {
                        //extract values
                        TextBox TxtFullName =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[1].FindControl("TxtFullName");

                        TextBox TxtMilad =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[2].FindControl("TxtMilad");

                        TextBox TxtMarkaz =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[3].FindControl("TxtMarkaz");

                        TextBox TxtMosalsal =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[4].FindControl("TxtMosalsal");

                        //extract the DropDownList Selected Items 
                        DropDownList ddl =
                            (DropDownList)GridViewTalabTadelat.Rows[i].Cells[5].FindControl("DDLTypeId");

                        TextBox TxtBayanatFalse =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[4].FindControl("TxtBayanatFalse");

                        TextBox TxtBayanatTrue =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[4].FindControl("TxtBayanatTrue");

                        dtCurrent.Rows[i][TalabTadelat.FullName] = TxtFullName.Text;
                        dtCurrent.Rows[i][TalabTadelat.Milad] = TxtMilad.Text;
                        dtCurrent.Rows[i][TalabTadelat.Markaz] = TxtMarkaz.Text;
                        dtCurrent.Rows[i][TalabTadelat.Mosalsal] = TxtMosalsal.Text;
                        dtCurrent.Rows[i][TalabTadelat.TypeID] = ddl.SelectedValue;
                        dtCurrent.Rows[i][TalabTadelat.BayanatFalse] = TxtBayanatFalse.Text;
                        dtCurrent.Rows[i][TalabTadelat.BayanatTrue] = TxtBayanatTrue.Text;
                    } // end for

                    //Store the current data to ViewState for future reference
                    ViewState[CurrentTable] = dtCurrent;

                    //Rebind the Grid with the current data to reflect changes 
                    GridViewTalabTadelat.DataSource = dtCurrent;
                    GridViewTalabTadelat.DataBind();
                } // end if

            } // end if

            //Set Previous Data on Postbacks 
            SetPreviousData();

        } // end method AddNewRowToGridView

        private void SetPreviousData()
        {
            int rowIndex = 0;
            if (ViewState[CurrentTable] != null)
            {
                DataTable dt = (DataTable)ViewState[CurrentTable];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        TextBox TxtFullName =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[1].FindControl("TxtFullName");

                        TextBox TxtMilad =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[2].FindControl("TxtMilad");

                        TextBox TxtMarkaz =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[3].FindControl("TxtMarkaz");

                        TextBox TxtMosalsal =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[4].FindControl("TxtMosalsal");

                        //extract the DropDownList Selected Items 
                        DropDownList ddl =
                            (DropDownList)GridViewTalabTadelat.Rows[rowIndex].Cells[5].FindControl("DDLTypeId");

                        TextBox TxtBayanatFalse =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[6].FindControl("TxtBayanatFalse");

                        TextBox TxtBayanatTrue =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[7].FindControl("TxtBayanatTrue");



                        if (i < dt.Rows.Count - 1)
                        {
                            TxtFullName.Text = dt.Rows[i][TalabTadelat.FullName].ToString();
                            TxtMilad.Text = dt.Rows[i][TalabTadelat.Milad].ToString();
                            TxtMarkaz.Text = dt.Rows[i][TalabTadelat.Markaz].ToString();
                            TxtMosalsal.Text = dt.Rows[i][TalabTadelat.Mosalsal].ToString();
                            //Set the Previous Selected Items on DropDownList  on Postbacks
                            ddl.ClearSelection();
                            ddl.SelectedValue = dt.Rows[i][TalabTadelat.TypeID].ToString();
                            TxtBayanatFalse.Text = dt.Rows[i][TalabTadelat.BayanatFalse].ToString();
                            TxtBayanatTrue.Text = dt.Rows[i][TalabTadelat.BayanatTrue].ToString();
                        } // end if
                        rowIndex++;
                    } // end for
                } // end if
            } // end if
        } // end method SetPreviousData

        private int InsertTalabIntoDB(string fullname, string milad, string markaz,
            string mosalsal, string typeid, string bayanatfalse, string bayanattrue)
        {
            int talabid = -1;
            string connectionString =
            ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertTalabTadelat", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FullName", fullname);
                cmd.Parameters.AddWithValue("@Milad", milad);
                cmd.Parameters.AddWithValue("@Markaz", markaz);
                cmd.Parameters.AddWithValue("@Mosalal", mosalsal);
                cmd.Parameters.AddWithValue("@TypeID", typeid);
                cmd.Parameters.AddWithValue("@BayanatFalse", bayanatfalse);
                cmd.Parameters.AddWithValue("@BayanatTrue", bayanattrue);
                cmd.Parameters.AddWithValue("@UserID", Session[LoggedUser.UserID]);

                SqlParameter outParam = new SqlParameter();
                outParam.ParameterName = "@TalabID";
                outParam.SqlDbType = SqlDbType.Int;
                outParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(outParam);

                con.Open();
                cmd.ExecuteNonQuery();

                int.TryParse(outParam.Value.ToString(), out talabid);

            } // end using
            return talabid;
        } // end method InsertTalabIntoDB

        private void SetSavedData()
        {
            int rowIndex = 0;
            if (ViewState[CurrentTable] != null)
            {
                DataTable dt = (DataTable)ViewState[CurrentTable];
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        TextBox TxtFullName =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[1].FindControl("TxtFullName");

                        TextBox TxtMilad =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[2].FindControl("TxtMilad");

                        TextBox TxtMarkaz =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[3].FindControl("TxtMarkaz");

                        TextBox TxtMosalsal =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[4].FindControl("TxtMosalsal");

                        //extract the DropDownList Selected Items 
                        DropDownList ddl =
                            (DropDownList)GridViewTalabTadelat.Rows[rowIndex].Cells[5].FindControl("DDLTypeId");

                        TextBox TxtBayanatFalse =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[6].FindControl("TxtBayanatFalse");

                        TextBox TxtBayanatTrue =
                            (TextBox)GridViewTalabTadelat.Rows[i].Cells[7].FindControl("TxtBayanatTrue");
                        GridViewTalabTadelat.Rows[i].Cells[8].Visible = false;



                        if (i < dt.Rows.Count - 1)
                        {
                            TxtFullName.Text = dt.Rows[i][TalabTadelat.FullName].ToString();
                            TxtMilad.Text = dt.Rows[i][TalabTadelat.Milad].ToString();
                            TxtMarkaz.Text = dt.Rows[i][TalabTadelat.Markaz].ToString();
                            TxtMosalsal.Text = dt.Rows[i][TalabTadelat.Mosalsal].ToString();
                            //Set the Previous Selected Items on DropDownList  on Postbacks
                            ddl.ClearSelection();
                            ddl.SelectedValue = dt.Rows[i][TalabTadelat.TypeID].ToString();
                            TxtBayanatFalse.Text = dt.Rows[i][TalabTadelat.BayanatFalse].ToString();
                            TxtBayanatTrue.Text = dt.Rows[i][TalabTadelat.BayanatTrue].ToString();
                        } // end if
                        rowIndex++;
                    } // end for
                } // end if
            } // end if
        } // end method SetSavedData


        protected void ButtonPrint_Click1(object sender, EventArgs e)
        {
            //clear grid view
            ViewState[CurrentTable] = null;


            SetInitialRow();

            //enable addrow & save button and disable print button
            ButtonAdd.Enabled = true;
            BtnSave.Enabled = true;
            ButtonPrint.Enabled = false;
        }
    }
}