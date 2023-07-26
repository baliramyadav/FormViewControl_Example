using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormViewControl_Example
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private void LoadData()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select Sid, Name, Class, Fees, PhotoName, Status From Student Order By Sid", ReadCS.ConStr);
            DataSet ds = new DataSet();
            da.Fill(ds, "Student");
            FormView1.DataSource = ds;
            FormView1.DataBind();
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            FormView1.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}