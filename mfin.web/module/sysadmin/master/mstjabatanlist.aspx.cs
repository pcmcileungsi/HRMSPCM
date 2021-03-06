﻿using System;
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

public partial class module_sysadmin_master_mstjabatanlist : BasePage
{
    private static string _RoleCode = "B100049";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            BindUnitKerja();
            BindGrid();           
        }
    }


    #region Toolbar
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("mstjabatandtl.aspx?action=add");
    }
    protected void BtnLookUpKenaikan_Click(object sender, EventArgs e)
    {
        pnlBody.Update();
        BindTahun();
        mdlPopupGetKenaikan.Show();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();        
    }
    protected void ddlUnitKerja_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();  
    }
    protected void rbKenaikan_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbKenaikan.SelectedValue == "0")
        {
            txtRupiah.Visible = false;
            txtPersen.Visible = true;
        }
        else
        {
            txtRupiah.Visible = true;
            txtPersen.Visible = false;
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        bool sukses = false;
        sukses = SaveKenaikan();

        pnlBody.Update();
        mdlPopupGetKenaikan.Hide();

        if (sukses) Utility.ShowMessageBoxAnas(this, "Data Kenaikan berhasil di simpan", "Suskses");
    }
    #endregion
	
	 private bool SaveKenaikan()
    {		
        MST_JABATAN_DAL _dalMST_JABATAN_DAL = null;
        Hashtable _htParameters = null;      

        try
        {
            _dalMST_JABATAN_DAL = new MST_JABATAN_DAL();
            _htParameters = new Hashtable();           

            if (ddlTahun.SelectedValue == "")
            {
                Utility.ShowMessageBoxAnas(this, "Tahun masih kosong", "Gagal");
                return false;
            }
            else
            {
				 if (txtRupiah.Visible)
				 {
					txtPersen.Text = "0"; 
                    if (txtRupiah.Text == "" || txtRupiah.Text == "0")
					{
                        Utility.ShowMessageBoxAnas(this, "Nominal Rupiah tidak boleh kosong atau Nol", "Gagal");
                        return false;
					}
                    txtRupiah.Text = txtRupiah.Text.Replace(",", "");			
				 }
				 else
				 {
					 txtRupiah.Text = "0"; 
					 if (txtPersen.Text == "" || txtPersen.Text == "0")
					 {						
						Utility.ShowMessageBoxAnas(this, "Persen tidak boleh kosong atau Nol", "Gagal");
                        return false;
					 }
                     if (Convert.ToDecimal(txtPersen.Text) > 100)
                     {
                         Utility.ShowMessageBoxAnas(this, "Nilai Persen tidak boleh lebih dari 100 ", "Gagal");
                         return false;
                     }
				 }			
              
		         MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
                 Utility.ApplyDefaultProp(_htParameters);
                 _dalMST_JABATAN_DAL.UpdateKenaikan(_htParameters);

                return true;
            }           
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
            return false;
        }
    }


    private void BindTahun()
    {
        MST_TUNJANGAN_DAL _dalMST_TUNJANGAN_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_TUNJANGAN_DAL = new MST_TUNJANGAN_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddlTahun.DataSource = _dalMST_TUNJANGAN_DAL.GetRowsTahun(_htParameters);
            ddlTahun.DataValueField = "TAHUN";
            ddlTahun.DataTextField = "TAHUN";
            ddlTahun.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindGrid()
    {
        MST_JABATAN_DAL _dalMST_JABATAN_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_JABATAN_DAL = new MST_JABATAN_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = ddlUnitKerja.SelectedValue;

            gvwList.DataSource = _dalMST_JABATAN_DAL.GetRows(_htParameters);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    private void BindUnitKerja()
    {
        MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";
            _htParameters["p_majelis"] = "";

            ddlUnitKerja.DataSource = _dalMST_UNIT_KERJA_DAL.GetRows(_htParameters);
            ddlUnitKerja.DataValueField = "KODE";
            ddlUnitKerja.DataTextField = "NAMA";
            ddlUnitKerja.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region GridView

    protected void gvwList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("mstjabatandtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                MST_JABATAN_DAL _dalMST_JABATAN_DAL = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalMST_JABATAN_DAL = new MST_JABATAN_DAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalMST_JABATAN_DAL.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("mstjabatanlist.aspx");

                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                }
                break;
        }
    }
    protected void gvwList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Redirect("lstblroundingdetail.aspx?action=edt&id=" + gvwList.SelectedDataKey[0].ToString());
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
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwList.DataKeys[e.Row.RowIndex].Value.ToString();
            _btn = (ImageButton)e.Row.FindControl("btnDelete");
            _btn.CommandArgument = gvwList.DataKeys[e.Row.RowIndex].Value.ToString();

            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion
    
}
