<%@ page title="" language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_echannelling_transaction_chclientlist, App_Web_pt4ne0vj" %>
    
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>    
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

    <script type="text/javascript">
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
        });
    </script>

    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Client List</span>
            </td>
        </tr>
        <%--<tr>
            <td>
                <cc1:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B000403" />
            </td>
        </tr>--%>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>Personal</span></a></li>
            <li><a href="#page-1"><span>Corporate</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td align="left">
                        <cc1:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B200006" />
                        <%--<cc1:XUIButton ID="btnBl" runat="server"  CssClass="bl" Text="Blacklist Selected" OnClick="btnBl_Click" RoleCode="B000416" />--%>
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearchPersonal" runat="server" DefaultButton="btnSearchPersonal">
                            <asp:TextBox ID="txtSearchPersonal" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchPersonal" runat="server" CssClass="search" Text="Search" OnClick="btnSearchPersonal_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListPersonal" runat="server" AutoGenerateColumns="False" DataKeyNames="SYS_CLIENTID,CLIENT"
                                    OnSelectedIndexChanged="gvwListPersonal_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListPersonal_PageIndexChanging"
                                    OnRowCreated="gvwListPersonal_RowCreated" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                        <asp:BoundField DataField="CLIENT" HeaderText="Code">
                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NAME" HeaderText="Name">
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AO" HeaderText="A/O">
                                            <ItemStyle Width="5%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ADDRESS1" HeaderText="Address">
                                            <ItemStyle Width="30%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ADDRESS3" HeaderText="City">
                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
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
                                <asp:AsyncPostBackTrigger ControlID="btnSearchPersonal" EventName="Click" />
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
                    <td align="left">
                        <%--<cc1:XUIButton ID="btnBlc" runat="server"  CssClass="bl" Text="Blacklist Selected" OnClick="btnBlc_Click" RoleCode="B000416" />--%>
                        <cc1:XUIButton ID="btnAddCorporate" runat="server" CssClass="add" Text="Add" OnClick="btnAddCorporate_Click" RoleCode="B200006" />
                    </td>
                    <td align="right">
                        <asp:Panel ID="pnlSearchCorporate" runat="server" DefaultButton="btnSearchCorporate">
                            <asp:TextBox ID="txtSearchCorporate" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchCorporate" runat="server" CssClass="search" Text="Search" OnClick="btnSearchCorporate_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="updMain1" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListCorporate" runat="server" AutoGenerateColumns="False" DataKeyNames="SYS_CLIENTID, CLIENT"
                                    OnSelectedIndexChanged="gvwListCorporate_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListCorporate_PageIndexChanging"
                                    OnRowCreated="gvwListCorporate_RowCreated" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                        <asp:BoundField DataField="CLIENT" HeaderText="Code">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SALUTE1" HeaderText="">
                                            <ItemStyle Width="5%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="NAME" HeaderText="Name">
                                            <ItemStyle Width="25%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AO" HeaderText="A/O">
                                            <ItemStyle Width="5%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CONTACT" HeaderText="Contact Person">
                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ADDRESS1" HeaderText="Address">
                                            <ItemStyle Width="22%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ADDRESS3" HeaderText="City">
                                            <ItemStyle Width="13%" HorizontalAlign="Left" />
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
                                <asp:AsyncPostBackTrigger ControlID="btnSearchCorporate" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    
   <%-- <asp:Panel ID="upnApproveValidate" runat="server" Width="370px" Style="display: block;">
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
                                    <asp:Button ID="btnApproval" runat="server" Text="OK" OnClick="btnblpersonal_Click" CssClass="post"/>
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
    <asp:Panel ID="upnApproveValidateCorporate" runat="server" Width="370px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnApproveValidateCorporate" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupApproveValidateCorporate" runat="server" BehaviorID="mdlPopupApproveValidateCorporate"
            PopupControlID="upnApproveValidateCorporate" TargetControlID="btnApproveValidateCorporate"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="upnApproveValidateCorporate"
            DragHandleID="pnlPopupApproveValidateCorporateHeader" />
        <div class="container" style="width:350px;">
            <asp:Panel ID="pnlPopupApproveValidateCorporateHeader" runat="server" CssClass="header"
                style="width:350px;">
                <asp:Label ID="lblHeaderApproveValidateCorporate" runat="server" CssClass="msg" Text="Approval" />
                <asp:LinkButton ID="btnCloseApproveValidateCorporate" runat="server" CssClass="close" OnClientClick="$find('mdlPopupApproveValidateCorporate').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailApproveValidateCorporate" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="body" style="width:350px;">
                        <table cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <span>Password</span>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtPasswordCorporate" runat="server" Enabled="true" 
                                    MaxLength="20" Width="160px" TextMode="Password"/>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="btnApprovalCorporate" runat="server" Text="OK" OnClick="btnblcorporate_Click" CssClass="post"/>
                                </td>
                                <td></td>
                                <td align="right">
                                    <asp:Button ID="btnVoidCorporate" runat="server" Text="Cancel" OnClientClick="$find('mdlPopupApproveValidateCorporate').hide(); return false;" CssClass="void"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>--%>
</asp:Content>
