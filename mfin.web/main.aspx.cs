using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblcurrententity.Text = Session[SessionKey.CURRENT_ENTITY_SESSION_XDESCS].ToString().Trim();
        lblEntity.Text = Session[SessionKey.CURRENT_ENTITY_SESSION_XDESCS].ToString().Trim();
        string uname = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString() +" - "+ Session[SessionKey.CURRENT_USER_HRMS_EMP_NAME].ToString();
        lblUserName.Text = uname;
        //lblUserName.Text = Utility.CurrentUID;
        lblRole.Text = Session[SessionKey.CURRENT_USER_HRMS_ROLE_DESC].ToString().Trim();       
    }
}
