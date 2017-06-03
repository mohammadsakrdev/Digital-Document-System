using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TadelatApplication.Models
{
    public class TalabTadelat
    {
        public static string FullName = "TalabTadelat";
        public static string Milad = "Milad";
        public static string Markaz = "Markaz";
        public static string Mosalsal = "Mosalsal";
        public static string TypeID = "TypeID";
        public static string BayanatTrue = "BayanatTrue";
        public static string BayanatFalse = "BayanatFalse";
        public static string CreatedOn = "CreatedOn";
        public static string UserID = "UserID";


        public static List<Users> getAllUsers()
        {
            List<Users> AllUsers = new List<Users>();
            string connectionString =
                ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllUsers", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Users user = new Users();
                    user.UserID = reader["UserID"].ToString();
                    user.FullName = reader["FullName"].ToString();
                    user.UserName = reader["UserName"].ToString();
                    user.UserPassword = reader["UserPassword"].ToString();
                    user.IsActive = Convert.ToBoolean(reader["IsActive"]);
                    user.RoleID = Convert.ToInt32(reader["RoleID"]);
                    user.BranchID = Convert.ToInt32(reader["BranchID"]);

                    AllUsers.Add(user);
                } // end while

            } // end using
            return AllUsers;
        } // end method getAllUsers

        public static int InsertNewUser(string fullname, string username, string userPassword, string isactive,
            string roleid, string branchid)
        {
            string connectionString =
                        ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertNewUser", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FullName", fullname);
                cmd.Parameters.AddWithValue("@UserName", username);
                cmd.Parameters.AddWithValue("@UserPassword", userPassword);
                cmd.Parameters.AddWithValue("@IsActive", isactive);
                cmd.Parameters.AddWithValue("@RoleID", roleid);
                cmd.Parameters.AddWithValue("@BranchID", branchid);

                con.Open();

                return cmd.ExecuteNonQuery();
            } // end using 

        } // end method InsertNewUser

        public static int UpdateUser(string userid, string fullname, string username,
            string userPassword, string isactive, string roleid, string branchid)
        {
            string connectionString =
                        ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertNewUser", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserID", userid);
                cmd.Parameters.AddWithValue("@FullName", fullname);
                cmd.Parameters.AddWithValue("@UserName", username);
                cmd.Parameters.AddWithValue("@UserPassword", userPassword);
                cmd.Parameters.AddWithValue("@IsActive", isactive);
                cmd.Parameters.AddWithValue("@RoleID", roleid);
                cmd.Parameters.AddWithValue("@BranchID", branchid);

                con.Open();

                return cmd.ExecuteNonQuery();
            } // end using 

        } // end method InsertNewUser

    } // end class TalabTadelat
}