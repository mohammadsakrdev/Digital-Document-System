using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace TadelatApplication
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        } // end method Application_Start

        protected void Application_Error(object sender, EventArgs e)
        {
            //Get the error details
            HttpException lastErrorWrapper = Server.GetLastError() as HttpException;

            Exception lastError = lastErrorWrapper;
            if (lastErrorWrapper.InnerException != null)
            {
                lastError = lastErrorWrapper.InnerException;
                //Code that runs when an unhandled error occurs

                string url = string.Empty;

                if (HttpContext.Current != null)
                {
                    url = HttpContext.Current.Request.Url.ToString();
                }

                string ErrorTypeName = lastError.GetType().ToString();
                string ErrorMessage = lastError.Message;
                string ErrorStackTrace = lastError.StackTrace;

                InsertErrorLog(url, ErrorTypeName, ErrorMessage, ErrorStackTrace);

                Server.ClearError();

                Response.Redirect("Error_Page.aspx");
            } // end if

        } // end method Application_Error


        private void InsertErrorLog(string PageUrl, string ErrorTypeName
            , string ErrorMessage, string ErrorStackTrace)
        {
            string connectionString =
                    ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertIntoErorLog", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@PageUrl", PageUrl);
                cmd.Parameters.AddWithValue("@ErrorTypeName", ErrorTypeName);
                cmd.Parameters.AddWithValue("@ErrorMessage", ErrorMessage);
                cmd.Parameters.AddWithValue("@ErrorStackTrace", ErrorStackTrace);

                con.Open();
                cmd.ExecuteNonQuery();

            } // end using

        } // end method InsertErrorLog

    } // end class Global
}