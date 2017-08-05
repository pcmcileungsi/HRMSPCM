<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="appleavelst.aspx.cs"
    Inherits="module_approval_appleavelst" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {

                var $maintab = $("#pages").tabs();
                jsPopUpDate('ctl00_cphbd_txtSPD_Date');
                jsPopUpDate('ctl00_cphbd_txtStartDate');
                jsPopUpDate('ctl00_cphbd_txtEndDate');

            });
        }
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
            jsPopUpDate('ctl00_cphbd_txtSPD_Date');
            jsPopUpDate('ctl00_cphbd_txtStartDate');
            jsPopUpDate('ctl00_cphbd_txtEndDate');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
        });

        var allCheckBoxSelector = '#<%=gvwList.ClientID%> input[id*="chbSelectAll"]:checkbox';
        var checkBoxSelector = '#<%=gvwList.ClientID%> input[id*="chbSelect"]:checkbox';


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

    </script>
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Approval Leave List</span>
                <asp:Label ID="lblEmployee_Code" runat="server" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>Draft</span></a></li>
            <li><a href="#page-1"><span>Approved</span></a></li>
            <li><a href="#page-2"><span>Rejected</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td>
                        <cc2:XUIButton ID="btnApprove" runat="server" CssClass="post" Text="Approve Selected" OnClick="btnApprove_Click" RoleCode="B100096" />
                        <cc2:XUIButton ID="btnReject" runat="server" CssClass="void" Text="Reject" OnClick="btnReject_Click" RoleCode="B100096" />
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
                        <asp:UpdatePanel ID="updMain" runat="server">
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
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="StartDate" />
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="EndDate" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                        <asp:BoundField DataField="TotDay" HeaderText="Days" SortExpression="TotDay" />
                                        <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                    ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
        </div>
        <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblApproved" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
                            <asp:TextBox ID="txtSearchApproved" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchApproved" runat="server" CssClass="search" Text="Search" OnClick="btnSearchApproved_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updApproved" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListApproved" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                    EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListApproved_PageIndexChanging"
                                    OnRowCommand="gvwListApproved_RowCommand" OnRowCreated="gvwListApproved_RowCreated"
                                    GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                        <asp:BoundField DataField="Employee_Code" HeaderText="NIK" SortExpression="Employee_Code" />
                                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="StartDate" />
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="EndDate" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                        <asp:BoundField DataField="TotDay" HeaderText="Days" SortExpression="TotDay" />
                                        <asp:BoundField DataField="Apv_Name" HeaderText="Approved By" SortExpression="Apv_Name" />
                                        <asp:BoundField DataField="Approved_Date" HeaderText="Approved Date" DataFormatString="{0:dd-MMM-yyyy HH:mm}" SortExpression="Approved_Date" />
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
        <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblRejected" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Panel ID="Panel2" runat="server" DefaultButton="btnSearchRejected">
                            <asp:TextBox ID="txtSearchRejected" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchRejected" runat="server" CssClass="search" Text="Search" OnClick="btnSearchRejected_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="upRejected" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListRejected" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                    EmptyDataText="There is no data." AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListRejected_PageIndexChanging"
                                    OnRowCreated="gvwListRejected_RowCreated" OnRowCommand="gvwListRejected_RowCommand" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                        <asp:BoundField DataField="Employee_Code" HeaderText="NIK" SortExpression="Employee_Code" />
                                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="StartDate" />
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="EndDate" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                        <asp:BoundField DataField="TotDay" HeaderText="Days" SortExpression="TotDay" />
                                        <asp:BoundField DataField="Rjc_Name" HeaderText="Reject By" SortExpression="Rjc_Name" />
                                        <asp:BoundField DataField="Rejected_Date" HeaderText="Reject Date" DataFormatString="{0:dd-MMM-yyyy HH:mm}" SortExpression="Rejected_Date" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" CommandArgument="ID"
                                                    ImageUrl="~/img/im4_grid_view.png" ToolTip="View" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchRejected" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%-- Lookup Approve--%>
    <asp:Panel ID="upnApproveValidate" runat="server" Width="370px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnApproveValidate" runat="server"></asp:Button>
        <cc1:ModalPopupExtender ID="mdlPopupApproveValidate" runat="server" BehaviorID="mdlPopupApproveValidate"
            PopupControlID="upnApproveValidate" TargetControlID="btnApproveValidate"
            BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <cc1:DragPanelExtender ID="DragPanelExtender2" runat="server" TargetControlID="upnApproveValidate"
            DragHandleID="pnlPopupApproveValidateHeader" />
        <div class="container" style="width: 350px;">
            <asp:Panel ID="pnlPopupApproveValidateHeader" runat="server" CssClass="header"
                Style="width: 350px;">
                <asp:Label ID="lblHeaderApproveValidate" runat="server" CssClass="msg" Text="Approval" />
                <asp:LinkButton ID="btnCloseApproveValidate" runat="server" CssClass="close" OnClientClick="$find('mdlPopupApproveValidate').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailApproveValidate" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="body" style="width: 350px;">
                        <table cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <span>Password</span>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtPassword" runat="server" Enabled="true"
                                        MaxLength="20" Width="160px" TextMode="Password" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnApproval" runat="server" Text="OK" OnClick="btnApproval_Click" CssClass="post" />
                                </td>
                                <td></td>
                                <td align="right">
                                    <asp:Button ID="btnVoid" runat="server" Text="Cancel" OnClientClick="$find('mdlPopupApproveValidate').hide(); return false;" CssClass="void" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Approve--%>
    <%-- Lookup Reject--%>
    <asp:Panel ID="upnRejectValidate" runat="server" Width="370px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnRejectValidate" runat="server"></asp:Button>
        <cc1:ModalPopupExtender ID="mdlPopupRejectValidate" runat="server" BehaviorID="mdlPopupRejectValidate"
            PopupControlID="upnRejectValidate" TargetControlID="btnRejectValidate"
            BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <cc1:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="upnRejectValidate"
            DragHandleID="pnlPopupRejectValidateHeader" />
        <div class="container" style="width: 350px;">
            <asp:Panel ID="pnlPopupRejectValidateHeader" runat="server" CssClass="header"
                Style="width: 350px;">
                <asp:Label ID="lblHeaderRejectValidate" runat="server" CssClass="msg" Text="Reject" />
                <asp:LinkButton ID="btnCloseRejectValidate" runat="server" CssClass="close" OnClientClick="$find('mdlPopupRejectValidate').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailRejectValidate" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="body" style="width: 350px;">
                        <table cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <span>Password</span>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtPasswordReject" runat="server" Enabled="true"
                                        MaxLength="20" Width="160px" TextMode="Password" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnRejection" runat="server" Text="OK" OnClick="btnRejection_Click" CssClass="post" />
                                </td>
                                <td></td>
                                <td align="right">
                                    <asp:Button ID="btnVoidReject" runat="server" Text="Cancel" OnClientClick="$find('mdlPopupRejectValidate').hide(); return false;" CssClass="void" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Reject--%>
</asp:Content>
