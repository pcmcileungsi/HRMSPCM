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

public partial class module_sysadmin_master_mstgapoklist : BasePage
{
    private static string _RoleCode = "B100085";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            BindTahun();
            BindGrid();
        }
    }

    #region Toolbar
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("mstgapokdtl.aspx?action=add");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void ddlTahun_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
    #endregion

    private void BindTahun()
    {
        MST_GAPOK_DAL _dalMST_GAPOK_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_GAPOK_DAL = new MST_GAPOK_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddlTahun.DataSource = _dalMST_GAPOK_DAL.GetRowsTahun(_htParameters);
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
        MST_GAPOK_DAL _dalMST_GAPOK_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_GAPOK_DAL = new MST_GAPOK_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            _htParameters["p_tahun"] = ddlTahun.SelectedValue;

            gvwList.DataSource = _dalMST_GAPOK_DAL.GetRows(_htParameters);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    #region GridView

    protected void gvwList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("mstgapokdtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                MST_GAPOK_DAL _dalMST_GAPOK_DAL = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalMST_GAPOK_DAL = new MST_GAPOK_DAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalMST_GAPOK_DAL.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("mstgapoklist.aspx");

                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                }
                break;
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
