using System;
using System.Configuration;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using MFin.DataAccessLayer.Security;
using MFin.DataAccessLayer.Master;

public partial class approval : System.Web.UI.Page 
{
    //protected string localid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {
            //lblDescs.Text = "Approved Success";
          cekdata();
        }
    }

    #region Cek
        private void cekdata()
        {
            SysEmailProcessDAL _dalSysEmailProcessDAL = null;
            Hashtable _htParameters = new Hashtable();

            try
            {
                _dalSysEmailProcessDAL = new SysEmailProcessDAL();
                _htParameters["p_ID"] = Request.Params["ID"].ToString();
                _htParameters["p_ACT"] = Request.Params["ACT"].ToString();
                _htParameters["p_Employee_Code"] = Request.Params["EMP"].ToString();
                _htParameters["p_Status"] = Request.Params["ST"].ToString();
                if(Request.Params["TP"].ToString()=="APR"){
                    _dalSysEmailProcessDAL.ApproveLinkAll(_htParameters);
                    lblDescs.Text = "Approve Success";
                }
                else if (Request.Params["TP"].ToString() == "RJT")
                {
                    _dalSysEmailProcessDAL.RejectedLinkAll(_htParameters);
                    lblDescs.Text = "Reject Success";
                }                  
               
            }
            catch (Exception ex)
            {
                lblDescs.Text = "Failed Approval";

                Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
            }
        }

    #endregion
}
