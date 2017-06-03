using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TadelatApplication.Models;

namespace TadelatApplication
{
    public partial class TypesForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[LoggedUser.UserID] == null)
            {
                Response.Redirect("LogoutForm.aspx");
            }

            if (!IsPostBack)
            {
                BindGridViewData();
            }
        } // end method Page_Load

        private void BindGridViewData()
        {
            GridViewTypes.DataSource = Tadelat.getAllTadelat();
            GridViewTypes.DataBind();
        } // end method BindGridViewData

        protected void GridViewTypes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertRow")
            {
                string typeName = ((TextBox)GridViewTypes.FooterRow.FindControl("InputTypeName")).Text;

                Tadelat.InsertType(typeName);

                BindGridViewData();

            } // end if
            else if (e.CommandName == "UpdateRow")
            {
                int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridViewTypes.EditIndex = rowindex;
                BindGridViewData();
            } // end else

            else if (e.CommandName == "SaveRow")
            {
                int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

                string typeId = ((Label)(GridViewTypes.Rows[rowindex].FindControl("TypeID"))).Text;
                string typeName = ((TextBox)(GridViewTypes.Rows[rowindex].FindControl("TxtTypeName"))).Text;

                Tadelat.UpdateType(typeId, typeName);

                GridViewTypes.EditIndex = -1;
                BindGridViewData();

            } // end else

            else if (e.CommandName == "CancelRow")
            {
                GridViewTypes.EditIndex = -1;
                BindGridViewData();
            } // end else
        } // end method GridViewTypes_RowCommand

    } // end class TypesForm
}