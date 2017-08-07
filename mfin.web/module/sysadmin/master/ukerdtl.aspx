<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="ukerdtl.aspx.cs" Inherits="module_sysadmin_master_ukerdtl" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Master Unit Kerja</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100075" />
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
                            <span>Nama</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCNama" runat="server" DataType="String" DBColumnName="NAMA"
                                BindType="Both" SPParameterName="p_NAMA" MaxLength="100" Width="120px"></cc1:XUITextBox>
                             <asp:RequiredFieldValidator ID="ReqtxtCNama" runat="server" ControlToValidate="txtCNama"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Alamat</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCAlamat" runat="server" DataType="String" DBColumnName="ALAMAT"
                                BindType="Both" SPParameterName="p_ALAMAT" MaxLength="200" Width="400px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>No.Telepon</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCTelp" runat="server" DataType="String" DBColumnName="TELP"
                                BindType="Both" SPParameterName="p_TELP" MaxLength="20" Width="100px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>No.Fax</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCFax" runat="server" DataType="String" DBColumnName="FAX"
                                BindType="Both" SPParameterName="p_FAX" MaxLength="20" Width="100px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Email</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCEmail" runat="server" DataType="String" DBColumnName="EMAIL"
                                BindType="Both" SPParameterName="p_EMAIL" MaxLength="100" Width="100px"></cc1:XUITextBox>
                        </td>
                    </tr>
                     <tr>
                        <td width="20%">
                            <span>KA Unit</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCKaUnit" runat="server" DataType="String" DBColumnName="KA_UNIT"
                                BindType="Both" SPParameterName="p_KA_UNIT" MaxLength="30" Width="100px"></cc1:XUITextBox>
                        </td>
                    </tr>
                     <tr>
                        <td width="20%">
                            <span>Group</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCGroup" runat="server" DataType="String" DBColumnName="GROUP"
                                BindType="Both" SPParameterName="p_GROUP" MaxLength="1" Width="100px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Kode Majelis</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCKodeMajelis" runat="server" DataType="String" DBColumnName="KODE_MAJELIS"
                                BindType="Both" SPParameterName="p_KODE_MAJELIS" MaxLength="5" Width="100px"></cc1:XUITextBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

