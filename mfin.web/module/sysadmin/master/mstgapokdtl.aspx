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

         function chop(value) {
             return value.substr(1);
         }

         function hapus(id, value) {
             if (value == "0") {
                 id.value = "";
                 return 0;
             }
         }

         function muncul(id, value) {
             if (value == "") {
                 id.value = "0";
                 return 0;
             }
         }

         function detectComma(lvalue, lfield) {
             if (lvalue.length > 1) {
                 var temp = removeComma(lvalue);
                 if (temp.substr(0, 1) == "0" || temp.substr(0, 1) == ",") {
                     var temp2 = chop(temp);
                     detectComma(temp2, lfield);
                 }
                 else {
                     lfield.value = putComma(temp);
                 }
             }
             else {
                 lfield.value = putComma(lvalue);
             }
         }

         function putComma(in_fld) {
             var t = 0;
             var o_fld = "";
             var w_fld = "";

             min_sign = minus_sign(in_fld)
             period_fld = removeperiod(in_fld)
             in_fld = removeComma2(in_fld)

             t = in_fld.length;
             for (t; t > 3; (t = t - 3)) {
                 w_fld = "," + in_fld.substring(t - 3, t);
                 o_fld = w_fld + o_fld;
             }
             w_fld = in_fld.substring(0, t);
             o_fld = min_sign + w_fld + o_fld + period_fld;

             in_fld = o_fld;
             return (o_fld);
         }

         function minus_sign(in_fld) {
             var w_fld = "";
             var o_fld = "";

             w_fld = in_fld.substring(0, 1);
             if (w_fld == "-") {
                 o_fld = "-"
             }
             return (o_fld);
         }

         function removeperiod(in_fld) {
             var t = 0;
             t = in_fld.length;
             var o_fld = "";
             var w_fld = "";
             var trig = 0;
             for (var i = 0; i < t; i++) {
                 w_fld = in_fld.substring(i, i + 1);
                 if ((w_fld >= "0" && w_fld <= "9" && trig == 1) || (w_fld == "." && trig == 0)) {
                     o_fld = o_fld + w_fld;
                     if (w_fld == ".") trig = 1;
                 }
             }
             return (o_fld);
         }

         function removeComma2(in_fld) {
             var t = 0;
             t = in_fld.length;
             var o_fld = "";
             var w_fld = "";
             var trig = 0;
             for (var i = 0; i < t; i++) {
                 w_fld = in_fld.substring(i, i + 1);
                 if ((w_fld >= "0" && w_fld <= "9" && trig == 0) || (w_fld == "." && trig == 0)) {
                     if (w_fld == ".") {
                         trig = 1;
                     } else o_fld = o_fld + w_fld;
                 }
             }
             return (o_fld);
         }       
         function removeComma(in_fld) {
             var t = 0;
             t = in_fld.length;
             var o_fld = "";
             var w_fld = "";

             for (var i = 0; i < t; i++) {
                 w_fld = in_fld.substring(i, i + 1);
                 if ((w_fld >= "0" && w_fld <= "9") || (w_fld == ".")) {
                     o_fld = o_fld + w_fld;
                 }
             }
             return (o_fld);
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
                                        BindType="DBToUIOnly" MaxLength="100" Width="100px" ReadOnly="true"></cc1:XUITextBox>
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
                                        BindType="DBToUIOnly" MaxLength="100" Width="100px" ReadOnly="true"></cc1:XUITextBox>
									<asp:RequiredFieldValidator ID="ReqGolongan_Name" runat="server" ControlToValidate="txtGolongan_Name"
                                         ErrorMessage="* Harus Diisi" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
					<tr>
                        <td width="20%">
                            <span>Masa Kerja</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">                           
                            <asp:UpdatePanel ID="updMasaKerjaInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtMasakerja" runat="server" DataType="String" DBColumnName="KODE_MASA_KERJA"
                                        BindType="Both" SPParameterName="p_KODE_MASA_KERJA" MaxLength="5" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpMasaKerja" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpMasaKerja_Click" />
                                    <cc1:XUITextBox ID="txtMasaKerja_Name" runat="server" DataType="String" DBColumnName="DESKRIPSI_MASAKERJA"
                                        BindType="DBToUIOnly" MaxLength="100" Width="100px" ReadOnly="true"></cc1:XUITextBox>
									<asp:RequiredFieldValidator ID="ReqMasaKerja_Name" runat="server" ControlToValidate="txtMasaKerja_Name"
                                         ErrorMessage="* Harus Diisi" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
					<tr>
                        <td width="20%">
                            <span>Status Pegawai</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">                           
                            <asp:UpdatePanel ID="updStatusPegInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtStatusPeg" runat="server" DataType="String" DBColumnName="KODE_STATUS_PEGAWAI"
                                        BindType="Both" SPParameterName="p_KODE_STATUS_PEGAWAI" MaxLength="5" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpStatusPeg" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpStatusPeg_Click" />
                                    <cc1:XUITextBox ID="txtStatusPeg_Name" runat="server" DataType="String" DBColumnName="DESKRIPSI_STATUSPEGAWAI"
                                        BindType="DBToUIOnly" MaxLength="100" Width="100px" ReadOnly="true"></cc1:XUITextBox>
									<asp:RequiredFieldValidator ID="ReqStatusPeg_Name" runat="server" ControlToValidate="txtStatusPeg_Name"
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
                            <cc1:XUITextBox ID="txtNominal" runat="server" DataType="String" DBColumnName="NOMINAL" style="text-align:right"
                                BindType="Both" SPParameterName="p_NOMINAL" MaxLength="20" Width="120px"
                                 onkeypress="javascript:hapus(this,this.value);" onblur="if (this.value){this.onchange();} javascript:muncul(this,this.value);"
                                 onkeyup="javascript:detectComma(this.value,this);"></cc1:XUITextBox>                          
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
                            <%--<cc1:XUITextBox ID="txtStatus" runat="server" DataType="String" DBColumnName="STATUS"
                                BindType="Both" SPParameterName="p_STATUS" MaxLength="1" Width="50px"></cc1:XUITextBox>--%>
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
	
	<%-- Lookup MasaKerja--%>
    <asp:Panel ID="pnlPopUpGetMasaKerja" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetMasaKerja" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetMasaKerja" runat="server" BehaviorID="mdlPopupGetMasaKerja"
            PopupControlID="pnlPopUpGetMasaKerja" TargetControlID="btnShowPopupGetMasaKerja"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender2" runat="server" TargetControlID="pnlPopUpGetMasaKerja"
            DragHandleID="pnlPopupGetMasaKerjaHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetMasaKerjaHeader" runat="server" CssClass="header">
                <asp:Label ID="Label2" runat="server" CssClass="msg" Text="Masa Kerja" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetMasaKerja').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetMasaKerja" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchMasaKerja" runat="server" DefaultButton="btnSearchMasaKerja">
                            <asp:TextBox ID="txtSearchMasaKerja" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchMasaKerja" OnClick="btnSearchMasaKerja_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListMasaKerja" runat="server" OnSelectedIndexChanged="gvwListMasaKerja_SelectedIndexChanged"
                            DataKeyNames="KODE,DESKRIPSI" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListMasaKerja_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListMasaKerja_PageIndexChanging" CssClass="mGrid"
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
                        <asp:Button ID="btnCloseMasaKerja" OnClientClick="$find('mdlPopupGetMasaKerja').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup MasaKerja--%>
	
	<%-- Lookup StatusPegawai--%>
    <asp:Panel ID="pnlPopUpGetStatusPeg" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetStatusPeg" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetStatusPeg" runat="server" BehaviorID="mdlPopupGetStatusPeg"
            PopupControlID="pnlPopUpGetStatusPeg" TargetControlID="btnShowPopupGetStatusPeg"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender3" runat="server" TargetControlID="pnlPopUpGetStatusPeg"
            DragHandleID="pnlPopupGetStatusPegHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetStatusPegHeader" runat="server" CssClass="header">
                <asp:Label ID="Label3" runat="server" CssClass="msg" Text="Status Pegawai" />
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetStatusPeg').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetStatusPeg" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchStatusPeg" runat="server" DefaultButton="btnSearchStatusPeg">
                            <asp:TextBox ID="txtSearchStatusPeg" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchStatusPeg" OnClick="btnSearchStatusPeg_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListStatusPeg" runat="server" OnSelectedIndexChanged="gvwListStatusPeg_SelectedIndexChanged"
                            DataKeyNames="KODE,DESKRIPSI" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListStatusPeg_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListStatusPeg_PageIndexChanging" CssClass="mGrid"
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
                        <asp:Button ID="btnCloseStatusPeg" OnClientClick="$find('mdlPopupGetStatusPeg').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup StatusPegawai--%>

</asp:Content>

