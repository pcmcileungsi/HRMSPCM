﻿<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="msttunjanganjabdtl.aspx.cs" Inherits="module_sysadmin_master_msttunjanganjabdtl" %>
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
                    <span class="search-header">Data Master Tunjangan Jabatan</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100105" />
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
                            <cc1:XUITextBox ID="txtCKode" runat="server" DataType="String" DBColumnName="KODE"
                                BindType="Both" SPParameterName="p_KODE" MaxLength="5" Width="50px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCKode" runat="server" ControlToValidate="txtCKode"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
					 <tr>
                        <td width="20%">
                            <span>Tunjangan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">                           
                            <asp:UpdatePanel ID="updTunjanganJabInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtCKodeTunjanganJab" runat="server" DataType="String" DBColumnName="KODE_JENIS_TUNJANGAN"
                                        BindType="Both" SPParameterName="p_KODE_JENIS_TUNJANGAN" MaxLength="5" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpTunjanganJab" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpTunjanganJab_Click" />
                                    <cc1:XUITextBox ID="txtTunjanganJab_Name" runat="server" DataType="String" DBColumnName="DESKRIPSI_TUNJANGAN"
                                        BindType="DBToUIOnly" MaxLength="100" Width="330px" ReadOnly="true"></cc1:XUITextBox>
									 <asp:RequiredFieldValidator ID="ReqTunjanganJab" runat="server" ControlToValidate="txtTunjanganJab_Name"
                                          ErrorMessage="* Harus Diisi" /> 	
                                </ContentTemplate>
                            </asp:UpdatePanel>
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
                            <asp:UpdatePanel ID="updJabatanInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtKodeJabatan" runat="server" DataType="String" DBColumnName="KODE_MASTER_JABATAN"
                                        BindType="Both" SPParameterName="p_KODE_MASTER_JABATAN" MaxLength="5" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpJabatan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpJabatan_Click" />
                                    <cc1:XUITextBox ID="txtJabatan_Name" runat="server" DataType="String" DBColumnName="DESKRIPSI_JABATAN"
                                        BindType="DBToUIOnly" MaxLength="100" Width="330px" ReadOnly="true"></cc1:XUITextBox>
									 <asp:RequiredFieldValidator ID="ReqJabatan" runat="server" ControlToValidate="txtJabatan_Name"
                                          ErrorMessage="* Harus Diisi" /> 	
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Nominal</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCNominal" runat="server" DataType="String" DBColumnName="NOMINAL" onkeypress="return isNumber(event)"
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
                                BindType="Both" SPParameterName="p_TAHUN" MaxLength="4" Width="100px"></cc1:XUITextBox>
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
                            <cc1:XUIRadioButtonList ID="rbStatus" runat="server" DataType="String" DBColumnName="STATUS"
                                BindType="Both" SPParameterName="p_STATUS" RepeatDirection="Horizontal" RepeatLayout="Flow">                                
                                <asp:ListItem Value="1" Selected="True">Aktif</asp:ListItem>
                                <asp:ListItem Value="0">Tidak Aktif</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>					
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

     <%-- Lookup Tunjangan Jabatan--%>
    <asp:Panel ID="pnlPopUpGetTunjanganJab" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetTunjanganJab" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetTunjanganJab" runat="server" BehaviorID="mdlPopupGetTunjanganJab"
            PopupControlID="pnlPopUpGetTunjanganJab" TargetControlID="btnShowPopupGetTunjanganJab"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender16" runat="server" TargetControlID="pnlPopUpGetTunjanganJab"
            DragHandleID="pnlPopupGetTunjanganJabHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetTunjanganJabHeader" runat="server" CssClass="header">
                <asp:Label ID="Label15" runat="server" CssClass="msg" Text="Majelis" />
                <asp:LinkButton ID="LinkButton15" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetTunjanganJab').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetTunjanganJab" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchTunjanganJab" runat="server" DefaultButton="btnSearchTunjanganJab">
                            <asp:TextBox ID="txtSearchTunjanganJab" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchTunjanganJab" OnClick="btnSearchTunjanganJab_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListTunjanganJab" runat="server" OnSelectedIndexChanged="gvwListTunjanganJab_SelectedIndexChanged"
                            DataKeyNames="KODE,DESKRIPSI" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListTunjanganJab_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListTunjanganJab_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="DESKRIPSI" HeaderText="TUNJANGAN" SortExpression="DESKRIPSI" />                                                             
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose" ControlStyle-ForeColor="RED" ControlStyle-BorderColor="RED"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseTunjanganJab" OnClientClick="$find('mdlPopupGetTunjanganJab').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Tunjangan Jabatan--%>
	
		 <%-- Lookup Jabatan--%>
    <asp:Panel ID="pnlPopUpGetJabatan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetJabatan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetJabatan" runat="server" BehaviorID="mdlPopupGetJabatan"
            PopupControlID="pnlPopUpGetJabatan" TargetControlID="btnShowPopupGetJabatan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnlPopUpGetJabatan"
            DragHandleID="pnlPopupGetJabatanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetJabatanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="Jabatan" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetJabatan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetJabatan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchJabatan" runat="server" DefaultButton="btnSearchJabatan">
                            <asp:TextBox ID="txtSearchJabatan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchJabatan" OnClick="btnSearchJabatan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListJabatan" runat="server" OnSelectedIndexChanged="gvwListJabatan_SelectedIndexChanged"
                            DataKeyNames="KODE,DESKRIPSI" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListJabatan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListJabatan_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="DESKRIPSI" HeaderText="Jabatan" SortExpression="DESKRIPSI" />                                                            
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose" ControlStyle-ForeColor="RED" ControlStyle-BorderColor="RED"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseJabatan" OnClientClick="$find('mdlPopupGetJabatan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Jabatan--%>

</asp:Content>

