<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="mstgapokdtl.aspx.cs" Inherits="module_sysadmin_master_mstgapokdtl" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
     <script type="text/javascript" language="javascript">
         function isNumber(evt) {
             evt = (evt) ? evt : window.event;
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if ((charCode >= 48 && charCode <= 57) || charCode == 46 || charCode == 8 || (charCode >= 35 && charCode <= 40)) {
                 return true;
             }
             return false;
         }
      </script>

     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Master Gapok</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100087" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <%--<tr style="display: none">--%>
                    <tr>
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblID" runat="server" DataType="String" DBColumnName="ID"
                                BindType="Both" SPParameterName="p_ID" Text="0"></cc1:XUILabel>
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
                            <cc1:XUITextBox ID="txtKode" runat="server" DataType="String" DBColumnName="KODE"
                                BindType="Both" SPParameterName="p_KODE" MaxLength="10" Width="50px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCKode" runat="server" ControlToValidate="txtKode"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
					 <tr>
                        <td width="20%">
                            <span>Pendidikan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">                           
                            <asp:UpdatePanel ID="updPendidikanInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtKodePendidikan" runat="server" DataType="String" DBColumnName="KODE_JENJANG_PENDIDIKAN"
                                        BindType="Both" SPParameterName="p_KODE_JENJANG_PENDIDIKAN" MaxLength="5" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpPendidikan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpPendidikan_Click" />
                                    <cc1:XUITextBox ID="txtPendidikan_Name" runat="server" DataType="String" DBColumnName="DESKRIPSI_PENDIDIKAN"
                                        BindType="DBToUIOnly" MaxLength="100" Width="330px" ReadOnly="true"></cc1:XUITextBox>
									<asp:RequiredFieldValidator ID="ReqPendidikan_Name" runat="server" ControlToValidate="txtPendidikan_Name"
                                         ErrorMessage="* Harus Diisi" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
					<tr>
                        <td width="20%">
                            <span>Golongan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">                           
                            <asp:UpdatePanel ID="updGolonganInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtKodeGolongan" runat="server" DataType="String" DBColumnName="KODE_JENIS_GOLONGAN"
                                        BindType="Both" SPParameterName="p_KODE_JENIS_GOLONGAN" MaxLength="5" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpGolongan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpGolongan_Click" />
                                    <cc1:XUITextBox ID="txtGolongan_Name" runat="server" DataType="String" DBColumnName="DESKRIPSI_GOLONGAN"
                                        BindType="DBToUIOnly" MaxLength="100" Width="330px" ReadOnly="true"></cc1:XUITextBox>
									<asp:RequiredFieldValidator ID="ReqGolongan_Name" runat="server" ControlToValidate="txtGolongan_Name"
                                         ErrorMessage="* Harus Diisi" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Gapok</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtNominal" runat="server" DataType="String" DBColumnName="NOMINAL" onkeypress="return isNumber(event)"
                                BindType="Both" SPParameterName="p_NOMINAL" MaxLength="20" Width="120px"></cc1:XUITextBox>                          
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Tahun</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTahun" runat="server" DataType="String" DBColumnName="TAHUN" onkeypress="return isNumber(event)"
                                BindType="Both" SPParameterName="p_TAHUN" MaxLength="4" Width="50px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtStatus" runat="server" DataType="String" DBColumnName="STATUS"
                                BindType="Both" SPParameterName="p_STATUS" MaxLength="1" Width="50px"></cc1:XUITextBox>
                        </td>
                    </tr>           
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

     <%-- Lookup Pendidikan--%>
    <asp:Panel ID="pnlPopUpGetPendidikan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetPendidikan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetPendidikan" runat="server" BehaviorID="mdlPopupGetPendidikan"
            PopupControlID="pnlPopUpGetPendidikan" TargetControlID="btnShowPopupGetPendidikan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender16" runat="server" TargetControlID="pnlPopUpGetPendidikan"
            DragHandleID="pnlPopupGetPendidikanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetPendidikanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label15" runat="server" CssClass="msg" Text="Pendidikan" />
                <asp:LinkButton ID="LinkButton15" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetPendidikan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetPendidikan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchPendidikan" runat="server" DefaultButton="btnSearchPendidikan">
                            <asp:TextBox ID="txtSearchPendidikan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchPendidikan" OnClick="btnSearchPendidikan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListPendidikan" runat="server" OnSelectedIndexChanged="gvwListPendidikan_SelectedIndexChanged"
                            DataKeyNames="KODE,DESKRIPSI" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListPendidikan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListPendidikan_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="KODE" HeaderText="Kode" SortExpression="Kode" />
                                <asp:BoundField DataField="DESKRIPSI" HeaderText="Pendidikan" SortExpression="DESKRIPSI" />                                                            
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose" ItemStyle-HorizontalAlign="Center" ControlStyle-ForeColor="RED" ControlStyle-BorderColor="RED"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnClosePendidikan" OnClientClick="$find('mdlPopupGetPendidikan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Pendidikan--%>
	
	 <%-- Lookup Golongan--%>
    <asp:Panel ID="pnlPopUpGetGolongan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetGolongan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetGolongan" runat="server" BehaviorID="mdlPopupGetGolongan"
            PopupControlID="pnlPopUpGetGolongan" TargetControlID="btnShowPopupGetGolongan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnlPopUpGetGolongan"
            DragHandleID="pnlPopupGetGolonganHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetGolonganHeader" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="Golongan" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetGolongan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetGolongan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchGolongan" runat="server" DefaultButton="btnSearchGolongan">
                            <asp:TextBox ID="txtSearchGolongan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchGolongan" OnClick="btnSearchGolongan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListGolongan" runat="server" OnSelectedIndexChanged="gvwListGolongan_SelectedIndexChanged"
                            DataKeyNames="KODE,DESKRIPSI" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListGolongan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListGolongan_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="KODE" HeaderText="Kode" SortExpression="Kode" />
                                <asp:BoundField DataField="DESKRIPSI" HeaderText="Golongan" SortExpression="DESKRIPSI" />                                                            
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose" ControlStyle-ForeColor="RED" ControlStyle-BorderColor="RED"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseGolongan" OnClientClick="$find('mdlPopupGetGolongan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Golongan--%>

</asp:Content>

