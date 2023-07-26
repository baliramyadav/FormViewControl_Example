using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormViewControl_Example
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Customer obj = new Customer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }

        }
        private void LoadData()
        {
            FormView1.DataSource = obj.Customer_Select(null, true);
            FormView1.DataBind();
        }


        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            FormView1.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode == FormViewMode.Insert)
            {
                FormView1.ChangeMode(FormViewMode.Insert);
            }
            else if (e.NewMode == FormViewMode.Edit)
            {
                FormView1.ChangeMode(FormViewMode.Edit);
                LoadData();
            }
            else
            {
                FormView1.ChangeMode(FormViewMode.ReadOnly);
                LoadData();
            }

        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            string Name = ((TextBox)FormView1.FindControl("txtName")).Text;
            decimal Balance = decimal.Parse(((TextBox)FormView1.FindControl("txtBalance")).Text);
            string City = ((TextBox)FormView1.FindControl("txtCity")).Text;
            bool Status = ((CheckBox)FormView1.FindControl("cbStatus")).Checked;
            int? Custid = null;
            if (obj.Customer_Insert(Name, Balance, City, Status, ref Custid) > 0)
            {
                FormView1.ChangeMode(FormViewMode.ReadOnly);
                LoadData();
            }
            else
            {
                Response.Write("<script>alert('Failed inserting record into the table.')</script>");
            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            int Custid = (int)e.Keys["Custid"];
            string Name = ((TextBox)FormView1.FindControl("txtName")).Text;
            decimal Balance = decimal.Parse(((TextBox)FormView1.FindControl("txtBalance")).Text);
            string City = ((TextBox)FormView1.FindControl("txtCity")).Text;
            if (obj.Customer_Update(Custid, Name, Balance, City) > 0)
            {
                FormView1.ChangeMode(FormViewMode.ReadOnly);
                LoadData();
            }
            else
            {
                Response.Write("<script>alert('Failed updating record in the table.')</script>");
            }

        }

        protected void FormView1_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            int Custid = int.Parse(((Label)FormView1.FindControl("lblCustid")).Text);
            if (obj.Customer_Delete(Custid) > 0)
            {
                LoadData();
            }
            else
            {
                Response.Write("<script>alert('Failed deleting record from the table.')</script>");
            }

        }
    }
}