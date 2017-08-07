﻿<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="chsetuplist.aspx.cs"
    Inherits="module_channelling_admin_chsetuplist" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Setup Channelling List</span>
            </td>
        </tr>
        <tr>
            <td>
                <cc2:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B200034" />
            </td>
            <td align="right">
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
    <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">
        <tr>
            <td>
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="CH_SETUPID"
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
                                <asp:BoundField DataField="MODULE" HeaderText="Module">
                                    <ItemStyle Width="20%" HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NAME" HeaderText="Channelling Name">
                                    <ItemStyle Width="80%" HorizontalAlign="Left" />
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
                                            <cc1:ConfirmButtonExtender
                                                ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?" TargetControlID="btnDelete">
                                            </cc1:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
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