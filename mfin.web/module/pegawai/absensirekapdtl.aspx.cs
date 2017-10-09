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
using System.IO;

using MFin.DataAccessLayer.Master;

public partial class module_pegawai_absensirekapdtl : BasePage
{
    private static string _RoleCode = "B100121";
    string filepath = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        
        if (!Page.IsPostBack)
        {            
            CheckRole(_RoleCode);

            if (Session["nik_absen"] != null) txtNIK.Text = Session["nik_absen"].ToString();
            if (Session["nama_absen"] != null) txtNama.Text = Session["nama_absen"].ToString();
            if (Session["tgl2_absen"] != null) txtBlnThn.Text = Session["tgl2_absen"].ToString();

            LoadData();
            BindGrid();
        }
    }

    private void LoadData()
    {
        HR_ABSENSI_DAL _dalHR_ABSENSI = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_ABSENSI = new HR_ABSENSI_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_nik"] = Session["nik_absen"].ToString();
            DataTable _dt = _dalHR_ABSENSI.GetRowShift(_htParameters);           
            
            if (_dt.Rows[0]["is_shift"].ToString() == "1")
            {
                cbShift.Checked = true;
            }            
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData(int id, string masuk, string pulang)
    {
        HR_ABSENSI_DAL _dalHR_ABSENSI = null;
        Hashtable _htParameters = null;
       
        try
        {
            _dalHR_ABSENSI = new HR_ABSENSI_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_id"] = id;
            _htParameters["p_masuk"] = masuk;
            _htParameters["p_pulang"] = pulang; 
            //if (cbShift.Checked)
            //    _htParameters["p_IS_SHIFT"] = "1";
            //else
            //    _htParameters["p_IS_SHIFT"] = "0";

            _dalHR_ABSENSI.UpdateRekap(_htParameters);    
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindGrid()
    {
        HR_ABSENSI_DAL _dalHR_ABSENSI = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_ABSENSI = new HR_ABSENSI_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_nik"] = Session["nik_absen"].ToString();
            _htParameters["p_TanggalAbsen"] = Session["tgl_absen"].ToString();

            gvwList.DataSource = _dalHR_ABSENSI.GetRowRekapDetail(_htParameters);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }    

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("absensirekap.aspx");       
    }   
    #endregion 

    	
    
    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        gvwList.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        gvwList.EditIndex = -1;
        this.BindGrid();
    }

    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvwList.Rows[e.RowIndex];
        int id = Convert.ToInt32(gvwList.DataKeys[e.RowIndex].Values[0]);
        string masuk = (row.FindControl("txtMasuk") as TextBox).Text;
        string pulang = (row.FindControl("txtPulang") as TextBox).Text;

        SaveData(id, masuk, pulang);
       
        gvwList.EditIndex = -1;
        this.BindGrid();
    }
	protected void gvwList_RowDataBound(Object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow 
			&& (
				e.Row.RowState == DataControlRowState.Alternate
				|| e.Row.RowState == DataControlRowState.Normal
				|| e.Row.RowState == DataControlRowState.Selected
			))
		{
            LinkButton EditButton = (LinkButton)e.Row.FindControl("EditButton");

            if ((DataBinder.Eval(e.Row.DataItem, "Sakit").ToString()) != "0" || (DataBinder.Eval(e.Row.DataItem, "Cuti").ToString()) != "0")
            {
                EditButton.Visible = false;
            }            
		}
	}	
    protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    protected void gvwList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
}
