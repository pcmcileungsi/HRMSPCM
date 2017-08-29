<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="msttunjangandtl.aspx.cs" Inherits="module_sysadmin_master_msttunjangandtl" %>
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
                    <span class="search-header">Data Master Tunjangan</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100099" />
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
                            <asp:UpdatePanel ID="updTunjanganInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtCKodeTunjangan" runat="server" DataType="String" DBColumnName="KODE_JENIS_TUNJANGAN"
                                        BindType="Both" SPParameterName="p_KODE_JENIS_TUNJANGAN" MaxLength="5" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpTunjangan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpTunjangan_Click" />
                                    <cc1:XUITextBox ID="txtTunjangan_Name" runat="server" DataType="String" DBColumnName="DESKRIPSI"
                                        BindType="DBToUIOnly" MaxLength="100" Width="330px" ReadOnly="true"></cc1:XUITextBox>
									 <asp:RequiredFieldValidator ID="ReqTunjangan" runat="server" ControlToValidate="txtTunjangan_Name"
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
                            <cc1:XUITextBox ID="txtCNominal" runat="server" DataType="String" DBColumnName="NOMINAL" style="text-align:right"
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

     <%-- Lookup Tunjangan--%>
    <asp:Panel ID="pnlPopUpGetTunjangan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetTunjangan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetTunjangan" runat="server" BehaviorID="mdlPopupGetTunjangan"
            PopupControlID="pnlPopUpGetTunjangan" TargetControlID="btnShowPopupGetTunjangan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender16" runat="server" TargetControlID="pnlPopUpGetTunjangan"
            DragHandleID="pnlPopupGetTunjanganHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetTunjanganHeader" runat="server" CssClass="header">
                <asp:Label ID="Label15" runat="server" CssClass="msg" Text="Tunjangan" />
                <asp:LinkButton ID="LinkButton15" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetTunjangan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetTunjangan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchTunjangan" runat="server" DefaultButton="btnSearchTunjangan">
                            <asp:TextBox ID="txtSearchTunjangan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchTunjangan" OnClick="btnSearchTunjangan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListTunjangan" runat="server" OnSelectedIndexChanged="gvwListTunjangan_SelectedIndexChanged"
                            DataKeyNames="KODE,DESKRIPSI" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListTunjangan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListTunjangan_PageIndexChanging" CssClass="mGrid"
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
                        <asp:Button ID="btnCloseTunjangan" OnClientClick="$find('mdlPopupGetTunjangan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Tunjangan--%>

</asp:Content>

