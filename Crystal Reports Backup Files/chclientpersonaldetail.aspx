<%@ Page Title="" Language="C#" MasterPageFile="~/mfin2.master" AutoEventWireup="true" CodeFile="chclientpersonaldetail.aspx.cs" Inherits="module_channelling_transaction_chclientpersonaldetail" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
    <script type="text/javascript">
         $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            $("#subpages-0").tabs();
            $("#subpages-1").tabs();
        });
        
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            jsPopUpDate('ctl00_cphbd_txtInbornDt');
            jsPopUpDate('ctl00_cphbd_txtInFromDt');
            jsPopUpDate('ctl00_cphbd_txtInToDt');
            jsPopUpDate('ctl00_cphbd_txtInSpouBrdt');

            function hidSpouse() {
                if ($get('ctl00_cphbd_rboInMarital_2').Checked = true) {
                    $get('tblBody0_8').visible = true;
                }
                else {
                    $get('tblBody0_8').visible = false;
                }
            }
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
                    <span class="search-header">Data Client</span>
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
                <li><a href="#page-0"><span>Personal Information</span></a></li>
                <%--<li><a href="#page-1"><span>Client Document</span></a></li>--%>
            </ul>
            <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow-y: auto">
                <asp:UpdatePanel ID="pnlBody0" runat="server">
                    <ContentTemplate>
                        <table id="tblBody0_0" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr style="display: none">
                                <td >
                                    <span>ID</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td >
                                    <cc1:XUILabel ID="lblSYSCLIENTID" runat="server" DataType="Integer" DBColumnName="SYS_CLIENTID"
                                        BindType="Both" SPParameterName="p_sys_clientid" Text="0"></cc1:XUILabel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Client no.</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="79%">
                                    <cc1:XUITextBox ID="txtClient" runat="server" DataType="String" DBColumnName="CLIENT"
                                        BindType="Both" SPParameterName="p_client" MaxLength="20" Width="160px"
                                        Enabled="false">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Gelar</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtSalute1" runat="server" DataType="String" DBColumnName="SALUTE1"
                                        BindType="Both" SPParameterName="p_salute1" MaxLength="10" Width="80px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Nama/Sebutan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtName" runat="server" DataType="String" DBColumnName="NAME"
                                        BindType="Both" SPParameterName="p_name" MaxLength="60" Width="340px">
                                    </cc1:XUITextBox>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" Text="Nama Debitur harus diisi">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="revClient" runat="server" ErrorMessage="Nama Debitur Tidak Boleh ada Special karakter"
                                        ControlToValidate="txtName" ValidationExpression="[A-Za-z '-]*[A-Za-z '-]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Gelar Belakang</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtSalute2" runat="server" DataType="String" DBColumnName="SALUTE2"
                                        BindType="Both" SPParameterName="p_salute2" MaxLength="10" Width="80px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <%--<tr>
                                <td>
                                    <span>A/O *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUIDropDownList ID="ddlAO" runat="server" DataType="String" DBColumnName="AO"
                                        BindType="Both" SPParameterName="p_ao">
                                    </cc1:XUIDropDownList>
                                    <asp:RequiredFieldValidator ID="rfvAO" runat="server" ControlToValidate="ddlAO" Display="Dynamic" Text="A/O harus diisi">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>
                            <tr>
                                <td >
                                    <span>Tanggal Lahir *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td >
                                    <cc1:XUITextBox ID="txtInbornDt" runat="server" DataType="DateTime" Format="dd/MM/yyyy"
                                        DBColumnName="INBORNDT" BindType="Both" SPParameterName="p_inborndt" Width="72px"
                                        CausesValidation="false"></cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvTanggalLahir" runat="server" ControlToValidate="txtInbornDt" Display="Dynamic" Text="Tanggal lahir harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Tempat Lahir *</span>
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
                                <td>
                                    <span>Status Pernikahan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td >
                                    <cc1:XUIRadioButtonList ID="rboInMarital" runat="server" DataType="String" DBColumnName="INMARITAL"
                                        BindType="Both" SPParameterName="p_inmarital" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                        onclick='hidSpouse();'>
                                        <asp:ListItem Value="0" style="display:none;"></asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True"> Single </asp:ListItem>
                                        <asp:ListItem Value="2"> Married </asp:ListItem>
                                        <asp:ListItem Value="3"> Widowed </asp:ListItem>
                                    </cc1:XUIRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Ibu Kandung *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td >
                                    <cc1:XUITextBox ID="txtIbuKandung" runat="server" DataType="String" DBColumnName="IBUKANDUNG"
                                        BindType="Both" SPParameterName="p_ibukandung" MaxLength="40" Width="320px"
                                        CausesValidation="false">
                                    </cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvIbuKandung" runat="server" ControlToValidate="txtIbuKandung" Display="Dynamic" Text="Ibu Kandung harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="revIbuKandung" runat="server" ErrorMessage="Nama Ibu Kandung Tidak Boleh ada Special karakter"
                                        ControlToValidate="txtIbuKandung" ValidationExpression="[A-Za-z '-]*[A-Za-z '-]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Agama</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUIDropDownList ID="ddlReligion" runat="server" DataType="String" DBColumnName="RELIGION"
                                        BindType="Both" SPParameterName="p_religion">
                                        <asp:ListItem Value="1"> ISLAM </asp:ListItem>
                                        <asp:ListItem Value="2"> KRISTEN </asp:ListItem>
                                        <asp:ListItem Value="3"> KATHOLIK </asp:ListItem>
                                        <asp:ListItem Value="4"> BUDHA </asp:ListItem>
                                        <asp:ListItem Value="5"> HINDU </asp:ListItem>
                                        <asp:ListItem Value="6"> KONG HU CU </asp:ListItem>
                                        <asp:ListItem Value="7"> ALIRAN KEPERCAYAAN </asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <span>NPWP *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td >
                                    <cc1:XUITextBox ID="txtNPWP" runat="server" DataType="String" DBColumnName="NPWP"
                                        BindType="Both" SPParameterName="p_npwp" MaxLength="20" Width="280px"
                                        CausesValidation="false" ToolTip="Format = 99.999.999.9.999.999">
                                        </cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvNPWP" runat="server" ControlToValidate="txtNPWP" Display="Dynamic" Text="NPWP harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="revNPWPPersonal" runat="server" ErrorMessage="Format NPWP salah! NPWP Format = 99.999.999.9.999.999"
                                        ControlToValidate="txtNPWP" 
                                        ValidationExpression="([0-9]{2}\.[0-9]{3}\.[0-9]{3}\.[0-9]{1}\.[0-9]{3}\.[0-9]{3})" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Tanggungan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInJumTg" runat="server" DataType="Number" Format="N0" DBColumnName="INJUMTG"
                                        BindType="Both" SPParameterName="p_injumtg" MaxLength="2" Width="16px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>No. KTP *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtInKtp" runat="server" DataType="String" DBColumnName="INKTP"
                                        BindType="Both" SPParameterName="p_inktp" MaxLength="30" Width="240px"
                                        CausesValidation="false"></cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvInKTP" runat="server" ControlToValidate="txtInKtp" Display="Dynamic" Text="KTP harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Pendidikan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInEducat" runat="server" DataType="String" DBColumnName="INEDUCAT"
                                        BindType="Both" SPParameterName="p_ineducat" MaxLength="30" Width="240px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Jenis Kelamin *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUIRadioButtonList ID="rboInGender" runat="server" DataType="String" DBColumnName="INGENDER"
                                        BindType="Both" SPParameterName="p_ingender" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="1" Selected="True"> Male </asp:ListItem>
                                        <asp:ListItem Value="2"> Female </asp:ListItem>
                                    </cc1:XUIRadioButtonList>
                                   <%-- <asp:RequiredFieldValidator ID="rfvInGender" runat="server" ControlToValidate="rboInGender" Display="Dynamic" Text="Gender harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="3" valign="top">
                                    <span>Alamat</span>
                                </td>
                                <td rowspan="3" valign="top">
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtAddress1" runat="server" DataType="String" DBColumnName="ADDRESS1"
                                        BindType="Both" SPParameterName="p_address1" MaxLength="40" Width="320px"
                                        CausesValidation="false">
                                    </cc1:XUITextBox>
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="revAddress1" runat="server" ErrorMessage="Alamat(1) tidak boleh ada special karakter"
                                        ControlToValidate="txtAddress1" ValidationExpression="[A-Za-z0-9 .,/()-]*[A-Za-z0-9 .,/()-]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtAddress2" runat="server" DataType="String" DBColumnName="ADDRESS2"
                                        BindType="Both" SPParameterName="p_address2" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="revAddress2" runat="server" ErrorMessage="Alamat(2) tidak boleh ada special karakter"
                                        ControlToValidate="txtAddress2" ValidationExpression="[A-Za-z0-9 .,/()-]*[A-Za-z0-9 .,/()-]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtAddress3" runat="server" DataType="String" DBColumnName="ADDRESS3"
                                        BindType="Both" SPParameterName="p_address3" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="revAddress3" runat="server" ErrorMessage="Alamat(3) tidak boleh ada special karakterr"
                                        ControlToValidate="txtAddress3" ValidationExpression="[A-Za-z0-9 .,/()-]*[A-Za-z0-9 .,/()-]" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Kode Pos *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="updAreaInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnLookUpArea" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpArea_Click" />                                    
                                            <cc1:XUITextBox ID="txtAreaName" runat="server" DataType="String" DBColumnName="AREA_CODE"
                                                SPParameterName="p_area_code" BindType="Both" Width="48px" Enabled="false">
                                            </cc1:XUITextBox>
                                            <%--<asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtAreaName" Display="Dynamic" Text="Zip Code harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Kelurahan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtKelurahan" runat="server" DataType="String" DBColumnName="KELURAHAN"
                                        BindType="Both" SPParameterName="p_kelurahan" MaxLength="40" Width="320px"
                                        CausesValidation="false" Enabled="true">
                                    </cc1:XUITextBox>
                                   <%-- <asp:RequiredFieldValidator ID="rfvKelurahan" runat="server" ControlToValidate="txtKelurahan" Display="Dynamic" Text="Kelurahan harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Kecamatan *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtKecamatan" runat="server" DataType="String" DBColumnName="KECAMATAN"
                                        BindType="Both" SPParameterName="p_kecamatan" MaxLength="40" Width="320px"
                                        CausesValidation="false" Enabled="true">
                                    </cc1:XUITextBox>
                                   <%-- <asp:RequiredFieldValidator ID="rfvKecamatan" runat="server" ControlToValidate="txtKecamatan" Display="Dynamic" Text="Kecamatan harus diisi">
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
                                           <%-- <asp:RequiredFieldValidator ID="txtIndustry" runat="server" ControlToValidate="txtInd_Code" Display="Dynamic" Text="Industry harus diisi">
                                            </asp:RequiredFieldValidator>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>No. Telepon Rumah *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtPhoneAreaCode" runat="server" DataType="String" DBColumnName="AREA_CODES"
                                        BindType="Both" SPParameterName="p_kodearea" MaxLength="4" Width="32px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <cc1:XUITextBox ID="txtPhone" runat="server" DataType="String" DBColumnName="PHONE"
                                        BindType="Both" SPParameterName="p_phone" MaxLength="20" Width="160px">
                                    </cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvPhoneAreaCode" runat="server" ControlToValidate="txtPhoneAreaCode" Display="Dynamic" Text="Kode Area Telepon harus diisi">
                                    </asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" Text="No Telepon harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Fax </span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtFax" runat="server" DataType="String" DBColumnName="FAX" BindType="Both"
                                        SPParameterName="p_fax" MaxLength="20" Width="160px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <%--<tr>
                                <td rowspan="3" valign="top">
                                    <span>Alamat Surat</span>
                                </td>
                                <td rowspan="3" valign="top">
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInMailAdd1" runat="server" DataType="String" DBColumnName="INMAILADD1"
                                        BindType="Both" SPParameterName="p_inmailadd1" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtInMailAdd2" runat="server" DataType="String" DBColumnName="INMAILADD2"
                                        BindType="Both" SPParameterName="p_inmailadd2" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtInMailAdd3" runat="server" DataType="String" DBColumnName="INMAILADD3"
                                        BindType="Both" SPParameterName="p_inmailadd3" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>No. Tlp Alamat Surat</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80">
                                    <cc1:XUITextBox ID="txtInMailPhone" runat="server" DataType="String" DBColumnName="INMAILPHONE"
                                        BindType="Both" SPParameterName="p_inmailphone" MaxLength="20" Width="160px"></cc1:XUITextBox>
                                </td>
                            </tr>--%>
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
                                <td>
                                    <span>Email</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtEmail" runat="server" DataType="String" DBColumnName="EMAIL"
                                        BindType="Both" SPParameterName="p_email" MaxLength="50" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <%--<tr>
                                <td>
                                    <span>Group</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="updGroupInfo" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:XUITextBox ID="txtGroup_" runat="server" DataType="String" DBColumnName="GROUP_"
                                                BindType="Both" SPParameterName="p_group_" MaxLength="10" Width="80px" >
                                            </cc1:XUITextBox>
                                            <asp:ImageButton ID="btnLookUpGroup" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpGroup_Click" />                                    
                                            <cc1:XUITextBox ID="txtGroupName" runat="server" DataType="String" DBColumnName="GROUPNAME"
                                                BindType="DBToUIOnly" MaxLength="40" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>--%>
                            <tr>
                                <td colspan="3"><span>&nbsp;</span></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-bottom: solid 1px #AAAAAA;">
                                </td>
                            </tr>
                        </table>
                        <table id="tblBody0_1" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="3">
                                    <h2>
                                        Informasi Pekerjaan
                                    </h2>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <cc1:XUIRadioButtonList ID="rboInJob" runat="server" DataType="String" DBColumnName="INJOB"
                                        BindType="Both" SPParameterName="p_injob" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="0" style="display:none;"></asp:ListItem>
                                        <asp:ListItem Value="1"> Karyawan </asp:ListItem>
                                        <asp:ListItem Value="2"> Wiraswasta </asp:ListItem>
                                        <asp:ListItem Value="3"> Profesional </asp:ListItem>
                                        <asp:ListItem Value="4" Selected="True" > Others </asp:ListItem>
                                    </cc1:XUIRadioButtonList>
                                    <span> *</span>
                                    <%--<asp:RequiredFieldValidator ID="rfvInJob" runat="server" ControlToValidate="rboInJob" Display="Dynamic" Text="Pekerjaan harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Perusahaan * </span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="79%">
                                    <cc1:XUITextBox ID="txtInCompany" runat="server" DataType="String" DBColumnName="INCOMPANY"
                                        BindType="Both" SPParameterName="p_incompany" MaxLength="35" Width="280px"></cc1:XUITextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtInCompany" Display="Dynamic" Text="Company harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Industri</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInCompInd" runat="server" DataType="String" DBColumnName="INCOMPIND"
                                        BindType="Both" SPParameterName="p_incompind" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="3" valign="top">
                                    <span>Alamat</span>
                                </td>
                                <td rowspan="3" valign="top">
                                    <span>:</span>
                                </td>
                                <td >
                                    <cc1:XUITextBox ID="txtInAddr1" runat="server" DataType="String" DBColumnName="INADDR1"
                                        BindType="Both" SPParameterName="p_inaddr1" MaxLength="35" Width="280px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtInAddr2" runat="server" DataType="String" DBColumnName="INADDR2"
                                        BindType="Both" SPParameterName="p_inaddr2" MaxLength="35" Width="280px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtInAddr3" runat="server" DataType="String" DBColumnName="INADDR3"
                                        BindType="Both" SPParameterName="p_inaddr3" MaxLength="35" Width="280px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>No. Telepon</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInPhone" runat="server" DataType="String" DBColumnName="INPHONE"
                                        BindType="Both" SPParameterName="p_inphone" MaxLength="20" Width="160px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Fax </span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td  width="80%">
                                    <cc1:XUITextBox ID="txtInFax" runat="server" DataType="String" DBColumnName="INFAX"
                                        BindType="Both" SPParameterName="p_infax" MaxLength="20" Width="160px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Posisi</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInPosition" runat="server" DataType="String" DBColumnName="INPOSITION"
                                        BindType="Both" SPParameterName="p_inposition" MaxLength="30" Width="240px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Lama Bekerja</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInPerYear" runat="server" DataType="Number" Format="N0" DBColumnName="INPERYEAR"
                                        BindType="Both" SPParameterName="p_inperyear" Text="0" Width="24" MaxLength="3"></cc1:XUITextBox>
                                    <span>Tahun</span>
                                    <cc1:XUITextBox ID="txtInPerMth" runat="server" DataType="Number" Format="N0" DBColumnName="INPERMTH"
                                        BindType="Both" SPParameterName="p_inpermth" Text="0" Width="24" MaxLength="3"></cc1:XUITextBox>
                                    <span>Bulan</span>
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
                        <table id="tblBody0_2" cellpadding="0px" cellspacing="0px" width="100%" border="0px">
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
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpSIDNegara_Click" />                                    
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
                        <table id="tblBody0_4" cellpadding="0px" cellspacing="0px" width="100%" border="0px">
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
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKKelompok_Click" Enabled ="false"/>                                    
                                            <cc1:XUITextBox ID="txtOJKKelompok_Descs" runat="server" DataType="String" DBColumnName="OJKKELOMPOK_DESCS"
                                                BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled ="false"></cc1:XUITextBox>
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
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKKategoriUsaha_Click" Enabled ="false" />                                    
                                            <cc1:XUITextBox ID="txtOJKKategoriUsaha_Descs" runat="server" DataType="String" DBColumnName="OJKKATEGORIUSAHA_DESCS"
                                                BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled ="false"></cc1:XUITextBox>
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
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKGolongan_Click" Enabled ="false" />                                    
                                            <cc1:XUITextBox ID="txtOJKGolongan_Descs" runat="server" DataType="String" DBColumnName="OJKGOLONGAN_DESCS"
                                                BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true" Enabled ="false" ></cc1:XUITextBox>
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
                                                ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKHubungan_Click" Enabled ="false" />                                    
                                            <cc1:XUITextBox ID="txtOJKHubungan_Descs" runat="server" DataType="String" DBColumnName="OJKHUBUNGAN_DESCS"
                                                BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled ="false"></cc1:XUITextBox>
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
                        <table id="tblBody0_3" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="3">
                                    <h2>Kekayaan Pribadi</h2>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Rumah *</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="79%">
                                    <cc1:XUIRadioButtonList ID="rboInHouse" runat="server" DataType="String" DBColumnName="INHOUSE"
                                        BindType="Both" SPParameterName="p_inhouse" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="0" style="display:none;"></asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" >Own</asp:ListItem>
                                        <asp:ListItem Value="2">Rental</asp:ListItem>
                                        <asp:ListItem Value="3">Credit</asp:ListItem>
                                        <asp:ListItem Value="4">Family</asp:ListItem>
                                    </cc1:XUIRadioButtonList>
                                    <%--<asp:RequiredFieldValidator ID="rfvInHouse" runat="server" ControlToValidate="rboInHouse" Display="Dynamic" Text="Housing harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Lama Tinggal *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInStaYear" runat="server" DataType="Number" Format="N0" DBColumnName="INSTAYEAR"
                                        BindType="Both" SPParameterName="p_instayear" Text="0" MaxLength="3" Width="32">
                                    </cc1:XUITextBox>
                                    <span>Tahun</span>
                                    <cc1:XUITextBox ID="txtInStaMth" runat="server" DataType="Number" Format="N0" DBColumnName="INSTAMTH"
                                        BindType="Both" SPParameterName="p_instamth" Text="0" MaxLength="3" Width="32">
                                    </cc1:XUITextBox>
                                    <span>Bulan</span>
                                    <%--<asp:RequiredFieldValidator ID="rfvInStaYear" runat="server" ControlToValidate="txtInStaYear" Display="Dynamic" Text="Stay Year harus diisi">
                                    </asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="rfvInStaMth" runat="server" ControlToValidate="txtInStaMth" Display="Dynamic" Text="Stay Month harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Luas Bangunan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInLuasHouse" runat="server" DataType="Number" Format="N0"
                                        DBColumnName="INLUASHOUSE" BindType="Both" SPParameterName="p_inluashouse" Text="0"
                                        MaxLength="4" Width="32px">
                                    </cc1:XUITextBox>
                                    <span>M2</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Luas Tanah</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInLuasLand" runat="server" DataType="Number" Format="N0" DBColumnName="INLUASLAND"
                                        BindType="Both" SPParameterName="p_inluasland" Text="0" MaxLength="4" Width="32px">
                                    </cc1:XUITextBox>
                                    <span>M2</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Kendaraan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInCar" runat="server" DataType="String" MaxLength="30" DBColumnName="INCAR"
                                        BindType="Both" SPParameterName="p_incar" Width="240px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>No. Polisi</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInCarNo" runat="server" DataType="String" MaxLength="8" DBColumnName="INCARNO"
                                        BindType="Both" SPParameterName="p_incarno" Width="64px">
                                    </cc1:XUITextBox>
                                    <span>Tahun</span>
                                    <cc1:XUITextBox ID="txtInCarYear" runat="server" DataType="String" MaxLength="4" Width="32px" DBColumnName="INCARYEAR"
                                        BindType="Both" SPParameterName="p_incaryear">
                                    </cc1:XUITextBox>
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
                       <%-- <table id="tblBody0_4" cellpadding="0px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="3">
                                    <h2>
                                        Informasi Kredit Lainnya</h2>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Bank/Perusahaan Finance</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="79%">
                                    <cc1:XUITextBox ID="txtInBank" runat="server" DataType="String" MaxLength="35" DBColumnName="INBANK"
                                        BindType="Both" SPParameterName="p_inbank" Width="280px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Jenis Pinjaman</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInTypeLoan" runat="server" DataType="String" MaxLength="20"
                                        DBColumnName="INTYPELOAN" BindType="Both" SPParameterName="p_intypeloan" Width="160px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Total Pinjaman</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInTotLoan" runat="server" DataType="Number" Format="N2" DBColumnName="INTOTLOAN"
                                        BindType="Both" SPParameterName="p_intotloan" Text="0.00" MaxLength="17">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Angsuran tiap Bulan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInRental" runat="server" DataType="Number" Format="N2" DBColumnName="INRENTAL"
                                        BindType="Both" SPParameterName="p_inrental" Text="0.00" MaxLength="17">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Tenor</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInLoanPeriod" runat="server" DataType="Number" Format="N0"
                                        DBColumnName="INLOANPERIOD" BindType="Both" SPParameterName="p_inloanperiod" Text="0"
                                        MaxLength="3">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Dari Tanggal</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInFromDt" runat="server" DataType="DateTime" Format="dd/MM/yyyy"
                                        DBColumnName="INFROMDT" BindType="Both" SPParameterName="p_infromdt" Width="64px">
                                    </cc1:XUITextBox>
                                    <span>Sampai</span>
                                    <cc1:XUITextBox ID="txtInToDt" runat="server" DataType="DateTime" Format="dd/MM/yyyy"
                                        DBColumnName="INTODT" BindType="Both" SPParameterName="p_intodt" Width="64px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><span>&nbsp;</span></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-bottom: solid 1px #AAAAAA;">
                                </td>
                            </tr>
                        </table>--%>
                       <%-- <table id="tblBody0_5" cellpadding="0px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="3">
                                    <h2>Referensi/Penjamin</h2>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    Nama *
                                </td>
                                <td width="1%">
                                    :
                                </td>
                                <td width="79%">
                                    <cc1:XUITextBox ID="txtInJamin" runat="server" DataType="String" MaxLength="35" DBColumnName="INJAMIN"
                                        BindType="Both" SPParameterName="p_injamin" Width="280px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="3" valign="top" >
                                    Alamat *
                                </td>
                                <td rowspan="3" valign="top">
                                    :
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInJamAdd1" runat="server" DataType="String" MaxLength="40"
                                        DBColumnName="INJAMADD1" BindType="Both" SPParameterName="p_injamadd1" Width="320px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <cc1:XUITextBox ID="txtInJamAdd2" runat="server" DataType="String" MaxLength="40"
                                        DBColumnName="INJAMADD2" BindType="Both" SPParameterName="p_injamadd2" Width="320px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtInJamAdd3" runat="server" DataType="String" MaxLength="40"
                                        DBColumnName="INJAMADD3" BindType="Both" SPParameterName="p_injamadd3" Width="320px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    No. KTP *
                                </td>
                                <td>
                                    :
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInJamKtp" runat="server" DataType="String" MaxLength="20"
                                        DBColumnName="INJAMKTP" BindType="Both" SPParameterName="p_injamktp" Width="160px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    No. Telepon *   
                                </td>
                                <td>
                                    :
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInJamTelp" runat="server" DataType="String" MaxLength="14"
                                        DBColumnName="INJAMTELP" BindType="Both" SPParameterName="p_injamtelp" Width="112px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Status *
                                </td>
                                <td>
                                    :
                                </td>
                                <td>
                                    <cc1:XUIRadioButtonList ID="rboInJamStat" runat="server" DataType="String" DBColumnName="INJAMSTAT"
                                        BindType="Both" SPParameterName="p_injamstat" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="0" style="display:none;"></asp:ListItem>
                                        <asp:ListItem Value="1">Referensi</asp:ListItem>
                                        <asp:ListItem Value="2" Selected="True">Penjamin</asp:ListItem>
                                    </cc1:XUIRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><span>&nbsp;</span></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-bottom: solid 1px #AAAAAA;">
                                </td>
                            </tr>
                        </table>--%>
                        <%--<table id="tblBody0_6" cellpadding="0px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <h2>
                                        Catatan</h2>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtRemark" runat="server" DataType="String" DBColumnName="REMARK"
                                        BindType="Both" SPParameterName="p_remark" TextMode="MultiLine" Wrap="false" Rows="10" Width="640px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><span>&nbsp;</span></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-bottom: solid 1px #AAAAAA;">
                                </td>
                            </tr>
                        </table>--%>
                       <%-- <table id="tblBody0_7" cellpadding="0px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <h2>
                                        Proses Remedial
                                    </h2>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtMemo" runat="server" DataType="String" DBColumnName="MEMO"
                                        BindType="Both" SPParameterName="p_memo" TextMode="MultiLine" Wrap="false"
                                        Rows="10" Width="640px" Enabled="false">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                           <tr>
                                <td colspan="3"><span>&nbsp;</span></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-bottom: solid 1px #AAAAAA;">
                                </td>
                            </tr>
                        </table>--%>
                        <table id="tblBody0_8" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="3">
                                    <h2>Identitas Pasangan</h2>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Nama *</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="79%">
                                    <cc1:XUITextBox ID="txtInSpouName" runat="server" DataType="String" MaxLength="40" DBColumnName="INSPOUNAME"
                                        BindType="Both" SPParameterName="p_inspouname" Width="320px">
                                    </cc1:XUITextBox>
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Nama Pasangan Tidak Boleh ada Special karakter"
                                        ControlToValidate="txtInSpouName" ValidationExpression="[A-Za-z '-]*[A-Za-z '-]" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>TTL *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouPlc" runat="server" DataType="String" MaxLength="20" DBColumnName="INSPOUPLC"
                                        BindType="Both" SPParameterName="p_inspouplc" Width="160px">
                                    </cc1:XUITextBox>
                                    <cc1:XUITextBox ID="txtInSpouBrdt" runat="server" DataType="DateTime" Format="dd/MM/yyyy" MaxLength="10" DBColumnName="INSPOUBRDT"
                                        BindType="Both" SPParameterName="p_inspoubrdt" Width="64px">
                                    </cc1:XUITextBox> (dd/MM/yyyy)
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Pendidikan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouEdu" runat="server" DataType="String" MaxLength="25" DBColumnName="INSPOUEDU"
                                        BindType="Both" SPParameterName="p_inspouedu" Width="200px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>KTP/KTM *</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouKt" runat="server" DataType="String" MaxLength="30" DBColumnName="INSPOUKT"
                                        BindType="Both" SPParameterName="p_inspoukt" Width="240px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <cc1:XUIRadioButtonList ID="rboInSpouJob" runat="server" DataType="String" DBColumnName="INSPOUJOB"
                                        BindType="Both" SPParameterName="p_inspoujob" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="0" style="display:none;"></asp:ListItem>
                                        <asp:ListItem Value="1">Staff</asp:ListItem>
                                        <asp:ListItem Value="2">Wiraswasta</asp:ListItem>
                                        <asp:ListItem Value="3">Profesional</asp:ListItem>
                                        <asp:ListItem Value="4" Selected="True">Others</asp:ListItem>
                                    </cc1:XUIRadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Perusahaan</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouComp" runat="server" DataType="String" MaxLength="40" DBColumnName="INSPOUCOMP"
                                        BindType="Both" SPParameterName="p_inspoucomp" Width="320px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Industri</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouInd" runat="server" DataType="String" MaxLength="30" DBColumnName="INSPOUIND"
                                        BindType="Both" SPParameterName="p_inspouind" Width="240px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="3" valign="top">
                                    <span>Alamat *</span>
                                </td>
                                <td rowspan="3" valign="top">
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouAdd1" runat="server" DataType="String" MaxLength="40" DBColumnName="INSPOUADD1"
                                        BindType="Both" SPParameterName="p_inspouadd1" Width="320px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouAdd2" runat="server" DataType="String" MaxLength="40" DBColumnName="INSPOUADD2"
                                        BindType="Both" SPParameterName="p_inspouadd2" Width="320px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouAdd3" runat="server" DataType="String" MaxLength="40" DBColumnName="INSPOUADD3"
                                        BindType="Both" SPParameterName="p_inspouadd3" Width="320px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>No. Telepon</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouTelp" runat="server" DataType="String" MaxLength="14" DBColumnName="INSPOUTELP"
                                        BindType="Both" SPParameterName="p_inspoutelp" Width="112px">
                                    </cc1:XUITextBox>
                                    <span>Fax </span>
                                    <cc1:XUITextBox ID="txtInSpouFax" runat="server" DataType="String" MaxLength="14" DBColumnName="INSPOUFAX"
                                        BindType="Both" SPParameterName="p_inspoufax" Width="112px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Posisi</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouJab" runat="server" DataType="String" MaxLength="30" DBColumnName="INSPOUJAB"
                                        BindType="Both" SPParameterName="p_inspoujab" Width="240px">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Lama Bekerja</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtInSpouYear" runat="server" DataType="Number" Format="N0" DBColumnName="INSPOUYEAR"
                                        BindType="Both" SPParameterName="p_inspouyear" Text="0" MaxLength="2" Width="32px"></cc1:XUITextBox>
                                    <span>Tahun</span>
                                    <cc1:XUITextBox ID="txtInSpouBln" runat="server" DataType="Number" Format="N0" DBColumnName="INSPOUBLN"
                                        BindType="Both" SPParameterName="p_inspoubln" Text="0" MaxLength="2" Width="16px"></cc1:XUITextBox>
                                    <span>Bulan</span>
                                </td>
                            </tr>
                            <tr><td colspan="3">&nbsp;</td></tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            
            <%--<div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow: auto">
                <table id="tblBody1" runat="server" cellpadding="3" cellspacing="0" class="search-list-table"
                width="100%">
                    <tr>
                        <td>
                            <cc1:XUIButton RoleCode="B000403" ID="btnAddDetail" runat="server" CssClass="add" Text="Add" OnClick="btnAddDetail_Click" />
                            <cc1:XUIButton ID="btnDelete" runat="server"  CssClass="void" Text="Delete" OnClick="btnReject_Click" RoleCode="B000405" />
                           
                        </td>
                        <td align="right">
                            <asp:Panel ID="pnlSearchDetail" runat="server" DefaultButton="btnSearchDetail">
                                <asp:TextBox ID="txtSearchDetail" runat="server"></asp:TextBox>
                                <asp:Button ID="btnSearchDetail" runat="server" CssClass="search" Text="Search"
                                    OnClick="btnSearchDetail_Click" />
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwListDetail" runat="server" AutoGenerateColumns="False" DataKeyNames="DOC_STORAGEDID"
                                        OnSelectedIndexChanged="gvwListDetail_SelectedIndexChanged" EmptyDataText="There is no data."
                                        AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListDetail_PageIndexChanging"
                                        OnRowCommand="gvwListDetail_RowCommand"
                                        OnRowDataBound="gvwListDetail_RowDataBound" 
                                        OnRowCreated="gvwListDetail_RowCreated" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chbSelectAll" runat="server" />    
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chbSelect" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="DOC_NAME" HeaderText="Document Type">
                                                <ItemStyle Width="20%" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NAME" HeaderText="Title">
                                                <ItemStyle Width="40%" HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DESCS" HeaderText="Description">
                                                <ItemStyle Width="40%" HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                        ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearchDetail" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>--%>
        </div>
        <asp:ValidationSummary ShowMessageBox="true" ShowSummary="false" ID="vsClient" HeaderText="Data belum lengkap atau format salah:"
            DisplayMode="BulletList" EnableClientScript="true" runat="server" />
    <%--</div>--%>
   
    
    <%-- lookup area--%>
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
                        <asp:Panel ID="pnlSearchArea" runat="server" DefaultButton="btnSearchArea">
                            <asp:TextBox ID="txtSearchArea" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchArea" OnClick="btnSearchArea_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false">
                            </asp:Button>
                        </asp:Panel>
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
                                <asp:BoundField DataField="KODEPOS" HeaderText="Kode Pos">
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

