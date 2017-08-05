<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="lstblbranchdetail.aspx.cs" Inherits="module_master_lstblbranchdetail" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Master Branch</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B000504" />
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
                            <cc1:XUILabel ID="lblBRANCH" runat="server" DataType="Integer" DBColumnName="LS_TBLBRANCHID"
                                BindType="Both" SPParameterName="p_ls_tblbranchid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Branch Code</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCcode" runat="server" DataType="String" DBColumnName="BranchCode"
                                BindType="Both" SPParameterName="p_branch_code" MaxLength="5" Width="50px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCcode" runat="server" ControlToValidate="txtCcode"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Branch Name</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCname" runat="server" DataType="String" DBColumnName="BranchName"
                                BindType="Both" SPParameterName="p_branch_name" MaxLength="50" Width="120px"></cc1:XUITextBox>
                             <asp:RequiredFieldValidator ID="ReqtxtCname" runat="server" ControlToValidate="txtCname"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Branch Address</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCaddress" runat="server" DataType="String" DBColumnName="BranchAddress"
                                BindType="Both" SPParameterName="p_branch_address" MaxLength="200" Width="400px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Branch Phone</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCphone" runat="server" DataType="String" DBColumnName="BranchPhone"
                                BindType="Both" SPParameterName="p_branch_phone" MaxLength="30" Width="100px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Branch Fax</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCfax" runat="server" DataType="String" DBColumnName="BranchFax"
                                BindType="Both" SPParameterName="p_branch_fax" MaxLength="30" Width="100px"></cc1:XUITextBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

