using System;
using System.Collections;
using System.Collections.Generic;
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


using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.IO;


using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;

using MFin.DataAccessLayer;
using ICSharpCode.SharpZipLib.Zip;

public class Utility
{
    public Utility()
    {

    }

    #region Convertion
    public static DateTime ToDateTime(string dt)
    {
        System.Globalization.DateTimeFormatInfo dtfi = null;

        try
        {
            dtfi = new System.Globalization.DateTimeFormatInfo();
            dtfi.ShortDatePattern = "dd/MM/yyyy";

            return DateTime.Parse(dt, dtfi);

        }
        catch (Exception)
        {
            return new DateTime(1900, 1, 1);
        }
    }
    #endregion

    #region Message Box
    public static string SAVE_DATA_SUCCESS_MESSAGE = "Success to save data.";
    public static string SAVE_DATA_FAIL_MESSAGE = "Fail to save data.";
    public static string APPROVE_DATA_SUCCESS_MESSAGE = "Success to Approve data.";
    public static string APPROVE_DATA_FAIL_MESSAGE = "Fail to Approve data.";
    public static string REJECT_DATA_SUCCESS_MESSAGE = "Success to Reject data.";
    public static string REJECT_DATA_FAIL_MESSAGE = "Fail to Reject data.";
    public static string LOAD_DATA_FAIL_MESSAGE = "Fail to load data.";
    public static string DELETE_VALIDATION_MESSAGE = "Are you sure to delete this record?";
    public static string DELETE_VALIDATION_SUCCESS_MESSAGE = "Success to delete data.";
    public static string DELETE_VALIDATION_FAIL_MESSAGE = "Fail to delete data.";
    public static string MAIL_SENDING_SUCCESS_MESSAGE = "Success to sending mail.";
    public static string MAIL_SENDING_FAIL_MESSAGE = "Fail to sending mail.";

    public static void ApplyDefaultProp(Hashtable ht)
    {
        //ht["p_module"] = 2;

        ht["p_cre_date"] = DateTime.Now;
        ht["p_cre_by"] = CurrentUID;
        ht["p_cre_ip_address"] = CurrentIPAddress;

        ht["p_mod_date"] = DateTime.Now;
        ht["p_mod_by"] = CurrentUID;
        ht["p_mod_ip_address"] = CurrentIPAddress;
    }

    public static void deleteValidation(Page Page, string Message, Exception Ex, string NextUrl)
    {
        string script = "";


        string sMessage = Message;
        string sURL = NextUrl;
        string sTitle = "";

        if (Ex != null)
            sMessage += GetAllExceptionMessage(Ex);

        if (NextUrl != null)
            sURL = "\'" + NextUrl + "\'";

        if (Ex == null)
            sTitle = "Sukses";
        else
            sTitle = "Gagal";


        sMessage = sMessage.Replace("\n", "").Replace("\r", "").Replace("\'", "\\'");

        script = @" 
                    $(function() {

                        var $dialog = $('<div></div>')
		                                .html('" + sMessage + @"')
		                                .dialog({
		                                    autoOpen: false,
                                            width: 400,
		                                    title: '" + sTitle + @"',
		                                    buttons: {
		                                        Ok: function() {
		                                            " + script + "  $(this).dialog('close'); ";

        if (NextUrl != null)
            script += @"location.href = " + sURL + @";";

        script += @"

		                                        }
                                                 Cancel: function(){
                                                    " + script + "  $(this).dialog('close'); ";

        if (NextUrl != null)
            script += @"location.href = " + sURL + @";";

        script += @"
		                                    }
		                                });

                        $dialog.dialog('open');

                    });
                ";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msgbox", script, true);
    }

