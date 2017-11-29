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

    private void SaveData(int id, string masuk, string pulang, string nik, string TglAbsen, string keterangan)
    {
        HR_ABSENSI_DAL _dalHR_ABSENSI = null;
        Hashtable _htParameters = null;
        Hashtable _htParameters2 = null;
        Hashtable _htParameters3 = null;
        int isInsert = 0;
       
        try
        {
            _dalHR_ABSENSI = new HR_ABSENSI_DAL();
            _htParameters = new Hashtable();
            _htParameters2 = new Hashtable();
            _htParameters3 = new Hashtable();

            _htParameters["p_id"] = id;
            _htParameters["p_masuk"] = masuk;
            _htParameters["p_pulang"] = pulang;
            _htParameters["p_Keterangan"] = keterangan;
            //if (cbShift.Checked)
            //    _htParameters["p_IS_SHIFT"] = "1";
            //else
            //    _htParameters["p_IS_SHIFT"] = "0";

            //Parameter Cek Insert
            _htParameters2["p_NIK"] = nik;
            _htParameters2["p_TANGGAL_ABSEN"] = TglAbsen;

            //Parameter Insert
            _htParameters3["p_NIK"] = nik;
            _htParameters3["p_TANGGAL_ABSEN"] = TglAbsen;
            _htParameters3["p_IN_TIME"] = "07:00";
            _htParameters3["p_OUT_TIME"] = "15:00";
            _htParameters3["p_ATTEND_TIME"] = (keterangan == "" ? masuk : ""); //"";
            _htParameters3["p_LEAVE_TIME"] = (keterangan == "" ? pulang : ""); //"";
            _htParameters3["p_KODE_JENIS_SHIFT"] = "1";
            _htParameters3["p_ABNORMAL"] = (keterangan == "" ? "Normal" : "Absence"); //"Absence";
            _htParameters3["p_WORK_TIME"] = 0;
            _htParameters3["p_Keterangan"] = keterangan;
            Utility.ApplyDefaultProp(_htParameters3);

            _dalHR_ABSENSI.InsertCek(_htParameters2, ref isInsert);

            if (isInsert == 0)
                _dalHR_ABSENSI.Insert(_htParameters3);
            else
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
 	
    protected void ddlKeterangan_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    
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
        string nik = Session["nik_absen"].ToString();
        string TglAbsen = (row.FindControl("lblTglAbsen") as Label).Text;
        DropDownList ddlKeterangan = (DropDownList)row.FindControl("ddlKeterangan");

        SaveData(id, masuk, pulang, nik, TglAbsen, ddlKeterangan.SelectedValue);
       
        gvwList.EditIndex = -1;
        this.BindGrid();
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

    protected void gvwList_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblPC = (e.Row.FindControl("lblPC") as Label);
            LinkButton EditButton = (LinkButton)e.Row.FindControl("EditButton");
           
            if ((DataBinder.Eval(e.Row.DataItem, "Sakit").ToString()) == "1" || (DataBinder.Eval(e.Row.DataItem, "Keterangan").ToString()) != "")
            {
                lblPC.Text = "0";
            }
        }

        if (e.Row.RowType == DataControlRowType.DataRow && gvwList.EditIndex == e.Row.RowIndex)
        {
            TextBox txtMasuk = (TextBox)e.Row.FindControl("txtMasuk");
            TextBox txtPulang = (TextBox)e.Row.FindControl("txtPulang");
            Label lblKeterangan = (e.Row.FindControl("lblKeterangan") as Label);
            DropDownList ddlKeterangan = (DropDownList)e.Row.FindControl("ddlKeterangan");

            DataTable dt = new DataTable();

            if ((DataBinder.Eval(e.Row.DataItem, "Keterangan").ToString()) == "Libur Nasional")
            {               
                dt.Columns.Add("Keterangan", typeof(String));
                dt.Rows.Add("");
                dt.Rows.Add("Libur Nasional");
                dt.Rows.Add("Sakit");
                dt.Rows.Add("Cuti");
                dt.Rows.Add("Ijin");
                dt.Rows.Add("Alpha");              
            }
            else
            {
                dt.Columns.Add("Keterangan", typeof(String));
                dt.Rows.Add("");
                dt.Rows.Add("Sakit");
                dt.Rows.Add("Cuti");
                dt.Rows.Add("Ijin");
                dt.Rows.Add("Alpha");                                   
            }

            ddlKeterangan.DataSource = dt;
            ddlKeterangan.DataTextField = "Keterangan";
            ddlKeterangan.DataValueField = "Keterangan";
            ddlKeterangan.DataBind();
            ddlKeterangan.Items.FindByValue(lblKeterangan.Text).Selected = true;
        }
    }	
    //protected void gvwList_RowDataBound(Object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        Label lblPC = (e.Row.FindControl("lblPC") as Label);
    //        LinkButton EditButton = (LinkButton)e.Row.FindControl("EditButton");

    //        //if ((DataBinder.Eval(e.Row.DataItem, "Keterangan").ToString()) == "Libur Nasional")
    //        //{
    //        //    EditButton.Visible = false;
    //        //}
    //        if ((DataBinder.Eval(e.Row.DataItem, "Sakit").ToString()) == "1" || (DataBinder.Eval(e.Row.DataItem, "Keterangan").ToString()) != "")
    //        {
    //            lblPC.Text = "0";
    //        }
    //    }

    //    if (e.Row.RowType == DataControlRowType.DataRow && gvwList.EditIndex == e.Row.RowIndex)
    //    {
    //        TextBox txtMasuk = (TextBox)e.Row.FindControl("txtMasuk");
    //        TextBox txtPulang = (TextBox)e.Row.FindControl("txtPulang");
    //        Label lblKeterangan = (e.Row.FindControl("lblKeterangan") as Label);

    //        DropDownList ddlKeterangan = (DropDownList)e.Row.FindControl("ddlKeterangan");

    //        // ini untuk deteksi yang sakit,cuti,alpha,ijin
    //        if ((DataBinder.Eval(e.Row.DataItem, "Sakit").ToString()) == "1" || (DataBinder.Eval(e.Row.DataItem, "Keterangan").ToString()) != "")
    //        {
    //            if (!string.IsNullOrEmpty((DataBinder.Eval(e.Row.DataItem, "attend_time").ToString())))
    //            {
    //                DataTable dt = new DataTable();
    //                dt.Columns.Add("Keterangan", typeof(String));
    //                dt.Rows.Add("");
    //                dt.Rows.Add("Ijin");

    //                ddlKeterangan.DataSource = dt;
    //                ddlKeterangan.DataTextField = "Keterangan";
    //                ddlKeterangan.DataValueField = "Keterangan";
    //                ddlKeterangan.DataBind();
    //                if (lblKeterangan.Text == "")
    //                    ddlKeterangan.Items.FindByValue("").Selected = true;
    //                else
    //                    ddlKeterangan.Items.FindByValue(lblKeterangan.Text).Selected = true;
    //            }
    //            else
    //            {
    //                if ((DataBinder.Eval(e.Row.DataItem, "Keterangan").ToString()) == "Libur Nasional")
    //                {
    //                    DataTable dt = new DataTable();
    //                    dt.Columns.Add("Keterangan", typeof(String));
    //                    dt.Rows.Add("");
    //                    dt.Rows.Add("Libur Nasional");
    //                    dt.Rows.Add("Sakit");
    //                    dt.Rows.Add("Cuti");
    //                    dt.Rows.Add("Ijin");
    //                    dt.Rows.Add("Alpha");

    //                    ddlKeterangan.DataSource = dt;
    //                    ddlKeterangan.DataTextField = "Keterangan";
    //                    ddlKeterangan.DataValueField = "Keterangan";
    //                    ddlKeterangan.DataBind();
    //                    ddlKeterangan.Items.FindByValue(lblKeterangan.Text).Selected = true;
    //                }
    //                else
    //                {
    //                    DataTable dt = new DataTable();
    //                    dt.Columns.Add("Keterangan", typeof(String));
    //                    dt.Rows.Add("Sakit");
    //                    dt.Rows.Add("Cuti");
    //                    dt.Rows.Add("Ijin");
    //                    dt.Rows.Add("Alpha");

    //                    ddlKeterangan.DataSource = dt;
    //                    ddlKeterangan.DataTextField = "Keterangan";
    //                    ddlKeterangan.DataValueField = "Keterangan";
    //                    ddlKeterangan.DataBind();
    //                    if (lblKeterangan.Text == "")
    //                        ddlKeterangan.Items.FindByValue("Sakit").Selected = true;
    //                    else
    //                        ddlKeterangan.Items.FindByValue(lblKeterangan.Text).Selected = true;
    //                }
    //            }
    //        }
    //        else
    //        {
    //            DataTable dt = new DataTable();
    //            dt.Columns.Add("Keterangan", typeof(String));
    //            dt.Rows.Add("");
    //            dt.Rows.Add("Ijin");

    //            ddlKeterangan.DataSource = dt;
    //            ddlKeterangan.DataTextField = "Keterangan";
    //            ddlKeterangan.DataValueField = "Keterangan";
    //            ddlKeterangan.DataBind();
    //            if (lblKeterangan.Text == "")
    //                ddlKeterangan.Items.FindByValue("").Selected = true;
    //            else
    //                ddlKeterangan.Items.FindByValue(lblKeterangan.Text).Selected = true;
    //        }
    //    }
    //}	
}
