<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_channelling_admin_chsdklist, App_Web_6nlwv8yu" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

    <script type="text/javascript">
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
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
        
    </script>

    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Channelling Disbursement Requisition List</span>
            </td>
        </tr>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>Pending</span></a></li>
            <li><a href="#page-1"><span>Approved</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 0px 0px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody0" cellpadding="0px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="pnlBody0" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <table id="tblBody0_1" cellpadding="0px" cellspacing="0px" class="search-list-table">
                                    <tr>
                                        <td align="left">
                                            <cc1:XUIButton RoleCode="B200028" ID="btnApprove" runat="server" CssClass="post" Text="Approve"
                                                OnClick="btnApprove_Click" />
                                            <cc1:XUIButton RoleCode="B200028" ID="btnReject" runat="server" CssClass="void" Text="Reject"
                                                OnClick="btnReject_Click" />
                                            <%--<cc1:XUIButton ID="btnEdit" runat="server" CssClass="edit" Text="Edit" OnClick="btnEdit_Click" Visible = "false" RoleCode="B200025" />--%>
                                            <%--<asp:Button ID="btnReject" runat="server" CssClass="void" Text="Reject Selected"
                                                OnClick="btnReject_Click" />--%>
                                        </td>
                
                                        <td align="right">
                                            <asp:TextBox ID="txtSearchPendingList" runat="server"></asp:TextBox>
                                            <asp:Button ID="btnSearchPendingList" runat="server" CssClass="search" Text="Search"
                                                OnClick="btnSearchPendingList_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="gvwListPending" runat="server" AutoGenerateColumns="False" DataKeyNames="CH_PAYMENTREQUESTID, LSAGREE, NAME"
                                    OnSelectedIndexChanged="gvwListPending_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListPending_PageIndexChanging"
                                    OnRowCreated="gvwListPending_RowCreated" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                                <asp:CheckBox ID="chbSelectAll" runat="server" />    
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chbSelect" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="LSAGREE" HeaderText="Batch No.">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NAME" HeaderText="Lessee.">
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AMTLEASE" HeaderText="Plafond" DataFormatString="{0:N2}">
                                            <ItemStyle Width="25%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LEASETYPE" HeaderText="Type">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MODULE" HeaderText="Module">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AO" HeaderText="AO">
                                            <ItemStyle Width="5%" HorizontalAlign="Center" />
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
                                <asp:AsyncPostBackTrigger ControlID="btnSearchPendingList" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnApproval" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnRejection" EventName="Click" />
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
                    <td width="20%">
                        <asp:ImageButton ID="btnPrintApprovedDisb" runat="server" CssClass="print" ImageUrl="~/img/im4_toolbar_print.png"
                            OnClick="btnPrintApprovedDisb_Click" Style="display: none;" />
                    </td>
                    <td align="right">
                        <asp:TextBox ID="txtSearchApprovedList" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearchApprovedList" runat="server" CssClass="search" Text="Search"
                            OnClick="btnSearchApprovedList_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:UpdatePanel ID="pnlBody1" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListApproved" runat="server" AutoGenerateColumns="False" DataKeyNames="CH_PAYMENTREQUESTID, LSAGREE, NAME"
                                    OnSelectedIndexChanged="gvwListApproved_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListApproved_PageIndexChanging"
                                    OnRowCreated="gvwListApproved_RowCreated" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                        <asp:BoundField DataField="LSAGREE" HeaderText="Batch No.">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NAME" HeaderText="Lessee.">
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AMTLEASE" HeaderText="Plafond" DataFormatString="{0:N2}">
                                            <ItemStyle Width="25%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LEASETYPE" HeaderText="Type">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MODULE" HeaderText="Module">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AO" HeaderText="AO">
                                            <ItemStyle Width="5%" HorizontalAlign="Center" />
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
                                <asp:AsyncPostBackTrigger ControlID="btnSearchApprovedList" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnApproval" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnRejection" EventName="Click" />
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
