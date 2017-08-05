using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.IO;
using MFin.DataAccessLayer.Security;
using MFin.DataAccessLayer;
//using DocumentFormat.OpenXml;
//using DocumentFormat.OpenXml.Packaging;
//using DocumentFormat.OpenXml.Wordprocessing;

using MFin.DataAccessLayer.Master;
using MPF23.XUI.Control;

using System.Linq;
using System.Data.SqlClient;

public class Shared
{
    public Shared()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region Security
    public static bool CheckPageRole(string sRole)
    {
        if (sRole.Equals(""))
            return true;
        else
            return CheckRole(sRole);
    }

    public static void CheckControlRole(Page p)
    {
        CheckControlRole(p.Controls);
    }

    public static void CheckControlRole(ControlCollection cc)
    {
        foreach (System.Web.UI.Control c in cc)
        {
            if (c.HasControls())
                CheckControlRole(c.Controls);
            else
            {
                if (c is XUIButton)
                {
                    XUIButton btn = ((XUIButton)c);
                    if (CheckRole(btn.RoleCode))
                        btn.Enabled = true;
                    else if (btn.RoleCode == "")
                        btn.Enabled = true;
                    else
                    {
                        btn.Enabled = false;
                        //btn.BackColor = System.Drawing.Color.Red;
                        btn.ForeColor = System.Drawing.Color.SlateGray;
                    }
                }
            }
        }
    }

    public static bool CheckRole(string sRole)
    {
        //System.Diagnostics.Debugger.Break();
        foreach (object role in (ArrayList)HttpContext.Current.Session[SessionKey.CURRENT_USER_ROLE_SESSION_KEY])
        {
            if (sRole == role.ToString())
                return true;
        }
        return false;
    }
    #endregion

    #region binding
    public static void BindAO(DropDownList ddl)
    {

        SysTblMarketingDAL _dalSysTblMarketing = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysTblMarketing = new SysTblMarketingDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalSysTblMarketing.GetRows(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

        }
        catch (Exception)
        {

        }

    }
    public static void BindAOC(DropDownList ddl, string ccode)
    {

        SysTblMarketingDAL _dalSysTblMarketing = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysTblMarketing = new SysTblMarketingDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";
            _htParameters["p_c_code"] = ccode;

            ddl.DataSource = _dalSysTblMarketing.GetRowsAsForDDLAOC(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }

    }

    public static void BindAOApp(DropDownList ddl, string ccode)
    {

        SysTblMarketingDAL _dalSysTblMarketing = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysTblMarketing = new SysTblMarketingDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";
            _htParameters["p_c_code"] = ccode;

            ddl.DataSource = _dalSysTblMarketing.GetRowsDDLApp(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();
        }
        catch (Exception)
        {

        }

    }
    public static void BindAOCode(DropDownList ddl, string ccode)
    {

        SysTblMarketingDAL _dalSysTblMarketing = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysTblMarketing = new SysTblMarketingDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";
            _htParameters["p_c_code"] = ccode;

            ddl.DataSource = _dalSysTblMarketing.GetRowsAsForDDLAOC(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "CODE";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }

    }

