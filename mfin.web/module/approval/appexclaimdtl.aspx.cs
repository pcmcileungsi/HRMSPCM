using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using MFin.DataAccessLayer.Master;

using System.Linq;
public partial class module_approval_appexclaimdtl : BasePage
{
    private static string _RoleCode = "B100079";
 
    #region Load
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            TabName.Value = Request.Form[TabName.UniqueID];
            CheckRole(_RoleCode);

            //if (Request.Params["action"].Equals("edt"))
            LoadData();
        }
    }

    private void LoadData()
    {
        EmpExclaimDAL _dalEmpExclaimDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaimDAL = new EmpExclaimDAL();
            _htParameters = new Hashtable();

            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                DataTable _dt = _dalEmpExclaimDAL.GetRow(_htParameters);
                MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
                BindGridClaim();
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    #endregion


    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("appexclaimlst.aspx");
    }
   
   
    #endregion

  
    #region Detail
    //private void LoadDataDetail()
    //{
    //    try
    //    {
    //        Shared.BindGrvEmpExclaim(grvExpenseClaimDetail, txtExClaim_No.Text);
    //    }
    //    catch (Exception ex)
    //    {
    //        Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
    //    }
    //}

    private void BindGridClaim()
    {
        EmpExclaimDetailDAL _dalEmpExclaimDetailDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaimDetailDAL = new EmpExclaimDetailDAL();
            _htParameters = new Hashtable();

            if (txtExClaim_No.Text != "")
            {
                //Shared.BindGrvEmpExclaim(grvExpenseClaimDetail, txtSPD_No.Text);
                _htParameters["p_ExClaim_No"] = txtExClaim_No.Text;
            }
            else
            {
                _htParameters["p_SPD_No"] = txtSPD_No.Text;
                //Shared.BindGrvEmpExclaim(grvExpenseClaimDetail, txtExClaim_No.Text);
            }

            DataTable dt = new DataTable();
            dt = _dalEmpExclaimDetailDAL.GetRows(_htParameters);
            grvExpenseClaimDetail.DataSource = dt;
            grvExpenseClaimDetail.DataBind();

            if (dt.Rows.Count > 0)
            {
                decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("Total_Cost"));
                grvExpenseClaimDetail.FooterRow.Cells[5].Text = "Total";
                grvExpenseClaimDetail.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                grvExpenseClaimDetail.FooterRow.Cells[5].Font.Bold = true;
                grvExpenseClaimDetail.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                grvExpenseClaimDetail.FooterRow.Cells[6].Font.Bold = true;
                grvExpenseClaimDetail.FooterRow.Cells[6].Text = total.ToString("N2");
            }

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }
    #endregion
}