    public static void ShowMessageBox(Page Page, string Message, Exception Ex, string NextUrl)
    {
        string script = "";


        string sMessage = Message;
        string sURL = NextUrl;
        string sTitle = "";

        if (Ex != null)
            sMessage += GetAllExceptionMessage(Ex);

        if (NextUrl != null)
            sURL = "\'" + NextUrl + "\'";

        if (Ex == null)
            sTitle = "Sukses";
        else
            sTitle = "Gagal";


        sMessage = sMessage.Replace("\n", "").Replace("\r", "").Replace("\'", "\\'");

        script = @" 
                    $(function() {

                        var $dialog = $('<div></div>')
		                                .html('" + sMessage + @"')
		                                .dialog({
		                                    autoOpen: false,
                                            width: 400,
		                                    title: '" + sTitle + @"',
		                                    buttons: {
		                                        Ok: function() {
		                                            " + script + "  $(this).dialog('close'); ";

        if (NextUrl != null)
            script += @"location.href = " + sURL + @";";

        script += @"

		                                        }
		                                    }
		                                });

                        $dialog.dialog('open');

                    });
                ";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msgbox", script, true);
    }
    public static void ShowMessageBox(Page Page, string Message, Exception Ex, string NextUrl, string Script)
    {
        string script = "";


        string sMessage = Message;
        string sURL = NextUrl;
        string sTitle = "";

        if (Ex != null)
            sMessage += GetAllExceptionMessage(Ex);

        if (NextUrl != null)
            sURL = "\'" + NextUrl + "\'";

        if (Ex == null)
            sTitle = "Sukses";
        else
            sTitle = "Gagal";


        sMessage = sMessage.Replace("\n", "").Replace("\r", "").Replace("\'", "\\'");

        script = @" 
                    $(function() {

                        var $dialog = $('<div></div>')
		                                .html('" + sMessage + @"')
		                                .dialog({
		                                    autoOpen: false,
                                            width: 400,
		                                    title: '" + sTitle + @"',
		                                    buttons: {
		                                        Ok: function() {
		                                            " + Script + " $(this).dialog('close'); ";

        if (NextUrl != null)
            script += @"location.href = " + sURL + @";";

        script += @"

		                                        }
		                                    }
		                                });

                        $dialog.dialog('open');

                    });
                ";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msgbox", script, true);
    }

    public static void ShowMessageBoxAnas(Page Page, string Message, string sTitle)
    {
        string script = "";


        string sMessage = Message;
        
     
        sMessage = sMessage.Replace("\n", "").Replace("\r", "").Replace("\'", "\\'");

        script = @" 
                    $(function() {

                        var $dialog = $('<div></div>')
		                                .html('" + sMessage + @"')
		                                .dialog({
		                                    autoOpen: false,
                                            width: 400,
		                                    title: '" + sTitle + @"',
		                                    buttons: {
		                                        Ok: function() {
		                                             $(this).dialog('close'); ";

        script += @"

		                                        }
		                                    }
		                                });

                        $dialog.dialog('open');

                    });
                ";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "msgbox", script, true);
    }
    public static string GetAllExceptionMessage(Exception ex)
    {
        string sError = "";
        Exception exInner = ex;

        while (exInner != null)
        {
            sError += "<br><br><em>" + exInner.Message.Replace("\"", "") + "</em>";
            exInner = exInner.InnerException;
        }

        return sError;
    }
    #endregion


    #region Current
    public static string CurrentUID
    {
        //get { return "admin"; } 
        get {return ((DataRow)HttpContext.Current.Session[SessionKey.CURRENT_USER_SESSION_KEY])["user_id"].ToString(); }
    }
    public static string CurrentIPAddress
    {
        get { return HttpContext.Current.Session[SessionKey.CURRENT_USER_IP_ADDRESS_SESSION_KEY].ToString(); }
    }
    public static string CurrentUName
    {
        get { return ((DataRow)HttpContext.Current.Session[SessionKey.CURRENT_USER_SESSION_KEY])["staff_name"].ToString(); }
    }
    public static string CurrentUBaseBranchCode
    {
        get { return ((DataRow)HttpContext.Current.Session[SessionKey.CURRENT_USER_SESSION_KEY])["default_branch_code"].ToString(); }
    }
    public static string CurrentUBaseBranchName
    {
        get { return ((DataRow)HttpContext.Current.Session[SessionKey.CURRENT_USER_SESSION_KEY])["default_branch_name"].ToString(); }
    }
    public static string CurrentYear
    {
        get { return DateTime.Now.ToString("yyyy"); }
    }
    public static string CurrentMonth
    {
        get { return DateTime.Now.ToString("MM"); }
    }
    public static string CurrentDay
    {
        get { return DateTime.Now.ToString("dd"); }
    }
    public static string CurrentDate
    {
        get { return DateTime.Now.ToString("dd/MM/yyyy"); }
    }
    #endregion


    public static void BindYear(DropDownList ddl, int from, int to)
    {
        ddl.Items.Add(new System.Web.UI.WebControls.ListItem("Pilih", "0"));

        for (int i = from; i <= to; i++)
            ddl.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
    }
    public static void BindMonth(DropDownList ddl)
    {

        string[] str = new string[13] { "Pilih ", "Januari", "Pebuari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "Nopember", "Desember" };
        string[] intValue = new string[13] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" };

        for (int i = 0; i < 13; i++)
            ddl.Items.Add(new System.Web.UI.WebControls.ListItem(str[i], intValue[i]));
    }



    #region Report
    public static string ExecuteReportHRMS(Page page, string spName, Hashtable parameter, string rptName, string pdfName, string tblName)
    {
        ReportDAL _ReportDAL = null;
        ReportDocument rptDoc = null;
        string sRptFormula = "";
        try
        {
            //  execute DAL first
            _ReportDAL = new ReportDAL();
            _ReportDAL.ExecuteSPReport(spName, parameter);

            //  generate report
            rptDoc = new ReportDocument();
            rptDoc.Load(rptName);

            ConnectionInfo connectionInfo = new ConnectionInfo();
            connectionInfo.DatabaseName = RPTDBName;
            connectionInfo.ServerName = RPTDBServer;
            connectionInfo.UserID = RPTDBUID;
            connectionInfo.Password = RPTDBPassword;

            foreach (CrystalDecisions.CrystalReports.Engine.Table table in rptDoc.Database.Tables)
            {
                TableLogOnInfo tloi = table.LogOnInfo;
                tloi.ConnectionInfo = connectionInfo;
                table.ApplyLogOnInfo(tloi);
            }

            //sRptFormula = "{" + tblName + ".USER_ID} = \"" + Utility.CurrentUID + "\"";

            //rptDoc.RecordSelectionFormula = sRptFormula;
            rptDoc.ExportToDisk(ExportFormatType.PortableDocFormat, pdfName);
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to load/run report : " + rptName, ex);
        }
        finally
        {
            rptDoc.Close();
            rptDoc.Dispose();
        }

        return pdfName;
    }
    
    public static string ExecuteReport(Page page, string spName, Hashtable parameter, string rptName, string pdfName, string tblName)
    {
        ReportDAL _ReportDAL = null;
        ReportDocument rptDoc = null;
        string sRptFormula = "";
        try
        {
            //  execute DAL first
            _ReportDAL = new ReportDAL();
            _ReportDAL.ExecuteSPReport(spName, parameter);

            //  generate report
            rptDoc = new ReportDocument();
            rptDoc.Load(rptName);

            ConnectionInfo connectionInfo = new ConnectionInfo();
            connectionInfo.DatabaseName = RPTDBName;
            connectionInfo.ServerName = RPTDBServer;
            connectionInfo.UserID = RPTDBUID;
            connectionInfo.Password = RPTDBPassword;

            foreach (CrystalDecisions.CrystalReports.Engine.Table table in rptDoc.Database.Tables)
            {
                TableLogOnInfo tloi = table.LogOnInfo;
                tloi.ConnectionInfo = connectionInfo;
                table.ApplyLogOnInfo(tloi);
            }

            sRptFormula = "{" + tblName + ".USER_ID} = \"" + Utility.CurrentUID + "\"";

            rptDoc.RecordSelectionFormula = sRptFormula;
            rptDoc.ExportToDisk(ExportFormatType.PortableDocFormat, pdfName);
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to load/run report : " + rptName, ex);
        }
        finally
        {
            rptDoc.Close();
            rptDoc.Dispose();
        }

        return pdfName;
    }
    public static string ExecuteReport(Page page, string spName, Hashtable parameter, string rptName, string pdfName, string tblName, ExportFormatType formatType)
    {
        ReportDAL _ReportDAL = null;
        ReportDocument rptDoc = null;
        string sRptFormula = "";
        try
        {
            //  execute DAL first
            _ReportDAL = new ReportDAL();
            _ReportDAL.ExecuteSPReport(spName, parameter);

            //  generate report
            rptDoc = new ReportDocument();
            rptDoc.Load(rptName);

            ConnectionInfo connectionInfo = new ConnectionInfo();
            connectionInfo.DatabaseName = RPTDBName;
            connectionInfo.ServerName = RPTDBServer;
            connectionInfo.UserID = RPTDBUID;
            connectionInfo.Password = RPTDBPassword;

            foreach (CrystalDecisions.CrystalReports.Engine.Table table in rptDoc.Database.Tables)
            {
                TableLogOnInfo tloi = table.LogOnInfo;
                tloi.ConnectionInfo = connectionInfo;

                table.ApplyLogOnInfo(tloi);
            }

            sRptFormula = "{" + tblName + ".USER_ID} = \"" + Utility.CurrentUID + "\"";

            rptDoc.RecordSelectionFormula = sRptFormula;
            rptDoc.ExportToDisk(formatType, pdfName);
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to load/run report : " + rptName, ex);
        }
        finally
        {
            rptDoc.Close();
            rptDoc.Dispose();
        }

        return pdfName;
    }

    public static string ExecuteReport(Page page, string spReportName, string spResultName, Hashtable parameter, string txtName)
    {
        ReportDAL dalReport = null;
        string fullpathtextfile = "";
        try
        {
            //  execute DAL first
            dalReport = new ReportDAL();
            DataTable dt = dalReport.ExecuteTextReport(spReportName, spResultName, parameter);
            ArrayList al = new ArrayList();

            foreach (DataRow dr in dt.Rows)
            {
                al.Add(dr[0]);
            }

            fullpathtextfile = WriteToTextFile(page, txtName, al);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }

        return fullpathtextfile;
    }
    
    public static string ExecuteReportExportExcel(Page page, string spReportName, string spResultName, Hashtable parameter, string filepath)
    {
        ReportDAL dalReport = null;
        string fullpathtextfile = "";
        try
        {
            //  execute DAL first
            dalReport = new ReportDAL();
            DataTable dt = dalReport.ExecuteExcelReport(spReportName, spResultName, parameter);
            ArrayList column = new ArrayList();

            if (spResultName != null)
            {
                column = new ArrayList();
                foreach (DataColumn col in dt.Columns)
                {
                    column.Add(col.ColumnName);
                }
                ExportToExcel(filepath, dt, column);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }

        return filepath;
    }

    public static string WriteToTextFile(Page page, string sFileName, ArrayList al)
    {
        string Filename = page.Server.MapPath(@"~\temp\txt\" + sFileName);
        StreamWriter sw = File.CreateText(Filename);

        for (int i = 0; i < al.Count; i++)
            sw.WriteLine(al[i].ToString());

        sw.Close();

        return Filename;
    }

    public static string CombineReport(IList pdfFiles, string pdfFile)
    {
        try
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            foreach (object o in pdfFiles)
            {
                sb.Append(o.ToString());
                sb.Append(" ");
            }

            sb.AppendFormat("cat output {0} allow printing", pdfFile);

            System.Diagnostics.Process p = System.Diagnostics.Process.Start(PDFTK, sb.ToString());
            p.WaitForExit();

            return pdfFile;
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to combine pdf file.", ex);
        }
    }
    public static string ExecuteReportAmortAdjust(Page page, string spName, Hashtable parameter, string rptName, string pdfName, string tblName, int amortadjust)
    {
        ReportDAL _ReportDAL = null;
        ReportDocument rptDoc = null;
        string sRptFormula = "";
        try
        {
            //  execute DAL first
            _ReportDAL = new ReportDAL();
            _ReportDAL.ExecuteSPReport(spName, parameter);

            //  generate report
            rptDoc = new ReportDocument();
            rptDoc.Load(rptName);

            ConnectionInfo connectionInfo = new ConnectionInfo();
            connectionInfo.DatabaseName = RPTDBName;
            connectionInfo.ServerName = RPTDBServer;
            connectionInfo.UserID = RPTDBUID;
            connectionInfo.Password = RPTDBPassword;

            foreach (CrystalDecisions.CrystalReports.Engine.Table table in rptDoc.Database.Tables)
            {
                TableLogOnInfo tloi = table.LogOnInfo;
                tloi.ConnectionInfo = connectionInfo;
                table.ApplyLogOnInfo(tloi);
            }

            sRptFormula = "{" + tblName + ".USER_ID} = \"" + Utility.CurrentUID + "\"" + " and " + "{" + tblName + ".RPT_SERIAL} = " + amortadjust;

            rptDoc.RecordSelectionFormula = sRptFormula;
            rptDoc.ExportToDisk(ExportFormatType.PortableDocFormat, pdfName);
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to load/run report : " + rptName, ex);
        }
        finally
        {
            rptDoc.Close();
            rptDoc.Dispose();
        }

        return pdfName;
    }

    public static string ExecuteReportAmortAdjustExport(Page page, string spName, Hashtable parameter, string rptName, string pdfName, string tblName, int amortadjust, ExportFormatType formatType)
    {
        ReportDAL _ReportDAL = null;
        ReportDocument rptDoc = null;
        string sRptFormula = "";
        try
        {
            //  execute DAL first
            _ReportDAL = new ReportDAL();
            _ReportDAL.ExecuteSPReport(spName, parameter);

            //  generate report
            rptDoc = new ReportDocument();
            rptDoc.Load(rptName);

            ConnectionInfo connectionInfo = new ConnectionInfo();
            connectionInfo.DatabaseName = RPTDBName;
            connectionInfo.ServerName = RPTDBServer;
            connectionInfo.UserID = RPTDBUID;
            connectionInfo.Password = RPTDBPassword;

            foreach (CrystalDecisions.CrystalReports.Engine.Table table in rptDoc.Database.Tables)
            {
                TableLogOnInfo tloi = table.LogOnInfo;
                tloi.ConnectionInfo = connectionInfo;
                table.ApplyLogOnInfo(tloi);
            }

            sRptFormula = "{" + tblName + ".USER_ID} = \"" + Utility.CurrentUID + "\"" + " and " + "{" + tblName + ".RPT_SERIAL} = " + amortadjust;

            rptDoc.RecordSelectionFormula = sRptFormula;
            rptDoc.ExportToDisk(formatType, pdfName);
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to load/run report : " + rptName, ex);
        }
        finally
        {
            rptDoc.Close();
            rptDoc.Dispose();
        }

        return pdfName;
    }

    public static string ExecuteReportAmorTemp(Page page, string spName, Hashtable parameter, string rptName, string pdfName, string tblName, string lsagree)
    {
        ReportDAL _ReportDAL = null;
        ReportDocument rptDoc = null;
        string sRptFormula = "";
        try
        {
            //  execute DAL first
            _ReportDAL = new ReportDAL();
            _ReportDAL.ExecuteSPReport(spName, parameter);

            //  generate report
            rptDoc = new ReportDocument();
            rptDoc.Load(rptName);

            ConnectionInfo connectionInfo = new ConnectionInfo();
            connectionInfo.DatabaseName = RPTDBName;
            connectionInfo.ServerName = RPTDBServer;
            connectionInfo.UserID = RPTDBUID;
            connectionInfo.Password = RPTDBPassword;

            foreach (CrystalDecisions.CrystalReports.Engine.Table table in rptDoc.Database.Tables)
            {
                TableLogOnInfo tloi = table.LogOnInfo;
                tloi.ConnectionInfo = connectionInfo;
                table.ApplyLogOnInfo(tloi);
            }

            sRptFormula = "{" + tblName + ".USER_ID} = \"" + Utility.CurrentUID + "\"" + " and " + "{" + tblName + ".LSAGREE} = \"" + Utility.CurrentUID + "\"";

            rptDoc.RecordSelectionFormula = sRptFormula;
            rptDoc.ExportToDisk(ExportFormatType.PortableDocFormat, pdfName);
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to load/run report : " + rptName, ex);
        }
        finally
        {
            rptDoc.Close();
            rptDoc.Dispose();
        }

        return pdfName;
    }

    public static void ExecuteSP(string spName, Hashtable parameter)
    {
        ReportDAL _ReportDAL = null;

        try
        {
            _ReportDAL = new ReportDAL();
            _ReportDAL.ExecuteSPReport(spName, parameter);
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to exec sp : " + spName, ex);
        }
    }

    public static string ExecuteOnlyReport(Page page, string rptName, string pdfName, string tblName)
    {
        ReportDAL _ReportDAL = null;
        ReportDocument rptDoc = null;
        string sRptFormula = "";
        try
        {
            //ScriptManager.RegisterStartupScript(page, page.GetType(), "cursor", "document.body.style.cursor = 'wait';", true);
            //  execute DAL first
            //_ReportDAL = new ReportDAL();
            //_ReportDAL.ExecuteSPReport(spName, parameter);

            //  generate report
            rptDoc = new ReportDocument();
            rptDoc.Load(rptName);

            ConnectionInfo connectionInfo = new ConnectionInfo();
            connectionInfo.DatabaseName = RPTDBName;
            connectionInfo.ServerName = RPTDBServer;
            connectionInfo.UserID = RPTDBUID;
            connectionInfo.Password = RPTDBPassword;

            foreach (CrystalDecisions.CrystalReports.Engine.Table table in rptDoc.Database.Tables)
            {
                TableLogOnInfo tloi = table.LogOnInfo;
                tloi.ConnectionInfo = connectionInfo;
                table.ApplyLogOnInfo(tloi);
            }

            sRptFormula = "{" + tblName + ".USER_ID} = \"" + Utility.CurrentUID + "\"";

            rptDoc.RecordSelectionFormula = sRptFormula;
            rptDoc.ExportToDisk(ExportFormatType.PortableDocFormat, pdfName);
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to load/run report : " + rptName, ex);
        }
        finally
        {
            rptDoc.Close();
            rptDoc.Dispose();
            //ScriptManager.RegisterStartupScript(page, page.GetType(), "cursor", "document.body.style.cursor = 'default';", true);
        }

        return pdfName;
    }

    private static string RPTDBServer
    {
        get { return System.Configuration.ConfigurationSettings.AppSettings["RPTDBServer"]; }
    }
    private static string RPTDBName
    {
        get { return System.Configuration.ConfigurationSettings.AppSettings["RPTDBName"]; }
    }
    private static string RPTDBUID
    {
        get { return System.Configuration.ConfigurationSettings.AppSettings["RPTDBUID"]; }
    }
    private static string RPTDBPassword
    {
        get { return System.Configuration.ConfigurationSettings.AppSettings["RPTDBPassword"]; }
    }
    public static string PDFTK
    {
        get { return System.Configuration.ConfigurationSettings.AppSettings["PDFTK"]; }
    }

    public static string XLS2XLS
    {
        get { return System.Configuration.ConfigurationSettings.AppSettings["XLS2XLS"]; }
    }
    #endregion

    public static string ConvertXLSXtoXLS(string Source, string folderOutput)
    {
        try
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.AppendFormat("-P:Source={0},Target={1},PureConsole=True", Source, "C:\\TEMP");
            System.Diagnostics.Process p = System.Diagnostics.Process.Start(XLS2XLS, sb.ToString());
            p.WaitForExit();

            return folderOutput;
        }
        catch (Exception ex)
        {
            throw new Exception("Fail to combine pdf file.", ex);
        }
    }

    public static string ExportToExcel(string filepath, DataTable dt, ArrayList column)
    {
        DataTable table = new DataTable();
        CreateTable(dt, ref table, column);

        string file = new ExcelHelper().ExportToExcel(table);
        // string rootPath =  HttpContext.Current.Server.MapPath("~").ToString();
        // string localCopy = filepath; //Guid.NewGuid().ToString() + ".xlsx";
        //string filename = GetFileName(filepath);
        //string filenamex = "";
        //if (filename[filename.Length - 1] != 'x')
        //    filenamex = filename + "x";
        //else
        //    filenamex = filename;

        //File.Copy(file, "C:\\TEMP\\" + filenamex, true);
        //ConvertXLSXtoXLS("C:\\TEMP\\" + filenamex, "C:\\TEMP");

        //File.Copy("C:\\TEMP\\-Unlicensed-" + filenamex.Substring(0,filenamex.Length-1), filepath, true);
        if (filepath[filepath.Length - 1] != 'x')
            filepath += "x";
        File.Copy(file, filepath, true);

        return filepath;
    }

    private static void CreateTable(DataTable source, ref DataTable table, ArrayList column)
    {
        // create columns
        //int counter = 0;
        foreach (DataColumn col in source.Columns)
        {
            DataColumn datacol = new DataColumn(col.ColumnName);
            datacol.DataType = col.DataType;
            table.Columns.Add(datacol);
            //counter++;
        }

        // fill rows
        foreach (DataRow row in source.Rows)
        {
            DataRow dr;
            dr = table.NewRow();

            foreach (string col in column)
            {
                dr[col] = row[col];
            }
            /*
            for (int i = 0; i < row.Cells.Count; i++)
            {
                dr[i] = row.Cells[i].Text.Replace("&nbsp;", " ");
            }
            */
            table.Rows.Add(dr);
        }
    }

    private static string GetFileName(string filepath)
    {
        string filename = "";

        string[] s = filepath.Split('\\');

        filename = s[s.Length - 1];

        return filename;
    }

    #region MailMerge
    public static void CopyStream(Stream source, Stream target)
    {
        if (source != null)
        {
            MemoryStream mstream = source as MemoryStream;
            if (mstream != null) mstream.WriteTo(target);
            else
            {
                byte[] buffer = new byte[2048];
                int length = buffer.Length, size;
                while ((size = source.Read(buffer, 0, length)) != 0)
                    target.Write(buffer, 0, size);
            }
        }
    }

    public static void CopyFile(string templatefile, string resultfilename)
    {
        MemoryStream documentStream;
        String templatePath = templatefile;
        using (Stream tplStream = File.OpenRead(templatePath))
        {
            documentStream = new MemoryStream((int)tplStream.Length);
            CopyStream(tplStream, documentStream);
            documentStream.Position = 0L;
        }
        using (WordprocessingDocument template = WordprocessingDocument.Open(documentStream, true))
        {
            template.ChangeDocumentType(DocumentFormat.OpenXml.WordprocessingDocumentType.Document);
            MainDocumentPart mainPart = template.MainDocumentPart;
            mainPart.DocumentSettingsPart.AddExternalRelationship("http://schemas.openxmlformats.org/officeDocument/2006/relationships/attachedTemplate", new Uri(templatePath, UriKind.Absolute));
            mainPart.Document.Save();
        }


        string path = resultfilename;
        File.WriteAllBytes(path, documentStream.ToArray());
    }

    public static string MailMerge(Page p, string templatefile, string resultfilename, Dictionary<string, string> replaceOperations)
    {
        CopyFile(templatefile, resultfilename);

        using (WordprocessingDocument wordDoc = WordprocessingDocument.Open(resultfilename, true))
        {
            Replace(wordDoc, replaceOperations);
        }

        return resultfilename;
    }

    public static char[] splitChar = new char[] { ' ' };
    public static void Replace(WordprocessingDocument document, Dictionary<string, string> replaceOperations)
    {
        ////find all the fields in the body         
        //foreach (var field in document.MainDocumentPart.Document.Body.Descendants<SimpleField>())
        //{
        //    //parse the instruction             
        //    string[] instruction = field.Instruction.Value.Split(splitChar, StringSplitOptions.RemoveEmptyEntries);

        //    //check if it's a merge field, and if so...             

        //    if (instruction[0].ToLower().Equals("mergefield"))
        //    {
        //        //get the field name                 
        //        string fieldname = instruction[1];

        //        //find the text inside (there will only be one)                 
        //        foreach (var fieldtext in field.Descendants<Text>())
        //        {
        //            //see if we know what to set this value to                     
        //            string value = replaceOperations.ContainsKey(fieldname) ? replaceOperations[fieldname] : null;

        //            //if we found the replace value, set the text to this value                     
        //            if (value != null)
        //                fieldtext.Text = value;

        //            //should only be one text inside                     
        //            break;
        //        }
        //    }
        //}

      
        //find all the fields in the body         
        foreach (var field in document.MainDocumentPart.Document.Descendants<SimpleField>())
        {
            //parse the instruction             
            string[] instruction = field.Instruction.Value.Split(splitChar, StringSplitOptions.RemoveEmptyEntries);

            //check if it's a merge field, and if so...             

            if (instruction[0].ToLower().Equals("mergefield"))
            {
                //get the field name                 
                string fieldname = instruction[1];

                //find the text inside (there will only be one)                 
                foreach (var fieldtext in field.Descendants<Text>())
                {
                    //see if we know what to set this value to                     
                    string value = replaceOperations.ContainsKey(fieldname) ? replaceOperations[fieldname] : null;

                    //if we found the replace value, set the text to this value                     
                    if (value != null)
                        fieldtext.Text = value;

                    //should only be one text inside                     
                    break;
                }
            }
        }

        //bisa berubah tapi begitu di print gak bisa karena error 
        //document.MainDocumentPart.Document.Save(); 
        foreach (FooterPart fpart in document.MainDocumentPart.FooterParts)
        {
            foreach (var fieldFooter in fpart.Footer.Descendants<SimpleField>())
            {
                //parse the instruction             
                string[] instructionfooter = fieldFooter.Instruction.Value.Split(splitChar, StringSplitOptions.RemoveEmptyEntries);

                //check if it's a merge field, and if so...             

                if (instructionfooter[0].ToLower().Equals("mergefield"))
                {
                    //get the field name                 
                    string fieldnamefooter = instructionfooter[1];

                    //find the text inside (there will only be one)                 
                    foreach (var fieldtextfooter in fieldFooter.Descendants<Text>())
                    {
                        //see if we know what to set this value to                     
                        string footervalue = replaceOperations.ContainsKey(fieldnamefooter) ? replaceOperations[fieldnamefooter] : null;

                        //if we found the replace value, set the text to this value                     
                        if (footervalue != null)
                            fieldtextfooter.Text = footervalue;
                            //fpart.Footer.Save();    // save header back in package
                        //should only be one text inside                     
                        break;
                    }
                }

            }
            //... // process fields
            //fpart.Footer.Save();    // save header back in package
            //document.MainDocumentPart.Document.Save();
            //fpart.Footer.Save();
        }
        //document.MainDocumentPart.Document.Save();
    }
    #endregion


    public static string ZipFiles(ArrayList files, string zipfilepath)
    {
        try
        {
            // Depending on the directory this could be very large and would require more attention
            // in a commercial package.
            ArrayList filenames = files;

            // 'using' statements guarantee the stream is closed properly which is a big source
            // of problems otherwise.  Its exception safe as well which is great.
            if (File.Exists(zipfilepath))
                File.Delete(zipfilepath);


            using (ZipOutputStream s = new ZipOutputStream(File.Create(zipfilepath)))
            {

                s.SetLevel(9); // 0 - store only to 9 - means best compression

                byte[] buffer = new byte[4096];

                foreach (string file in filenames)
                {

                    // Using GetFileName makes the result compatible with XP
                    // as the resulting path is not absolute.
                    ZipEntry entry = new ZipEntry(Path.GetFileName(file));

                    // Setup the entry data as required.

                    // Crc and size are handled by the library for seakable streams
                    // so no need to do them here.

                    // Could also use the last write time or similar for the file.
                    entry.DateTime = DateTime.Now;
                    s.PutNextEntry(entry);

                    using (FileStream fs = File.OpenRead(file))
                    {

                        // Using a fixed size buffer here makes no noticeable difference for output
                        // but keeps a lid on memory usage.
                        int sourceBytes;
                        do
                        {
                            sourceBytes = fs.Read(buffer, 0, buffer.Length);
                            s.Write(buffer, 0, sourceBytes);
                        } while (sourceBytes > 0);
                    }
                }

                // Finish/Close arent needed strictly as the using statement does this automatically

                // Finish is important to ensure trailing information for a Zip file is appended.  Without this
                // the created file would be invalid.
                s.Finish();

                // Close is important to wrap things up and unlock the file.
                s.Close();
            }
        }
        catch (Exception ex)
        {
            //Console.WriteLine("Exception during processing {0}", ex);

            // No need to rethrow the exception as for our purposes its handled.
        }
        return zipfilepath;
    }

}
