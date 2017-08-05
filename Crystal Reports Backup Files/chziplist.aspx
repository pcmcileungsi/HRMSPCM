<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="chziplist.aspx.cs" Inherits="module_channelling_transaction_chziplist" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
    <script type="text/javascript">
//        $(document).ready(function() {
//            var $maintab = $("#pages").tabs();
//        });

        var allCheckBoxSelector = '#<%=gvwList.ClientID%> input[id*="chbSelectAll"]:checkbox';
        var checkBoxSelector = '#<%=gvwList.ClientID%> input[id*="chbSelect"]:checkbox';

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
                <span class="search-header">ZIP List</span>
            </td>
        </tr>
        <tr>
            <td>
                <cc2:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B200029" />
                <cc2:XUIButton ID="btnDelete" runat="server" CssClass="delete" Text="Delete" OnClick="btnDelete_Click" RoleCode="B200031" />
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
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="SYS_ZIPID"
                            OnSelectedIndexChanged="gvwList_SelectedIndexChanged" EmptyDataText="There is no data."
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
                            OnRowCommand="gvwList_RowCommand"
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
                                        <asp:CheckBox ID="chbSelectAll" runat="server" />    
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chbSelect" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="KOTA" HeaderText="Kota">
                                    <ItemStyle Width="25%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="KECAMATAN" HeaderText="Kecamatan">
                                    <ItemStyle Width="25%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="KELURAHAN" HeaderText="Kelurahan">
                                    <ItemStyle Width="25%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="KODEPOS" HeaderText="Zip Code">
                                    <ItemStyle Width="25%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                            ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="~/img/im4_grid_delete.png" ToolTip="Delete" />
                                            <cc1:ConfirmButtonExtender
                                                ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?" TargetControlID="btnDelete">
                                            </cc1:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnDeleted" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    
    <asp:Panel ID="upnDeleteValidate" runat="server" Width="370px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnDeleteValidate" runat="server"></asp:Button>
        <cc1:ModalPopupExtender ID="mdlPopupDeleteValidate" runat="server" BehaviorID="mdlPopupDeleteValidate"
            PopupControlID="upnDeleteValidate" TargetControlID="btnDeleteValidate"
            BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <cc1:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="upnDeleteValidate"
            DragHandleID="pnlPopupDeleteValidateHeader" />
        <div class="container" style="width:350px;">
            <asp:Panel ID="pnlPopupDeleteValidateHeader" runat="server" CssClass="header"
                style="width:350px;">
                <asp:Label ID="lblHeaderDeleteValidate" runat="server" CssClass="msg" Text="Delete" />
                <asp:LinkButton ID="btnCloseDeleteValidate" runat="server" CssClass="close" OnClientClick="$find('mdlPopupDeleteValidate').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailDeleteValidate" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="body" style="width:350px;">
                        <table cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <span>Password</span>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtPasswordDelete" runat="server" Enabled="true" 
                                    MaxLength="20" Width="160px" TextMode="Password"/>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnDeleted" runat="server" Text="OK" OnClick="btnDeleted_Click" CssClass="post"/>
                                </td>
                                <td></td>
                                <td align="right">
                                    <asp:Button ID="btnVoidDelete" runat="server" Text="Cancel" OnClientClick="$find('mdlPopupDeleteValidate').hide(); return false;" CssClass="void"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
</asp:Content>