    public static void BindIndustry(DropDownList ddl)
    {
        LStblindustryDAL _dalLsTblIndustry = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLsTblIndustry = new LStblindustryDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLsTblIndustry.GetRows(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }
    public static void BindIndustry(string Keywords, GridView gvw)
    {
        LStblindustryDAL _dalLStblindustry = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblindustry = new LStblindustryDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLStblindustry.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindSubIndustry(DropDownList ddl)
    {
        LStblindustrysubDAL _dal = null;
        Hashtable _htParameters = null;

        try
        {
            _dal = new LStblindustrysubDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dal.GetRows(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("", ""));

        }
        catch (Exception)
        {

        }
    }

    public static void BindMake(string Keywords, GridView gvw)
    {
        LStblmakeDAL _dalLStblMake = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblMake = new LStblmakeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLStblMake.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }
    public static void BindMake(DropDownList ddl)
    {
        LStblmakeDAL _dalLsTblMake = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLsTblMake = new LStblmakeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLsTblMake.GetRows(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }
    public static void BindDDLMerk(DropDownList ddl)
    {
        RPTLsTblMakeDAL _dalRPTLsTblMake = null;
        Hashtable _htParameters = null;

        try
        {
            _dalRPTLsTblMake = new RPTLsTblMakeDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalRPTLsTblMake.GetRowsMerk(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindModel(DropDownList ddl, String MerkCode)
    {
        LStblmodelDAL _dalLsTblModel = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLsTblModel = new LStblmodelDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";
            _htParameters["p_code"] = MerkCode;

            ddl.DataSource = _dalLsTblModel.GetRows(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }

    public static void BindInsurer(string Keywords, GridView gvw)
    {
        LSinsurertblDAL _dalLSinsurerTbl = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSinsurerTbl = new LSinsurertblDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSinsurerTbl.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }
    public static void BindInsurer(DropDownList ddl)
    {
        LSinsurertblDAL _dalLSinsurerTbl = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSinsurerTbl = new LSinsurertblDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLSinsurerTbl.GetRows(_htParameters);
            ddl.DataValueField = "INSURERNO";
            ddl.DataTextField = "INSURER";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("",""));
        }
        catch (Exception)
        {

        }
    }
    public static void BindDDLInsurer(DropDownList ddl)
    {
        LSinsurertblDAL _dalLSinsurertbl = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSinsurertbl = new LSinsurertblDAL();
            _htParameters = new Hashtable();


            ddl.DataSource = _dalLSinsurertbl.GetRowsForDDL(_htParameters);
            ddl.DataValueField = "INSURERNO";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }
    public static void BindInsurerType(DropDownList ddl, String InsurerNo)
    {
        LSinsurertypeDAL _dalLSinsurerType = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSinsurerType = new LSinsurertypeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";
            _htParameters["p_insurerno"] = InsurerNo;

            ddl.DataSource = _dalLSinsurerType.GetRows(_htParameters);
            ddl.DataValueField = "INSPOLICY";
            ddl.DataTextField = "DESCPOLICY";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("", ""));
            
        }
        catch (Exception)
        {

        }
    }
    public static void BindDDLInsurerType(DropDownList ddl)
    {
        LSinsurertypeDAL _dalLSinsurertype = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSinsurertype = new LSinsurertypeDAL();
            _htParameters = new Hashtable();

            ddl.DataSource = _dalLSinsurertype.GetRowsForDDL(_htParameters);
            ddl.DataValueField = "INSPOLICY";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {
            
        }
    }

    public static void BindCurrency(DropDownList ddl)
    {
        SysCurrencyDAL _dalSysCurrency = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysCurrency = new SysCurrencyDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalSysCurrency.GetRows(_htParameters);
            ddl.DataValueField = "CURRENCY";
            ddl.DataTextField = "CURRENCY";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }
    public static void BindCurrencyValas(DropDownList ddl)
    {
        SysCurrencyDAL _dalSysCurrency = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysCurrency = new SysCurrencyDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalSysCurrency.GetRowsValas(_htParameters);
            ddl.DataValueField = "CURRENCY";
            ddl.DataTextField = "CURRENCY";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }

    public static void BindTblEquip(DropDownList ddl)
    {
        LStblequipDAL _dalLStblEquip = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblEquip = new LStblequipDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLStblEquip.GetRows(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCRIP";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }

    public static void BindBenchmark(DropDownList ddl)
    {
        LStblbenchmarkDAL _dalLStblBenchmark = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblBenchmark = new LStblbenchmarkDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLStblBenchmark.GetRows(_htParameters);
            ddl.DataValueField = "BENCHMARK";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }

    public static void BindJenisProduk(DropDownList ddl)
    {
        ReffSifatKreditDAL _dalReffSifatKredit = null;

        Hashtable _htParameter = null;

        try
        {
            _dalReffSifatKredit = new ReffSifatKreditDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffSifatKredit.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }
    public static void BindJenisProdukKelolaan(DropDownList ddl)
    {
        ReffJenisKelolaanDAL _dalReffJenisKelolaan = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffJenisKelolaan = new ReffJenisKelolaanDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffJenisKelolaan.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindStatus(DropDownList ddl)
    {
        ReffStatusDAL _dalReffStatus = null;

        Hashtable _htParameter = null;

        try
        {
            _dalReffStatus = new ReffStatusDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffStatus.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }
    public static void BindSalute(DropDownList ddl)
    {
        SysTblSaluteDAL _dalSysTblSalute = null;

        Hashtable _htParameter = null;

        try
        {
            _dalSysTblSalute = new SysTblSaluteDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalSysTblSalute.GetRows(_htParameter);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "CODE";
            ddl.DataBind();



        }
        catch (Exception)
        { }
    }
    public static void BindJabatan(DropDownList ddl)
    {
        ReffJabatanDAL _dalReffJabatan = null;

        Hashtable _htParameter = null;

        try
        {
            _dalReffJabatan = new ReffJabatanDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffJabatan.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindGolDebitur(DropDownList ddl)
    {
        ReffGolDebitur _dalReffGolDebitur = null;

        Hashtable _htParameter = null;

        try
        {
            _dalReffGolDebitur = new ReffGolDebitur();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffGolDebitur.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }
    public static void BindGolDebiturWStatus(DropDownList ddl, string status)
    {
        ReffGolDebitur _dalReffGolDebitur = null;

        Hashtable _htParameter = null;

        try
        {
            _dalReffGolDebitur = new ReffGolDebitur();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffGolDebitur.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();



        }
        catch (Exception)
        { }
    }

    public static void BindJenisAgunan(DropDownList ddl)
    {
        ReffJenisAgunanDAL _dalReffJenisAgunan = null;

        Hashtable _htParameter = null;

        try
        {
            _dalReffJenisAgunan = new ReffJenisAgunanDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffJenisAgunan.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }
    public static void BindJenisGuna(DropDownList ddl)
    {
        ReffJenisPenggunaanDAL _dalReffJenisPenggunaan = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffJenisPenggunaan = new ReffJenisPenggunaanDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffJenisPenggunaan.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "TEMPKETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindCollectibility(DropDownList ddl)
    {
        ReffCollectibilityDAL _dalReffCollectibility = null;

        Hashtable _htParameter = null;

        try
        {
            _dalReffCollectibility = new ReffCollectibilityDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffCollectibility.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindSebabMacet(DropDownList ddl)
    {
        ReffSebabMacetDAL _dalReffSebabMacet = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffSebabMacet = new ReffSebabMacetDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffSebabMacet.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindOrientasi(DropDownList ddl)
    {
        ReffOrientasiPenggunaanDAL _dalReffOrientasiPenggunaan = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffOrientasiPenggunaan = new ReffOrientasiPenggunaanDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffOrientasiPenggunaan.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "TEMPKETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindPekerjaan(DropDownList ddl)
    {
        ReffPekerjaanDAL _dalReffPekerjaan = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffPekerjaan = new ReffPekerjaanDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffPekerjaan.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindSektorEkonomi(DropDownList ddl)
    {
        ReffSektorEkonomiDAL _dalReffSektorEkonomi = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffSektorEkonomi = new ReffSektorEkonomiDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffSektorEkonomi.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindNegara(DropDownList ddl)
    {
        ReffNegaraDAL _dalReffNegara = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffNegara = new ReffNegaraDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffNegara.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            //ddl.ClearSelection();
            //ddl.Items.FindByValue("ID").Selected = true;
            ddl.DataBind();
        }
        catch (Exception)
        { }
    }

    public static void BindDati2Pro(DropDownList ddl)
    {
        ReffDati2DAL _dalReffDati2Pro = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffDati2Pro = new ReffDati2DAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffDati2Pro.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "NAMADAERAH";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindKondisi(DropDownList ddl)
    {
        ReffKondisiDAL _dalReffKondisi = null;
        Hashtable _htParameter = null;

        try
        {
            _dalReffKondisi = new ReffKondisiDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffKondisi.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindLsTblLocation(DropDownList ddl)
    {
        LStbllocationDAL _dalLStblLocation = null;
        Hashtable _htParameter = null;

        try
        {
            _dalLStblLocation = new LStbllocationDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalLStblLocation.GetRows(_htParameter);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

    public static void BindDocLocation(DropDownList ddl)
    {
        LStbldoclocDAL _dal = null;
        Hashtable _htParameter = null;

        try
        {
            _dal = new LStbldoclocDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dal.GetRows(_htParameter);
            ddl.DataValueField = "DOC_LOC";
            ddl.DataTextField = "DESC_LOC";
            ddl.DataBind();



        }
        catch (Exception)
        { }
    }

    public static void BindLessee(string Keywords, GridView gvw)
    {
        SysClientDAL _dalSysClient = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysClient = new SysClientDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalSysClient.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }
    public static void BindLesseeAsforIndustryCode(string Keywords, GridView gvw, string c_code)
    {
        SysClientDAL _dalSysClient = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysClient = new SysClientDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = c_code;
            DataTable _dt = _dalSysClient.GetRowsAsforIndustryCode(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(null, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    public static void BindSupplier(string Keywords, GridView gvw)
    {
        SysTblSupplierDAL _dalSysTblSupplier = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysTblSupplier = new SysTblSupplierDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalSysTblSupplier.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }

    public static void BindSupplierPlafond(string Keywords, GridView gvw)
    {
        SysTblSupplierDAL _dalSysTblSupplier = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysTblSupplier = new SysTblSupplierDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalSysTblSupplier.GetRowsforReports(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }


    public static void BindOLApp(string Keywords, GridView gvw)
    {
        OlApplicationDAL _dalOlApplication = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOlApplication = new OlApplicationDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalOlApplication.GetRowsForLookUp(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }

    public static void BindClient(string Keywords, GridView gvw)
    {
        SysClientDAL _dalSysClient = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysClient = new SysClientDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalSysClient.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }
    public static void BindClientGroup(string Keywords, GridView gvw)
    {
        SysClientgroupDAL _dalSysClientGroup = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysClientGroup = new SysClientgroupDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalSysClientGroup.GetRowsForLookUp(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }


    public static void BindDDLInsurance(DropDownList ddl)
    {
        LSinsurertypeDAL _ddlLSinsurertype = null;
        Hashtable _htParameters = null;

        try
        {
            _ddlLSinsurertype = new LSinsurertypeDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";

            ddl.DataSource = _ddlLSinsurertype.GetRowsForDDLinsurer(_htParameters);
            ddl.DataValueField = "INSPOLICY";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            
            
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindAgreementAsForDocument(string Keywords, GridView gvw, string c_code)
    {
        LSagreementDAL _dalLSagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSagreement = new LSagreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = c_code;

            DataTable _dt = _dalLSagreement.GetRowsForLookUpDocument(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {


        }
    }

    public static void BindAgreementAsForDepositInsurance(string Keywords, GridView gvw)
    {
        LSagreementDAL _dalLSagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSagreement = new LSagreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSagreement.GetRowsForDepositInsurance(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {


        }
    }
    
    public static void BindAgreement(string Keywords, GridView gvw)
    {
        LSagreementDAL _dalLSagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSagreement = new LSagreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_c_code"] = "ALL";
            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSagreement.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {


        }
    }
    public static void BindAgreementForLookUpWithCompanyCode(string Keywords, GridView gvw, string c_code)
    {
        LSagreementDAL _dalLSagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSagreement = new LSagreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = c_code;

            DataTable _dt = _dalLSagreement.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {


        }
    }

    public static void BindAgreementForLookUpWithCompanyCodeAndModule(string Keywords, GridView gvw, string c_code, string module)
    {
        LSagreementDAL _dalLSagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSagreement = new LSagreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = c_code;
            _htParameters["p_module"] = module;

            DataTable _dt = _dalLSagreement.GetRowswccodeandmodule(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {


        }
    }


    public static void BindAgreementDisbursed(string Keywords, string ccode, GridView gvw)
    {
        LSagreementDAL _dalLSagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSagreement = new LSagreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_c_code"] = ccode;
            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSagreement.GetRowsDisbursement(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {


        }
    }
    

    public static void BindAgreementForLookUpRestructure(string Keywords, GridView gvw)
    {
        LSagreementDAL _dalLSagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSagreement = new LSagreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSagreement.GetRowsForLookUpRestructure(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {


        }
    }
    public static void BindBuyAgreement(string Keywords, GridView gvw)
    {
        LsBuyAgreementDAL _dalLSbuyagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSbuyagreement = new LsBuyAgreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSbuyagreement.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public static void BindAgreementForLookUpRentalAdjust(string Keywords, GridView gvw)
    {
        LSagreementDAL _dalLSagreement = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSagreement = new LSagreementDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSagreement.GetRowsForLookUpRentalAdjust(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {


        }
    }

    public static void BindBadDebt(string Keywords, GridView gvw)
    {
        LsBadDebtDAL _dalLSbaddebt = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSbaddebt = new LsBadDebtDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSbaddebt.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindOlApplication(string Keywords, GridView gvw)
    {
        OlApplicationDAL _dalOlApplication = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOlApplication = new OlApplicationDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalOlApplication.GetRowsForDdlInsreg(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindFactoring(string Keywords, GridView gvw)
    {
        FCContractDAL _dalFCContractDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalFCContractDAL = new FCContractDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalFCContractDAL.GetRowsForDdlInsreg(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindAssetNoVehicle(string Keywords, GridView gvw)
    {
        LSassetvehicleDAL _dalLSassetvehicle = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSassetvehicle = new LSassetvehicleDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLSassetvehicle.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }

    public static void BindAssetNoVehiclePerNoAgreement(string Keywords, string lsagree, GridView gvw)
    {
        LSassetvehicleDAL _dalLSassetvehicle = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSassetvehicle = new LSassetvehicleDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_lsagree"] = lsagree;

            DataTable _dt = _dalLSassetvehicle.GetRowsPerAgreement(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }


    public static void BindAssetNoInsurance(string Keywords, string lsagree, string inspolicy,GridView gvw)
    {
        LSassetvehicleDAL _dalLSassetvehicle = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLSassetvehicle = new LSassetvehicleDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_lsagree"] = lsagree;
            _htParameters["p_inspolicy"] = inspolicy;

            DataTable _dt = _dalLSassetvehicle.GetRowsNoInsurance(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }


    public static void BindModule(DropDownList ddl)
    {
        SysModuleDAL _dalSysModule = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysModule = new SysModuleDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalSysModule.GetRows(_htParameters);
            ddl.DataTextField = "MODULE_DESC";
            ddl.DataValueField = "MODULE";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        {

        }
    }

    public static void BindDDLModule(DropDownList ddl, string c_code, int type)
    {
        SysModuleDAL _dalSysModule = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysModule = new SysModuleDAL();
            _htParameters = new Hashtable();

            _htParameters["p_c_code"] = c_code;
            _htParameters["p_type"] = type;

            ddl.DataSource = _dalSysModule.GetRowsDDL(_htParameters);
            ddl.DataTextField = "MODULE_DESC";
            ddl.DataValueField = "MODULE";
            ddl.DataBind();

        }
        catch (Exception)
        {

        }
    }

    public static void BindModuleAsforGLLink(string Keywords, GridView gvw, string c_code)
    {
        SysModuleDAL _dalGenModule = null;
        Hashtable _htParameters = null;

        try
        {
            _dalGenModule = new SysModuleDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = c_code;
            DataTable _dt = _dalGenModule.GetRowsAsforGLLink(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(null, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    public static void BindDDLAccPeriod(DropDownList ddl)
    {
        RPTAccshariabsDAL _dalRptAccShariabs = null;
        Hashtable _htParameters = null;

        try
        {
            _dalRptAccShariabs = new RPTAccshariabsDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalRptAccShariabs.GetRowsPeriod(_htParameters);
            ddl.DataValueField = "ACC_PERIOD";
            ddl.DataTextField = "ACC_PERIOD";
            ddl.DataBind();

            
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindDDLCompany(DropDownList ddl)
    {
        SysCompanyDAL _ddlSysCompany = null;
        Hashtable _htParameters = null;

        try
        {
            _ddlSysCompany = new SysCompanyDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";

            ddl.DataSource = _ddlSysCompany.GetRows(_htParameters);
            ddl.DataValueField = "C_CODE";
            ddl.DataTextField = "C_NAME";
            ddl.DataBind();

            
            
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindDDLCompanyByUID(DropDownList ddl, string UID)
    {
        SysCompanyDAL _ddlSysCompany = null;
        Hashtable _htParameters = null;

        try
        {
            _ddlSysCompany = new SysCompanyDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";
            _htParameters["p_user_id"] = UID;
            ddl.DataSource = _ddlSysCompany.GetRowsByUID(_htParameters);
            ddl.DataValueField = "C_CODE";
            ddl.DataTextField = "C_NAME";
            ddl.DataBind();



        }
        catch (Exception ex)
        {

        }
    }

    public static void BindDDLDepartment(DropDownList ddl)
    {
        PcDeptDAL _dalDepartment = null;
        Hashtable _htParameters = null;

        try
        {
            _dalDepartment = new PcDeptDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalDepartment.GetRows(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindZip(string Keywords, GridView gvw)
    {
        SysZIPDAL _dalSysZIP = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysZIP = new SysZIPDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            
            DataTable _dt = _dalSysZIP.GetRowsWithAreaCode(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public static void BindJenisPengikatan(DropDownList ddl)
    {
        ReffJenisPengikatanDAL _dalReffJenisPengikatan = null;

        Hashtable _htParameter = null;

        try
        {
            _dalReffJenisPengikatan = new ReffJenisPengikatanDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalReffJenisPengikatan.GetRows(_htParameter);
            ddl.DataValueField = "SANDI";
            ddl.DataTextField = "KETERANGAN";
            ddl.DataBind();

            
            
        }
        catch (Exception)
        { }
    }

   
    public static void BindDepartment(string Keywords, GridView gvw)
    {
        PcDeptDAL _dalDepartment = null;
        Hashtable _htParameters = null;

        try
        {
            _dalDepartment = new PcDeptDAL();
            _htParameters = new Hashtable();

            _htParameters["p_divisi"] = "all";
            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalDepartment.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindMiscFee(string Keywords, GridView gvw)
    {
        LSTblMiscFeeDAL _dalMiscFee = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMiscFee = new LSTblMiscFeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalMiscFee.GetRowsForProvisi(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindEmployee(string Keywords, GridView gvw)
    {
        PcEmplDAL _dalDepartment = null;
        Hashtable _htParameters = null;

        try
        {
            _dalDepartment = new PcEmplDAL();
            _htParameters = new Hashtable();

            _htParameters["p_divisi"] = "all";
            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalDepartment.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

   

    public static void BindDDLUsergroup(DropDownList ddl)
    {
        MasterGroupDAL _dalgroup = null;

        Hashtable _htParameter = null;

        try
        {
            _dalgroup = new MasterGroupDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalgroup.GetRows(_htParameter);
            ddl.DataValueField = "USERGROUP";
            ddl.DataTextField = "USERGROUPDESCNID";
            ddl.DataBind();
        }
        catch (Exception)
        { }
    }

    public static void BindDDLDivisi(DropDownList ddl)
    {
        SysDivisiDAL _dalSysDivisi = null;

        Hashtable _htParameter = null;

        try
        {
            _dalSysDivisi = new SysDivisiDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalSysDivisi.GetRows(_htParameter);
            ddl.DataValueField = "DIVISI";
            ddl.DataTextField = "DESCRIPTION";
            ddl.DataBind();
        }
        catch (Exception)
        { }
    }
    public static void BindDDLVhcType(DropDownList ddl)
    {
        SysVhcTypeDAL _dalSysvhc = null;

        Hashtable _htParameter = null;

        try
        {
            _dalSysvhc = new SysVhcTypeDAL();
            _htParameter = new Hashtable();

            _htParameter["p_keywords"] = "";

            ddl.DataSource = _dalSysvhc.GetRows(_htParameter);
            ddl.DataValueField = "VECTYPE";
            ddl.DataTextField = "VECTYPE";
            ddl.DataBind();
        }
        catch (Exception)
        { }
    }

    static public void BindDDLFACategory(DropDownList ddl)
    {
        FaCategoryDAL _dal = null;

        Hashtable _ht = null;

        try
        {
            _dal = new FaCategoryDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = "";

            ddl.DataSource = _dal.GetRows(_ht);
            ddl.DataValueField = "CAT_CODE";
            ddl.DataTextField = "CAT_NAME";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
        }
    }

    //new tgl 29 November 2013
    static public void BindDDLFACategoryLabel(DropDownList ddl)
    {
        RptFaLabelDAL _dal = null;

        Hashtable _ht = null;

        try
        {
            _dal = new RptFaLabelDAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = "";

            ddl.DataSource = _dal.GetRowsForCategory(_ht);
            ddl.DataValueField = "CAT_CODE";
            ddl.DataTextField = "CAT_NAME";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
        }
    }

    static public void BindDDLPmtSched1(DropDownList ddl)
    {
        SysTblpmtsched1DAL _dal = null;

        Hashtable _ht = null;

        try
        {
            _dal = new SysTblpmtsched1DAL();
            _ht = new Hashtable();

            _ht["p_keywords"] = "";

            ddl.DataSource = _dal.GetRows(_ht);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("------", "0"));

        }
        catch (Exception ex)
        {
        }
    }

    public static void BindYearTable(DropDownList ddl)
    {

        PcYearDAL _dalPcYear = null;
        Hashtable _htParameters = null;

        try
        {
            _dalPcYear = new PcYearDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalPcYear.GetRows(_htParameters);
            ddl.DataValueField = "Year";
            ddl.DataBind();

        }
        catch (Exception)
        {

        }

    }

    public static void BindMarketCoverage(DropDownList ddl)
    {

        PcMarketCoverageDAL _dalPcMarketCoverage = null;
        Hashtable _htParameters = null;

        try
        {
            _dalPcMarketCoverage = new PcMarketCoverageDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalPcMarketCoverage.GetRows(_htParameters);
            ddl.DataValueField = "DESCS";
            ddl.DataBind();

        }
        catch (Exception)
        {

        }

    }

    public static void BindCompanyAsforGLLink(string Keywords, GridView gvw)
    {
        SysCompanyDAL _dalSysCompanyDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysCompanyDAL = new SysCompanyDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            DataTable _dt = _dalSysCompanyDAL.GetRowsAsforGLLink(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(null, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    public static void BindKondisiGV(string Keywords, GridView gvw)
    {
        ReffKondisiDAL _dalReffKondisiDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalReffKondisiDAL = new ReffKondisiDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalReffKondisiDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }

    public static void BindSebabMacetGV(string Keywords, GridView gvw)
    {
        ReffSebabMacetDAL _dalReffSebabMacetDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalReffSebabMacetDAL = new ReffSebabMacetDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalReffSebabMacetDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }

   

    public static void BindDocType(string Keywords, GridView gvw)
    {
        DocTypeDAL _dalDocType = null;
        Hashtable _htParameters = null;

        try
        {
            _dalDocType = new DocTypeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            DataTable _dt = _dalDocType.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }

    public static void BindTranCode(DropDownList ddl)
    {
        LSTblMiscFeeDAL _dal = null;
        Hashtable _htParameters = null;

        try
        {
            _dal = new LSTblMiscFeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dal.GetRows(_htParameters);
            ddl.DataValueField = "TRANCODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();

            ddl.Items.Insert(0, new ListItem("", ""));

        }
        catch (Exception)
        {

        }
    }


    public static void BindCHModel(DropDownList ddl, String MerkCode)
    {
        CHtblmodelDAL _dalCHTblModel = null;
        Hashtable _htParameters = null;

        try
        {
            _dalCHTblModel = new CHtblmodelDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";
            _htParameters["p_module"] = 2;
            _htParameters["p_code"] = MerkCode;

            ddl.DataSource = _dalCHTblModel.GetRows(_htParameters);
            ddl.DataValueField = "CODE";
            ddl.DataTextField = "DESCS";
            ddl.DataBind();



        }
        catch (Exception)
        {

        }
    }

    public static void BindCHLesseeAsforIndustryCode(string Keywords, GridView gvw, string c_code)
    {
        SysClientDAL _dalSysClient = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysClient = new SysClientDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = c_code;
            _htParameters["p_module"] = 2;
            DataTable _dt = _dalSysClient.GetRowsCHAsforIndustryCode(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(null, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    public static void BindCHMake(string Keywords, GridView gvw)
    {
        CHtblmakeDAL _dalCHtblmakeDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalCHtblmakeDAL = new CHtblmakeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_module"] = 2;

            DataTable _dt = _dalCHtblmakeDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception)
        {

        }
    }

    public static void BindSubIndustry(string Keywords, GridView gvw)
    {
        LStblindustrysubDAL _dalLStblindustrysubDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblindustrysubDAL = new LStblindustrysubDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLStblindustrysubDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindSIDStatus(string Keywords, GridView gvw)
    {
        ReffStatusDAL _dalReffStatusDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalReffStatusDAL = new ReffStatusDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalReffStatusDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindSIDGolongan(string Keywords, GridView gvw)
    {
        ReffGolDebitur _dalReffGolDebitur = null;
        Hashtable _htParameters = null;

        try
        {
            _dalReffGolDebitur = new ReffGolDebitur();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalReffGolDebitur.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindSIDDATI2(string Keywords, GridView gvw)
    {
        ReffDati2DAL _dalReffDati2DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalReffDati2DAL = new ReffDati2DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalReffDati2DAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindSIDNegara(string Keywords, GridView gvw)
    {
        ReffNegaraDAL _dalReffNegaraDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalReffNegaraDAL = new ReffNegaraDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalReffNegaraDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindSIDPekerjaan(string Keywords, GridView gvw)
    {
        ReffPekerjaanDAL _dalReffPekerjaanDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalReffPekerjaanDAL = new ReffPekerjaanDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalReffPekerjaanDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindSIDBidUsaha(string Keywords, GridView gvw)
    {
        ReffSektorEkonomiDAL _dalReffSektorEkonomiDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalReffSektorEkonomiDAL = new ReffSektorEkonomiDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalReffSektorEkonomiDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    //OJK
    public static void BindOJKKelompok(string Keywords, GridView gvw)
    {
        OJKMasterKelompokDebiturDAL _dalOJKMasterKelompokDebiturDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterKelompokDebiturDAL = new OJKMasterKelompokDebiturDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterKelompokDebiturDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindOJKKategoriUsaha(string Keywords, GridView gvw)
    {
        OJKMasterKategoriUsahaDebiturDAL _dalOJKMasterKategoriUsahaDebiturDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterKategoriUsahaDebiturDAL = new OJKMasterKategoriUsahaDebiturDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterKategoriUsahaDebiturDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindOJKGolongan(string Keywords, GridView gvw)
    {
        OJKMasterGolonganDAL _dalOJKMasterGolonganDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterGolonganDAL = new OJKMasterGolonganDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterGolonganDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public static void BindOJKHubungan(string Keywords, GridView gvw)
    {
        OJKMasterHubungandenganPPDAL _dalOJKMasterHubungandenganPPDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterHubungandenganPPDAL = new OJKMasterHubungandenganPPDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterHubungandenganPPDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindOJKSektorEkonomi(string Keywords, GridView gvw)
    {
        OJKMasterSektorEkonomiDAL _dalOJKMasterSektorEkonomiDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterSektorEkonomiDAL = new OJKMasterSektorEkonomiDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterSektorEkonomiDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindOJKJenisPembiayaan(string Keywords, GridView gvw)
    {
        OJKMasterJenisPembiayaanDAL _dalOJKMasterJenisPembiayaanDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterJenisPembiayaanDAL = new OJKMasterJenisPembiayaanDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterJenisPembiayaanDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public static void BindOJKSkemaPembiayaan(string Keywords, int Type, GridView gvw)
    {
        OJKMasterSkemaPembiayaanDAL _dalOJKMasterSkemaPembiayaanDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterSkemaPembiayaanDAL = new OJKMasterSkemaPembiayaanDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";
            _htParameters["p_type"] = Type;

            DataTable _dt = _dalOJKMasterSkemaPembiayaanDAL.GetRowsWithType(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public static void BindOJKJenisBarangdanJasa(string Keywords, GridView gvw)
    {
        OJKMasterJenisBarangdanJasaDAL _dalOJKMasterJenisBarangdanJasaDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterJenisBarangdanJasaDAL = new OJKMasterJenisBarangdanJasaDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterJenisBarangdanJasaDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public static void BindOJKJenisSukuBunga(string Keywords, GridView gvw)
    {
        OJKMasterJenisSukuBungaDAL _dalOJKMasterJenisSukuBungaDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterJenisSukuBungaDAL = new OJKMasterJenisSukuBungaDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterJenisSukuBungaDAL.GetRowsJoinBagiHasil(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public static void BindOJKMataUang(string Keywords, GridView gvw)
    {
        OJKMasterMataUangDAL _dalOJKMasterMataUangDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterMataUangDAL = new OJKMasterMataUangDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterMataUangDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    public static void BindOJKLokasiProyek(string Keywords, GridView gvw)
    {
        OJKMasterLokasiProyekDAL _dalOJKMasterLokasiProyekDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterLokasiProyekDAL = new OJKMasterLokasiProyekDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterLokasiProyekDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindOJKJenisAgunan(string Keywords, GridView gvw)
    {
        OJKMasterJenisAgunanDAL _dalOJKMasterJenisAgunanDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalOJKMasterJenisAgunanDAL = new OJKMasterJenisAgunanDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;
            _htParameters["p_c_code"] = "ALL";

            DataTable _dt = _dalOJKMasterJenisAgunanDAL.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public static void BindDDLHRMSBranch(DropDownList ddl)
    {
        LStblBranchDAL _dalLStblBranchDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblBranchDAL = new LStblBranchDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLStblBranchDAL.GetRows(_htParameters);
            ddl.DataValueField = "BranchCode";
            ddl.DataTextField = "BranchName";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindDDLHRMSDept(DropDownList ddl)
    {
        LStblDeptDAL _dalLStblDeptDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblDeptDAL = new LStblDeptDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLStblDeptDAL.GetRows(_htParameters);
            ddl.DataValueField = "DeptCode";
            ddl.DataTextField = "DeptName";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindDDLHRMSGrade(DropDownList ddl)
    {
        LStblGradeDAL _dalLStblGradeDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblGradeDAL = new LStblGradeDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLStblGradeDAL.GetRows(_htParameters);
            ddl.DataValueField = "GradeCode";
            ddl.DataTextField = "GradeName";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindDDLHRMSLeader(DropDownList ddl)
    {
        EmployeeDAL _dalEmployeeDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployeeDAL = new EmployeeDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";
            _htParameters["p_status"] = "1";

            ddl.DataSource = _dalEmployeeDAL.GetRows(_htParameters);
            ddl.DataValueField = "Employee_NIK";
            ddl.DataTextField = "Employee_Name";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindDDLHRMSReligion(DropDownList ddl)
    {
        LStblReligionDAL _dalLStblReligionDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblReligionDAL = new LStblReligionDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";

            ddl.DataSource = _dalLStblReligionDAL.GetRows(_htParameters);
            ddl.DataValueField = "ReligionCode";
            ddl.DataTextField = "ReligionName";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindDDLHRMSUser(DropDownList ddl,string parameters)
    {
        MasterUserDAL _dalMasterUserDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMasterUserDAL = new MasterUserDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";
            _htParameters["p_Employee_ID"] = parameters;

            ddl.DataSource = _dalMasterUserDAL.GetRowsUserforHRMS(_htParameters);
            ddl.DataValueField = "USER_ID";
            ddl.DataTextField = "USER_NAME";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindDDLHRMSYear(DropDownList ddl, string parameters)
    {
        EmpLeaveBalance _dalEmpLeaveBalance = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpLeaveBalance = new EmpLeaveBalance();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";
            _htParameters["p_Employee_ID"] = parameters;

            ddl.DataSource = _dalEmpLeaveBalance.GetRowsYear(_htParameters);
            ddl.DataValueField = "YEAR";
            ddl.DataTextField = "YEAR";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindDDLHRMSTypeCost(DropDownList ddl, string parameters)
    {
        LStblCostTypeDAL _dalLStblCostTypeDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblCostTypeDAL = new LStblCostTypeDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = "";
            _htParameters["p_ID"] = parameters;

            ddl.DataSource = _dalLStblCostTypeDAL.GetRows(_htParameters);
            ddl.DataValueField = "Code";
            ddl.DataTextField = "Description";
            ddl.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void Bind_HRMS_PopUp(string refName, GridView gvw, string parameternya)
    {
        try
        {
            var dal = new GenericDAL();
            var htParameters = new Hashtable();
            var tableName = refName;
            htParameters["p_keywords"] = parameternya;

            gvw.DataSource = dal.GetRows(tableName, htParameters);
            gvw.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void Bind_HRMS_PopUp_SPD(string refName, GridView gvw, string parameternya)
    {
        try
        {
            var dal = new EmpSPDDAL();
            var htParameters = new Hashtable();
            var tableName = refName;
            htParameters["p_keywords"] = parameternya;

            gvw.DataSource = dal.GetRows(htParameters);
            gvw.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindGRVHRMSEmployee(GridView gvw, string parameternya)
    {
        EmployeeDAL _dalEmployeeDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployeeDAL = new EmployeeDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = parameternya;
            _htParameters["p_status"] = "1";

            gvw.DataSource = _dalEmployeeDAL.GetRows(_htParameters);
            gvw.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindGrvEmpSPDTask(GridView gvw, string p_SPD_No)
    {
        EmpSPDTaskDAL _dalEmpSPDTaskDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpSPDTaskDAL = new EmpSPDTaskDAL();
            _htParameters = new Hashtable();
            _htParameters["p_SPD_No"] = p_SPD_No;           

            gvw.DataSource = _dalEmpSPDTaskDAL.GetRows(_htParameters);
            gvw.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindGrvEmpSPDCost(GridView gvw, string p_SPD_No)
    {
        EmpSPDCostDAL _dalEmpSPDCostDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpSPDCostDAL = new EmpSPDCostDAL();
            _htParameters = new Hashtable();
            _htParameters["p_SPD_No"] = p_SPD_No;

            DataTable dt = new DataTable();
            dt = _dalEmpSPDCostDAL.GetRows(_htParameters);
            gvw.DataSource = dt;
            gvw.DataBind();

            if (dt.Rows.Count>0)
            {
                decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("Total_Cost"));
                gvw.FooterRow.Cells[2].Text = "Total";
                gvw.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;
                gvw.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                gvw.FooterRow.Cells[2].Font.Bold = true;
                gvw.FooterRow.Cells[5].Font.Bold = true;
                gvw.FooterRow.Cells[5].Text = total.ToString("N2");
            }                       
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindGrvEmpExclaim(GridView gvw, string ExClaim_No)
    {
        EmpExclaimDetailDAL _dalEmpExclaimDetailDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaimDetailDAL = new EmpExclaimDetailDAL();
            _htParameters = new Hashtable();
            _htParameters["p_ExClaim_No"] = ExClaim_No;

            DataTable dt = new DataTable();
            dt = _dalEmpExclaimDetailDAL.GetRows(_htParameters);
            gvw.DataSource = dt;
            gvw.DataBind();

            if(dt.Rows.Count>0)
            {
                decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("Total_Cost"));                
                gvw.FooterRow.Cells[14].Text = "Total";
                gvw.FooterRow.Cells[14].HorizontalAlign = HorizontalAlign.Right;
                gvw.FooterRow.Cells[14].Font.Bold = true;
                gvw.FooterRow.Cells[15].HorizontalAlign = HorizontalAlign.Right;
                gvw.FooterRow.Cells[15].Font.Bold = true;
                gvw.FooterRow.Cells[15].Text = total.ToString("N2");
            }
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void BindKaryawan(string Keywords, GridView gvw)
    {
        LStblemployeeDAL _dalLStblemployee = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblemployee = new LStblemployeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = Keywords;

            DataTable _dt = _dalLStblemployee.GetRows(_htParameters);
            gvw.DataSource = _dt;
            gvw.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    //public static void GetUserName(TextBox txt)
    //{
    //    try
    //    {
    //        //var dal = new GenericDAL();
    //        //var htParameters = new Hashtable();
    //        //var tableName = "SLIK_REF_" + refName;
    //        //htParameters["p_keywords"] = "";

    //        //ddl.DataSource = dal.GetRows(tableName, htParameters);
    //        //ddl.DataValueField = "CODE";
    //        //ddl.DataTextField = "DESCRIPTION";
    //        //ddl.DataBind(); 

    //        var dal = new GenericDAL();
    //        var htParameters = new Hashtable();
    //        //var tableName = "SLIK_REF_" + refName;
    //        //htParameters["p_keywords"] = parameternya;

    //        ddl.DataSource = dal.GetRows("sp_User_for_HRMS_getrow", htParameters);
    //        ddl.DataValueField = "USER_ID";
    //        ddl.DataTextField = "USER_NAME";
    //        ddl.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //        //throw ex;
    //    }
    //}
    #endregion

    #region misc
    public static void trimDDL(DropDownList ddl)
    {
        foreach (ListItem li in ddl.Items)
        {
            li.Value=li.Value.Trim();
            li.Text=li.Text.Trim();
        }
    }
    #endregion
    /*
    #region mail merge
    public static char[] splitChar = new char[] { ' ' };

    public static void Replace(WordprocessingDocument document, Dictionary<string, string> replaceOperations)
    {
        //find all the fields         
        foreach (var field in document.MainDocumentPart.Document.Body.Descendants<SimpleField>())
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
    }
    
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
    #endregion

    */
}