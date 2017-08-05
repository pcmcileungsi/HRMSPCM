<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_sysadmin_userlog, App_Web_5xutsobd" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">User Log</span>
            </td>
        </tr>
        <tr>
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
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID"
                            EmptyDataText="There is no data."
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
                                <asp:BoundField DataField="USER_ID" HeaderText="User ID">
                                    <ItemStyle Width="30%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LOGIN_DATE" HeaderText="Login Date">
                                    <ItemStyle Width="50%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LOGIN_IP_ADDRESS" HeaderText="Login IP Address" DataFormatString="{0:dd/MM/yy HH:mm:ss}">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField>
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

