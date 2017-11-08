using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;

using MFin.DataAccessLayer.Master;

public class Calendar
{
    public string DATE { get; set; }
    public string WORKING_DAY { get; set; }   
}	

public partial class module_sysadmin_master_mstcalendarlist : BasePage
{
    private static string _RoleCode = "B100073";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            TahunOption(txtYear, (DateTime.Now.Year + 1).ToString());
        }
    }

    private void TahunOption(DropDownList oCombo, string cDefault)
    {
        int nNow = DateTime.Now.Year + 1;
        for (int n = nNow; n >= 2010; n--)
        {
            oCombo.Items.Add(new ListItem(n.ToString(), n.ToString()));            
        }
        oCombo.SelectedValue = DateTime.Now.Year.ToString();
    }

    private static List<T> ConvertDataTable<T>(DataTable dt)
    {
        List<T> data = new List<T>();
        foreach (DataRow row in dt.Rows)
        {
            T item = GetItem<T>(row);
            data.Add(item);
        }
        return data;
    }
    private static T GetItem<T>(DataRow dr)
    {
        Type temp = typeof(T);
        T obj = Activator.CreateInstance<T>();

        foreach (DataColumn column in dr.Table.Columns)
        {
            foreach (System.Reflection.PropertyInfo pro in temp.GetProperties())
            {
                if (pro.Name == column.ColumnName)
                    pro.SetValue(obj, dr[column.ColumnName], null);
                else
                    continue;
            }
        }
        return obj;
    }  

    [System.Web.Services.WebMethod]
    public static Object getData(string YEAR)
    {
        DataTable dt = new DataTable();
        List<Calendar> data = new List<Calendar>();

        MST_CALENDAR_DAL _dalMST_CALENDAR = new MST_CALENDAR_DAL();
        Hashtable _htParameters = new Hashtable();
       _htParameters["p_keywords"] = YEAR;

        dt = _dalMST_CALENDAR.GetRows(_htParameters);            
        
        data = ConvertDataTable<Calendar>(dt);
        var total = data.Count;

        return new { total, data };
    }

    [System.Web.Services.WebMethod]
    public static Object insertData(string YEAR)
    {
        string resultMessage = "";

        try
        {
            MST_CALENDAR_DAL _dalMST_CALENDAR = new MST_CALENDAR_DAL();
            Hashtable _htParameters = new Hashtable();
            Utility.ApplyDefaultProp(_htParameters);
            _htParameters["Year"] = YEAR;

            _dalMST_CALENDAR.Insert(_htParameters);         
        }
        catch (Exception e)
        {
            resultMessage = "Process Insert data finish with error: " + e.Message;
        }
        return new { resultMessage };
    }

    [System.Web.Services.WebMethod]
    public static Object update(string date_flag, string date_unflag)
    {
        string resultMessage = "";
        try
        {
            MST_CALENDAR_DAL _dalMST_CALENDAR = new MST_CALENDAR_DAL();
            Hashtable _htParameters = new Hashtable();
            Utility.ApplyDefaultProp(_htParameters);
            
            foreach (var dt in date_flag.Split('|'))
            {
                _htParameters["p_working_Day"] = 0;
                _htParameters["p_date"] = dt.ToString();

                _dalMST_CALENDAR.Update(_htParameters);    

                //string update = "update tb_m_calendar set working_Day = 0 where date = '" + dt + "'";               
            }


            foreach (var dt in date_unflag.Split('|'))
            {
                _htParameters["p_working_Day"] = 1;
                _htParameters["p_date"] = dt.ToString();

                _dalMST_CALENDAR.Update(_htParameters);  

                //string update = "update tb_m_calendar set working_Day = 1 where date = '" + dt + "'";               
            }
        }

        catch (Exception e)
        {

            resultMessage = "Process Save data finish with error: " + e.Message;
        }
        return new { resultMessage };
    }
   
}
