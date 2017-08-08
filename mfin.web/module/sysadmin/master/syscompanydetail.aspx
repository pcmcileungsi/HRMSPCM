<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="syscompanydetail.aspx.cs"
    Inherits="module_sysadmin_master_syscompanydetail" Title="Untitled Page" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            jsPopUpDate('ctl00_cphbd_txtCodate');
            jsPopUpDate('ctl00_cphbd_txtCsiupdate');
            jsPopUpDate('ctl00_cphbd_txtClistdate');
        });
    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Instansi</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100069" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr style="display: none">
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblSYSCOMPANY" runat="server" DataType="Integer" DBColumnName="SYS_COMPANYID"
                                BindType="Both" SPParameterName="p_sys_companyid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Kode</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCcode" runat="server" DataType="String" DBColumnName="C_CODE"
                                BindType="Both" SPParameterName="p_c_code" MaxLength="6" Width="48px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCcode" runat="server" ControlToValidate="txtCcode"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Nama Instansi</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCname" runat="server" DataType="String" DBColumnName="C_NAME"
                                BindType="Both" SPParameterName="p_c_name" MaxLength="35" Width="280px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqtxtCname" runat="server" ControlToValidate="txtCname"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" rowspan="2" valign="top">
                            <span>Alamat</span>
                        </td>
                        <td rowspan="2" valign="top">
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCaddress1" runat="server" DataType="String" DBColumnName="C_ADDRESS1"
                                BindType="Both" SPParameterName="p_c_address1" MaxLength="30" Width="240px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCaddress1" runat="server" ControlToValidate="txtCaddress1"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCaddress2" runat="server" DataType="String" DBColumnName="C_ADDRESS2"
                                BindType="Both" SPParameterName="p_c_address2" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Kota</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCcity" runat="server" DataType="String" DBColumnName="C_CITY"
                                BindType="Both" SPParameterName="p_c_city" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Operation Area</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCarea" runat="server" DataType="String" DBColumnName="C_AREA"
                                BindType="Both" SPParameterName="p_c_area" MaxLength="30" Width="240px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqtxtCarea" runat="server" ControlToValidate="txtCarea"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>NPWP No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCnpwp" runat="server" DataType="String" DBColumnName="C_NPWP"
                                BindType="Both" SPParameterName="p_c_npwp" MaxLength="20" Width="160px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCnpwp" runat="server" ControlToValidate="txtCnpwp"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>SIUP No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCsiup" runat="server" DataType="String" DBColumnName="C_SIUP"
                                BindType="Both" SPParameterName="p_c_siup" MaxLength="20" Width="160px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCsiup" runat="server" ControlToValidate="txtCsiup"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Bank Name 1</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtBankName1" runat="server" DataType="String" DBColumnName="BANK_NAME1"
                                BindType="Both" SPParameterName="p_bank_name1" MaxLength="50" Width="300px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>A/C No 1</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtAccNo1" runat="server" DataType="String" DBColumnName="ACC_NO1"
                                BindType="Both" SPParameterName="p_acc_no1" MaxLength="50" Width="300px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>A/C Name 1</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtAccName1" runat="server" DataType="String" DBColumnName="ACC_NAME1"
                                BindType="Both" SPParameterName="p_acc_name1" MaxLength="50" Width="300px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Bank Name 2</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtBankName2" runat="server" DataType="String" DBColumnName="BANK_NAME2"
                                BindType="Both" SPParameterName="p_bank_name2" MaxLength="50" Width="300px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>A/C No 2</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtAccNo2" runat="server" DataType="String" DBColumnName="ACC_NO2"
                                BindType="Both" SPParameterName="p_acc_no2" MaxLength="50" Width="300px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>A/C Name 2</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtAccName2" runat="server" DataType="String" DBColumnName="ACC_NAME2"
                                BindType="Both" SPParameterName="p_acc_name2" MaxLength="50" Width="300px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Director</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updDireksiInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtDireksi_Code" runat="server" DataType="String" DBColumnName="Direksi_Code"
                                        BindType="Both" SPParameterName="p_Direksi_Code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpEmployee" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpDireksi_Click" />
                                    <cc1:XUITextBox ID="txtDireksi_Name" runat="server" DataType="String" DBColumnName="Direksi_Name"
                                        BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>HRD</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updHRDInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtHRD_Code" runat="server" DataType="String" DBColumnName="HRD_Code"
                                        BindType="Both" SPParameterName="p_HRD_Code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpHRD_Click" />
                                    <cc1:XUITextBox ID="txtHRD_Name" runat="server" DataType="String" DBColumnName="HRD_Name"
                                        BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <table style="display: none">

                    <tr>
                        <td width="20%">
                            <span>Public Listing No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtClisting" runat="server" DataType="String" DBColumnName="C_LISTING"
                                BindType="Both" SPParameterName="p_c_listing" MaxLength="20" Width="160px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqClisting" runat="server" ControlToValidate="txtClisting"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>

                    <tr>
                        <td width="20%">
                            <span>Tax Invoice Code</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSandi" runat="server" DataType="String" DBColumnName="SANDI"
                                BindType="Both" SPParameterName="p_sandi" MaxLength="6" Width="48px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqSandi" runat="server" ControlToValidate="txtSandi"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Type</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboCtype" runat="server" DataType="String" DBColumnName="C_TYPE"
                                BindType="Both" SPParameterName="p_c_type" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="0" Selected="True" style="display: none;"></asp:ListItem>
                                <asp:ListItem Value="1">BUMN</asp:ListItem>
                                <asp:ListItem Value="2">Public Listed</asp:ListItem>
                                <asp:ListItem Value="3">PMA</asp:ListItem>
                                <asp:ListItem Value="4">Private Company</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Phone</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCphone" runat="server" DataType="String" DBColumnName="C_PHONE"
                                BindType="Both" SPParameterName="p_c_phone" MaxLength="15" Width="120px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCphone" runat="server" ControlToValidate="txtCphone"
                                ErrorMessage="* Harus Diisi" />
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
                            <cc1:XUITextBox ID="txtCfax" runat="server" DataType="String" DBColumnName="C_FAX"
                                BindType="Both" SPParameterName="p_c_fax" MaxLength="15" Width="120px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Date Corporate</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCodate" runat="server" DataType="DateTime" DBColumnName="C_CODATE"
                                BindType="Both" SPParameterName="p_c_codate" Format="dd/MM/yyyy" MaxLength="10"
                                Width="64px"></cc1:XUITextBox>

                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>SIUP Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCsiupdate" runat="server" DataType="DateTime" DBColumnName="C_SIUPDATE"
                                BindType="Both" SPParameterName="p_c_siupdate" Format="dd/MM/yyyy" MaxLength="10"
                                Width="64px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCsiupdate" runat="server" ControlToValidate="txtCsiupdate"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Listed Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtClistdate" runat="server" DataType="DateTime" DBColumnName="C_LISTDATE"
                                BindType="Both" SPParameterName="p_c_listdate" Format="dd/MM/yyyy" MaxLength="10"
                                Width="64px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Sign 1</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSign1" runat="server" DataType="String" DBColumnName="C_SIGN1"
                                BindType="Both" SPParameterName="p_c_sign1" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Title 1</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTitle1" runat="server" DataType="String" DBColumnName="C_TITLE1"
                                BindType="Both" SPParameterName="p_c_title1" MaxLength="50" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Sign 2</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSign2" runat="server" DataType="String" DBColumnName="C_SIGN2"
                                BindType="Both" SPParameterName="p_c_sign2" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Title 2</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTitle2" runat="server" DataType="String" DBColumnName="C_TITLE2"
                                BindType="Both" SPParameterName="p_c_title2" MaxLength="50" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Sign 3</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSign3" runat="server" DataType="String" DBColumnName="C_SIGN3"
                                BindType="Both" SPParameterName="p_c_sign3" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Title 3</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTitle3" runat="server" DataType="String" DBColumnName="C_TITLE3"
                                BindType="Both" SPParameterName="p_c_title3" MaxLength="50" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>IM in charge</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSign4" runat="server" DataType="String" DBColumnName="C_SIGN4"
                                BindType="Both" SPParameterName="p_c_sign4" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>IM Title</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTitle4" runat="server" DataType="String" DBColumnName="C_TITLE4"
                                BindType="Both" SPParameterName="p_c_title4" MaxLength="50" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>LOD In charge</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSign5" runat="server" DataType="String" DBColumnName="C_SIGN5"
                                BindType="Both" SPParameterName="p_c_sign5" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>LOD Title</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTitle5" runat="server" DataType="String" DBColumnName="C_TITLE5"
                                BindType="Both" SPParameterName="p_c_title5" MaxLength="50" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Insurance In charge</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSign6" runat="server" DataType="String" DBColumnName="C_SIGN6"
                                BindType="Both" SPParameterName="p_c_sign6" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Insurance Title</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTitle6" runat="server" DataType="String" DBColumnName="C_TITLE6"
                                BindType="Both" SPParameterName="p_c_title6" MaxLength="50" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%-- Lookup Direksi--%>
    <asp:Panel ID="pnlPopUpGetDireksi" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetDireksi" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetDireksi" runat="server" BehaviorID="mdlPopupGetDireksi"
            PopupControlID="pnlPopupGetDireksi" TargetControlID="btnShowPopupGetDireksi"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender16" runat="server" TargetControlID="pnlPopUpGetDireksi"
            DragHandleID="pnlPopupGetDireksiHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetDireksiHeader" runat="server" CssClass="header">
                <asp:Label ID="Label15" runat="server" CssClass="msg" Text="Direksi" />
                <asp:LinkButton ID="LinkButton15" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetDireksi').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetDireksi" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchDireksi" runat="server" DefaultButton="btnSearchDireksi">
                            <asp:TextBox ID="txtSearchDireksi" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchDireksi" OnClick="btnSearchDireksi_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListDireksi" runat="server" OnSelectedIndexChanged="gvwListDireksi_SelectedIndexChanged"
                            DataKeyNames="Employee_NIK,Employee_Name" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListDireksi_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListDireksi_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="Employee_NIK" HeaderText="NIK" SortExpression="Employee_NIK" />
                                <asp:BoundField DataField="Employee_Name" HeaderText="Nama Pegawai" SortExpression="Employee_Name" />
                                <asp:BoundField DataField="BranchName" HeaderText="Cabang" SortExpression="BranchName" />
                                <asp:BoundField DataField="DeptName" HeaderText="Departemen" SortExpression="DeptName" />
                                <asp:BoundField DataField="GRADEName" HeaderText="Grade" SortExpression="GRADEName" />
                                <asp:BoundField DataField="Employee_Hp" HeaderText="Hp" SortExpression="Employee_Hp" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose" ControlStyle-ForeColor="RED" ControlStyle-BorderColor="RED"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseDireksi" OnClientClick="$find('mdlPopupGetDireksi').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Direksi--%>
    <%-- Lookup HRD--%>
    <asp:Panel ID="pnlPopUpGetHRD" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetHRD" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetHRD" runat="server" BehaviorID="mdlPopupGetHRD"
            PopupControlID="pnlPopupGetHRD" TargetControlID="btnShowPopupGetHRD"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnlPopUpGetHRD"
            DragHandleID="pnlPopupGetHRDHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetHRDHeader" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="HRD" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetHRD').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetHRD" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchHRD" runat="server" DefaultButton="btnSearchHRD">
                            <asp:TextBox ID="txtSearchHRD" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchHRD" OnClick="btnSearchHRD_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListHRD" runat="server" OnSelectedIndexChanged="gvwListHRD_SelectedIndexChanged"
                            DataKeyNames="Employee_NIK,Employee_Name" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListHRD_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListHRD_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="Employee_NIK" HeaderText="NIK" SortExpression="Employee_NIK" />
                                <asp:BoundField DataField="Employee_Name" HeaderText="Nama Pegawai" SortExpression="Employee_Name" />
                                <asp:BoundField DataField="BranchName" HeaderText="Cabang" SortExpression="BranchName" />
                                <asp:BoundField DataField="DeptName" HeaderText="Departemen" SortExpression="DeptName" />
                                <asp:BoundField DataField="GRADEName" HeaderText="Grade" SortExpression="GRADEName" />
                                <asp:BoundField DataField="Employee_Hp" HeaderText="Hp" SortExpression="Employee_Hp" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose" ControlStyle-ForeColor="RED" ControlStyle-BorderColor="RED"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseHRD" OnClientClick="$find('mdlPopupGetHRD').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup HRD--%>
</asp:Content>
