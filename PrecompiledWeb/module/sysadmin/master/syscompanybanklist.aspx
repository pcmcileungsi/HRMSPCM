<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_sysadmin_master_syscompanybanklist, App_Web_ptzw034j" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
 <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Banker</span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" />
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
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="SYS_COMPANYBANKID"
                            OnSelectedIndexChanged="gvwList_SelectedIndexChanged" EmptyDataText="There is no data."
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
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
                                <asp:BoundField DataField="BANK" HeaderText="Bank">
                                    <ItemStyle Width="75%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BRANCH" HeaderText="Branch">
                                    <ItemStyle Width="25%" HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Address">
                                    <ItemStyle Width="25%" HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnSelect" runat="server" CausesValidation="False" CommandName="Select"
                                            ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
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

