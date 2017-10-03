using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Globalization;
using System.Collections.Generic;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;
using System.Linq;
using MFin.DataAccessLayer.Master;


public partial class module_pegawai_absensirekap : BasePage
{
        string tgl1
    {
        get
        {
            return (string)ViewState["tgl1"];
        }
        set
        {
            ViewState["tgl1"] = value;
        }
    }

        string tgl2
    {
        get
        {
            return (string)ViewState["tgl2"];
        }
        set
        {
            ViewState["tgl2"] = value;
        }
    }

        string tanggal1
        {
            get
            {
                return (string)ViewState["tanggal1"];
            }
            set
            {
                ViewState["tanggal1"] = value;
            }
        }

        string tanggal2
        {
            get
            {
                return (string)ViewState["tanggal2"];
            }
            set
            {
                ViewState["tanggal2"] = value;
            }
        }

        private static string _RoleCode = "B100139";		

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadInit();

            if (!IsPostBack)
            {
                CheckRole(_RoleCode);				
				
				TahunOption(ddlYear, DateTime.Now.Year.ToString());
                BindUnitKerja();                

                if (Session["year_absen"] != null) ddlYear.SelectedValue = Session["year_absen"].ToString();
                if (Session["month_absen"] != null) ddlMonth.SelectedValue = Session["month_absen"].ToString();
                if (Session["uker_absen"] != null) ddlUnitKerja.SelectedValue = Session["uker_absen"].ToString();

                BindGrid();
            }
        }
		
		private bool IsNumeric(string strInput)
        {
            decimal output;
            return decimal.TryParse(strInput, out output);
        }
		
		private void TahunOption(DropDownList oCombo, string cDefault)
        {
            int nNow = DateTime.Now.Year;
            for (int n = nNow; n >= 2010; n--)
            {                
                oCombo.Items.Add(new ListItem(n.ToString(), n.ToString()));
                if (n.ToString() == cDefault)
                {
                    oCombo.SelectedValue = n.ToString();
                }
            }
        }
		
		private void BindUnitKerja()
		   {
			 MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
			 Hashtable _htParameters = null;

			try
			{
				_dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
				_htParameters = new Hashtable();

			   _htParameters["p_keywords"] = "";
			   _htParameters["p_majelis"] = "";

				ddlUnitKerja.DataSource = _dalMST_UNIT_KERJA_DAL.GetRows(_htParameters);
				ddlUnitKerja.DataValueField = "KODE";
				ddlUnitKerja.DataTextField = "NAMA";
				ddlUnitKerja.DataBind();
			}
			catch (Exception ex)
			{
				Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
			}
		  }

        private void BindGrid()
        {
            HR_ABSENSI_DAL _dalHR_ABSENSI = null;
            Hashtable _htParameters = null;

            string year = ddlYear.SelectedValue;
            string month = ddlMonth.SelectedValue;

            try
            {
                _dalHR_ABSENSI = new HR_ABSENSI_DAL();
                _htParameters = new Hashtable();

                _htParameters["p_TANGGAL_ABSEN1"] = year + "-" + month + "-21";

                tgl1 = year + "-" + month + "-21";
                tanggal1 = "21" + "-" + month + "-" + year;

                if (Convert.ToInt16(month) + 1 == 13) { month = "01"; year = (Convert.ToInt16(year) + 1).ToString(); } else month = (Convert.ToInt16(month) + 1).ToString();

                _htParameters["p_TANGGAL_ABSEN2"] = year + "-" + month  + "-20";

                tgl2 = year + "-" + month + "-20";

                if (Convert.ToInt16(month) < 10)
                    tanggal2 = "20" + "-0" + month + "-" + year;
                else
                    tanggal2 = "20" + "-" + month + "-" + year;

                _htParameters["p_KODE_UNIT_KERJA"] = ddlUnitKerja.SelectedValue.ToString();

                gvwList.DataSource = _dalHR_ABSENSI.GetRowsRekap(_htParameters);
                gvwList.DataBind();
            }
            catch (Exception ex)
            {
                Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
            }
        }    

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["year_absen"] = ddlYear.SelectedValue;
            Session["month_absen"] = ddlMonth.SelectedValue;
            Session["uker_absen"] = ddlUnitKerja.SelectedValue;

            Response.Redirect("absensilist.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwList.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvwList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string nik = gvwList.SelectedDataKey[0].ToString();
            string nama = gvwList.SelectedDataKey[1].ToString();

            Session["tgl_absen"] = tgl1 + " s/d " + tgl2;
            Session["tgl2_absen"] = tanggal1 + " s/d " + tanggal2;
            Session["year_absen"] = ddlYear.SelectedValue;
            Session["month_absen"] = ddlMonth.SelectedValue;
            Session["uker_absen"] = ddlUnitKerja.SelectedValue;
            Session["nik_absen"] = nik;
            Session["nama_absen"] = nama;

            Response.Redirect("absensirekapdtl.aspx");
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
     
}


