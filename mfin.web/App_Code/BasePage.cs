using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


public class BasePage : System.Web.UI.Page 
{
    public BasePage()
    {

    }

    protected void LoadInit()
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "fnbase", "javascript:formatCurrency();", true);
        if (Session.Count == 0)
            Response.Redirect(ResolveUrl("~/logout.aspx"));
    }

    protected void CheckRole(string RoleCode)
    {
        if (!Shared.CheckPageRole(RoleCode))
            Response.Redirect(ResolveUrl("~/unauthorized.aspx"));

        Shared.CheckControlRole(this);
    }
}
