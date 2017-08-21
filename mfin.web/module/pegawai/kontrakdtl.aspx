<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="kontrakdtl.aspx.cs" Inherits="module_pegawai_kontrakdtl" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
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
                                BindType="Both" SPParameterName="p_DESKRIPSI" MaxLength="100" Width="50px"></cc1:XUITextBox>                           
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

</asp:Content>

