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
    public partial class UsersForm : System.Web.UI.Page
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

        } //End method Page_Load



        private void BindGridViewData()
        {
            GridViewUsers.DataSource = Users.getAllUsers();
            GridViewUsers.DataBind();
        } // end method BindGridViewData

        protected void GridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "InsertRow")
            {
                string fullName = ((TextBox)GridViewUsers.FooterRow.FindControl("InputFullName")).Text;
                string userName = ((TextBox)GridViewUsers.FooterRow.FindControl("InputUserName")).Text;
                string userPassword = ((TextBox)GridViewUsers.FooterRow.FindControl("InputUserPassword")).Text;
                string roleId = ((DropDownList)GridViewUsers.FooterRow.FindControl("DDLInputRoleID")).SelectedValue;
                string branchId = ((DropDownList)GridViewUsers.FooterRow.FindControl("DDLInputBranchID")).SelectedValue;
                bool isActive = ((CheckBox)GridViewUsers.FooterRow.FindControl("InputChBox")).Checked;

                Users.InsertNewUser(fullName, userName, userPassword, isActive, roleId, branchId);

                BindGridViewData();

            } // end if
            else if(e.CommandName == "UpdateRow")
            {
                int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridViewUsers.EditIndex = rowindex;
                BindGridViewData();
            } // end else

            else if (e.CommandName == "SaveRow")
            {
                int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

                string id = ((Label)(GridViewUsers.Rows[rowindex].FindControl("UserID"))).Text;
                string fullName = ((TextBox)(GridViewUsers.Rows[rowindex].FindControl("TxtFullName"))).Text;
                string userName = ((TextBox)(GridViewUsers.Rows[rowindex].FindControl("TxtUserName"))).Text;
                string userPassword = ((TextBox)(GridViewUsers.Rows[rowindex].FindControl("TxtUserPassword"))).Text;
                string roleId = ((DropDownList)(GridViewUsers.Rows[rowindex].FindControl("DDLRoleIDEdit"))).SelectedValue;
                string branchId = ((DropDownList)(GridViewUsers.Rows[rowindex].FindControl("DDLBranchIDEdit"))).SelectedValue;
                bool isActive = ((CheckBox)(GridViewUsers.Rows[rowindex].FindControl("ChBoxEdit"))).Checked;

                Users.UpdateUser(id, fullName, userName, userPassword, isActive, roleId, branchId);

                GridViewUsers.EditIndex = -1;
                BindGridViewData();

            } // end else

            else if (e.CommandName == "CancelRow")
            {
                GridViewUsers.EditIndex = -1;
                BindGridViewData();
            } // end else


        } // end method GridViewUsers_RowCommand

    } // end class UsersForm
}