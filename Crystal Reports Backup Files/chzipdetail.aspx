<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="chzipdetail.aspx.cs"
    Inherits="module_channelling_transaction_chzipdetail" Title="Untitled Page" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data ZIP</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B200030" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr style="display: none">
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblSYSZIPID" runat="server" DataType="Integer" DBColumnName="SYS_ZIPID"
                                BindType="Both" SPParameterName="p_sys_zipid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Kota</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtKota" runat="server" DataType="String" DBColumnName="KOTA"
                                BindType="Both" SPParameterName="p_kota" MaxLength="30" Width="240px" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtKota"
                                ErrorMessage="* Field cannot be blank" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Kecamatan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtKecamatan" runat="server" DataType="String" DBColumnName="KECAMATAN"
                                BindType="Both" SPParameterName="p_kecamatan" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Kelurahan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtKelurahan" runat="server" DataType="String" DBColumnName="KELURAHAN"
                                BindType="Both" SPParameterName="p_kelurahan" MaxLength="30" Width="240px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Kode Pos</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtKodePos" runat="server" DataType="String" DBColumnName="KODEPOS"
                                BindType="Both" SPParameterName="p_kodepos" MaxLength="5" Width="40px" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtKodePos" 
                                ErrorMessage="* Field cannot be blank" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
