<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="jenpekerjaandtl.aspx.cs" Inherits="module_data_jenpekerjaandtl" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Jenis Pekerjaan</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100033" />
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
                            <cc1:XUILabel ID="lblid" runat="server" DataType="String" DBColumnName="id"
                                BindType="Both" SPParameterName="p_id" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>                    
                    <tr>
                        <td width="20%">
                            <span>Kode Pekerjaan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtkode" runat="server" DataType="String" DBColumnName="kode"
                                BindType="Both" SPParameterName="p_kode" MaxLength="50" Width="200px"></cc1:XUITextBox>
                             <asp:RequiredFieldValidator ID="reqtxtkode" runat="server" ControlToValidate="txtkode"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Jenis Pekerjaan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtdeskripsi" runat="server" DataType="String" DBColumnName="deskripsi"
                                BindType="Both" SPParameterName="p_deskripsi" MaxLength="50" Width="200px"></cc1:XUITextBox>
                             <asp:RequiredFieldValidator ID="Reqtxtdeskripsi" runat="server" ControlToValidate="txtdeskripsi"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

