<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="pelamarlist.aspx.cs"
    Inherits="module_pegawai_pelamarlist" Title="Data Pelamar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
    <%--<script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {
                var $maintab = $("#pages").tabs();
                $("#subpages").tabs();
            });
        }
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
            $("#subpages").tabs();
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
        });




        function ToggleCheckUncheckAllOptionAsNeeded() {
            var totalCheckboxes = $(checkBoxSelector),
                checkedCheckboxes = totalCheckboxes.filter(":checked"),
                noCheckboxesAreChecked = (checkedCheckboxes.length === 0),
                allCheckboxesAreChecked = (totalCheckboxes.length === checkedCheckboxes.length);

            $(allCheckBoxSelector).attr('checked', allCheckboxesAreChecked);
        }

        $(document).ready(function () {
            $(allCheckBoxSelector).live('click', function () {
                $(checkBoxSelector).attr('checked', $(this).is(':checked'));

                ToggleCheckUncheckAllOptionAsNeeded();
            });

            $(checkBoxSelector).live('click', ToggleCheckUncheckAllOptionAsNeeded);

            ToggleCheckUncheckAllOptionAsNeeded();
        });

        var allCheckBoxSelector1 = '#<%=gvwList.ClientID%> input[id*="chbSelectAll"]:checkbox';
        var checkBoxSelector1 = '#<%=gvwList.ClientID%> input[id*="chbSelect"]:checkbox';


        function ToggleCheckUncheckAllOptionAsNeeded1() {
            var totalCheckboxes1 = $(checkBoxSelector1),
                checkedCheckboxes1 = totalCheckboxes1.filter(":checked"),
                noCheckboxesAreChecked1 = (checkedCheckboxes1.length === 0),
                allCheckboxesAreChecked1 = (totalCheckboxes1.length === checkedCheckboxes1.length);

            $(allCheckBoxSelector1).attr('checked', allCheckboxesAreChecked1);
        }

        $(document).ready(function () {
            $(allCheckBoxSelector1).live('click', function () {
                $(checkBoxSelector1).attr('checked', $(this).is(':checked'));

                ToggleCheckUncheckAllOptionAsNeeded1();
            });

            $(checkBoxSelector1).live('click', ToggleCheckUncheckAllOptionAsNeeded1);

            ToggleCheckUncheckAllOptionAsNeeded1();
        });
    </script>
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">SPD List</span>
                <asp:Label ID="lblEmployee_Code" runat="server" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>Aktif</span></a></li>
            <li><a href="#page-1"><span>Diterima</span></a></li>
            <li><a href="#page-2"><span>Tidak Diterima</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td>
                        <cc2:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click"
                            RoleCode="B100122" />
                        <%--<cc2:XUIButton ID="btnMail" runat="server" CssClass="mail" Text="Mail" OnClick="btnMail_Click" RoleCode="B100074" />--%>
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updMain" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                    OnSelectedIndexChanged="gvwList_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
                                    OnRowCreated="gvwList_RowCreated" OnRowCommand="gvwList_RowCommand" GridLines="None"
                                    CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
                                                <asp:CheckBox ID="chbSelectAll" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="kode" HeaderText="NIK" SortExpression="Kode" />
                                        <asp:BoundField DataField="nama" HeaderText="Nama Karyawan" SortExpression="nama" />
                                        <asp:BoundField DataField="no_ktp" HeaderText="No KTP" SortExpression="no_ktp" />
                                        <asp:BoundField DataField="no_sim" HeaderText="No SIM" SortExpression="no_sim" />
                                        <%--<asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}"
                                            SortExpression="SPD_Date" />--%>

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
                                                <cc1:ConfirmButtonExtender ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?"
                                                    TargetControlID="btnDelete">
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
        </div>
        <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblHRD" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Panel ID="Panel4" runat="server" DefaultButton="btnSearch">
                            <asp:TextBox ID="txtSearchHRD" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchHRD" runat="server" CssClass="search" Text="Search" OnClick="btnSearchHRD_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updHRD" UpdateMode="Always" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListHRD" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                    EmptyDataText="There is no data." AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListHRD_PageIndexChanging"
                                    OnRowCommand="gvwListHRD_RowCommand" OnRowCreated="gvwListHRD_RowCreated" GridLines="None"
                                    CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
                                                <asp:CheckBox ID="chbSelectAll" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Employee_Code" HeaderText="NIK" SortExpression="Employee_Code" />
                                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                        <asp:BoundField DataField="SPD_No" HeaderText="SPD No" SortExpression="SPD_No" />
                                        <asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}"
                                            SortExpression="SPD_Date" />
                                        <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                    ImageUrl="~/img/im4_grid_view.png" ToolTip="View" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchHRD" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblApproved" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
                            <asp:TextBox ID="txtSearchApproved" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchApproved" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchApproved_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updApproved" UpdateMode="Always" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListApproved" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                    EmptyDataText="There is no data." AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListApproved_PageIndexChanging"
                                    OnRowCommand="gvwListApproved_RowCommand" OnRowCreated="gvwListApproved_RowCreated"
                                    GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
                                                <asp:CheckBox ID="chbSelectAll" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Employee_Code" HeaderText="NIK" SortExpression="Employee_Code" />
                                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                        <asp:BoundField DataField="SPD_No" HeaderText="SPD No" SortExpression="SPD_No" />
                                        <asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}"
                                            SortExpression="SPD_Date" />
                                        <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                    ImageUrl="~/img/im4_grid_view.png" ToolTip="View" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchApproved" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
