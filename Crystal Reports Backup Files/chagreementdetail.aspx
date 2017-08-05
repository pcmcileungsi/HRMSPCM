<%@ Page Title="" Language="C#" MasterPageFile="~/mfin2.master" AutoEventWireup="true"
    CodeFile="chagreementdetail.aspx.cs" Inherits="module_channelling_transaction_chagreementdetail" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            jsPopUpDate('ctl00_cphbd_txtApplicDt');
            jsPopUpDate('ctl00_cphbd_txtCHRntDueDate1');
            jsPopUpDate('ctl00_cphbd_txtCHDisbursedt');
        });

        function onLoadFunction() {
            jsPopUpDate('ctl00_cphbd_txtApplicDt');
            jsPopUpDate('ctl00_cphbd_txtCHRntDueDate1');
            jsPopUpDate('ctl00_cphbd_txtCHDisbursedt');
            $('#ctl00_cphbd_txtLsPeriod').unbind();
            
        }

        function calculateAmountFinance() {
            var asset = $get("ctl00_cphbd_txtCostLease").value,
                sd = $get("ctl00_cphbd_txtDPLease").value;
            var temp = (jsToNumber(asset) / 1) - (jsToNumber(sd) / 1);
            $get("ctl00_cphbd_txtAmtLease").value = jsToCurrencywocent(temp);
        }


        function maskCurrency(id) {
            var val = $get(id).value;
            var mask = jsToCurrency(val);
            $get(id).value = mask;
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31
            &&(charCode < 48 || charCode > 57))
