<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="mstshiftdtl.aspx.cs" Inherits="module_sysadmin_master_mstshiftdtl" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
     <script type="text/javascript" language="javascript">
         $(document).ready(function () {
                      
         });      
         
              
         function isNumber(evt) {
             evt = (evt) ? evt : window.event;
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if ((charCode >= 48 && charCode <= 57) || charCode == 8 || (charCode >= 35 && charCode <39)) {                
                 return true;
             }
             return false;
         }
      </script>  

     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Master Shift</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100141" />
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
                            <cc1:XUITextBox ID="txtKode" runat="server" DataType="String" DBColumnName="KODE" onkeypress="return isNumber(event)"
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
                                BindType="Both" SPParameterName="p_DESKRIPSI" MaxLength="200" Width="400px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Jam Mulai</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                        <cc1:XUITextBox ID="txtJamMulai" runat="server" DataType="String" DBColumnName="START_TIME" 
                                BindType="Both" SPParameterName="p_START_TIME" Width="50px" Format="HH:mm"
                                Style="text-align: center; vertical-align: middle;" Enabled="true" MaxLength="5"
                                onkeyup="
                                var date = this.value;
                                 if (date.match(/^\d{2}$/) !== null) {
                                     this.value = date + ':';
                                 } else if (date.match(/^\d{2}\:\d{2}$/) !== null) {
                                     this.value = date;
                                 }" 
                                onkeypress="return isNumber(event)">
                            </cc1:XUITextBox>
                             <asp:RequiredFieldValidator ID="ReqtxtJamMulai" runat="server" ControlToValidate="txtJamMulai"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Jam Selesai</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                              <cc1:XUITextBox ID="txtJamSelesai" runat="server" DataType="String" DBColumnName="END_TIME" 
                                BindType="Both" SPParameterName="p_END_TIME" Width="50px" Format="HH:mm"
                                Style="text-align: center; vertical-align: middle;" Enabled="true" MaxLength="5"
                                onkeyup="
                                var date = this.value;
                                 if (date.match(/^\d{2}$/) !== null) {
                                     this.value = date + ':';
                                 } else if (date.match(/^\d{2}\:\d{2}$/) !== null) {
                                     this.value = date;
                                 }" 
                                onkeypress="return isNumber(event)">
                            </cc1:XUITextBox>
                             <asp:RequiredFieldValidator ID="ReqtxtJamSelesai" runat="server" ControlToValidate="txtJamSelesai"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>                               
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

