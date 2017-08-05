<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_channelling_transaction_chtblmakedetail, App_Web_pt4ne0vj" title="Untitled Page" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

    <script type="text/javascript">
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            $("#subpages-0").tabs();
            $("#subpages-1").tabs();
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
        <%--<table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">--%>
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Assets Merk</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B200002" />
                </td>
            </tr>
        </table>
        <div id="pages" style="margin: 5px 3px">
            <ul style="font-size: smaller">
                <li><a href="#page-0"><span>Info</span></a></li>
                <li><a href="#page-1"><span>Model</span></a></li>
            </ul>
            <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow-y: auto">
                <%--<cc1:XUIButton ID="btnBack" runat="server" CssClass="back" Text="Back" OnClick="btnBack_Click" />
                <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B000385" />--%>
                <asp:UpdatePanel ID="pnlBody" runat="server">
                    <ContentTemplate>
                        <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr style="display: none">
                                <td width="20%">
                                    <span>ID</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUILabel ID="lblTBLMAKEID" runat="server" DataType="Integer" DBColumnName="CH_TBLMAKEID"
                                        BindType="Both" SPParameterName="p_ch_tblmakeid" Text="0"></cc1:XUILabel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Merk Code</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtCODE" runat="server" DataType="String" DBColumnName="CODE"
                                        BindType="Both" SPParameterName="p_code" MaxLength="3" Width="48px">
                                    </cc1:XUITextBox>
                                    <asp:RequiredFieldValidator ID="rfvtxtCode" runat="server" ControlToValidate="txtCODE"
                                        ErrorMessage="* Field cannot be blank" />
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Description</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtDESCS" runat="server" DataType="String" DBColumnName="DESCS"
                                        BindType="Both" SPParameterName="p_descs" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Negara Pembuat</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtCountry" runat="server" DataType="String" DBColumnName="COUNTRY"
                                        BindType="Both" SPParameterName="p_country" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow-y: auto">
                <cc1:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B200001" />
                <cc1:XUIButton ID="btnDelete" runat="server" CssClass="delete" Text="Delete" OnClick="btnDelete_Click" RoleCode="B200003" />
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="CH_TBLMODELID"
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
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="50%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="50%" HorizontalAlign="Left" />
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
                                            <cc2:ConfirmButtonExtender
                                                ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?" TargetControlID="btnDelete">
                                            </cc2:ConfirmButtonExtender>
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
            </div>
        </div>
        
        <asp:Panel ID="upnDeleteValidate" runat="server" Width="370px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnDeleteValidate" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupDeleteValidate" runat="server" BehaviorID="mdlPopupDeleteValidate"
            PopupControlID="upnDeleteValidate" TargetControlID="btnDeleteValidate"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="upnDeleteValidate"
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
