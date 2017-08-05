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
using MFin.DataAccessLayer;

public partial class module_sysadmin_usergroupdetail : BasePage
{
    //private string _RoleCode = "P000475";
    private static string _RoleCode = "B100007";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            if (Request.Params["action"].Equals("edt"))
            {
                LoadData();
                //BindTblDocument();
                BindModule();
            }
            /*switch (Request.Params["page"])
            {
                case "0":
                    break;
                case "1":
                    Response.Redirect("usergroupdetail.aspx?action=edt&id=" + Request.Params["id"] + "#page-1");
                    break;
            }*/

        }
    }

    private void BindModule()
    {
        MasterModuleDAL _dal = null;
        Hashtable _ht = null;

        try
        {
            _dal = new MasterModuleDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = "";
            _ht["p_group_code"] = txtUSERGROUP.Text;
            gvwList.DataSource = _dal.GetRows(_ht);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindTblDocument()
    {
        MenuDAL _dalMenu = null;
        SysJobAccessDAL _dalJobAccess = null;
        Hashtable _htParameters = null;
        DataTable _dtParent = null;
        DataTable _dtChild = null;
        DataTable _dt = null;

        try
        {
            _dalMenu = new MenuDAL();
            _dalJobAccess = new SysJobAccessDAL();
            _htParameters = new Hashtable();

            _htParameters["p_usergroupid"] = Request.Params["id"];
            _htParameters["p_menu_id"] = "1";
            _htParameters["p_usergroup"] = txtUSERGROUP.Text;
            _htParameters["p_keywords"] = "";
            _dt = _dalJobAccess.GetRows(_htParameters);
            _dt.Rows.Clear();

            //get parent
            _htParameters["p_module_id"] = 1;
            _htParameters["p_parent_menu_id"] = DBNull.Value;
            _dtParent = _dalMenu.GetRows(_htParameters);

            foreach (DataRow _drParent in _dtParent.Rows)
            {
                //sRetValue = sRetValue + @"<h3><a href='#'>" + _drParent["MENU_NAME"].ToString() + "</a></h3><div style='padding:2px'><p><ul>";
                _htParameters["p_usergroupid"] = Request.Params["id"];
                _htParameters["p_menu_id"] = _drParent["MENU_ID"];
                _htParameters["p_usergroup"] = txtUSERGROUP.Text;
                _htParameters["p_keywords"] = "";
                try
                {
                    _dt.ImportRow((_dalJobAccess.GetRowByMenuId(_htParameters)).Rows[0]);

                    _htParameters["p_module_id"] = 1;
                    _htParameters["p_parent_menu_id"] = (int)_drParent["MENU_ID"];

                    _dtChild = _dalMenu.GetRows(_htParameters);

                    foreach (DataRow _drChild in _dtChild.Rows)
                    {
                        _htParameters["p_usergroupid"] = Request.Params["id"];
                        _htParameters["p_menu_id"] = _drChild["MENU_ID"];
                        _htParameters["p_usergroup"] = txtUSERGROUP.Text;
                        _htParameters["p_keywords"] = txtSearch.Text;
                
                        try
                        {
                            _dt.ImportRow((_dalJobAccess.GetRowByMenuId(_htParameters)).Rows[0]);

                        }
                        catch(Exception)
                        {
                        }
                    }
                }
                catch (Exception)
                {
                }
                //sRetValue = sRetValue + "</ul></p></div>";
            }
            gvwList.DataSource = _dt;
            gvwList.DataBind();

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }
    
    private void LoadData()
    {
        MasterGroupDAL _dal = null;
        Hashtable _htParameters = null;

        try
        {
            _dal = new MasterGroupDAL();
            _htParameters = new Hashtable();

            _htParameters["p_usergroupid"] = Request.Params["id"];
            DataTable _dt = _dal.GetRow(_htParameters);

            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    private void SaveData()
    {
        MasterGroupDAL _dalGroup = null;
        MasterGroupRoleDAL _dalGroupRole = null;
        Hashtable _htParameters = null;
        int iNextID = 0;
        int iNextIDRole = 0;
        int flag = 1;
        try
        {
            _dalGroup = new MasterGroupDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalGroup.Insert(_htParameters, ref iNextID);
            }
            else
            {
                //_htParameters["p_usergroupid"] = Request.Params["id"];
                _dalGroup.Update(_htParameters);
                iNextID = Int32.Parse(lblUSERGROUPID.Text.ToString());
            }
            //_dalJobAccess = new SysJobAccessDAL();
            _htParameters.Clear();
            _dalGroupRole = new MasterGroupRoleDAL();
            _htParameters["p_group_code"] = txtUSERGROUP.Text;
            _dalGroupRole.DeleteByGroupCode(_htParameters);

            _htParameters.Clear();
            #region checkboxChecking
            foreach (GridViewRow gvr in gvwList.Rows)
            {
                MPF23.Shared.Mapper.UIToDB.Map(gvr.Controls, _htParameters);
                _htParameters["p_module_id"] = gvwList.DataKeys[gvr.RowIndex][0];
                _htParameters["p_group_code"] = txtUSERGROUP.Text;
                
                Utility.ApplyDefaultProp(_htParameters);
                if (((CheckBox)gvr.FindControl("chkAccess")).Checked)
                {
                    _htParameters["p_action_code"] = "A";
                    _dalGroupRole.Insert(_htParameters, ref iNextIDRole);
                }

                if (((CheckBox)gvr.FindControl("chkNew")).Checked)
                {
                    _htParameters["p_action_code"] = "N";
                    _dalGroupRole.Insert(_htParameters, ref iNextIDRole);
                }

                if (((CheckBox)gvr.FindControl("chkEdit")).Checked)
                {
                    _htParameters["p_action_code"] = "E";
                    _dalGroupRole.Insert(_htParameters, ref iNextIDRole);
                }
                
                if (((CheckBox)gvr.FindControl("chkDelete")).Checked)
                {
                    _htParameters["p_action_code"] = "D";
                    _dalGroupRole.Insert(_htParameters, ref iNextIDRole);
                }
                if (((CheckBox)gvr.FindControl("chkPrint")).Checked)
                {
                    _htParameters["p_action_code"] = "P";
                    _dalGroupRole.Insert(_htParameters, ref iNextIDRole);
                }
                if (((CheckBox)gvr.FindControl("chkAppr")).Checked)
                {
                    _htParameters["p_action_code"] = "R";
                    _dalGroupRole.Insert(_htParameters, ref iNextIDRole);
                }
            }
            #endregion
            
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE , null, "usergroupdetail.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    #region Toolbar
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindTblDocument();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("usergrouplist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
        SaveData();
    }
    #endregion

    #region GridView
    

    protected void gvwList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Redirect("lstbldocumentdetail.aspx?action=edt&id=" + gvwList.SelectedDataKey[0].ToString() + "&code=" + txtCODE.Text + "&tblequipid=" + lblLSTBLEQUIPID.Text);
    }

    protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindTblDocument();
    }

    protected void gvwList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            #region InisiasiCheckbox
            if (gvwList.DataKeys[e.Row.RowIndex].Values[1].ToString() == "1")
            {
                ((CheckBox)e.Row.FindControl("chkAccess")).Checked = true;
            }
            if (gvwList.DataKeys[e.Row.RowIndex].Values[2].ToString() == "1")
            {
                ((CheckBox)e.Row.FindControl("chkNew")).Checked = true;
            }
            if (gvwList.DataKeys[e.Row.RowIndex].Values[3].ToString() == "1")
            {
                ((CheckBox)e.Row.FindControl("chkEdit")).Checked = true;
            }
            if (gvwList.DataKeys[e.Row.RowIndex].Values[4].ToString() == "1")
            {
                ((CheckBox)e.Row.FindControl("chkDelete")).Checked = true;
            }
            if (gvwList.DataKeys[e.Row.RowIndex].Values[5].ToString() == "1")
            {
                ((CheckBox)e.Row.FindControl("chkPrint")).Checked = true;
            }
            if (gvwList.DataKeys[e.Row.RowIndex].Values[6].ToString() == "1")
            {
                ((CheckBox)e.Row.FindControl("chkAppr")).Checked = true;
            }
            #endregion
            //if (gvwList.DataKeys[e.Row.RowIndex].Values[8].ToString() == "0")
            //{
            //    e.Row.Cells[1].Text = "     " + e.Row.Cells[1].Text;
            //}
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    protected void gvwList_RowDataBound(object sender,GridViewRowEventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
       
    }
    #endregion

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        SysJobAccessDAL _dal = new SysJobAccessDAL();
        Hashtable _ht = new Hashtable();
        try
        {
            _ht["p_usergroup"] = txtUSERGROUP.Text;
            Utility.ApplyDefaultProp(_ht);
            _dal.Generate(_ht);
            BindTblDocument();
        }
        catch (Exception ex)
        {

        }
    }

    protected void chbAccessAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chbAll = (CheckBox)sender;

        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox cb = (CheckBox)row.Cells[2].Controls[1];
            cb.Checked = chbAll.Checked;
        }
    }

    protected void chbNewAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chbAll = (CheckBox)sender;

        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox cb = (CheckBox)row.Cells[3].Controls[1];
            cb.Checked = chbAll.Checked;
        }
    }

    protected void chbEditAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chbAll = (CheckBox)sender;

        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox cb = (CheckBox)row.Cells[4].Controls[1];
            cb.Checked = chbAll.Checked;
        }
    }

    protected void chbDeleteAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chbAll = (CheckBox)sender;

        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox cb = (CheckBox)row.Cells[5].Controls[1];
            cb.Checked = chbAll.Checked;
        }
    }

    protected void chbPrintAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chbAll = (CheckBox)sender;

        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox cb = (CheckBox)row.Cells[6].Controls[1];
            cb.Checked = chbAll.Checked;
        }
    }

    protected void chbApproveAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chbAll = (CheckBox)sender;

        foreach (GridViewRow row in gvwList.Rows)
        {
            CheckBox cb = (CheckBox)row.Cells[7].Controls[1];
            cb.Checked = chbAll.Checked;
        }
    }
    
}
