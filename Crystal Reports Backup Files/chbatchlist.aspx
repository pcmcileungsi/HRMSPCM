<%@ Page Title="" Language="C#" MasterPageFile="~/mfin2.master" AutoEventWireup="true"
    CodeFile="chbatchlist.aspx.cs" Inherits="module_channelling_transaction_chbatchlist" %>
    
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

    <script type="text/javascript">
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            $("#subpages").tabs();
//            jsPopUpDate("ctl00_cphbd_dtFromDateLeasing");
//            jsPopUpDate("ctl00_cphbd_dtToDateLeasing");
//            jsPopUpDate("ctl00_cphbd_dtFromDateConsumer");
//            jsPopUpDate("ctl00_cphbd_dtToDateConsumer");
//            jsPopUpDate("ctl00_cphbd_dtFromDateIMBT");
//            jsPopUpDate("ctl00_cphbd_dtToDateIMBT");
//            jsPopUpDate("ctl00_cphbd_dtFromDateMurabahah");
//            jsPopUpDate("ctl00_cphbd_dtToDateMurabahah");
        });

        var allCheckBoxSelector = '#<%=gvwListPending.ClientID%> input[id*="chbSelectAll"]:checkbox';
        var checkBoxSelector = '#<%=gvwListPending.ClientID%> input[id*="chbSelect"]:checkbox';

        function ToggleCheckUncheckAllOptionAsNeeded() {
            var totalCheckboxes = $(checkBoxSelector),
                checkedCheckboxes = totalCheckboxes.filter(":checked"),
                noCheckboxesAreChecked = (checkedCheckboxes.length === 0),
                allCheckboxesAreChecked = (totalCheckboxes.length === checkedCheckboxes.length);

            $(allCheckBoxSelector).attr('checked', allCheckboxesAreChecked);
        }

        $(document).ready(function() {
            $(allCheckBoxSelector).live('click', function() {
                $(checkBoxSelector).attr('checked', $(this).is(':checked'));

                ToggleCheckUncheckAllOptionAsNeeded();
            });

            $(checkBoxSelector).live('click', ToggleCheckUncheckAllOptionAsNeeded);

            ToggleCheckUncheckAllOptionAsNeeded();
        });
        
    </script><table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Batch List</span>
            </td>
        </tr>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>Pending</span></a></li>
            <li><a href="#page-1"><span>Pending Disbursement</span></a></li>
            <li><a href="#page-2"><span>Disbursement</span></a></li>
            <li><a href="#page-3"><span>Delete</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td align="left">
                        <cc1:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B200019" />
                        <cc1:XUIButton ID="btnApprove" runat="server" CssClass="post" Text="Approve Selected" OnClick="btnApprove_Click"  RoleCode="B200023"/>
                        <cc1:XUIButton ID="btnReject" runat="server"  CssClass="void" Text="Delete Selected" OnClick="btnReject_Click" RoleCode="B200021" />
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearchPending" runat="server" DefaultButton="btnSearchPending">
                            <asp:TextBox ID="txtSearchPending" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchPending" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchPending_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updPanel" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListPending" runat="server" AutoGenerateColumns="False" DataKeyNames="LS_BUYAGREEMENTID"
                                    OnSelectedIndexChanged="gvwListPending_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListPending_PageIndexChanging"
                                    OnRowCreated="gvwListPending_RowCreated" GridLines="None" CssClass="mGrid"
                                    PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
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
                                        <asp:BoundField DataField="CODE" HeaderText="Batch Code">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESCS" HeaderText="Description">
                                            <ItemStyle Width="75%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DUEDATE" HeaderText="Due Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnSelectPending" runat="server" CausesValidation="False"
                                                    CommandName="Select" ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchPending" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnRejection" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnApproval" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody1" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td align="right">
                        <asp:Panel ID="pnlSearchPendingDisbursement" runat="server" DefaultButton="btnSearchPendingDisbursement">
                            <asp:TextBox ID="txtSearchPendingDisbursement" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchPendingDisbursement" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchPendingDisbursement_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updPanel1" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListPendingDisbursement" runat="server" AutoGenerateColumns="False" DataKeyNames="LS_BUYAGREEMENTID"
                                    OnSelectedIndexChanged="gvwListPendingDisbursement_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListPendingDisbursement_PageIndexChanging"
                                    OnRowCreated="gvwListPendingDisbursement_RowCreated" GridLines="None" CssClass="mGrid"
                                    PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CODE" HeaderText="Batch Code">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESCS" HeaderText="Description">
                                            <ItemStyle Width="75%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DUEDATE" HeaderText="Due Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnSelectPendingDisbursement" runat="server" CausesValidation="False"
                                                    CommandName="Select" ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchPendingDisbursement" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnRejection" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnApproval" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody2" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td align="right">
                        <asp:Panel ID="pnlSearchDisbursement" runat="server" DefaultButton="btnSearchDisbursement">
                            <asp:TextBox ID="txtSearchDisbursement" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchDisbursement" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchDisbursement_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updPanel2" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListDisbursement" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="LS_BUYAGREEMENTID" OnSelectedIndexChanged="gvwListDisbursement_SelectedIndexChanged"
                                    EmptyDataText="There is no data." AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListDisbursement_PageIndexChanging"
                                    OnRowCreated="gvwListDisbursement_RowCreated" GridLines="None" CssClass="mGrid"
                                    PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <span>No</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CODE" HeaderText="Batch Code">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESCS" HeaderText="Description">
                                            <ItemStyle Width="75%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DUEDATE" HeaderText="Due Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnSelectDisbursement" runat="server" CausesValidation="False"
                                                    CommandName="Select" ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchDisbursement" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnRejection" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnApproval" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-3" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody3" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td align="right">
                        <asp:Panel ID="pnlSearchReject" runat="server" DefaultButton="btnSearchReject">
                            <asp:TextBox ID="txtSearchReject" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchReject" runat="server" CssClass="search" Text="Search" OnClick="btnSearchReject_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updPanel3" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListReject" runat="server" AutoGenerateColumns="False" DataKeyNames="LS_BUYAGREEMENTID"
                                    OnSelectedIndexChanged="gvwListReject_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListReject_PageIndexChanging"
                                    OnRowCreated="gvwListReject_RowCreated" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                        <asp:BoundField DataField="CODE" HeaderText="Batch Code">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESCS" HeaderText="Description">
                                            <ItemStyle Width="75%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DUEDATE" HeaderText="Due Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnSelectReject" runat="server" CausesValidation="False" CommandName="Select"
                                                    ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchReject" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnRejection" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnApproval" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
    <asp:Panel ID="upnApproveValidate" runat="server" Width="370px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnApproveValidate" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupApproveValidate" runat="server" BehaviorID="mdlPopupApproveValidate"
            PopupControlID="upnApproveValidate" TargetControlID="btnApproveValidate"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender2" runat="server" TargetControlID="upnApproveValidate"
            DragHandleID="pnlPopupApproveValidateHeader" />
        <div class="container" style="width:350px;">
            <asp:Panel ID="pnlPopupApproveValidateHeader" runat="server" CssClass="header"
                style="width:350px;">
                <asp:Label ID="lblHeaderApproveValidate" runat="server" CssClass="msg" Text="Approval" />
                <asp:LinkButton ID="btnCloseApproveValidate" runat="server" CssClass="close" OnClientClick="$find('mdlPopupApproveValidate').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailApproveValidate" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="body" style="width:350px;">
                        <table cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <span>Password</span>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtPassword" runat="server" Enabled="true" 
                                    MaxLength="20" Width="160px" TextMode="Password"/>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnApproval" runat="server" Text="OK" OnClick="btnApproval_Click" CssClass="post"/>
                                </td>
                                <td></td>
                                <td align="right">
                                    <asp:Button ID="btnVoid" runat="server" Text="Cancel" OnClientClick="$find('mdlPopupApproveValidate').hide(); return false;" CssClass="void"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
    <asp:Panel ID="upnRejectValidate" runat="server" Width="370px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnRejectValidate" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupRejectValidate" runat="server" BehaviorID="mdlPopupRejectValidate"
            PopupControlID="upnRejectValidate" TargetControlID="btnRejectValidate"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="upnRejectValidate"
            DragHandleID="pnlPopupRejectValidateHeader" />
        <div class="container" style="width:350px;">
            <asp:Panel ID="pnlPopupRejectValidateHeader" runat="server" CssClass="header"
                style="width:350px;">
                <asp:Label ID="lblHeaderRejectValidate" runat="server" CssClass="msg" Text="Reject" />
                <asp:LinkButton ID="btnCloseRejectValidate" runat="server" CssClass="close" OnClientClick="$find('mdlPopupRejectValidate').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailRejectValidate" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="body" style="width:350px;">
                        <table cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <span>Password</span>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtPasswordReject" runat="server" Enabled="true" 
                                    MaxLength="20" Width="160px" TextMode="Password"/>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnRejection" runat="server" Text="OK" OnClick="btnRejection_Click" CssClass="post"/>
                                </td>
                                <td></td>
                                <td align="right">
                                    <asp:Button ID="btnVoidReject" runat="server" Text="Cancel" OnClientClick="$find('mdlPopupRejectValidate').hide(); return false;" CssClass="void"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
</asp:Content>
