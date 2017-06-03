using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TadelatApplication.Models
{
    public class Tadelat
    {
        public string TypeID { set; get; }
        public string TypeName { set; get; }

        public static List<Tadelat> getAllTadelat()
        {
            List<Tadelat> AllTadelat = new List<Tadelat>();
            string connectionString =
                ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllTypes", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Tadelat tadelat = new Tadelat();
                    tadelat.TypeID = reader["TypeID"].ToString();
                    tadelat.TypeName = reader["TypeName"].ToString();

                    AllTadelat.Add(tadelat);
                } // end while

            } // end using
            return AllTadelat;
        } // end method getAllUsers

        public static int InsertType(string typeName)
        {
            string connectionString =
                        ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("InsertType", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TypeName", typeName);

                con.Open();

                return cmd.ExecuteNonQuery();
            } // end using 

        } // end method InsertNewUser

        public static int UpdateType(string typeId, string typeName)
        {
            string connectionString =
                        ConfigurationManager.ConnectionStrings["TadelatDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UpdateType", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TypeID", typeId);
                cmd.Parameters.AddWithValue("@TypeName", typeName);

                con.Open();

                return cmd.ExecuteNonQuery();
            } // end using 

        } // end method InsertNewUser

    } // end class Tadelat




}