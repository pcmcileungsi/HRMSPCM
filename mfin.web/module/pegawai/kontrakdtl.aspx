<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="kontrakdtl.aspx.cs" Inherits="module_pegawai_kontrakdtl" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
	  <script type="text/javascript" language="javascript">
        $(document).ready(function () {            
            jsPopUpDate('ctl00_cphbd_txtTglAwalKontrak');
            jsPopUpDate('ctl00_cphbd_txtTglAkhirKontrak');
            
        });
        function UploadFile() {
            var nama = document.getElementById('<%=upfile.ClientID %>');
            document.getElementById('<%=txtDocName.ClientID %>').value = nama.files.item(0).name;
       }
        function onBrowse() {
            document.getElementById('<%=upfile.ClientID %>').click();
        }       
      </script>  
	  
     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data HR Kontrak</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                   <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100123" />
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
                                BindType="Both" SPParameterName="p_KODE" MaxLength="5" Width="50px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCKode" runat="server" ControlToValidate="txtKode"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Deskripsi</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtDesc" runat="server" DataType="String" DBColumnName="DESKRIPSI"
                                BindType="Both" SPParameterName="p_DESKRIPSI" MaxLength="100" Width="250px"></cc1:XUITextBox>                           
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Tanggal Mulai</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                           <cc1:XUITextBox ID="txtTglAwalKontrak" runat="server" DataType="DateTime" DBColumnName="TANGGAL_MULAI_KONTRAK" 
                                BindType="Both" SPParameterName="p_TANGGAL_MULAI_KONTRAK" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;" Enabled="true">
                            </cc1:XUITextBox>
                             <asp:RequiredFieldValidator ID="ReqtxtAwalKontrak" runat="server" ControlToValidate="txtTglAwalKontrak"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                             <span>Tanggal Akhir</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                             <cc1:XUITextBox ID="txtTglAkhirKontrak" runat="server" DataType="DateTime" DBColumnName="TANGGAL_AKHIR_KONTRAK"
                                BindType="Both" SPParameterName="p_TANGGAL_AKHIR_KONTRAK" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;" Enabled="true">
                             </cc1:XUITextBox>
                             <asp:RequiredFieldValidator ID="ReqtxtAkhirKontrak" runat="server" ControlToValidate="txtTglAkhirKontrak"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
					<tr>
                        <td width="20%">
                            <span>Pegawai</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">                           
                            <asp:UpdatePanel ID="updPegInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtPeg" runat="server" DataType="String" DBColumnName="KODE_PEGAWAI"
                                        BindType="Both" SPParameterName="p_KODE_PEGAWAI" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpPeg" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpPeg_Click" />
                                    <cc1:XUITextBox ID="txtPeg_Name" runat="server" DataType="String" DBColumnName="NAMA_PEGAWAI"
                                        BindType="DBToUIOnly" MaxLength="100" Width="200px" ReadOnly="true"></cc1:XUITextBox>
									<asp:RequiredFieldValidator ID="ReqPeg_Name" runat="server" ControlToValidate="txtPeg_Name"
                                         ErrorMessage="* Harus Diisi" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Unit Kerja</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                               <cc1:XUIDropDownList ID="ddlUnitKerja" runat="server" DataType="String" DBColumnName="KODE_UNIT_KERJA"
                                BindType="Both" SPParameterName="p_KODE_UNIT_KERJA" Style="min-width: 250px">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Posisi</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlPosisi" runat="server" DataType="String" DBColumnName="KODE_POSISI"
                                BindType="Both" SPParameterName="p_KODE_POSISI" Style="min-width: 250px">
                            </cc1:XUIDropDownList>
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
                            <cc1:XUIDropDownList ID="ddlJabatan" runat="server" DataType="String" DBColumnName="KODE_MST_JABATAN"
                                BindType="Both" SPParameterName="p_KODE_MST_JABATAN" Style="min-width: 250px">
                            </cc1:XUIDropDownList>
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
                            <cc1:XUICheckBox ID="cbStatus" runat="server" DataType="String">
                            </cc1:XUICheckBox>                           
                        </td>
                    </tr>
                     <tr>
                        <td width="20%">
                            <span>Dokumen</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">  
                                <button type="button" onclick="onBrowse()">Browse</button>   
                                <cc1:XUITextBox ID="txtDocName" runat="server" DataType="String" DBColumnName="DOKUMEN_NAME" 
                                BindType="Both" SPParameterName="p_DOKUMEN_NAME" Width="200px"></cc1:XUITextBox>                                                                                            
                                <input id="upfile" type="file" runat="server" name="upfile" style="display: none" onchange="UploadFile()" />                                                                              						   
                        </td>
                    </tr>                   
                </table>
            </ContentTemplate>
            <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />         
        </Triggers>
        </asp:UpdatePanel>
    </div> 
	
	<%-- Lookup Pegawai--%>
    <asp:Panel ID="pnlPopUpGetPeg" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetPeg" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetPeg" runat="server" BehaviorID="mdlPopupGetPeg"
            PopupControlID="pnlPopUpGetPeg" TargetControlID="btnShowPopupGetPeg"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender3" runat="server" TargetControlID="pnlPopUpGetPeg"
            DragHandleID="pnlPopupGetPegHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetPegHeader" runat="server" CssClass="header">
                <asp:Label ID="Label3" runat="server" CssClass="msg" Text="Pegawai" />
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetPeg').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetPeg" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchPeg" runat="server" DefaultButton="btnSearchPeg">
                            <asp:TextBox ID="txtSearchPeg" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchPeg" OnClick="btnSearchPeg_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListPeg" runat="server" OnSelectedIndexChanged="gvwListPeg_SelectedIndexChanged"
                            DataKeyNames="NIK,NAMA" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListPeg_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListPeg_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="NIK" HeaderText="Nik" SortExpression="Nik" />
                                <asp:BoundField DataField="NAMA" HeaderText="Nama" SortExpression="Nama" />                                                            
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose" ControlStyle-ForeColor="RED" ControlStyle-BorderColor="RED"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseStatusPeg" OnClientClick="$find('mdlPopupGetPeg').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Pegawai--%> 

</asp:Content>

