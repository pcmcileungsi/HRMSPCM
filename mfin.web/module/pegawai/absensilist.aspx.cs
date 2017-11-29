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
using System.IO;
using System.Text.RegularExpressions;

using MFin.DataAccessLayer.Master;

public partial class module_pegawai_absensilist : BasePage
{
    System.Data.DataTable dtx
    {
        get
        {
            return (System.Data.DataTable)ViewState["dt"];
        }
        set
        {
            ViewState["dt"] = value;
        }
    }

    private static string _RoleCode = "B100073";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
       
        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);

            BindGrid();            
        }
    }


    #region Toolbar
    protected void btnUpload_Click(object sender, EventArgs e)
    {        
        string filepath = "";
        try
        {
            HttpPostedFile file = Request.Files["ctl00$cphbd$upfile"];
            if (file != null && file.ContentLength > 0)
            {
                filepath = Server.MapPath("~/FileAttachments/");
                file.SaveAs(filepath + txtDocName.Text);
            }

            GetHtmlPage(filepath + txtDocName.Text);

            SaveData();

            BindGrid();

            string savefile = Path.Combine(Server.MapPath("~/FileAttachments/"), txtDocName.Text);
            if (System.IO.File.Exists(savefile))
                System.IO.File.Delete(savefile);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
            mdlPopupLoadingword2.Hide();
        }
        mdlPopupLoadingword2.Hide();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("absensirekap.aspx");
    }
    #endregion

    private string GetHtmlPage(string strURL)
    {
        String strResult;
        using (StreamReader sr = new StreamReader(strURL))
        {
            strResult = sr.ReadToEnd();
            sr.Close();
        }

        string[] values = strResult.Split(new string[] { "", "" }, StringSplitOptions.RemoveEmptyEntries);

        ConvertHTMLTablesToDataSet("" + values[0] + "");

        return strResult;
    }

    private DataSet ConvertHTMLTablesToDataSet(string HTML)
    {
        // Declarations
        DataSet ds = new DataSet();
        DataTable dt = null;
        DataRow dr = null;
        //DataColumn dc = null;           
        string TableExpression = "<table[^>]*>(.*?)</table>";
        string HeaderExpression = "<th[^>]*>(.*?)</th>";
        string RowExpression = "<tr[^>]*>(.*?)</tr>";
        string ColumnExpression = "<td[^>]*>(.*?)</td>";
        bool HeadersExist = false;
        int iCurrentColumn = 0;
        int iCurrentRow = 0;

        // Get a match for all the tables in the HTML
        MatchCollection Tables = Regex.Matches(HTML, TableExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);
        // Loop through each table element
        foreach (Match Table in Tables)
        {
            // Reset the current row counter and the header flag
            iCurrentRow = 0;
            HeadersExist = false;

            // Add a new table to the DataSet
            dt = new DataTable();

            //Create the relevant amount of columns for this table (use the headers if they exist, otherwise use default names)
            if (Table.Value.Contains("<th>"))
            {
                // Set the HeadersExist flag
                HeadersExist = true;

                // Get a match for all the rows in the table
                MatchCollection Headers = Regex.Matches(Table.Value, HeaderExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);

                // Loop through each header element
                foreach (Match Header in Headers)
                {
                    dt.Columns.Add(Header.Groups[1].ToString());
                }
            }
            else
            {
                //var x = Regex.Matches(Table.Value, TableExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase)[0].ToString();
                //var z = Regex.Matches(x, RowExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase)[0].ToString();
                //var y = Regex.Matches(z,ColumnExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);

                for (int iColumns = 1; iColumns <= Regex.Matches(Regex.Matches(Regex.Matches(Table.Value, TableExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase)[0].ToString(), RowExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase)[0].ToString(), ColumnExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase).Count; iColumns++)
                {
                    dt.Columns.Add("Column " + iColumns);
                }
            }

            //Get a match for all the rows in the table
            MatchCollection Rows = Regex.Matches(Table.Value, RowExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);

            // Loop through each row element
            foreach (Match Row in Rows)
            {
                // Only loop through the row if it isn't a header row
                if (!(iCurrentRow == 0 && HeadersExist))
                {
                    // Create a new row and reset the current column counter
                    dr = dt.NewRow();
                    iCurrentColumn = 0;

                    // Get a match for all the columns in the row
                    MatchCollection Columns = Regex.Matches(Row.Value, ColumnExpression, RegexOptions.Multiline | RegexOptions.Singleline | RegexOptions.IgnoreCase);

                    // Loop through each column element
                    foreach (Match Column in Columns)
                    {
                        // Add the value to the DataRow
                        dr[iCurrentColumn] = Column.Groups[1].ToString();

                        // Increase the current column
                        iCurrentColumn++;
                    }

                    // Add the DataRow to the DataTable
                    dt.Rows.Add(dr);
                }
                // Increase the current row counter
                iCurrentRow++;
            }

            // Add the DataTable to the DataSet
            ds.Tables.Add(dt);
        }
        
        dtx = dt;

        return ds;
    }

    private void SaveData()
    {
        HR_ABSENSI_DAL _dalHR_ABSENSI = null;
        Hashtable _htParameters = null;
		Hashtable _htParameters2 = null;
        string InOut = "";
        string InTime = "";
        string OutTime = "";
        string AttendLeave = "";
        string AttendTime = "";
        string LeaveTime = "";
        string Abnormal = "";
        string Abnormal0 = "";
        string Abnormal1 = "";
		int isInsert = 0;
       
        try
        {
            _dalHR_ABSENSI = new HR_ABSENSI_DAL();
            _htParameters = new Hashtable();
			_htParameters2 = new Hashtable();

            foreach (DataRow dr in dtx.Select("[Column 1] <> 'Date' and [Column 1] <> 'OutTime'"))
            //foreach (DataRow dr in dtx.Rows)
            {
                InOut = dr["Column 6"].ToString().Replace("<br>", ",");
                InTime = InOut.Split(',')[0];
                OutTime = InOut.Split(',')[1];

                AttendLeave = dr["Column 7"].ToString().Replace("<br>", ",");                 
                AttendTime = AttendLeave.Split(',')[0];
                if (AttendTime == "&nbsp;") AttendTime = "";
                LeaveTime = AttendLeave.Split(',')[1];
                if (LeaveTime == "&nbsp;") LeaveTime = "";

                Abnormal = dr["Column 8"].ToString().Replace("<br>", ",").Replace("<font color=#FF0000 size=2>", "").Replace("</font>", "");
                if (Abnormal.Contains(","))
                {
                    if (Abnormal.Split(',')[0] == "&nbsp;") Abnormal0 = Abnormal.Split(',')[1];
                    if (Abnormal.Split(',')[1] == "&nbsp;") Abnormal1 = Abnormal.Split(',')[0];

                    Abnormal = Abnormal0 + ";" + Abnormal1;
                }
				
				//Parameter Cek Insert
				_htParameters2["p_NIK"] = dr["Column 2"].ToString().Trim();
                _htParameters2["p_TANGGAL_ABSEN"] = DateTime.Now.Year.ToString() + "-" + dr["Column 1"].ToString();
                 
				 //Parameter Insert
                _htParameters["p_NIK"] = dr["Column 2"].ToString().Trim();
                _htParameters["p_TANGGAL_ABSEN"] = DateTime.Now.Year.ToString() + "-" + dr["Column 1"].ToString();
                _htParameters["p_IN_TIME"] = InTime;
                _htParameters["p_OUT_TIME"] = OutTime;
                _htParameters["p_ATTEND_TIME"] = AttendTime;
                _htParameters["p_LEAVE_TIME"] = LeaveTime;
                _htParameters["p_KODE_JENIS_SHIFT"] = dr["Column 5"].ToString().Substring(dr["Column 5"].ToString().Length - 1, 1);
                _htParameters["p_ABNORMAL"] = Abnormal.Trim();  
                _htParameters["p_WORK_TIME"] = Convert.ToInt16(dr["Column 9"].ToString().Replace("(Min)", ""));
                _htParameters["p_Keterangan"] = "";

                Utility.ApplyDefaultProp(_htParameters);
				Utility.ApplyDefaultProp(_htParameters2);
				
				_dalHR_ABSENSI.InsertCek(_htParameters2, ref isInsert);                            

                if (isInsert == 0)
                {
                   _dalHR_ABSENSI.Insert(_htParameters); 
                }                
            }
            Utility.ShowMessageBoxAnas(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, "Sukses");       
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindGrid()
    {
        HR_ABSENSI_DAL _dalHR_ABSENSI = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_ABSENSI = new HR_ABSENSI_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;

            gvwList.DataSource = _dalHR_ABSENSI.GetRows(_htParameters);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }    

    #region GridView
    
  
    protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void gvwList_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion
}
