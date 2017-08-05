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


using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using Excel;
using MFin.DataAccessLayer;
using MFin.DataAccessLayer.Security;


public partial class module_master_lstblleaveimport : BasePage
{
    #region Load
    private static string _RoleCode = "B100055";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            txtStartDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            BindGridUpload();
        }
    }
    #endregion 

    #region Download
    protected void btnDownloadTemplate_OnClick(object sender, EventArgs e)
    {
        EmpLeaveBalance _dalEmpLeaveBalance = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpLeaveBalance = new EmpLeaveBalance();
            _htParameters = new Hashtable();

            string empcode = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString().Trim();

            _htParameters["p_START_DATE"] = Utility.ToDateTime(txtStartDate.Text);
            _htParameters["p_END_DATE"] = Utility.ToDateTime(txtEndDate.Text);

            var dt = _dalEmpLeaveBalance.GetRowsTempBalanceDataExcel(_htParameters);

            if (dt.Rows.Count <= 0)
                throw new Exception("No data found for date " + txtStartDate.Text + " to date " + txtEndDate.Text);

            var filename = "employee_leave_quota" + empcode + "_" + Utility.ToDateTime(txtStartDate.Text).ToString("yyyyMMdd");
            var filepath = Server.MapPath(@"~\temp\xls\" + filename);

            var columns = new string[dt.Columns.Count];
            var rows = new string[dt.Rows.Count];
            var i = 0;
            foreach (DataColumn col in dt.Columns)
            {
                columns[i] = col.ColumnName;
                i++;
            }
            var builder = new StringBuilder();
            builder.Append(string.Join(",", columns.ToArray())).Append("\n");
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                var currentRow = new string[dt.Columns.Count];
                var j = 0;
                foreach (DataColumn col in dt.Columns)
                {
                    object item = dr[col];
                    currentRow[j] = (item.ToString());
                    j++;
                }
                rows[i] = string.Join(",", currentRow.ToArray());
                i++;
            }
            builder.Append(string.Join("\n", rows.ToArray()));
            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + filename + ".csv");
            Response.Write(builder.ToString());
            Response.End();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }
    #endregion

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstblleavelist.aspx");
    }
   
    protected void btnLog_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Log",
            "window.open('../../temp/txt/logUploadLeaveQuotaData.txt', 'Log', 'fullscreen=0,menubar=0,status=0,scrollbars=0,resizable=1,toolbar=0,width=600,height=400');",
            true);
    }
    protected void btnProcess_Click(object sender, EventArgs e)
    {
        EmpLeaveBalance _dalEmpLeaveBalance = null;
        Hashtable htParameters = null;
        try
        {
            _dalEmpLeaveBalance = new EmpLeaveBalance();
            htParameters = new Hashtable();

            htParameters["p_user_id"] = Session[SessionKey.CURRENT_USER_SESSION_KEY].ToString().Trim();
            Utility.ApplyDefaultProp(htParameters);
            _dalEmpLeaveBalance.TempBalanceUploadProcess(htParameters);
            BindGridUpload();

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, null, null);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }
    
    

   

    

    #endregion

    #region Upload
    private void BindGridUpload()
    {
        EmpLeaveBalance _dalEmpLeaveBalance = null;
        Hashtable htParameters = null;
        try
        {
            _dalEmpLeaveBalance = new EmpLeaveBalance();
            htParameters = new Hashtable();
            htParameters["p_keywords"] = txtSearchListUpload.Text;
            gvwListUpload.DataSource = _dalEmpLeaveBalance.GetRowsTempBalanceGrid(htParameters);
            gvwListUpload.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchListUpload_Click(object sender, EventArgs e)
    {
        BindGridUpload();
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        var valid = true;
        if (!FileUploadControl.HasFile) return;
        var filename = FileUploadControl.FileName;
        var s = filename.Split('.');
        var extension = s[s.Length - 1];
        var saveAsFileName = "UploadKtaBatchPayment_" + DateTime.Now.ToString("yyyyMMddhhmmss") + "." + extension;
        var contenttype = FileUploadControl.PostedFile.ContentType;
        var log = "";
        try
        {
            if (contenttype == "application/octet-stream" || contenttype == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" || contenttype == "application/vnd.ms-excel" || contenttype == "text/csv")
            {
                FileUploadControl.SaveAs(Server.MapPath(@"../../temp/xls/") + saveAsFileName);
                log += "Upload file " + filename + " success.\t" + DateTime.Now.ToString(CultureInfo.InvariantCulture) + "\n\r";
                var uploadedPath = Server.MapPath(@"../../temp/xls/") + saveAsFileName;
                
                var ctr = 0;
                var parser = new Microsoft.VisualBasic.FileIO.TextFieldParser(uploadedPath);
                parser.TextFieldType = Microsoft.VisualBasic.FileIO.FieldType.Delimited;
                parser.SetDelimiters(new string[] { "," });

                while (!parser.EndOfData)
                {
                    string[] row = parser.ReadFields();
                    if (ctr == 0)
                    {
                        ctr = 1;
                    }
                    else
                    {
                        if (row != null)
                        {
                            var employee_code = row[0];
                            var employee_name = row[1];
                            var start_date = row[5];
                            var end_date = row[6]; 
                            var Quota = row[7];

                            if (employee_code != "Employee_NIK")
                            {
                                try
                                {
                                    //InsertXlsRowData(row);
                                    EmpLeaveBalance _dalEmpLeaveBalance = null;
                                    Hashtable htParameters = null;

                                    _dalEmpLeaveBalance = new EmpLeaveBalance();
                                    htParameters = new Hashtable();
                                    var iNextId = 0;
                                    htParameters.Clear();
                                    htParameters["p_Employee_Code"] = employee_code;
                                    htParameters["p_START_DATE"] = Utility.ToDateTime(start_date);
                                    htParameters["p_END_DATE"] = Utility.ToDateTime(end_date);
                                    htParameters["p_Quota"] = Quota;
                                    Utility.ApplyDefaultProp(htParameters);
                                    _dalEmpLeaveBalance.InsertTempBalance(htParameters, ref iNextId);
                                    
                                    log += "Insert Data : " + employee_code + " - " + employee_name + " Success.\t" +
                                           DateTime.Now.ToString(CultureInfo.InvariantCulture) + "\n\r";
                                }
                                catch (Exception exc)
                                {
                                    log += "Insert Data : " + employee_code + " - " + employee_name +
                                           " Failed.\t" + exc.InnerException.Message + "\t" +
                                           DateTime.Now.ToString(CultureInfo.InvariantCulture) + "\n\r";
                                    valid = false;
                                   // Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
                                }
                            }                            
                        }
                    }
                }

                Utility.ShowMessageBox(this,
                    valid ? "Upload Success" : "Upload Success but error in processing data. Check Log for detail info.",
                    null, "lstblleaveimport.aspx");
                //BindGridUpload();
            }
            else
            {
                Utility.ShowMessageBox(this, "Error Excel Format", null, null);
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, "Upload Failed.", ex, null);
        }

        CreateLog(log);
    }

    private void CreateLog(string log)
    {
        //simpan log
        FileStream fs = null;
        StreamWriter sw = null;
        var filepath = Server.MapPath(@"../../temp/txt/") + "logUploadLeaveQuotaData.txt";
        try
        {
            fs = new FileStream(filepath, FileMode.Create, FileAccess.ReadWrite);

            sw = new StreamWriter(fs);
            sw.WriteLine(log);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, "Log file not created. The following error occured: " + ex.Message, null, null);
        }
        finally
        {
            if (sw != null)
            {
                sw.Close();
                sw.Dispose();
            }

            if (fs != null)
            {
                fs.Close();
                fs.Dispose();
            }
        }
    }  

    protected void btnDeleteUpload_Click(object sender, EventArgs e)
    {
        EmpLeaveBalance _dalEmpLeaveBalance = null;
        Hashtable htParameters = null;
        try
        {
            _dalEmpLeaveBalance = new EmpLeaveBalance();
            htParameters = new Hashtable();

            htParameters["p_user_id"] = Session[SessionKey.CURRENT_USER_SESSION_KEY].ToString().Trim();

            _dalEmpLeaveBalance.DeleteTempBalance(htParameters);
            BindGridUpload();

            Utility.ShowMessageBox(this, Utility.DELETE_VALIDATION_SUCCESS_MESSAGE, null, null, null);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.DELETE_VALIDATION_FAIL_MESSAGE, ex, null, null);
        }
    }
    #endregion
}