//            if (charCode != 46 && charCode > 31
//            && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>

    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td style="border-bottom: solid 1px #dedede">
                <span class="search-header">Application Detail</span>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: text-bottom;">
                <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                    Text="Back" OnClick="btnBack_Click" />
                <%--<asp:Button ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" />--%>
                <asp:TextBox ID="txtApplicnoHd" runat="server" Enabled="false" Width="120px"></asp:TextBox>
                <asp:TextBox ID="txtLesseeHd" runat="server" Enabled="false" Width="280px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>Entry</span></a></li>
            <li><a href="#page-1"><span>Term Condition</span></a></li>
            <li><a href="#page-2"><span>Charges</span></a></li>
            <li><a href="#page-3"><span>Amortisation Tifa</span></a></li>
            <li><a href="#page-4"><span>Amortisation Nasabah</span></a></li>
            <li><a href="#page-5"><span>Collateral</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <asp:UpdatePanel ID="pnlBodyAppEntry" runat="server">
                <ContentTemplate>
                    <table id="tblBody" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                        <tr>
                            <td>
                                <cc1:XUIButton RoleCode="B200012" ID="btnSaveAppEntry" runat="server" CssClass="save" Text="Save" OnClick="btnSaveAppEntry_Click" />
                                <cc1:XUIButton RoleCode="B200012" ID="btnClone" runat="server" CssClass="set" Text="Clone" OnClick="btnClone_Click" />
                            </td>       
                        </tr>
                        <tr>
                            <td colspan="3" style="border-top: solid 1px black;">
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td width="20%">
                                <span>ID</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUILabel ID="lblLSAGREEMENTID" runat="server" DataType="Integer" DBColumnName="LS_AGREEMENTID"
                                    BindType="Both" SPParameterName="p_ls_agreementid" Text="0"></cc1:XUILabel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Application Status</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUILabel ID="lblAppStatus" runat="server" DataType="String" DBColumnName="APPSTATUSNAME"
                                    BindType="Both" SPParameterName="p_status" Text="Marketing"></cc1:XUILabel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Application No.</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtLSAGREE" runat="server" DataType="String" DBColumnName="LSAGREE"
                                    BindType="Both" Enabled="false" SPParameterName="p_lsagree" MaxLength="20" Width="160px"
                                    Text="--Auto Generated--"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Application Date</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtApplicDt" runat="server" DataType="DateTime" Format="dd/MM/yyyy"
                                    DBColumnName="APPLICDT" BindType="Both" SPParameterName="p_applicdt" MaxLength="10"
                                    Width="68px" Style="text-align: center;"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Lessee</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <asp:UpdatePanel ID="updLesseeInfo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <cc1:XUITextBox ID="txtLessee" runat="server" DataType="String" DBColumnName="LESSEE"
                                            BindType="Both" SPParameterName="p_lessee" MaxLength="10" Width="80px" Style="display: none;">
                                        </cc1:XUITextBox>
                                        <cc1:XUILabel ID="lblLesseCode" ReadOnly="true" runat="server" DataType="String"
                                            DBColumnName="LESSEE" BindType="DBToUIOnly" SPParameterName="p_lessee"></cc1:XUILabel>
                                        <asp:ImageButton ID="btnLookUpLessee" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpLessee_Click" />
                                        <cc1:XUITextBox ID="txtLesseeName" runat="server" DataType="String" DBColumnName="LESSEENAME"
                                            BindType="DBToUIOnly" Enabled="False" MaxLength="40" Width="494px"></cc1:XUITextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-bottom: solid 1px black;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <h2>
                                    OJK Information
                                </h2>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%"><span>Jenis Pembiayaan *</span></td>
                            <td width="1%"><span>:</span></td>
                            <td width="79%">
                                <asp:UpdatePanel ID="updOJKJenisPembiayaanInfo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <cc1:XUITextBox ID="txtOJKJenisPembiayaan_Code" runat="server" DataType="String" DBColumnName="OJKJENISPEMBIAYAAN_CODE"
                                            BindType="Both" SPParameterName="p_ojkjenispembiayaan_code" MaxLength="20" Width="48px" Enabled="false">
                                        </cc1:XUITextBox>
                                        <asp:ImageButton ID="imgBtnLookUpOJKJenisPembiayaan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKJenisPembiayaan_Click" Enabled ="false" />                                    
                                        <cc1:XUITextBox ID="txtOJKJenisPembiayaan_Descs" runat="server" DataType="String" DBColumnName="OJKJENISPEMBIAYAAN_DESCS"
                                            BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled ="false"></cc1:XUITextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%"><span>Skema Pembiayaan *</span></td>
                            <td width="1%"><span>:</span></td>
                            <td width="79%">
                                <asp:UpdatePanel ID="updOJKSkemaPembiayaanInfo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <cc1:XUITextBox ID="txtOJKSkemaPembiayaan_Code" runat="server" DataType="String" DBColumnName="OJKSKEMAPEMBIAYAAN_CODE"
                                            BindType="Both" SPParameterName="p_ojkskemapembiayaan_code" MaxLength="20" Width="48px" Enabled="false">
                                        </cc1:XUITextBox>
                                        <asp:ImageButton ID="imgBtnLookUpOJKSkemaPembiayaan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKSkemaPembiayaan_Click" Enabled ="false"/>                                    
                                        <cc1:XUITextBox ID="txtOJKSkemaPembiayaan_Descs" runat="server" DataType="String" DBColumnName="OJKSKEMAPEMBIAYAAN_DESCS"
                                            BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled ="false"></cc1:XUITextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%"><span>Jenis Barang dan Jasa *</span></td>
                            <td width="1%"><span>:</span></td>
                            <td width="79%">
                                <asp:UpdatePanel ID="updOJKJenisBarangdanJasaInfo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <cc1:XUITextBox ID="txtOJKJenisBarangdanJasa_Code" runat="server" DataType="String" DBColumnName="OJKJENISBARANGDANJASA_CODE"
                                            BindType="Both" SPParameterName="p_ojkjenisbarangdanjasa_code" MaxLength="20" Width="48px" Enabled="false">
                                        </cc1:XUITextBox>
                                        <asp:ImageButton ID="imgBtnLookUpOJKJenisBarangdanJasa" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKJenisBarangdanJasa_Click" Enabled = "false" />                                    
                                        <cc1:XUITextBox ID="txtOJKJenisBarangdanJasa_Descs" runat="server" DataType="String" DBColumnName="OJKJENISBARANGDANJASA_DESCS"
                                            BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled =" false"></cc1:XUITextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%"><span>Jenis Suku Bunga/Bagi Hasil *</span></td>
                            <td width="1%"><span>:</span></td>
                            <td width="79%">
                                <asp:UpdatePanel ID="updOJKJenisSukuBungaInfo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <cc1:XUITextBox ID="txtOJKJenisSukuBunga_Code" runat="server" DataType="String" DBColumnName="OJKJENISSUKUBUNGA_CODE"
                                            BindType="Both" SPParameterName="p_ojkjenissukubunga_code" MaxLength="20" Width="48px" Enabled="false">
                                        </cc1:XUITextBox>
                                        <asp:ImageButton ID="imgBtnLookUpOJKJenisSukuBunga" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKJenisSukuBunga_Click" Enabled ="false" />                                    
                                        <cc1:XUITextBox ID="txtOJKJenisSukuBunga_Descs" runat="server" DataType="String" DBColumnName="OJKJENISSUKUBUNGA_DESCS"
                                            BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled ="false"></cc1:XUITextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%"><span>Mata Uang *</span></td>
                            <td width="1%"><span>:</span></td>
                            <td width="79%">
                                <asp:UpdatePanel ID="updOJKMataUangInfo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <cc1:XUITextBox ID="txtOJKMataUang_Code" runat="server" DataType="String" DBColumnName="OJKMATAUANG_CODE"
                                            BindType="Both" SPParameterName="p_ojkmatauang_code" MaxLength="20" Width="48px" Enabled="false">
                                        </cc1:XUITextBox>
                                        <asp:ImageButton ID="imgBtnLookUpOJKMataUang" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKMataUang_Click" Enabled ="false" />                                    
                                        <cc1:XUITextBox ID="txtOJKMataUang_Descs" runat="server" DataType="String" DBColumnName="OJKMATAUANG_DESCS"
                                            BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled ="false"></cc1:XUITextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%"><span>Lokasi Proyek *</span></td>
                            <td width="1%"><span>:</span></td>
                            <td width="79%">
                                <asp:UpdatePanel ID="updOJKLokasiProyekInfo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <cc1:XUITextBox ID="txtOJKLokasiProyek_Code" runat="server" DataType="String" DBColumnName="OJKLOKASIPROYEK_CODE"
                                            BindType="Both" SPParameterName="p_ojklokasiproyek_code" MaxLength="20" Width="48px" Enabled="false">
                                        </cc1:XUITextBox>
                                        <asp:ImageButton ID="imgBtnLookUpOJKLokasiProyek" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKLokasiProyek_Click" />                                    
                                        <cc1:XUITextBox ID="txtOJKLokasiProyek_Descs" runat="server" DataType="String" DBColumnName="OJKLOKASIPROYEK_DESCS"
                                            BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-bottom: solid 1px black;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <h2>
                                    Leased Assets</h2>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Location</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIDropDownList ID="ddlLoc_Code" runat="server" DataType="String" DBColumnName="LOC_CODE"
                                    BindType="Both" SPParameterName="p_loc_code" Style="width: 600px;">
                                </cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Merk</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <asp:UpdatePanel ID="updMakeInfo" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <cc1:XUITextBox ID="txtMerk_Code" runat="server" DataType="String" DBColumnName="MERK_CODE"
                                            BindType="Both" SPParameterName="p_merk_code" MaxLength="3" Width="30px" AutoPostBack="true"
                                            OnTextChanged="txtMerkCode_TextChanged">
                                        </cc1:XUITextBox>
                                        <cc1:XUILabel ID="lblMerk_Code" ReadOnly="true" runat="server" DataType="String" Style="display: none;"
                                            DBColumnName="MERK_CODE" BindType="DBToUIOnly" SPParameterName="p_merk_code"></cc1:XUILabel>
                                        <asp:ImageButton ID="btnLookUpMake" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpMake_Click" />
                                        <cc1:XUITextBox ID="txtMerk_CodeDesc" runat="server" DataType="String" DBColumnName="MERKNAME"
                                            BindType="DBToUIOnly" Enabled="False" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Model</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIDropDownList ID="ddlModel" runat="server" DataType="String" DBColumnName="MODEL"
                                    BindType="Both" SPParameterName="p_model" Style="width: 600px;">
                                </cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Asset Description</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtAssetDesc" runat="server" DataType="String" BindType="Both"
                                    DBColumnName="DESCS" SPParameterName="p_descs" Width="600px" MaxLength="60"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Asset Location</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtObjAddress" runat="server" DataType="String" BindType="Both"
                                    DBColumnName="OBJADDRESS" SPParameterName="p_objaddress" Width="600px" MaxLength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Year of Made</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIDropDownList ID="txtYearMade" runat="server" DataType="String" DBColumnName="YEARMADE"
                                BindType="Both" SPParameterName="p_yearmade" Style="width: 50px;">
                                </cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Stnk/Inv. a/n</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtStnkName" runat="server" DataType="String" DBColumnName="STNKNAME"
                                    BindType="Both" SPParameterName="p_stnkname" MaxLength="30" Width="240px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-bottom: solid 1px black;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px 30px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <asp:UpdatePanel ID="pnlBodyTermCondition" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table id="tblBody2" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                        <tr>
                            <td><cc1:XUIButton RoleCode="B200012" ID="btnSaveTermCondition" runat="server" CssClass="save" Text="Save" OnClick="btnSaveTermCondition_Click" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-top: solid 1px black;">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <span>
                                    <h2>Structure</h2>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Asset(s) Cost</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtCostLease" runat="server" DataType="Number" Format="N0" DBColumnName="COSTLEASE"
                                    BindType="Both" SPParameterName="p_costlease" MaxLength="15" Width="160px" Text="0.00"
                                    onBlur="calculateAmountFinance(); javascript:jsFormatCurrency('ctl00_cphbd_txtCostLease')">
                                </cc1:XUITextBox>
                                <cc1:XUICheckBox ID="chbVAT" runat="server" DataType="String" DBColumnName="VAT"
                                    BindType="Both" SPParameterName="p_vat" Text="Include VAT"></cc1:XUICheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Down Payment (SD)</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtDPLease" runat="server" DataType="Number" Format="N0" DBColumnName="DPLEASE"
                                    BindType="Both" SPParameterName="p_dplease" MaxLength="15" Width="160px" Text="0.00"
                                    onBlur="calculateAmountFinance(); javascript:jsFormatCurrency('ctl00_cphbd_txtDPLease')">
                                </cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Amount Finance</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtAmtLease" runat="server" DataType="Number" Format="N0" DBColumnName="AMTLEASE"
                                    BindType="Both" SPParameterName="p_amtlease" MaxLength="15" Width="160px" Text="0.00"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Period</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtLsPeriod" runat="server" DataType="Number" Format="N0" DBColumnName="LSPERIOD"
                                    BindType="Both" SPParameterName="p_lsperiod" MaxLength="5" Width="40px" CausesValidation="true">
                                </cc1:XUITextBox>
                                <span>Months</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-bottom: solid 1px black;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <span>
                                    <h2>Interest Policy</h2>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Margin Channel</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtCHRate1" runat="server" DataType="Number" Format="N8" DBColumnName="CHRATE1"
                                    BindType="Both" SPParameterName="p_chrate1" Text="0.00000000" Width="144px"
                                    MaxLength="20"></cc1:XUITextBox>
                                <span>% p.a</span>
                                <asp:RequiredFieldValidator ID="rfvTxtCHRate1" SetFocusOnError="true" runat="server" ControlToValidate="txtCHRate1"
                                    ErrorMessage="* Harus diisi" />
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Eff. Rate Channel</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtCHRate" runat="server" DataType="Number" Format="N8" DBColumnName="CHRATE"
                                    BindType="Both" SPParameterName="p_chrate" Text="0.00000000" 
                                    Width="144px" Enabled="false"
                                    MaxLength="20" />
                                <span>% p.a</span>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Margin (Flat) Channel</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtCHFlatRate" runat="server" DataType="Number" Format="N8" DBColumnName="CHFLATRATE"
                                    BindType="Both" SPParameterName="p_chflatrate" Text="0.00000000" Width="144px" MaxLength="20"
                                    Enabled="false"></cc1:XUITextBox>
                                <span>% p.a</span>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Rental Payable In</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIRadioButtonList ID="rboCHRentalPay" runat="server" DataType="String" DBColumnName="CHRENTALPAY"
                                    BindType="Both" SPParameterName="p_chrentalpay" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="1" Selected="True">Advance</asp:ListItem>
                                    <asp:ListItem Value="2">Arrears</asp:ListItem>
                                </cc1:XUIRadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Agreement Date Channel</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtCHDisbursedt" runat="server" DataType="DateTime" Format="dd/MM/yyyy"
                                    DBColumnName="CHDISBURSEDT" BindType="Both" SPParameterName="p_chdisbursedt" MaxLength="10"
                                    Width="64px" ></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>1st Rental Due Date Channel</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtCHRntDueDate1" runat="server" DataType="DateTime" Format="dd/MM/yyyy"
                                    DBColumnName="CHRNTDUEDT1" BindType="Both" SPParameterName="p_chrntduedt1" MaxLength="10"
                                    Width="64px" ></cc1:XUITextBox>
                            </td>
                        </tr>
                        
                        <tr>  
                            <td width="20%">
                                <span>Rental Amount Channel</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtCHRental" runat="server" DataType="Number" Format="N2" DBColumnName="CHRENTAL"
                                    BindType="DBToUIOnly" SPParameterName="p_chrental" Text="0.00" Enabled="false"
                                    Width="144px" MaxLength="20"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Margin Tifa</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtROI" runat="server" DataType="Number" Format="N8" DBColumnName="ROI"
                                    BindType="Both" SPParameterName="p_roi" Text="0.00000000" 
                                    Width="144px" Enabled="false"
                                    MaxLength="20" />
                                <span>% p.a</span>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Eff. Rate Tifa</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtEffRate" runat="server" DataType="Number" Format="N8" DBColumnName="EFFRATE"
                                    BindType="Both" SPParameterName="p_effrate" Text="0.00000000" 
                                    Width="144px" Enabled="false"
                                    MaxLength="20" />
                                <span>% p.a</span>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Margin Flat Tifa</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtFlatRate" runat="server" DataType="Number" Format="N8" DBColumnName="FLATRATE"
                                    BindType="Both" SPParameterName="p_flatrate" Text="0.00000000" 
                                    Width="144px" Enabled="false"
                                    MaxLength="20" />
                                <span>% p.a</span>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>1st Rental Due Date Tifa</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtRntDueDate1" runat="server" DataType="DateTime" Format="dd/MM/yyyy"
                                    DBColumnName="RNTDUEDT1" BindType="Both" SPParameterName="p_rntduedt1" MaxLength="10"
                                    Width="64px" Enabled ="false"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>  
                            <td width="20%">
                                <span>Rental Amount Tifa</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtRental" runat="server" DataType="Number" Format="N2" DBColumnName="RENTAL"
                                    BindType="DBToUIOnly" SPParameterName="p_rental" Text="0.00" Enabled="false"
                                    Width="144px" MaxLength="20"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-bottom: solid 1px black;">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody5" runat="server" cellpadding="3" cellspacing="0" class="search-list-table">
                <tr>
                    <td colspan="2">
                        <cc1:XUIButton RoleCode="B200012" ID="btnAddCharges" runat="server" CssClass="add" Text="Add" OnClick="btnAddCharges_Click" Visible = "false" Enabled = "false"  />
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearchCharges" runat="server" DefaultButton="btnSearchCharges">
                            <asp:TextBox ID="txtSearchCharges" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchCharges" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchCharges_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListCharges" runat="server" AutoGenerateColumns="False" DataKeyNames="LS_AGREEFEEID"
                                    OnSelectedIndexChanged="gvwListCharges_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListCharges_PageIndexChanging"
                                    OnRowCommand="gvwListCharges_RowCommand"
                                    OnRowCreated="gvwListCharges_RowCreated" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="TRANCODE" HeaderText="Code">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESCS" HeaderText="Description">
                                            <ItemStyle Width="50%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AMOUNT" HeaderText="Amount" DataFormatString="{0:N0}">
                                            <ItemStyle Width="20%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PAYWITH" HeaderText="Cara Bayar">
                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                    ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" Enabled = "false" Visible = "false"  />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                    ImageUrl="~/img/im4_grid_delete.png" ToolTip="Delete" Enabled = "false" Visible = "false"/>
                                                    <cc2:ConfirmButtonExtender
                                                        ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?" TargetControlID="btnDelete">
                                                    </cc2:ConfirmButtonExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchCharges" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-3" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody6" runat="server" cellpadding="3" cellspacing="0" class="search-list-table">
                <tr>
                    <td>
                        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" CssClass="calc" Enabled = "false" Visible = "false"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="pnlBody6" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListAmortisation" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="LS_AMORTSCHEDULEID" OnSelectedIndexChanged="gvwListAmortisation_SelectedIndexChanged"
                                    EmptyDataText="There is no data." AllowPaging="True" PageSize="37" OnPageIndexChanging="gvwListAmortisation_PageIndexChanging"
                                    OnRowCreated="gvwListAmortisation_RowCreated" GridLines="None" CssClass="mGrid"
                                    PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                                    <Columns>
                                        <asp:BoundField DataField="PERIOD" HeaderText="Period">
                                            <ItemStyle Width="5%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="INT_PP" HeaderText="Period Int." DataFormatString="{0:N4}">
                                            <ItemStyle Width="5%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DUEDATE" HeaderText="Due Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PAYMENT" HeaderText="Rental" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="INTEREST" HeaderText="Lease Income" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PRINCIPAL" HeaderText="Principal Recovery" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="OSPRINCIP" HeaderText="O/S Principal" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="UNEARN_INC" HeaderText="Unearn Income" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="12%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LS_RECEIVE" HeaderText="Lease Receivable" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <PagerStyle CssClass="pgr" />
                                    <AlternatingRowStyle CssClass="alt" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnCalculate" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-4" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody7" runat="server" cellpadding="3" cellspacing="0" class="search-list-table">
                <tr>
                    <td>
                        <asp:Button ID="btnCHCalculate" runat="server" Text="Calculate" OnClick="btnCHCalculate_Click" CssClass="calc" Enabled = "false" Visible = "false"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="pnlBody7" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListCHAmortisation" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="CH_AMORTSCHEDULEID" OnSelectedIndexChanged="gvwListCHAmortisation_SelectedIndexChanged"
                                    EmptyDataText="There is no data." AllowPaging="True" PageSize="37" OnPageIndexChanging="gvwListCHAmortisation_PageIndexChanging"
                                    OnRowCreated="gvwListCHAmortisation_RowCreated" GridLines="None" CssClass="mGrid"
                                    PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                                    <Columns>
                                        <asp:BoundField DataField="PERIOD" HeaderText="Period">
                                            <ItemStyle Width="5%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="INT_PP" HeaderText="Period Int." DataFormatString="{0:N4}">
                                            <ItemStyle Width="5%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DUEDATE" HeaderText="Due Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PAYMENT" HeaderText="Rental" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="INTEREST" HeaderText="Lease Income" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PRINCIPAL" HeaderText="Principal Recovery" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="11%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="OSPRINCIP" HeaderText="O/S Principal" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="UNEARN_INC" HeaderText="Unearn Income" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="12%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LS_RECEIVE" HeaderText="Lease Receivable" 
                                            DataFormatString="{0:N2}">
                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <PagerStyle CssClass="pgr" />
                                    <AlternatingRowStyle CssClass="alt" />
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnCHCalculate" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-5" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody8" runat="server" cellpadding="3" cellspacing="0" class="search-list-table"
                width="100%">
                <tr>
                    <td colspan="2">
                        <cc1:XUIButton RoleCode="B200012" ID="btnAddCollateral" runat="server" CssClass="add" Text="Add" OnClick="btnAddCollateral_Click" Enabled = "false" Visible = "false" />
                        <%--<asp:Button ID="btnDeleteCollateral" runat="server" CssClass="void" Text="Delete"
                            OnClick="btnDeleteCollateral_Click" />--%>
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearchCollateral" runat="server" DefaultButton="btnSearchCollateral">
                            <asp:TextBox ID="txtSearchCollateral" runat="server" CssClass="search-parameter"></asp:TextBox>
                            <asp:Button ID="btnSearchCollateral" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchCollateral_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:UpdatePanel ID="pnlBody8" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListCollateral" runat="server" AutoGenerateColumns="False" DataKeyNames="LS_ASSETVEHICLEID"
                                    OnSelectedIndexChanged="gvwListCollateral_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListCollateral_PageIndexChanging"
                                    OnRowCommand="gvwListCollateral_RowCommand"
                                    OnRowDataBound="gvwListCollateral_RowDataBound" 
                                    OnRowCreated="gvwListCollateral_RowCreated" GridLines="None" CssClass="mGrid"
                                    PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="DESCRIPTION" HeaderText="Asset Description">
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MERKNAME" HeaderText="Merk">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="VHCYEAR" HeaderText="Year">
                                            <ItemStyle Width="5%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="VHCCHASS" HeaderText="Serial No.">
                                            <ItemStyle Width="10%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SERIALNO" HeaderText="Engine No.">
                                            <ItemStyle Width="10%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ASSETCOST" HeaderText="Cost Price" DataFormatString="{0:N2}">
                                            <ItemStyle Width="10%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="POLICENO" HeaderText="Plat No.">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ASSETCOND" HeaderText="Cond.">
                                            <ItemStyle Width="5%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="VHCCOLOR" HeaderText="Color">
                                            <ItemStyle Width="5%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                            ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="~/img/im4_grid_delete.png" ToolTip="Delete" />
                                            <cc2:ConfirmButtonExtender
                                                ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?" TargetControlID="btnDelete">
                                            </cc2:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchCollateral" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:Panel ID="pnlPopupGetLessee" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetLessee" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetLessee" runat="server" BehaviorID="mdlPopupGetLessee"
            PopupControlID="pnlPopupGetLessee" TargetControlID="btnShowPopupGetLessee" BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender2" runat="server" TargetControlID="pnlPopupGetLessee"
            DragHandleID="pnlPopupGetLesseeHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetLesseeHeader" runat="server" CssClass="header">
                <asp:Label ID="lblHeader" runat="server" CssClass="msg" Text="Lessee" />
                <asp:LinkButton ID="btnClose" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetLessee').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetLessee" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchLessee" runat="server" DefaultButton="btnSearchLessee">
                            <asp:TextBox ID="txtSearchLessee" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchLessee" OnClick="btnSearchLessee_Click" runat="server" Text="Search"
                                CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListLessee" runat="server" OnSelectedIndexChanged="gvwListLessee_SelectedIndexChanged"
                            DataKeyNames="CLIENT, NAME, IND_CODE, STATUS, AO" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListLessee_RowCreated" GridLines="None" AllowPaging="true" PageSize="10"
                            OnPageIndexChanging="gvwListLessee_PageIndexChanging" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CLIENT" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NAME" HeaderText="Name">
                                    <ItemStyle Width="40%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="ADDRESS1" HeaderText="Address">
                                    <ItemStyle Width="45%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="AO" HeaderText="Marketing Officer">
                                    <ItemStyle Width="5%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseLessee" OnClientClick="$find('mdlPopupGetLessee').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearchLessee" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlPopUpGetMake" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetMake" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetMake" runat="server" BehaviorID="mdlPopupGetMake"
            PopupControlID="pnlPopupGetMake" TargetControlID="btnShowPopupGetMake" BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender4" runat="server" TargetControlID="pnlPopupGetMake"
            DragHandleID="pnlPopupGetMakeHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetMakeHeader" runat="server" CssClass="header">
                <asp:Label ID="lblMakeHeader" runat="server" CssClass="msg" Text="Merk" />
                <asp:LinkButton ID="btnCloseMake" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetMake').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetMake" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchMake" runat="server" DefaultButton="btnSearchMake">
                            <asp:TextBox ID="txtSearchMake" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchMake" OnClick="btnSearchMake_Click" runat="server" Text="Search"
                                CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListMake" runat="server" OnSelectedIndexChanged="gvwListMake_SelectedIndexChanged"
                            DataKeyNames="CODE, DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListMake_RowCreated" GridLines="None" AllowPaging="true" PageSize="10"
                            OnPageIndexChanging="gvwListMake_PageIndexChanging" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="25%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Name">
                                    <ItemStyle Width="75%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseMakeFooter" OnClientClick="$find('mdlPopupGetMake').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearchMake" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
     <%-- Lookup OJK Jenis Pembiayaan--%>
    <asp:Panel ID="pnlPopUpGetOJKJenisPembiayaan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKJenisPembiayaan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKJenisPembiayaan" runat="server" BehaviorID="mdlPopupGetOJKJenisPembiayaan"
            PopupControlID="pnlPopupGetOJKJenisPembiayaan" TargetControlID="btnShowPopupGetOJKJenisPembiayaan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender5" runat="server" TargetControlID="pnlPopUpGetOJKJenisPembiayaan"
            DragHandleID="pnlPopupGetOJKJenisPembiayaanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKJenisPembiayaanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label3" runat="server" CssClass="msg" Text="OJKJenisPembiayaan" />
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKJenisPembiayaan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKJenisPembiayaan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKJenisPembiayaan" runat="server" DefaultButton="btnSearchOJKJenisPembiayaan">
                            <asp:TextBox ID="txtSearchOJKJenisPembiayaan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKJenisPembiayaan" OnClick="btnSearchOJKJenisPembiayaan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKJenisPembiayaan" runat="server" OnSelectedIndexChanged="gvwListOJKJenisPembiayaan_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKJenisPembiayaan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKJenisPembiayaan_PageIndexChanging" CssClass="mGrid"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKJenisPembiayaan" OnClientClick="$find('mdlPopupGetOJKJenisPembiayaan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Skema Pembiayaan--%>
    <asp:Panel ID="pnlPopUpGetOJKSkemaPembiayaan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKSkemaPembiayaan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKSkemaPembiayaan" runat="server" BehaviorID="mdlPopupGetOJKSkemaPembiayaan"
            PopupControlID="pnlPopupGetOJKSkemaPembiayaan" TargetControlID="btnShowPopupGetOJKSkemaPembiayaan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender6" runat="server" TargetControlID="pnlPopUpGetOJKSkemaPembiayaan"
            DragHandleID="pnlPopupGetOJKSkemaPembiayaanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKSkemaPembiayaanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="OJKSkemaPembiayaan" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKSkemaPembiayaan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKSkemaPembiayaan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKSkemaPembiayaan" runat="server" DefaultButton="btnSearchOJKSkemaPembiayaan">
                            <asp:TextBox ID="txtSearchOJKSkemaPembiayaan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKSkemaPembiayaan" OnClick="btnSearchOJKSkemaPembiayaan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKSkemaPembiayaan" runat="server" OnSelectedIndexChanged="gvwListOJKSkemaPembiayaan_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKSkemaPembiayaan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKSkemaPembiayaan_PageIndexChanging" CssClass="mGrid"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKSkemaPembiayaan" OnClientClick="$find('mdlPopupGetOJKSkemaPembiayaan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Jenis Barang dan Jasa--%>
    <asp:Panel ID="pnlPopUpGetOJKJenisBarangdanJasa" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKJenisBarangdanJasa" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKJenisBarangdanJasa" runat="server" BehaviorID="mdlPopupGetOJKJenisBarangdanJasa"
            PopupControlID="pnlPopupGetOJKJenisBarangdanJasa" TargetControlID="btnShowPopupGetOJKJenisBarangdanJasa"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender7" runat="server" TargetControlID="pnlPopUpGetOJKJenisBarangdanJasa"
            DragHandleID="pnlPopupGetOJKJenisBarangdanJasaHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKJenisBarangdanJasaHeader" runat="server" CssClass="header">
                <asp:Label ID="Label2" runat="server" CssClass="msg" Text="OJKJenisBarangdanJasa" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKJenisBarangdanJasa').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKJenisBarangdanJasa" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKJenisBarangdanJasa" runat="server" DefaultButton="btnSearchOJKJenisBarangdanJasa">
                            <asp:TextBox ID="txtSearchOJKJenisBarangdanJasa" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKJenisBarangdanJasa" OnClick="btnSearchOJKJenisBarangdanJasa_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKJenisBarangdanJasa" runat="server" OnSelectedIndexChanged="gvwListOJKJenisBarangdanJasa_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKJenisBarangdanJasa_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKJenisBarangdanJasa_PageIndexChanging" CssClass="mGrid"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKJenisBarangdanJasa" OnClientClick="$find('mdlPopupGetOJKJenisBarangdanJasa').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Jenis Suku Bunga--%>
    <asp:Panel ID="pnlPopUpGetOJKJenisSukuBunga" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKJenisSukuBunga" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKJenisSukuBunga" runat="server" BehaviorID="mdlPopupGetOJKJenisSukuBunga"
            PopupControlID="pnlPopupGetOJKJenisSukuBunga" TargetControlID="btnShowPopupGetOJKJenisSukuBunga"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender8" runat="server" TargetControlID="pnlPopUpGetOJKJenisSukuBunga"
            DragHandleID="pnlPopupGetOJKJenisSukuBungaHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKJenisSukuBungaHeader" runat="server" CssClass="header">
                <asp:Label ID="Label4" runat="server" CssClass="msg" Text="OJKJenisSukuBunga" />
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKJenisSukuBunga').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKJenisSukuBunga" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKJenisSukuBunga" runat="server" DefaultButton="btnSearchOJKJenisSukuBunga">
                            <asp:TextBox ID="txtSearchOJKJenisSukuBunga" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKJenisSukuBunga" OnClick="btnSearchOJKJenisSukuBunga_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKJenisSukuBunga" runat="server" OnSelectedIndexChanged="gvwListOJKJenisSukuBunga_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKJenisSukuBunga_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKJenisSukuBunga_PageIndexChanging" CssClass="mGrid"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKJenisSukuBunga" OnClientClick="$find('mdlPopupGetOJKJenisSukuBunga').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Mata Uang--%>
    <asp:Panel ID="pnlPopUpGetOJKMataUang" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKMataUang" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKMataUang" runat="server" BehaviorID="mdlPopupGetOJKMataUang"
            PopupControlID="pnlPopupGetOJKMataUang" TargetControlID="btnShowPopupGetOJKMataUang"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender9" runat="server" TargetControlID="pnlPopUpGetOJKMataUang"
            DragHandleID="pnlPopupGetOJKMataUangHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKMataUangHeader" runat="server" CssClass="header">
                <asp:Label ID="Label5" runat="server" CssClass="msg" Text="OJKMataUang" />
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKMataUang').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKMataUang" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKMataUang" runat="server" DefaultButton="btnSearchOJKMataUang">
                            <asp:TextBox ID="txtSearchOJKMataUang" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKMataUang" OnClick="btnSearchOJKMataUang_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKMataUang" runat="server" OnSelectedIndexChanged="gvwListOJKMataUang_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKMataUang_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKMataUang_PageIndexChanging" CssClass="mGrid"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKMataUang" OnClientClick="$find('mdlPopupGetOJKMataUang').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Lokasi Proyek--%>
    <asp:Panel ID="pnlPopUpGetOJKLokasiProyek" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKLokasiProyek" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKLokasiProyek" runat="server" BehaviorID="mdlPopupGetOJKLokasiProyek"
            PopupControlID="pnlPopupGetOJKLokasiProyek" TargetControlID="btnShowPopupGetOJKLokasiProyek"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender10" runat="server" TargetControlID="pnlPopUpGetOJKLokasiProyek"
            DragHandleID="pnlPopupGetOJKLokasiProyekHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKLokasiProyekHeader" runat="server" CssClass="header">
                <asp:Label ID="Label6" runat="server" CssClass="msg" Text="OJKLokasiProyek" />
                <asp:LinkButton ID="LinkButton6" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKLokasiProyek').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKLokasiProyek" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKLokasiProyek" runat="server" DefaultButton="btnSearchOJKLokasiProyek">
                            <asp:TextBox ID="txtSearchOJKLokasiProyek" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKLokasiProyek" OnClick="btnSearchOJKLokasiProyek_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKLokasiProyek" runat="server" OnSelectedIndexChanged="gvwListOJKLokasiProyek_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKLokasiProyek_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKLokasiProyek_PageIndexChanging" CssClass="mGrid"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKLokasiProyek" OnClientClick="$find('mdlPopupGetOJKLokasiProyek').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
</asp:Content>
