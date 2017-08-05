<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="syscompanybankdetail.aspx.cs" Inherits="module_sysadmin_master_syscompanybankdetail" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
<div>
  <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Banker</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <asp:Button ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" />
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
                            <cc1:XUILabel ID="lblSYSCOMPANYBANKID" runat="server" DataType="Integer" DBColumnName="SYS_COMPANYBANKID"
                                BindType="Both" SPParameterName="p_sys_companybankid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Bank</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="40%">
                          <cc1:XUIDropDownList ID="txtBank" runat="server" DataType="String" DBColumnName="BANK"
                                BindType="Both" SPParameterName="p_bank" MaxLength="4" Width="32px"></cc1:XUIDropDownList>
                        </td>
                        <td width="40%">
                          <cc1:XUILabel ID="lblDescription" runat="server" DataType="String" DBColumnName="DESCRIPTION"
                                BindType="Both" SPParameterName="p_description" MaxLength="30" Width="240px"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Branch</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblDescs" runat="server" DataType="String" DBColumnName="BRANCH"
                                BindType="Both" SPParameterName="p_Address" MaxLength="40" Width="360px"></cc1:XUILabel>
                        </td>
                    </tr>
                     <tr>
                        <td width="20%" rowspan="3" valign="top">
                            <span>Address</span>
                        </td>
                        <td rowspan="3" valign="top">
                            <span>:</span>
                        </td><cc1:XUILabel
                        <td width="80%">
                            <cc1:XUILabel ID="lblAddress1" runat="server" DataType="String" DBColumnName="ADDRESS1"
                                BindType="Both" SPParameterName="p_c_address1" MaxLength="30" Width="240px"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="80%">
                            <cc1:XUILabel ID="lblAddress2" runat="server" DataType="String" DBColumnName="ADDRESS2"
                                BindType="Both" SPParameterName="p_c_address2" MaxLength="30" Width="240px"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="80%">
                            <cc1:XUILabel ID="lblAddress3" runat="server" DataType="String" DBColumnName="ADDRESS3"
                                BindType="Both" SPParameterName="p_c_address2" MaxLength="30" Width="240px"></cc1:XUILabel>
                        </td>
                    </tr>
                     <tr>
                        <td width="20%">
                            <span>Currency</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                          <cc1:XUIDropDownList ID="ddlCurrency" runat="server" DataType="String" DBColumnName="CURRENCY"
                                BindType="Both" SPParameterName="p_currency" MaxLength="4" Width="32px"></cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Account No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                          <cc1:XUITextBox ID="txtCurrency" runat="server" DataType="String" DBColumnName="CURRENCY"
                                BindType="Both" SPParameterName="p_currency" MaxLength="3" Width="24px"></cc1:XUITextBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
</div>
</asp:Content>

