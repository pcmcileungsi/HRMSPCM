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

public class SessionKey
{
    public SessionKey()
    {

    }

    public static string CURRENT_USER_SESSION_KEY
    {
        get { return "CURRENT_USER_SESSION_KEY"; }
    }

    public static string CURRENT_PASSWORD_SESSION_KEY
    {
        get { return "CURRENT_PASSWORD_SESSION_KEY"; }
    }

    public static string CURRENT_ENTITY_SESSION_KEY
    {
        get { return "CURRENT_ENTITY_SESSION_KEY"; }
    }

    public static string CURRENT_ENTITY_SESSION_XDESCS
    {
        get { return "CURRENT_ENTITY_SESSION_XDESCS"; }
    }

    public static string CURRENT_USER_IP_ADDRESS_SESSION_KEY
    {
        get { return "CURRENT_USER_IP_ADDRESS_SESSION_KEY"; }
    }

    public static string CURRENT_USER_ROLE_SESSION_KEY
    {
        get { return "CURRENT_USER_ROLE_SESSION_KEY"; }
    }

    public static string CURRENT_USER_HRMS_ROLE
    {
        get { return "CURRENT_USER_HRMS_ROLE"; }
    }

    public static string CURRENT_USER_HRMS_EMP_CODE
    {
        get { return "CURRENT_USER_HRMS_EMP_CODE"; }
    }

    public static string CURRENT_USER_HRMS_EMP_NAME
    {
        get { return "CURRENT_USER_HRMS_EMP_NAME"; }
    }

    public static string CURRENT_USER_HRMS_ROLE_DESC
    {
        get { return "CURRENT_USER_HRMS_ROLE_DESC"; }
    }
}
