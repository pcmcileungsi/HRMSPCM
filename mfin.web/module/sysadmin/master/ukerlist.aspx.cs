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

public partial class module_sysadmin_master_ukerlist : BasePage
{
    //tes
    private static string _RoleCode = "B100079";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            BindMajelis();
            BindGrid();           
        }
    }


    #region Toolbar
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("ukerdtl.aspx?action=add");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void ddlMajelis_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
    #endregion

    private void BindGrid()
    {
        MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            _htParameters["p_majelis"] = ddlMajelis.SelectedValue;


            gvwList.DataSource = _dalMST_UNIT_KERJA_DAL.GetRows(_htParameters);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    private void BindMajelis()
    {
        MST_MAJELIS_DAL _dalMST_MAJELIS = null;
        Hashtable _htParameters = null;  
       
        try
        {
            _dalMST_MAJELIS = new MST_MAJELIS_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddlMajelis.DataSource = _dalMST_MAJELIS.GetRows(_htParameters);
            ddlMajelis.DataValueField = "KODE";
            ddlMajelis.DataTextField = "NAMA";
            ddlMajelis.DataBind();
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
                Response.Redirect("ukerdtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalMST_UNIT_KERJA_DAL.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("ukerlist.aspx");

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
