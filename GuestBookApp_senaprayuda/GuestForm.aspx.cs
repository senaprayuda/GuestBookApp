using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuestBookApp_senaprayuda
{

    public partial class GuestForm : System.Web.UI.Page
    {

        string connStr = ConfigurationManager.ConnectionStrings["GuestBook"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            grdGuest.DataBind();
            if (lihat.Visible == true)
            {
                tambah.Visible = false;
            }
            else
            {
                tambah.Visible = true;
            }

        }

        public void clear()
        {
            txtNama.Text = "";
            txtAlamat.Text = "";
            txtPesan.Text = "";
            jkLaki.Checked = false;
            jkPerempuan.Checked = false;
            ddlProvinsi.SelectedIndex = 0;
            txtcalendar.Text = "";
        }

        protected void btnBatal_Click(object sender, EventArgs e)
        {
            tambah.Visible = false;
            lihat.Visible = true;
            grdGuest.DataBind();
            clear();
        }

        
        protected void btnSimpan_Click(object sender, EventArgs e)

        {
            SqlConnection connection = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("insertGuest", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("nama", txtNama.Text);
            cmd.Parameters.AddWithValue("alamat", txtAlamat.Text);
            cmd.Parameters.AddWithValue("provinsi", ddlProvinsi.SelectedValue);
            if (jkLaki.Checked == true)
            {
                cmd.Parameters.AddWithValue("jenisKelamin", 1);
            }
            else
            {
                cmd.Parameters.AddWithValue("jenisKelamin", 0);
            }

            {
                cmd.Parameters.AddWithValue("tanggallahir", txtcalendar.Text);
                cmd.Parameters.AddWithValue("pesan", txtPesan.Text);
                connection.Open();
                int k = cmd.ExecuteNonQuery();
                if (k != 0)
                {
                    Response.Write("<script>alert('Record Inserted Succesfully into the Database');</script>");
                }
                connection.Close();
                clear();
                tambah.Visible = false;
                lihat.Visible = true;
                grdGuest.DataBind();
            }
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            lihat.Visible = false;
            tambah.Visible = true;
        }
    }
}
