<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="cutidtl.aspx.cs" Inherits="module_transaksi_cutidtl" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {

                var $maintab = $("#pages").tabs();
                jsPopUpDate('ctl00_cphbd_txtSubmissionDate');
                jsPopUpDate('ctl00_cphbd_txtStartDate');
                jsPopUpDate('ctl00_cphbd_txtEndDate');

            });
        }
        //$(document).ready(function () {
        //    var $maintab = $("#pages").tabs();
        //    jsPopUpDate('ctl00_cphbd_txtSubmissionDate');
        //    jsPopUpDate('ctl00_cphbd_txtStartDate');
        //    jsPopUpDate('ctl00_cphbd_txtEndDate');
        //});
    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Cuti</span>
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
                    <tr>
                        <td width="20%">
                            <span>No Cuti</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUILabel ID="lbl_ID" runat="server" DataType="Integer" DBColumnName="ID"
                                BindType="Both" SPParameterName="p_ID" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Pegawai *</span></td>
                        <td><span>:</span></td>
                        <td width="80%" colspan="2">
                            <asp:UpdatePanel ID="updKaryawanInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtNIK" runat="server" DataType="String" DBColumnName="NIK"
                                        BindType="Both" SPParameterName="p_NIK" MaxLength="10" Width="100px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpKaryawan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpKaryawan_Click" />
                                    <cc1:XUITextBox ID="txtNama" runat="server" DataType="String" DBColumnName="NAMA"
                                        BindType="DBToUIOnly" MaxLength="40" Width="200px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Tanggal Pengajuan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtSubmissionDate" runat="server" DataType="DateTime" DBColumnName="SubmissionDate"
                                BindType="Both" SPParameterName="p_SubmissionDate" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;" Enabled="false">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvSubmissionDate" runat="server" ControlToValidate="txtSubmissionDate"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Tanggal Mulai</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtStartDate" runat="server" DataType="DateTime" DBColumnName="StartDate" AutoPostBack="true" OnTextChanged="txtStartDate_TextChanged"
                                BindType="Both" SPParameterName="p_StartDate" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate"
                                ErrorMessage="* Harus diisi" />
                            <cc1:XUICheckBox ID="CheckHAlf" runat="server" Text="Setengah Hari" Visible="false" AutoPostBack="true" OnCheckedChanged="CheckHAlf_CheckedChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Tanggal Akhir</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="20%">
                            <cc1:XUITextBox ID="txtEndDate" runat="server" DataType="DateTime" DBColumnName="EndDate"
                                BindType="Both" SPParameterName="p_EndDate" Width="72px" Format="dd/MM/yyyy" AutoPostBack="true" OnTextChanged="txtEndDate_TextChanged"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate"
                                ErrorMessage="* Harus diisi" />
                        </td>
                        <td width="60%" id="tdHalf" runat="server">
                            <asp:Label ID="lblHalf" runat="server" Visible="false" Text="Tipe Setengah Hari :"></asp:Label>
                            <cc1:XUIDropDownList ID="ddlHalfType" runat="server" DataType="String" DBColumnName="HalfType"
                                BindType="Both" SPParameterName="p_HalfType" Style="min-width: 50px" Visible="false">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">8-12</asp:ListItem>
                                <asp:ListItem Value="2">13-17</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Total Cuti</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">

                            <cc1:XUITextBox ID="txtTotDay" runat="server" DataType="String" DBColumnName="TotDay"
                                BindType="Both" SPParameterName="p_TotDay" MaxLength="2" Width="50px"></cc1:XUITextBox>
                            hari
                               
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Deskripsi</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtDescription" runat="server" DataType="String" DBColumnName="Description"
                                BindType="Both" SPParameterName="p_Description" MaxLength="200" Width="350px" Height="50px" TextMode="MultiLine"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Pengganti</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtpj_pengganti" runat="server" DataType="String" DBColumnName="pj_pengganti"
                                BindType="Both" SPParameterName="p_pj_pengganti" MaxLength="50" Width="150px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td width="20%">
                            <span>Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUIDropDownList ID="ddlStatus" runat="server" DataType="String" DBColumnName="Status"
                                BindType="Both" SPParameterName="p_Status" Style="min-width: 250px">
                                <asp:ListItem Value="0">Draft</asp:ListItem>
                                <asp:ListItem Value="1">Approve</asp:ListItem>
                                <asp:ListItem Value="2">Reject</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>

        </asp:UpdatePanel>
    </div>
    <%-- Lookup Karyawan--%>
    <asp:Panel ID="pnlPopUpGetKaryawan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetKaryawan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetKaryawan" runat="server" BehaviorID="mdlPopupGetKaryawan"
            PopupControlID="pnlPopupGetKaryawan" TargetControlID="btnShowPopupGetKaryawan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender3" runat="server" TargetControlID="pnlPopUpGetKaryawan"
            DragHandleID="pnlPopupGetKaryawanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetKaryawanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label2" runat="server" CssClass="msg" Text="Karyawan" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetKaryawan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetKaryawan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchKaryawan" runat="server" DefaultButton="btnSearchKaryawan">
                            <asp:TextBox ID="txtSearchKaryawan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchKaryawan" OnClick="btnSearchKaryawan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListKaryawan" runat="server" OnSelectedIndexChanged="gvwListKaryawan_SelectedIndexChanged"
                            DataKeyNames="NIK,NAMA,NAMA_UNIT_KERJA" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListKaryawan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListKaryawan_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="NIK" HeaderText="NIK" />
                                <asp:BoundField DataField="NAMA" HeaderText="NAMA" />
                                <asp:BoundField DataField="NAMA_UNIT_KERJA" HeaderText="NAMA_UNIT_KERJA" />
                                <asp:BoundField DataField="Quota" HeaderText="Kuota" SortExpression="Quota" />
                                <asp:BoundField DataField="Used" HeaderText="Terpakai" SortExpression="Used" />
                                <asp:BoundField DataField="Balance" HeaderText="Sisa" SortExpression="Balance" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseKaryawan" OnClientClick="$find('mdlPopupGetKaryawan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Karyawan--%>
</asp:Content>

