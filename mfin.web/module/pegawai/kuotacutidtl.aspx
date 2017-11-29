<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="kuotacutidtl.aspx.cs" Inherits="module_master_lstblleavedetail" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {

                var $maintab = $("#pages").tabs();
                jsPopUpDate('ctl00_cphbd_txtSTART_DATE');
                jsPopUpDate('ctl00_cphbd_txtEND_DATE');

            });
        }
    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Kuota Cuti Detail</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100057" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr>
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblID" runat="server" DataType="Integer" DBColumnName="ID"
                                BindType="Both" SPParameterName="p_id" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Pegawai *</span></td>
                        <td><span>:</span></td>
                        <td width="80%">
                            <asp:UpdatePanel ID="updKaryawanInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtNIK" runat="server" DataType="String" DBColumnName="NIK"
                                        BindType="Both" SPParameterName="p_NIK" MaxLength="10" Width="100px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpKaryawan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpKaryawan_Click" />
                                    <cc1:XUITextBox ID="txtNAMA" runat="server" DataType="String" DBColumnName="NAMA"
                                        BindType="DBToUIOnly" MaxLength="40" Width="300px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40px">Start Date *</td>
                        <td>
                            <span>:</span>
                        </td>
                        <td>
                            <cc1:XUITextBox ID="txtSTART_DATE" runat="server" DataType="DateTime" DBColumnName="START_DATE" AutoPostBack="true" OnTextChanged="txtSTART_DATE_TextChanged"
                                BindType="Both" SPParameterName="p_START_DATE" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvSTART_DATE" runat="server" ControlToValidate="txtSTART_DATE"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 40px">End Date *</td>
                        <td>
                            <span>:</span>
                        </td>
                        <td>
                            <cc1:XUITextBox ID="txtEND_DATE" runat="server" DataType="DateTime" DBColumnName="END_DATE" AutoPostBack="true" OnTextChanged="txtEND_DATE_TextChanged"
                                BindType="Both" SPParameterName="p_END_DATE" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvEND_DATE" runat="server" ControlToValidate="txtEND_DATE"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Quota (Hari)*</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtQuota" runat="server" DataType="String" DBColumnName="Quota"
                                BindType="Both" SPParameterName="p_quota" MaxLength="3" Width="50px">0</cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqQuota" runat="server" ControlToValidate="txtQuota"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td>
                            <cc1:XUIDropDownList ID="ddlStatus" runat="server" CssClass="DropDownList" Width="40%" DataType="String" DBColumnName="STATUS"
                                BindType="Both" SPParameterName="p_STATUS">
                                <asp:ListItem Value="Y" Text="Aktif"></asp:ListItem>
                                <asp:ListItem Value="N" Text="Tidak Aktif"></asp:ListItem>
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
                                <asp:BoundField DataField="NIK" HeaderText="NIK">
                                    <ItemStyle Width="20%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NAMA" HeaderText="NAMA">
                                    <ItemStyle Width="40%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NAMA_UNIT_KERJA" HeaderText="UNIT KERJA">
                                    <ItemStyle Width="40%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
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

