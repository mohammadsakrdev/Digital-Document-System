using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TadelatApplication.Models
{
    public class LoggedUser
    {
        public static string UserID
        {
            get
            { return "UserID"; }
        }
        public static string FullName
        {
            get
            { return "FullName"; }
        }

        public static string UserName
        {
            get
            { return "UserName";}
        }

        public static string UserPassword
        {
            get
            { return "UserPassword"; }
        }

        public static string IsActive
        {
            get
            { return "IsActive"; }
        }

        public static string RoleID
        {
            get
            { return "RoleID"; }
        }

        public static string BranchID
        {
            get
            { return "BranchID"; }
        }


    } // end class CUrrentUser
}