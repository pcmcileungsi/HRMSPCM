<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_sysadmin_master_lstbldecisionsublist, App_Web_ptzw034j" title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Level of Approval List</span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                <cc1:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B000503" />
            </td>
            <td align="right">
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
    <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">
        <tr>
            <td width="20%">Username</td>
            <td>:</td>
            <td width="80%"> <asp:Label ID="lblUsername" runat="server" ></asp:Label> </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="LS_TBLDECISIONID"
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
                                <asp:BoundField DataField="EFF_DATE" HeaderText="Effrate Date" DataFormatString="{0:dd/MM/yyyy}">
                                    <ItemStyle Width="40%" HorizontalAlign="Center"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="CURRENCY" HeaderText="Currency">
                                    <ItemStyle Width="15%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AMOUNT" HeaderText="Limit" DataFormatString="{0:N2}">
                                    <ItemStyle Width="45%" HorizontalAlign="Right" />
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

