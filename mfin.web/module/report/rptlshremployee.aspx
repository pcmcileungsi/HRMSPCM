<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="rptlshremployee.aspx.cs" Inherits="module_report_rptlshremployee" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
<script type="text/javascript">
    $(document).ready(function() {
        jsPopUpDate("ctl00_cphbd_txtdDateFr");
        jsPopUpDate("ctl00_cphbd_txtdDateTo");
    });
</script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Employee List Report</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr>
                        <td width="20%">
                            <span>Employee Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboStatus" runat="server" DataType="String" BindType="UIToDBOnly"
                                SPParameterName="p_status" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value='1'>Active</asp:ListItem>
                                <asp:ListItem Value='2'>Non Active</asp:ListItem>
                                <asp:ListItem Value='3' Selected="True">ALL</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <%--<tr>
                        <td width="20%">
                            <span>Printer Option</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboPrinterOption" runat="server" DataType="String" BindType="None"
                                SPParameterName="p_printeroption" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value='0' Selected="False" style="display:none;"></asp:ListItem>
                                <asp:ListItem Value='1'>Printer</asp:ListItem>
                                <asp:ListItem Value='2' Selected="True">Preview</asp:ListItem>
                                <asp:ListItem Value='3'>Export to Excel</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td colspan="3" style="border-bottom: solid 1px #DEDEDE;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnPrint" runat="server" CssClass="print" Text="Print" OnClick="btnPrint_Click" style="width:auto;" />
                            <asp:Button ID="btnPrintAll" runat="server" CssClass="print" Text="PrintAll" OnClick="btnPrintAll_Click" style="width:auto;" />
                        </td>
                        <td colspan="2" align="right">
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_ID"
                                        EmptyDataText="There is no data." AllowPaging="false"
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
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                        <span><asp:CheckBox ID="chbSelectAll" runat="server" CssClass="set" Text="" AutoPostBack="true" 
                                                        OnCheckedChanged="btnSelectAll_Click"/></span>
                                                    </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chbSelect" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Employee_NIK" HeaderText="NIK" SortExpression="Employee_NIK" />
                                            <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                            <asp:BoundField DataField="BranchName" HeaderText="Branch" SortExpression="BranchName" />
                                            <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                            <%--<asp:BoundField DataField="C_CODE" HeaderText="Code">
                                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="C_NAME" HeaderText="Name">
                                                <ItemStyle Width="90%" HorizontalAlign="Left" />
                                            </asp:BoundField>--%>
                                            <%--<asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnSelect" runat="server" CausesValidation="False" CommandName="Select"
                                                        ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
