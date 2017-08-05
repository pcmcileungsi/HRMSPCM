<%@ WebHandler Language="C#" Class="menu" %>

using System;
using System.Collections;
using System.Data;
using System.Web;

using MFin.DataAccessLayer;

public class menu : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(RenderMenu());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }


    private string RenderMenu()
    {        
        MenuDAL _dalMenu = null;
        Hashtable _htParameters = null;
        DataTable _dtParent = null;
        DataTable _dtChild = null;

        string sRetValue = "";

        try
        {
            _dalMenu = new MenuDAL();
            _htParameters = new Hashtable();

            //get parent
            _htParameters["p_module_id"] = 2;
            _htParameters["p_parent_menu_id"] = DBNull.Value;

            _dtParent = _dalMenu.GetRows(_htParameters);

            foreach (DataRow _drParent in _dtParent.Rows)
            {
                sRetValue = sRetValue + @"<h3><a href='#'>" + _drParent["MENU_NAME"].ToString() + "</a></h3><div style='padding:2px'><p><ul>";

                _htParameters["p_module_id"] = 2;
                _htParameters["p_parent_menu_id"] = (int)_drParent["MENU_ID"];

                _dtChild = _dalMenu.GetRows(_htParameters);

                foreach (DataRow _drChild in _dtChild.Rows)
                {
                    sRetValue = sRetValue + @"<li><a href='" + _drChild["URL"].ToString() + "' target='bd-right-ws'>" + _drChild["MENU_NAME"].ToString() + "</a></li>";
                }

                sRetValue = sRetValue + "</ul></p></div>";
            }


            return sRetValue;

        }
        catch (Exception ex)
        {
            return @"<h3>
                        <a href='#'>Error</a></h3>
                    <div>
                        <p>
                            problem when loading menu..." + ex.Message + @"
                        </p>
                    </div>";
        }
    }
}