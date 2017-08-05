<%@ page title="" language="C#" masterpagefile="~/mfin2.master" autoeventwireup="true" inherits="module_channelling_transaction_chcclientcorporatedetail, App_Web_pt4ne0vj" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            jsPopUpDate('ctl00_cphbd_txtInBornDtCorporate');
            jsPopUpDate('ctl00_cphbd_txtTglUbah');
            jsPopUpDate('ctl00_cphbd_txtIbuLahir');
            jsPopUpDate('ctl00_cphbd_txtInSpouBrdt');

            function fnPangsa() {
                var e = $get('ctl00_cphbd_ddlIDJabatan');
                switch (e.option[e.selectedIndex].value) {
                    case "00":
                    case "01":
                    case "02":
                    case "03":
                    case "04":
                    case "05":
                    case "06":
                    case "07":
                    case "09":
                    case "10":
                    case "11":
                    case "12":
                    case "13":
                    case "19": $get('ctl00_cphbd_txtPangsa').disable = true; break;
                    default: $get('ctl00_cphbd_txtPangsa').disable = false; break;
                }

            }
            /*if (e.options[e.selectedIndex].value < 20)
            $get('ctl00_cphbd_txtPangsa').disable = true;
            else 
            $get('ctl00_cphbd_txtPangsa').disable = false;
            */


        });
        
        function onLoadFunction() {
            jsPopUpDate('ctl00_cphbd_txtInbornDt');
            jsPopUpDate('ctl00_cphbd_txtInFromDt');
            jsPopUpDate('ctl00_cphbd_txtInToDt');
            jsPopUpDate('ctl00_cphbd_txtInSpouBrdt');
        }
    </script>

    <%--<div>--%>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Client Corporate</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B200007" />
                </td>
            </tr>
        </table>
        <div id="pages" style="margin: 5px 3px">
            <ul style="font-size: smaller">
                <li><a href="#page-0"><span>Corporate</span></a></li>
                <li><a href="#page-1"><span>Pengurus</span></a></li>
            </ul>
            <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow-y: auto">
                <asp:UpdatePanel ID="pnlBody1" runat="server">
                    <ContentTemplate>
                        <table id="tblBody1_0" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr style="display: none">
                                <td width="20%">
                                    <span>ID</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUILabel ID="lblSYSCLIENTID" runat="server" DataType="Integer" DBColumnName="SYS_CLIENTID"
                                        BindType="Both" SPParameterName="p_sys_clientid" Text="0"></cc1:XUILabel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><h2>Informasi Perusahaan</h2></td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Client no.</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="79%">
                                    <cc1:XUITextBox ID="txtClientCorporate" runat="server" DataType="String" DBColumnName="CLIENT"
                                        BindType="Both" SPParameterName="p_client" MaxLength="20" Width="180px" Enabled="false">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Nama *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtNameCorporate" runat="server" DataType="String" DBColumnName="NAME"
                                        BindType="Both" SPParameterName="p_name" MaxLength="60" Width="320px"
                                        CausesValidation="false">
                                    </cc1:XUITextBox>
                                    <cc1:XUIDropDownList ID="ddlSalute" runat="server" DBColumnName="SALUTE1"
                                        BindType="Both" SPParameterName="p_salute" DataType="String">
                                       <%-- <asp:ListItem Value="PT">PT</asp:ListItem>
                                        <asp:ListItem Value="CV">CV</asp:ListItem>
                                        <asp:ListItem Value="YAYASAN">YAYASAN</asp:ListItem>
                                        <asp:ListItem Value="KOPERASI">KOPERASI</asp:ListItem>--%>
                                    </cc1:XUIDropDownList>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtNameCorporate" Display="Dynamic" Text="Nama harus diisi">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revClient" runat="server" ErrorMessage="Nama Tidak Boleh ada Special karakter"
                                        ControlToValidate="txtNameCorporate" ValidationExpression="[A-Za-z '-]*[A-Za-z '-]" Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%" rowspan="3" valign="top">
                                    <span>Alamat *</span>
                                </td>
                                <td rowspan="3" valign="top">
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtAddress1Corporate" runat="server" DataType="String" DBColumnName="ADDRESS1"
                                        BindType="Both" SPParameterName="p_address1" MaxLength="40" Width="320px"
                                        CausesValidation="false">
                                    </cc1:XUITextBox>
                                   <%-- <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress1Corporate" Display="Dynamic" Text="Address harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                    <asp:RegularExpressionValidator ID="revAddress1Corporate" runat="server"
                                        ErrorMessage="Alamat(1) Tidak Boleh Ada special Karakter"
                                        ControlToValidate="txtAddress1Corporate"
                                        ValidationExpression="[A-Za-z0-9 .,/()-]*[A-Za-z0-9 .,/()-]"
                                        Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtAddress2Corporate" runat="server" DataType="String" DBColumnName="ADDRESS2"
                                        BindType="Both" SPParameterName="p_address2" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                    <asp:RegularExpressionValidator ID="revAddress2Corporate" runat="server"
                                        ErrorMessage="Alamat(2) Tidak Boleh Ada special Karakter"
                                        ControlToValidate="txtAddress2Corporate"
                                        ValidationExpression="[A-Za-z0-9 .,/()-]*[A-Za-z0-9 .,/()-]"
                                        Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtAddress3Corporate" runat="server" DataType="String" DBColumnName="ADDRESS3"
                                        BindType="Both" SPParameterName="p_address3" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                    <asp:RegularExpressionValidator ID="revAddress3Corporate" runat="server"
                                        ErrorMessage="Alamat(3) Tidak Boleh Ada special Karakter"
                                        ControlToValidate="txtAddress3Corporate"
                                        ValidationExpression="[A-Za-z0-9 .,/()-]*[A-Za-z0-9 .,/()-]"
                                        Display="Dynamic" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Kode Pos *</span>
                                </td>
                                <td>:</td>
                                <td>
                                    <asp:UpdatePanel ID="updAreaInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnLookUpArea" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpArea_Click" />                                    
                                            <cc1:XUITextBox ID="txtAreaName" runat="server" DataType="String" DBColumnName="AREA_CODE"
                                                SPParameterName="p_area_code" BindType="Both" 
                                                Width="48px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <%--<asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtAreaName" Display="Dynamic" Text="Zip Code harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Kelurahan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtKelurahanCorporate" runat="server" DataType="String" DBColumnName="KELURAHAN"
                                        BindType="Both" SPParameterName="p_kelurahan" MaxLength="40" Width="320px"
                                        Enabled="true">
                                    </cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvKelurahan" runat="server" ControlToValidate="txtKelurahanCorporate" Display="Dynamic" Text="Kelurahan harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Kecamatan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtKecamatanCorporate" runat="server" DataType="String" DBColumnName="KECAMATAN"
                                        BindType="Both" SPParameterName="p_kecamatan" MaxLength="40" Width="320px"
                                        Enabled="true">
                                    </cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvKecamatan" runat="server" ControlToValidate="txtKecamatanCorporate" Display="Dynamic" Text="Kecamatan harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>No. Telepon *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    
                                    <cc1:XUITextBox ID="txtPhoneAreaCode" runat="server" DataType="String" DBColumnName="AREA_CODES"
                                        BindType="Both" SPParameterName="p_kodearea" MaxLength="4" Width="32px" Enabled="false">
                                    </cc1:XUITextBox>
                                   <%-- <cc1:XUITextBox ID="txtPhone" runat="server" DataType="String" DBColumnName="PHONE"
                                        BindType="Both" SPParameterName="p_phone" MaxLength="20" Width="160px">
                                    </cc1:XUITextBox>--%>
                                    
                                    <cc1:XUITextBox ID="txtPhoneCorporate" runat="server" DataType="String" DBColumnName="PHONE"
                                        BindType="Both" SPParameterName="p_phone" MaxLength="20" Width="160px"></cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneCorporate" Display="Dynamic" Text="No Telepon harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Fax</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtFaxCorporate" runat="server" DataType="String" DBColumnName="FAX"
                                        BindType="Both" SPParameterName="p_fax" MaxLength="20" Width="160px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Jenis Perusahaan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUIRadioButtonList ID="rboCobIsType" runat="server" DataType="String" DBColumnName="COBISTYPE"
                                        BindType="Both" SPParameterName="p_cobistype" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="0" Selected="True" style="display:none;"></asp:ListItem>
                                        <asp:ListItem Value="1">PMDN</asp:ListItem>
                                        <asp:ListItem Value="2">PMA</asp:ListItem>
                                    </cc1:XUIRadioButtonList>
                                    
                                    <span style="margin-left:30px;">Berdiri Sejak *</span>
                                    <cc1:XUITextBox ID="txtSince" runat="server" DataType="String" DBColumnName="SINCE"
                                        BindType="Both" SPParameterName="p_since" MaxLength="4" Width="32px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Status Perusahaan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUIRadioButtonList ID="rboCobIsStat" runat="server" DataType="String" DBColumnName="COBISSTAT"
                                        BindType="Both" SPParameterName="p_cobisstat" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="0" Selected="True" style="display:none;"></asp:ListItem>
                                        <asp:ListItem Value="1">Private</asp:ListItem>
                                        <asp:ListItem Value="2">Public</asp:ListItem>
                                        <asp:ListItem Value="3">BUMN</asp:ListItem>
                                    </cc1:XUIRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>No. NPWP *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtNPWP" runat="server" DataType="String" DBColumnName="NPWP"
                                        BindType="Both" SPParameterName="p_npwp" MaxLength="20" Width="280px"
                                        CausesValidation="false" ToolTip="Format NPWP: 99.999.999.9.999.999">
                                    </cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvNPWP" runat="server" ControlToValidate="txtNPWP" Display="Dynamic" Text="NPWP harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                    <asp:RegularExpressionValidator ID="revNPWP" runat="server" ErrorMessage="Format NPWP Salah! Format = 99.999.999.9.999.999" Display="Dynamic"
                                        ControlToValidate="txtNPWP" ValidationExpression="([0-9]{2}\.[0-9]{3}\.[0-9]{3}\.[0-9]{1}\.[0-9]{3}\.[0-9]{3})" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>SIUP *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtSIUP" runat="server" DataType="String" DBColumnName="SIUP"
                                        BindType="Both" SPParameterName="p_siup" MaxLength="35" Width="280px"
                                        CausesValidation="false"></cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvSIUP" runat="server" ControlToValidate="txtSIUP" Display="Dynamic" Text="SIUP harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Industri *</span></td>
                                <td><span>:</span></td>
                                <td width="80%">
                                    <asp:UpdatePanel ID="updIndustryInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtInd_Code" runat="server" DataType="String" DBColumnName="IND_CODES"
                                                BindType="Both" SPParameterName="p_ind_code" MaxLength="2" Width="16px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpIndustry" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpIndustry_Click" />                                    
                                            <cc1:XUITextBox ID="txtInd_Desc" runat="server" DataType="String" DBColumnName="IND_DESCS"
                                                BindType="DBToUIOnly" MaxLength="40" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                            <%--<asp:RequiredFieldValidator ID="rfvInd_Code" runat="server" ControlToValidate="txtInd_Code" Display="Dynamic" Text="Industry harus diisi">
                                                </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Website</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtWebsite" runat="server" DataType="String" DBColumnName="WEBSITE"
                                        BindType="Both" SPParameterName="p_website" MaxLength="50" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Contact Person *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtContact" runat="server" DataType="String" DBColumnName="CONTACT"
                                        BindType="Both" SPParameterName="p_contact" MaxLength="40" Width="320px"
                                        CausesValidation="false"></cc1:XUITextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Jabatan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtPosition" runat="server" DataType="String" DBColumnName="POSITION"
                                        BindType="Both" SPParameterName="p_position" MaxLength="30" Width="240px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>No. Telepon Genggam *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInMailTelp" runat="server" DataType="String" DBColumnName="INMAILTELP"
                                        BindType="Both" SPParameterName="p_inmailtelp" MaxLength="14" Width="112px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Email</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtEmail" runat="server" DataType="String" DBColumnName="EMAIL"
                                        BindType="Both" SPParameterName="p_email" MaxLength="50" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3" style="border-bottom: solid 1px #dedede;"></td></tr>
                        </table>
                        <table id="tblBody1_1" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="3">
                                    <h2>
                                        Akte Notaris
                                    </h2>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>No. Akte Pendirian</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="79%">
                                    <cc1:XUITextBox ID="txtInKtpCorporate" runat="server" DataType="String" DBColumnName="INKTP"
                                        BindType="Both" SPParameterName="p_inktp" MaxLength="30" Width="240px"
                                        CausesValidation="false">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Tanggal Pendirian *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtInBornDtCorporate" runat="server" DataType="DateTime" Format="dd/MM/yyyy"
                                        DBColumnName="INBORNDT" BindType="Both" SPParameterName="p_inborndt" MaxLength="10" Width="72px"
                                        CausesValidation="false"></cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvInBornDt" runat="server" ControlToValidate="txtInBornDtCorporate" Display="Dynamic" Text="Tanggal Pendirian harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Kota Pendirian *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtInbornPlc" runat="server" DataType="String" DBColumnName="INBORNPLC"
                                        BindType="Both" SPParameterName="p_inbornplc" MaxLength="20" Width="160px" 
                                        CausesValidation="false">
                                    </cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvTempatLahir" runat="server" ControlToValidate="txtInbornPlc" Display="Dynamic" Text="Tempat Lahir harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Notaris *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtNotaris1" runat="server" DataType="String" MaxLength="40"
                                        DBColumnName="NOTARIS1" BindType="Both" SPParameterName="p_notaris1" Width="320px"
                                        CausesValidation="false">
                                    </cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvNotaris1" runat="server" ControlToValidate="txtNotaris1" Display="Dynamic" Text="Notaris harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>No. Akte Perubahan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtAkteUbah" runat="server" DataType="String" MaxLength="20"
                                        DBColumnName="AKTEUBAH" BindType="Both" SPParameterName="p_akteubah" Width="160px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Tanggal Perubahan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtTglUbah" runat="server" DataType="DateTime" Format="dd/MM/yyyy" MaxLength="10" Width="72px"
                                        DBColumnName="TGLUBAH" BindType="Both" SPParameterName="p_tglubah"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Notaris</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtNotaris2" runat="server" DataType="String" MaxLength="40" Width="320px"
                                        DBColumnName="NOTARIS2" BindType="Both" SPParameterName="p_notaris2"></cc1:XUITextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Penandatangan 1 *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtIbuKandungCorporate" runat="server" DataType="String" MaxLength="40" Width="320px"
                                        DBColumnName="IBUKANDUNG" BindType="Both" SPParameterName="p_ibukandung"></cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvIbuKandung" runat="server" ControlToValidate="txtIbuKandungCorporate" Display="Dynamic" Text="Penandatangan 1 harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Jabatan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtIbuJabat" runat="server" DataType="String" MaxLength="40" Width="320px"
                                        DBColumnName="IBUJABAT" BindType="Both" SPParameterName="p_ibujabat"></cc1:XUITextBox>
                                    <span>Tgl Lahir</span>
                                    <cc1:XUITextBox ID="txtIbuLahir" runat="server" DataType="DateTime" Format="dd/MM/yyyy" Width="72px" MaxLength="10"
                                        DBColumnName="IBULAHIR" BindType="Both" SPParameterName="p_ibulahir"></cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvIbuJabat" runat="server" ControlToValidate="txtIbuJabat" Display="Dynamic" Text="Jabatan harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Penandatangan 2</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtInSpouName" runat="server" DataType="String" MaxLength="40" Width="320px"
                                        DBColumnName="INSPOUNAME" BindType="Both" SPParameterName="p_inspouname"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Jabatan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtInSpouJab" runat="server" DataType="String" MaxLength="40" Width="320px"
                                        DBColumnName="INSPOUJAB" BindType="Both" SPParameterName="p_inspoujab"></cc1:XUITextBox>
                                    <span>Tgl Lahir</span>
                                    <cc1:XUITextBox ID="txtInSpouBrdt" runat="server" DataType="DateTime" Format="dd/MM/yyyy" Width="72px" MaxLength="10"
                                        DBColumnName="INSPOUBRDT" BindType="Both" SPParameterName="p_inspoubrdt"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3" style="border-bottom: solid 1px #dedede;"></td></tr>
                        </table>
                        <table id="tblBody1_2" cellpadding="0px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="4">
                                    <h2>Informasi SID</h2>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Status *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updSIDStatusInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtSIDStatus_Sandi" runat="server" DataType="String" DBColumnName="SIDSTATUS"
                                                BindType="Both" SPParameterName="p_sidstatus" MaxLength="4" Width="32px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpSIDStatus" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpSIDStatus_Click"  />                                    
                                            <cc1:XUITextBox ID="txtSIDStatus_Keterangan" runat="server" DataType="String" DBColumnName="SIDSTATUS_KETERANGAN"
                                                BindType="DBToUIOnly" MaxLength="30" Width="320px" ReadOnly="true" ></cc1:XUITextBox>
                                           <%-- <asp:RequiredFieldValidator ID="txtStatus" runat="server" ControlToValidate="txtSIDStatus" Display="Dynamic" Text="Status harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Golongan *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updSIDGolonganInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtSIDGolongan_Sandi" runat="server" DataType="String" DBColumnName="SIDGOLONGAN"
                                                BindType="Both" SPParameterName="p_sidgolongan" MaxLength="3" Width="32px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpSIDGolongan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpSIDGolongan_Click"  />                                    
                                            <cc1:XUITextBox ID="txtSIDGolongan_Keterangan" runat="server" DataType="String" DBColumnName="SIDGOLONGAN_KETERANGAN"
                                                BindType="DBToUIOnly" MaxLength="65" Width="480px" ReadOnly="true" ></cc1:XUITextBox>
                                           <%-- <asp:RequiredFieldValidator ID="txtGolongan" runat="server" ControlToValidate="txtSIDGolongan" Display="Dynamic" Text="Golongan harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>DATI II *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updSIDDATI2Info" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtSIDDATI2_Sandi" runat="server" DataType="String" DBColumnName="SIDDATI2"
                                                BindType="Both" SPParameterName="p_siddati2" MaxLength="4" Width="32px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpSIDDATI2" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpSIDDATI2_Click" />                                    
                                            <cc1:XUITextBox ID="txtSIDDATI2_Keterangan" runat="server" DataType="String" DBColumnName="SIDDATI2_KETERANGAN"
                                                BindType="DBToUIOnly" MaxLength="50" Width="480px" ReadOnly="true"></cc1:XUITextBox>
                                           <%-- <asp:RequiredFieldValidator ID="txtDATI2" runat="server" ControlToValidate="txtSIDDATI2" Display="Dynamic" Text="DATI II harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Negara *</span></td>
                                <td><span>:</span></td>
                                <td width="80%">
                                    <asp:UpdatePanel ID="updSIDNegaraInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtSIDNegara_Sandi" runat="server" DataType="String" DBColumnName="SIDNEGARA"
                                                BindType="Both" SPParameterName="p_sidnegara" MaxLength="3" Width="32px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpSIDNegara" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpSIDNegara_Click"  />                                    
                                            <cc1:XUITextBox ID="txtSIDNegara_Keterangan" runat="server" DataType="String" DBColumnName="SIDNEGARA_KETERANGAN"
                                                BindType="DBToUIOnly" MaxLength="50" Width="480px" ReadOnly="true" ></cc1:XUITextBox>
                                           <%-- <asp:RequiredFieldValidator ID="txtNegara" runat="server" ControlToValidate="txtSIDnegara" Display="Dynamic" Text="Negara harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Pekerjaan *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updSIDPekerjaanInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtSIDPekerjaan_Sandi" runat="server" DataType="String" DBColumnName="SIDPEKERJAAN"
                                                BindType="Both" SPParameterName="p_sidpekerjaan" MaxLength="3" Width="32px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpSIDPekerjaan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpSIDPekerjaan_Click" />                                    
                                            <cc1:XUITextBox ID="txtSIDPekerjaan_Keterangan" runat="server" DataType="String" DBColumnName="SIDPEKERJAAN_KETERANGAN"
                                                BindType="DBToUIOnly" MaxLength="30" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                           <%-- <asp:RequiredFieldValidator ID="txtPekerjaan" runat="server" ControlToValidate="txtSIDPekerjaan" Display="Dynamic" Text="Pekerjaan harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Ekonomi *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updSIDBidUsahaInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtSIDBidUsaha_Sandi" runat="server" DataType="String" DBColumnName="SIDBIDUSAHA"
                                                BindType="Both" SPParameterName="p_sidbidusaha" MaxLength="5" Width="32px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpSIDBidUsaha" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpSIDBidUsaha_Click" />                                    
                                            <cc1:XUITextBox ID="txtSIDBidUsaha_Keterangan" runat="server" DataType="String" DBColumnName="SIDBIDUSAHA_KETERANGAN"
                                                BindType="DBToUIOnly" MaxLength="80" Width="480px" ReadOnly="true"></cc1:XUITextBox>
                                           <%-- <asp:RequiredFieldValidator ID="txtEkonomi" runat="server" ControlToValidate="txtSIDEkonomi" Display="Dynamic" Text="Ekonomi harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                            <tr><td colspan="3" style="border-bottom: solid 1px #AAAAAA;"></td></tr>
                        </table>
                        <table id="tblBody1_3" cellpadding="0px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="4">
                                    <h2>
                                        Informasi OJK</h2>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Kelompok Debitur</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updOJKKelompokInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtOJKKelompok_Code" runat="server" DataType="String" DBColumnName="OJKKELOMPOK_CODE"
                                                BindType="Both" SPParameterName="p_ojkkelompok_code" MaxLength="20" Width="48px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpOJKKelompok" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKKelompok_Click"/>                                    
                                            <cc1:XUITextBox ID="txtOJKKelompok_Descs" runat="server" DataType="String" DBColumnName="OJKKELOMPOK_DESCS"
                                                BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" ></cc1:XUITextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Kategori Usaha Debitur *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updOJKKategoriUsahaInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtOJKKategoriUsaha_Code" runat="server" DataType="String" DBColumnName="OJKKATEGORIUSAHA_CODE"
                                                BindType="Both" SPParameterName="p_ojkkategoriusaha_code" MaxLength="20" Width="48px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpOJKKategoriUsaha" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKKategoriUsaha_Click" />                                    
                                            <cc1:XUITextBox ID="txtOJKKategoriUsaha_Descs" runat="server" DataType="String" DBColumnName="OJKKATEGORIUSAHA_DESCS"
                                                BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Golongan Debitur *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updOJKGolonganInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtOJKGolongan_Code" runat="server" DataType="String" DBColumnName="OJKGOLONGAN_CODE"
                                                BindType="Both" SPParameterName="p_ojkgolongan_code" MaxLength="20" Width="48px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpOJKGolongan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKGolongan_Click" />                                    
                                            <cc1:XUITextBox ID="txtOJKGolongan_Descs" runat="server" DataType="String" DBColumnName="OJKGOLONGAN_DESCS"
                                                BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true" ></cc1:XUITextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Hubungan Debitur dg PP *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updOJKHubunganInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtOJKHubungan_Code" runat="server" DataType="String" DBColumnName="OJKHUBUNGAN_CODE"
                                                BindType="Both" SPParameterName="p_ojkhubungan_code" MaxLength="20" Width="48px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpOJKHubungan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKHubungan_Click" />                                    
                                            <cc1:XUITextBox ID="txtOJKHubungan_Descs" runat="server" DataType="String" DBColumnName="OJKHUBUNGAN_DESCS"
                                                BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%"><span>Sektor Ekonomi Debitur *</span></td>
                                <td width="1%"><span>:</span></td>
                                <td width="79%">
                                    <asp:UpdatePanel ID="updOJKSektorEkonomiInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtOJKSektorEkonomi_Code" runat="server" DataType="String" DBColumnName="OJKSEKTOREKONOMI_CODE"
                                                BindType="Both" SPParameterName="p_ojksektorekonomi_code" MaxLength="20" Width="48px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="imgBtnLookUpOJKSektorEkonomi" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKSektorEkonomi_Click" />                                    
                                            <cc1:XUITextBox ID="txtOJKSektorEkonomi_Descs" runat="server" DataType="String" DBColumnName="OJKSEKTOREKONOMI_DESCS"
                                                BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><span>&nbsp;</span></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-bottom: solid 1px #AAAAAA;">
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow-y: auto">
                <asp:UpdatePanel ID="pnlBody2" runat="server">
                    <ContentTemplate>
                        <table cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <%--<asp:Button ID="btnAddPengurus" runat="server" CssClass="add" Text="Add" 
                                        OnClick="btnAddPengurus_Click" CausesValidation="false" />--%>
                                    <cc1:XUIButton ID="btnAddPengurus" runat="server" CssClass="add" Text="Add" OnClick="btnAddPengurus_Click" RoleCode="B200006" />
                                </td>
                                <td colspan="2" align="right">
                                    <asp:TextBox ID="txtSearchPengurus" runat="server" />
                                    <asp:Button ID="btnSearchPengurus" runat="server" CssClass="search" Text="Search"
                                        OnClick="btnSearchPengurus_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:GridView ID="gvwListPengurus" runat="server" DataKeyNames="SID_PENGURUSID"
                                        OnSelectedIndexChanged="gvwListPengurus_SelectedIndexChanged"
                                        AutoGenerateColumns="False" EmptyDataText="There is no data."
                                        OnRowCommand="gvwListPengurus_RowCommand"
                                        OnRowCreated="gvwListPengurus_RowCreated" GridLines="None" AllowPaging="true"
                                        PageSize="10" OnPageIndexChanging="gvwListPengurus_PageIndexChanging" CssClass="mGrid"
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
                                            <asp:BoundField DataField="NAMA" HeaderText="Nama">
                                                <ItemStyle Width="28%" HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="JABATAN" HeaderText="Jabatan">
                                                <ItemStyle Width="32%" HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ALAMAT" HeaderText="Alamat">
                                                <ItemStyle Width="40%" HorizontalAlign="Center"></ItemStyle>
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
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>    
        </div>
        <asp:ValidationSummary ShowMessageBox="true" ShowSummary="false" ID="vsClient" HeaderText="Data belum lengkap atau format salah:"
            DisplayMode="BulletList" EnableClientScript="true" runat="server" />
    <%--</div>--%>
    
    <asp:Panel ID="pnlPopupGetArea" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetArea" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetArea" runat="server" BehaviorID="mdlPopupGetArea"
            PopupControlID="pnlPopupGetArea" TargetControlID="btnShowPopupGetArea"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnlPopupGetArea"
            DragHandleID="pnlPopupGetAreaHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetAreaHeader" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="Area" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetArea').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetArea" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:TextBox ID="txtSearchArea" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearchArea" OnClick="btnSearchArea_Click" runat="server"
                            Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListArea" runat="server" OnSelectedIndexChanged="gvwListArea_SelectedIndexChanged"
                            DataKeyNames="KELURAHAN, KECAMATAN, KODEPOS, KODEAREA" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListArea_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListArea_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="KOTA" HeaderText="Kota">
                                    <ItemStyle Width="25%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KELURAHAN" HeaderText="Kelurahan">
                                    <ItemStyle Width="25%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KECAMATAN" HeaderText="Kecamatan">
                                    <ItemStyle Width="30%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KODEPOS" HeaderText="Kode Area">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KODEAREA" HeaderText="Kode Area">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseArea" OnClientClick="$find('mdlPopupGetArea').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
    <%-- Lookup industry--%>
    <asp:Panel ID="pnlPopUpGetIndustry" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetIndustry" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetIndustry" runat="server" BehaviorID="mdlPopupGetIndustry"
            PopupControlID="pnlPopupGetIndustry" TargetControlID="btnShowPopupGetIndustry"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender3" runat="server" TargetControlID="pnlPopUpGetIndustry"
            DragHandleID="pnlPopupGetIndustryHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetIndustryHeader" runat="server" CssClass="header">
                <asp:Label ID="Label2" runat="server" CssClass="msg" Text="Industry" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetIndustry').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetIndustry" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchIndustry" runat="server" DefaultButton="btnSearchIndustry">
                            <asp:TextBox ID="txtSearchIndustry" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchIndustry" OnClick="btnSearchIndustry_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListIndustry" runat="server" OnSelectedIndexChanged="gvwListIndustry_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListIndustry_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListIndustry_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="DESCS" HeaderText="Industry">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseIndustry" OnClientClick="$find('mdlPopupGetIndustry').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup SID Status--%>
    <asp:Panel ID="pnlPopUpGetSIDStatus" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetSIDStatus" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetSIDStatus" runat="server" BehaviorID="mdlPopupGetSIDStatus"
            PopupControlID="pnlPopupGetSIDStatus" TargetControlID="btnShowPopupGetSIDStatus"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender5" runat="server" TargetControlID="pnlPopUpGetSIDStatus"
            DragHandleID="pnlPopupGetSIDStatusHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetSIDStatusHeader" runat="server" CssClass="header">
                <asp:Label ID="Label4" runat="server" CssClass="msg" Text="SIDStatus" />
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetSIDStatus').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetSIDStatus" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchSIDStatus" runat="server" DefaultButton="btnSearchSIDStatus">
                            <asp:TextBox ID="txtSearchSIDStatus" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSIDStatus" OnClick="btnSearchSIDStatus_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListSIDStatus" runat="server" OnSelectedIndexChanged="gvwListSIDStatus_SelectedIndexChanged"
                            DataKeyNames="SANDI,KETERANGAN" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListSIDStatus_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListSIDStatus_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="SANDI" HeaderText="Sandi">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KETERANGAN" HeaderText="Keterangan">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseSIDStatus" OnClientClick="$find('mdlPopupGetSIDStatus').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup SID Golongan--%>
    <asp:Panel ID="pnlPopUpGetSIDGolongan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetSIDGolongan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetSIDGolongan" runat="server" BehaviorID="mdlPopupGetSIDGolongan"
            PopupControlID="pnlPopupGetSIDGolongan" TargetControlID="btnShowPopupGetSIDGolongan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender6" runat="server" TargetControlID="pnlPopUpGetSIDGolongan"
            DragHandleID="pnlPopupGetSIDGolonganHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetSIDGolonganHeader" runat="server" CssClass="header">
                <asp:Label ID="Label5" runat="server" CssClass="msg" Text="SIDGolongan" />
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetSIDGolongan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetSIDGolongan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchSIDGolongan" runat="server" DefaultButton="btnSearchSIDGolongan">
                            <asp:TextBox ID="txtSearchSIDGolongan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSIDGolongan" OnClick="btnSearchSIDGolongan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListSIDGolongan" runat="server" OnSelectedIndexChanged="gvwListSIDGolongan_SelectedIndexChanged"
                            DataKeyNames="SANDI,KETERANGAN" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListSIDGolongan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListSIDGolongan_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="SANDI" HeaderText="Sandi">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KETERANGAN" HeaderText="Keterangan">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseSIDGolongan" OnClientClick="$find('mdlPopupGetSIDGolongan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup SID DATI2--%>
    <asp:Panel ID="pnlPopUpGetSIDDATI2" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetSIDDATI2" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetSIDDATI2" runat="server" BehaviorID="mdlPopupGetSIDDATI2"
            PopupControlID="pnlPopupGetSIDDATI2" TargetControlID="btnShowPopupGetSIDDATI2"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender7" runat="server" TargetControlID="pnlPopUpGetSIDDATI2"
            DragHandleID="pnlPopupGetSIDDATI2Header" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetSIDDATI2Header" runat="server" CssClass="header">
                <asp:Label ID="Label6" runat="server" CssClass="msg" Text="SIDDATI2" />
                <asp:LinkButton ID="LinkButton6" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetSIDDATI2').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetSIDDATI2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchSIDDATI2" runat="server" DefaultButton="btnSearchSIDDATI2">
                            <asp:TextBox ID="txtSearchSIDDATI2" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSIDDATI2" OnClick="btnSearchSIDDATI2_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListSIDDATI2" runat="server" OnSelectedIndexChanged="gvwListSIDDATI2_SelectedIndexChanged"
                            DataKeyNames="SANDI,NAMADAERAH" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListSIDDATI2_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListSIDDATI2_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="SANDI" HeaderText="Sandi">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NAMADAERAH" HeaderText="Nama Daerah">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseSIDDATI2" OnClientClick="$find('mdlPopupGetSIDDATI2').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup SID Negara--%>
    <asp:Panel ID="pnlPopUpGetSIDNegara" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetSIDNegara" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetSIDNegara" runat="server" BehaviorID="mdlPopupGetSIDNegara"
            PopupControlID="pnlPopupGetSIDNegara" TargetControlID="btnShowPopupGetSIDNegara"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender8" runat="server" TargetControlID="pnlPopUpGetSIDNegara"
            DragHandleID="pnlPopupGetSIDNegaraHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetSIDNegaraHeader" runat="server" CssClass="header">
                <asp:Label ID="Label7" runat="server" CssClass="msg" Text="SIDNegara" />
                <asp:LinkButton ID="LinkButton7" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetSIDNegara').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetSIDNegara" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchSIDNegara" runat="server" DefaultButton="btnSearchSIDNegara">
                            <asp:TextBox ID="txtSearchSIDNegara" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSIDNegara" OnClick="btnSearchSIDNegara_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListSIDNegara" runat="server" OnSelectedIndexChanged="gvwListSIDNegara_SelectedIndexChanged"
                            DataKeyNames="SANDI,KETERANGAN" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListSIDNegara_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListSIDNegara_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="SANDI" HeaderText="Sandi">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KETERANGAN" HeaderText="Keterangan">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseSIDNegara" OnClientClick="$find('mdlPopupGetSIDNegara').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
    <%-- Lookup SID Pekerjaan--%>
    <asp:Panel ID="pnlPopUpGetSIDPekerjaan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetSIDPekerjaan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetSIDPekerjaan" runat="server" BehaviorID="mdlPopupGetSIDPekerjaan"
            PopupControlID="pnlPopupGetSIDPekerjaan" TargetControlID="btnShowPopupGetSIDPekerjaan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender9" runat="server" TargetControlID="pnlPopUpGetSIDPekerjaan"
            DragHandleID="pnlPopupGetSIDPekerjaanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetSIDPekerjaanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label8" runat="server" CssClass="msg" Text="SIDPekerjaan" />
                <asp:LinkButton ID="LinkButton8" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetSIDPekerjaan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetSIDPekerjaan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchSIDPekerjaan" runat="server" DefaultButton="btnSearchSIDPekerjaan">
                            <asp:TextBox ID="txtSearchSIDPekerjaan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSIDPekerjaan" OnClick="btnSearchSIDPekerjaan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListSIDPekerjaan" runat="server" OnSelectedIndexChanged="gvwListSIDPekerjaan_SelectedIndexChanged"
                            DataKeyNames="SANDI,KETERANGAN" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListSIDPekerjaan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListSIDPekerjaan_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="SANDI" HeaderText="Sandi">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KETERANGAN" HeaderText="Keterangan">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseSIDPekerjaan" OnClientClick="$find('mdlPopupGetSIDPekerjaan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
    <%-- Lookup SID BidUsaha--%>
    <asp:Panel ID="pnlPopUpGetSIDBidUsaha" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetSIDBidUsaha" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetSIDBidUsaha" runat="server" BehaviorID="mdlPopupGetSIDBidUsaha"
            PopupControlID="pnlPopupGetSIDBidUsaha" TargetControlID="btnShowPopupGetSIDBidUsaha"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender10" runat="server" TargetControlID="pnlPopUpGetSIDBidUsaha"
            DragHandleID="pnlPopupGetSIDBidUsahaHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetSIDBidUsahaHeader" runat="server" CssClass="header">
                <asp:Label ID="Label9" runat="server" CssClass="msg" Text="SIDBidUsaha" />
                <asp:LinkButton ID="LinkButton9" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetSIDBidUsaha').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetSIDBidUsaha" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchSIDBidUsaha" runat="server" DefaultButton="btnSearchSIDBidUsaha">
                            <asp:TextBox ID="txtSearchSIDBidUsaha" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSIDBidUsaha" OnClick="btnSearchSIDBidUsaha_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListSIDBidUsaha" runat="server" OnSelectedIndexChanged="gvwListSIDBidUsaha_SelectedIndexChanged"
                            DataKeyNames="SANDI,KETERANGAN" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListSIDBidUsaha_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListSIDBidUsaha_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="SANDI" HeaderText="Sandi">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="KETERANGAN" HeaderText="Keterangan">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseSIDBidUsaha" OnClientClick="$find('mdlPopupGetSIDBidUsaha').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Kelompok--%>
    <asp:Panel ID="pnlPopUpGetOJKKelompok" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKKelompok" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKKelompok" runat="server" BehaviorID="mdlPopupGetOJKKelompok"
            PopupControlID="pnlPopupGetOJKKelompok" TargetControlID="btnShowPopupGetOJKKelompok"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender11" runat="server" TargetControlID="pnlPopUpGetOJKKelompok"
            DragHandleID="pnlPopupGetOJKKelompokHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKKelompokHeader" runat="server" CssClass="header">
                <asp:Label ID="Label10" runat="server" CssClass="msg" Text="OJKKelompok" />
                <asp:LinkButton ID="LinkButton10" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKKelompok').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKKelompok" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKKelompok" runat="server" DefaultButton="btnSearchOJKKelompok">
                            <asp:TextBox ID="txtSearchOJKKelompok" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKKelompok" OnClick="btnSearchOJKKelompok_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKKelompok" runat="server" OnSelectedIndexChanged="gvwListOJKKelompok_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKKelompok_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKKelompok_PageIndexChanging" CssClass="mGrid"
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
                        <asp:Button ID="btnCloseOJKKelompok" OnClientClick="$find('mdlPopupGetOJKKelompok').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Kategori Usaha--%>
    <asp:Panel ID="pnlPopUpGetOJKKategoriUsaha" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKKategoriUsaha" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKKategoriUsaha" runat="server" BehaviorID="mdlPopupGetOJKKategoriUsaha"
            PopupControlID="pnlPopupGetOJKKategoriUsaha" TargetControlID="btnShowPopupGetOJKKategoriUsaha"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender12" runat="server" TargetControlID="pnlPopUpGetOJKKategoriUsaha"
            DragHandleID="pnlPopupGetOJKKategoriUsahaHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKKategoriUsahaHeader" runat="server" CssClass="header">
                <asp:Label ID="Label11" runat="server" CssClass="msg" Text="OJKKategoriUsaha" />
                <asp:LinkButton ID="LinkButton11" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKKategoriUsaha').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKKategoriUsaha" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKKategoriUsaha" runat="server" DefaultButton="btnSearchOJKKategoriUsaha">
                            <asp:TextBox ID="txtSearchOJKKategoriUsaha" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKKategoriUsaha" OnClick="btnSearchOJKKategoriUsaha_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKKategoriUsaha" runat="server" OnSelectedIndexChanged="gvwListOJKKategoriUsaha_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKKategoriUsaha_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKKategoriUsaha_PageIndexChanging" CssClass="mGrid"
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
                        <asp:Button ID="btnCloseOJKKategoriUsaha" OnClientClick="$find('mdlPopupGetOJKKategoriUsaha').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Golongan--%>
    <asp:Panel ID="pnlPopUpGetOJKGolongan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKGolongan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKGolongan" runat="server" BehaviorID="mdlPopupGetOJKGolongan"
            PopupControlID="pnlPopupGetOJKGolongan" TargetControlID="btnShowPopupGetOJKGolongan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender13" runat="server" TargetControlID="pnlPopUpGetOJKGolongan"
            DragHandleID="pnlPopupGetOJKGolonganHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKGolonganHeader" runat="server" CssClass="header">
                <asp:Label ID="Label12" runat="server" CssClass="msg" Text="OJKGolongan" />
                <asp:LinkButton ID="LinkButton12" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKGolongan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKGolongan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKGolongan" runat="server" DefaultButton="btnSearchOJKGolongan">
                            <asp:TextBox ID="txtSearchOJKGolongan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKGolongan" OnClick="btnSearchOJKGolongan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKGolongan" runat="server" OnSelectedIndexChanged="gvwListOJKGolongan_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKGolongan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKGolongan_PageIndexChanging" CssClass="mGrid"
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
                        <asp:Button ID="btnCloseOJKGolongan" OnClientClick="$find('mdlPopupGetOJKGolongan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Hubungan--%>
    <asp:Panel ID="pnlPopUpGetOJKHubungan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKHubungan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKHubungan" runat="server" BehaviorID="mdlPopupGetOJKHubungan"
            PopupControlID="pnlPopupGetOJKHubungan" TargetControlID="btnShowPopupGetOJKHubungan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender14" runat="server" TargetControlID="pnlPopUpGetOJKHubungan"
            DragHandleID="pnlPopupGetOJKHubunganHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKHubunganHeader" runat="server" CssClass="header">
                <asp:Label ID="Label13" runat="server" CssClass="msg" Text="OJKHubungan" />
                <asp:LinkButton ID="LinkButton13" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKHubungan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKHubungan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKHubungan" runat="server" DefaultButton="btnSearchOJKHubungan">
                            <asp:TextBox ID="txtSearchOJKHubungan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKHubungan" OnClick="btnSearchOJKHubungan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKHubungan" runat="server" OnSelectedIndexChanged="gvwListOJKHubungan_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKHubungan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKHubungan_PageIndexChanging" CssClass="mGrid"
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
                        <asp:Button ID="btnCloseOJKHubungan" OnClientClick="$find('mdlPopupGetOJKHubungan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Sektor Ekonomi--%>
    <asp:Panel ID="pnlPopUpGetOJKSektorEkonomi" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKSektorEkonomi" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKSektorEkonomi" runat="server" BehaviorID="mdlPopupGetOJKSektorEkonomi"
            PopupControlID="pnlPopupGetOJKSektorEkonomi" TargetControlID="btnShowPopupGetOJKSektorEkonomi"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender15" runat="server" TargetControlID="pnlPopUpGetOJKSektorEkonomi"
            DragHandleID="pnlPopupGetOJKSektorEkonomiHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKSektorEkonomiHeader" runat="server" CssClass="header">
                <asp:Label ID="Label14" runat="server" CssClass="msg" Text="OJKSektorEkonomi" />
                <asp:LinkButton ID="LinkButton14" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKSektorEkonomi').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKSektorEkonomi" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKSektorEkonomi" runat="server" DefaultButton="btnSearchOJKSektorEkonomi">
                            <asp:TextBox ID="txtSearchOJKSektorEkonomi" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKSektorEkonomi" OnClick="btnSearchOJKSektorEkonomi_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKSektorEkonomi" runat="server" OnSelectedIndexChanged="gvwListOJKSektorEkonomi_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKSektorEkonomi_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKSektorEkonomi_PageIndexChanging" CssClass="mGrid"
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
                        <asp:Button ID="btnCloseOJKSektorEkonomi" OnClientClick="$find('mdlPopupGetOJKSektorEkonomi').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
</asp:Content>

