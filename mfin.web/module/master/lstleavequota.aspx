<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="lstleavequota.aspx.cs"
    Inherits="module_master_lstleavequota" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
            jsPopUpYear('ctl00_cphbd_txtEmployee_BirthDate');
        });
    </script>
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Leave Quota List</span>
            </td>
        </tr>
        <tr>
            <td>
                <cc2:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100057" />
            </td>
            <td align="right">
                <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Text"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">
        <tr>
            <td style="width: 40px">Year : </td>
            <td>
                <cc2:XUIDropDownList ID="ddlYear" runat="server" DBColumnName="Year"
                    BindType="Both" SPParameterName="p_Year" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                </cc2:XUIDropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="updMain" UpdateMode="Always" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                            OnSelectedIndexChanged="gvwList_SelectedIndexChanged" EmptyDataText="There is no data."
                            AllowPaging="True" OnPageIndexChanging="gvwList_PageIndexChanging"
                            OnRowCreated="gvwList_RowCreated" OnRowCommand="gvwList_RowCommand" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" EnableModelValidation="True">
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Employee_NIK" HeaderText="NIK">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name">
                                    <ItemStyle Width="80%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Balance Prev Year">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>
                                        <asp:TextBox ID="txtTahunLalu" runat="server" Width="50px" Enabled="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quota">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtQuota" runat="server" Width="50px" Text='<%# Bind("Quota") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Used">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtUsed" runat="server" Enabled="false" Width="50px" Text='<%# Bind("Used") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Balance">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtBalance" runat="server" Enabled="false" Width="50px" Text='<%# Bind("Balance") %>'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                            ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="~/img/im4_grid_delete.png" ToolTip="Delete" />
                                        <cc1:ConfirmButtonExtender
                                            ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?" TargetControlID="btnDelete">
                                        </cc1:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
