<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="userdetail.aspx.cs" Inherits="module_sysadmin_userdetail" Title="Untitled Page" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

    <script type="text/javascript">
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
            $("#subpages-0").tabs();
            $("#subpages-1").tabs();
        });
    </script>

    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">User Manager</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100003" />
                </td>
            </tr>

        </table>
        <div id="pages" style="margin: 5px 3px">
            <ul style="font-size: smaller">
                <li><a href="#page-0"><span>Info</span></a></li>
                <li><a href="#page-1"><span>User Role</span></a></li>
            </ul>
            <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
                <asp:UpdatePanel ID="pnlBody" runat="server">
                    <ContentTemplate>
                        <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td width="20%">
                                    <span>User ID</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtUSER_ID" runat="server" DataType="String" DBColumnName="USER_ID"
                                        BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Name</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtUserName" runat="server" DataType="String" DBColumnName="USER_NAME"
                                        BindType="Both" SPParameterName="p_user_name" MaxLength="50" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td width="20%">
                                    <span>Password</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtUSER_PASSWORD" runat="server" DataType="String" DBColumnName="USER_PASSWORD"
                                        BindType="Both" SPParameterName="p_user_password" MaxLength="20" Width="160px" TextMode="Password"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td width="20%">
                                    <span>Password Approval</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtPasswordApproval" runat="server" DataType="String" DBColumnName="PASSWORD_APPROVAL"
                                        BindType="Both" SPParameterName="p_password_approval" MaxLength="20" Width="160px" TextMode="Password"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Role</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUIDropDownList ID="ddlROLE" runat="server" DataType="String" DBColumnName="ROLE"
                                        BindType="Both" SPParameterName="p_ROLE" Width="160px">
                                        <asp:ListItem Value="1">User</asp:ListItem>
                                        <asp:ListItem Value="2">Administrator</asp:ListItem>
                                    </cc1:XUIDropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Active</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <asp:CheckBox ID="chkIsActive" runat="server" />
                                </td>
                            </tr>

                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
                <table cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr>
                        <td>
                            <cc1:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B100002" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="USER_ID, ID"
                            OnSelectedIndexChanged="gvwList_SelectedIndexChanged" EmptyDataText="There is no data."
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
                            OnRowCommand="gvwList_RowCommand"
                            OnRowCreated="gvwList_RowCreated" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField Visible="false" DataField="USER_ID" HeaderText="Module Name">
                                    <ItemStyle Width="25%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="C_CODE" HeaderText="Unit Company">
                                    <ItemStyle Width="25%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="GROUP_CODE" HeaderText="Group">
                                    <ItemStyle Width="75%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                            ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="~/img/im4_grid_delete.png" ToolTip="Delete" />
                                        <cc2:ConfirmButtonExtender
                                            ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?" TargetControlID="btnDelete">
                                        </cc2:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>




