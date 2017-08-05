<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="lstblgradecostlist.aspx.cs"
    Inherits="module_master_lstblgradecostlist" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Plafond List</span>
            </td>
        </tr>
        <tr>
            <td>
                <cc2:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100117" />
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
            <td style="width: 80px">Cost Type : </td>
            <td>
                <cc2:XUIDropDownList ID="ddlCostCode" runat="server" DBColumnName="CostCode"
                    BindType="Both" SPParameterName="p_CostCode" AutoPostBack="true" OnSelectedIndexChanged="ddlCostCode_SelectedIndexChanged">
                </cc2:XUIDropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
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
                                <asp:BoundField DataField="GradeCode" HeaderText="Grade Code">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="GRADEName" HeaderText="Grade Name">
                                    <ItemStyle Width="80%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Cost">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>
                                       <%-- <asp:TextBox ID="txtCost" runat="server" Width="50px" Text='<%# Bind("Cost") %>' onblur="jsCalculate();jsFormatCurrencywcent('ctl00_cphbd_txtCost');"></asp:TextBox>--%>
                                        <cc2:XUITextBox ID="txtCost" runat="server" DataType="Number"
                                            DBColumnName="Cost" SPParameterName="p_Cost" BindType="Both" Width="160px"  
                                            Format="N2" Text='<%# Bind("Cost","{0:N2}") %>' onblur="jsCalculate();jsFormatCurrencywcent('ctl00_cphbd_txtCost');">
                                        </cc2:XUITextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                        <asp:PostBackTrigger ControlID="ddlCostCode" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
