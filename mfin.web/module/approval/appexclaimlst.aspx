<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="appexclaimlst.aspx.cs"
    Inherits="module_approval_appexclaimlst" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Approval Expense Claim List</span>
                <asp:Label ID="lblEmployee_Code" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="lblAproveType" runat="server" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>HRD</span></a></li>
            <li><a href="#page-1"><span>Atasan 1</span></a></li>
            <li><a href="#page-2"><span>Atasan 2</span></a></li>
            <li><a href="#page-3"><span>Approved</span></a></li>
            <li><a href="#page-4"><span>Rejected</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblHRD" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td>
                        <cc2:XUIButton ID="btnApproveHRD" runat="server" CssClass="post" Text="Approve Selected" OnClick="btnApproveHRD_Click" RoleCode="B100108" />
                        <cc2:XUIButton ID="btnRejectHRD" runat="server" CssClass="void" Text="Reject" OnClick="btnRejectHRD_Click" RoleCode="B100108" />
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearchHRD" runat="server" DefaultButton="btnSearchHRD">
                            <asp:TextBox ID="txtSearchHRD" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchHRD" runat="server" CssClass="search" Text="Search" OnClick="btnSearchHRD_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updMainHRD" UpdateMode="Always" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListHRD" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                    OnSelectedIndexChanged="gvwListHRD_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListHRD_PageIndexChanging"
                                    OnRowCreated="gvwListHRD_RowCreated" OnRowCommand="gvwListHRD_RowCommand" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                                <asp:CheckBox ID="chbSelectAllHRD" runat="server" AutoPostBack="true" OnCheckedChanged="chbSelectAllHRD_Click" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbSelectHRD" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Employee_Code" HeaderText="NIK" SortExpression="Employee_Code" />
                                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                        <asp:BoundField DataField="SPD_No" HeaderText="SPD No" SortExpression="SPD_No" />
                                        <asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="SPD_Date" />
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
        <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblAtasan1" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td>
                        <cc2:XUIButton ID="btnApproveAtasan1" runat="server" CssClass="post" Text="Approve Selected" OnClick="btnApproveAtasan1_Click" RoleCode="B100108" />
                        <cc2:XUIButton ID="btnRejectAtasan1" runat="server" CssClass="void" Text="Reject" OnClick="btnRejectAtasan1_Click" RoleCode="B100108" />
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearchAtasan1" runat="server" DefaultButton="btnSearchAtasan1">
                            <asp:TextBox ID="txtSearchAtasan1" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchAtasan1" runat="server" CssClass="search" Text="Search" OnClick="btnSearchAtasan1_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updMainAtasan1" UpdateMode="Always" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListAtasan1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                    OnSelectedIndexChanged="gvwListAtasan1_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListAtasan1_PageIndexChanging"
                                    OnRowCreated="gvwListAtasan1_RowCreated" OnRowCommand="gvwListAtasan1_RowCommand" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                                <asp:CheckBox ID="chbSelectAllAtasan1" runat="server" AutoPostBack="true" OnCheckedChanged="chbSelectAllAtasan1_Click" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbSelectAtasan1" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Employee_Code" HeaderText="NIK" SortExpression="Employee_Code" />
                                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                        <asp:BoundField DataField="SPD_No" HeaderText="SPD No" SortExpression="SPD_No" />
                                        <asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="SPD_Date" />
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
                                <asp:AsyncPostBackTrigger ControlID="btnSearchAtasan1" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblAtasan2" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td>
                        <cc2:XUIButton ID="btnApproveAtasan2" runat="server" CssClass="post" Text="Approve Selected" OnClick="btnApproveAtasan2_Click" RoleCode="B100108" />
                        <cc2:XUIButton ID="btnRejectAtasan2" runat="server" CssClass="void" Text="Reject" OnClick="btnRejectAtasan2_Click" RoleCode="B100108" />
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearchAtasan2" runat="server" DefaultButton="btnSearchAtasan2">
                            <asp:TextBox ID="txtSearchAtasan2" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchAtasan2" runat="server" CssClass="search" Text="Search" OnClick="btnSearchAtasan2_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updMainAtasan2" UpdateMode="Always" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListAtasan2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                    OnSelectedIndexChanged="gvwListAtasan2_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListAtasan2_PageIndexChanging"
                                    OnRowCreated="gvwListAtasan2_RowCreated" OnRowCommand="gvwListAtasan2_RowCommand" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                                <asp:CheckBox ID="chbSelectAllAtasan2" runat="server" AutoPostBack="true" OnCheckedChanged="chbSelectAllAtasan2_Click" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbSelectAtasan2" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Employee_Code" HeaderText="NIK" SortExpression="Employee_Code" />
                                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                        <asp:BoundField DataField="SPD_No" HeaderText="SPD No" SortExpression="SPD_No" />
                                        <asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="SPD_Date" />
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
                                <asp:AsyncPostBackTrigger ControlID="btnSearchAtasan2" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-3" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblApproved" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Panel ID="PanelApproved" runat="server" DefaultButton="btnSearchApproved">
                            <asp:TextBox ID="txtSearchApproved" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchApproved" runat="server" CssClass="search" Text="Search" OnClick="btnSearchApproved_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updApproved" UpdateMode="Always" runat="server">
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
                                        <asp:BoundField DataField="SPD_No" HeaderText="SPD No" SortExpression="SPD_No" />
                                        <asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="SPD_Date" />
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
        <div id="page-4" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblRejected" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Panel ID="PanelRejected" runat="server" DefaultButton="btnSearchRejected">
                            <asp:TextBox ID="txtSearchRejected" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchRejected" runat="server" CssClass="search" Text="Search" OnClick="btnSearchRejected_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="upRejected" UpdateMode="Always" runat="server">
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
                                        <asp:BoundField DataField="SPD_No" HeaderText="SPD No" SortExpression="SPD_No" />
                                        <asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="SPD_Date" />
                                        <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
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
