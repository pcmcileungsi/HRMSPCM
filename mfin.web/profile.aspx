<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="profile.aspx.cs"
    Inherits="profile" Title="Untitled Page" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

    <script type="text/javascript">
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            $("#subpages-0").tabs();
            $("#subpages-1").tabs();
        });
    </script>

    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Change Password</span>
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click"
                        RoleCode="" />
                </td>
            </tr>
        </table>
        <div id="pages" style="margin: 5px 3px">
            <ul style="font-size: smaller">
                <li><a href="#page-0"><span>Change Password</span></a></li>
            </ul>
            <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow-y: auto">
                <asp:UpdatePanel ID="pnlBody" runat="server">
                    <ContentTemplate>
                        <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td width="20%">
                                    <span>Old Password Login</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtOldPassword" runat="server" DataType="String" DBColumnName="OLD_PASSWORD"
                                        BindType="Both" SPParameterName="p_old_password" MaxLength="20" Width="160px" TextMode="Password"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Password Login</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtUSER_PASSWORD" runat="server" DataType="String" DBColumnName="USER_PASSWORD"
                                        BindType="Both" SPParameterName="p_user_password" MaxLength="20" Width="160px"
                                        TextMode="Password"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Password Approval</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtPasswordApproval" runat="server" DataType="String" DBColumnName="PASSWORD_APPROVAL"
                                        BindType="Both" SPParameterName="p_password_approval" MaxLength="20" Width="160px"
                                        TextMode="Password"></cc1:XUITextBox>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
