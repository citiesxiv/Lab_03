using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Lab_03
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void loadbtn_Click(object sender, EventArgs e)
        {
            msglbl.Text = "";
            string id = idtxt.Text;
            string connect = ConfigurationManager.ConnectionStrings["DBConnect"].ToString();
            using (SqlConnection con = new SqlConnection(connect))
            {
                string query = "SELECT * FROM productstbl WHERE id=" + id;
                con.Open();
                SqlCommand cmd = new SqlCommand(query,con);

                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    idtxt.Text = rdr["ID"].ToString();
                    nametxt.Text = rdr["name"].ToString();
                    pricetxt.Text = rdr["price"].ToString();
                    quantxt.Text = rdr["quantity"].ToString();
                }
                else
                {
                    msglbl.Text = "Product was not found";
                    nametxt.Text = String.Empty;
                    pricetxt.Text = String.Empty;
                    quantxt.Text = String.Empty;
                }

            }
        }

        protected void insertbtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string connect = ConfigurationManager.ConnectionStrings["DBConnect"].ToString();
                using (SqlConnection con = new SqlConnection(connect))
                {
                    string query = "INSERT into productstbl(name,price,quantity) VALUES('" + nametxt.Text + "', " + pricetxt.Text + ", " + quantxt.Text + ")";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.ExecuteNonQuery();


                }
                msglbl.Text = nametxt.Text + " has been added successfully";

            }
            
        }

        protected void updatebtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string connect = ConfigurationManager.ConnectionStrings["DBConnect"].ToString();
                using (SqlConnection con = new SqlConnection(connect))
                {
                    string query = "UPDATE productstbl SET name='" + nametxt.Text + "', price= " + pricetxt.Text
                                    + ",quantity= " + quantxt.Text + " WHERE id= " + idtxt.Text;
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.ExecuteNonQuery();


                }
                msglbl.Text = nametxt.Text + " has been successfully updated";
            }
           
        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string connect = ConfigurationManager.ConnectionStrings["DBConnect"].ToString();
                using (SqlConnection con = new SqlConnection(connect))
                {
                    string query = "DELETE FROM productstbl WHERE id=" + idtxt.Text;
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.ExecuteNonQuery();


                }
                msglbl.Text ="The product has been successfully deleted";

            }
           
        }
    }
}