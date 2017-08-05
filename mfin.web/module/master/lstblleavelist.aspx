<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="lstblleavelist.aspx.cs" Inherits="module_master_lstblleavelist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Leave Quota List</span>
            </td>
        </tr>
        <tr>
            <td>
                <cc2:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B100056" />
                <cc2:XUIButton ID="btnImport" runat="server" CssClass="dl" Text="Import From Excel" OnClick="btnImport_Click" RoleCode="B100056" />
            </td>
            <td align="right">
                <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">
        <tr>
            <td>
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                            OnSelectedIndexChanged="gvwList_SelectedIndexChanged" EmptyDataText="There is no data."
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
                            OnRowCreated="gvwList_RowCreated" OnRowCommand="gvwList_RowCommand" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                <asp:BoundField DataField="Employee_Code" HeaderText="NIK">
                                    <ItemStyle Width="15%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name">
                                    <ItemStyle Width="30%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="START_DATE" HeaderText="Start Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="START_DATE" />
                                <asp:BoundField DataField="END_DATE" HeaderText="End Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="END_DATE" />
                                <asp:BoundField DataField="BranchName" HeaderText="Branch">
                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DeptName" HeaderText="Department">
                                    <ItemStyle Width="25%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Quota" HeaderText="Quota">
                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Used" HeaderText="Used">
                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Balance" HeaderText="Balance">
                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
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
