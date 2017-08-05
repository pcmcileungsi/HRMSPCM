<%@ page title="" language="C#" masterpagefile="~/mfin2.master" autoeventwireup="true" inherits="module_channelling_transaction_chbatchdetail, App_Web_pt4ne0vj" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">

    <script type="text/javascript">
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            jsPopUpDate("ctl00_cphbd_txtDueDate");
        });

        function onLoadFunction() {
            jsPopUpDate('ctl00_cphbd_txtDueDate');

        }

        var allCheckBoxSelector = '#<%=gvwAgreement.ClientID%> input[id*="chbSelectAll"]:checkbox';
        var checkBoxSelector = '#<%=gvwAgreement.ClientID%> input[id*="chbSelect"]:checkbox';

        var allCheckBoxSelector1 = '#<%=gvwChanneling.ClientID%> input[id*="chbSelectAll"]:checkbox';
        var checkBoxSelector1 = '#<%=gvwChanneling.ClientID%> input[id*="chbSelect"]:checkbox';

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


        function ToggleCheckUncheckAllOptionAsNeeded1() {
            var totalCheckboxes1 = $(checkBoxSelector1),
                checkedCheckboxes1 = totalCheckboxes1.filter(":checked"),
                noCheckboxesAreChecked1 = (checkedCheckboxes1.length === 0),
                allCheckboxesAreChecked1 = (totalCheckboxes1.length === checkedCheckboxes1.length);

            $(allCheckBoxSelector1).attr('checked', allCheckboxesAreChecked1);
        }

        $(document).ready(function() {
            $(allCheckBoxSelector1).live('click', function() {
                $(checkBoxSelector1).attr('checked', $(this).is(':checked'));

                ToggleCheckUncheckAllOptionAsNeeded1();
            });

            $(checkBoxSelector1).live('click', ToggleCheckUncheckAllOptionAsNeeded1);

            ToggleCheckUncheckAllOptionAsNeeded1();
        });
        
    </script>
    
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td style="border-bottom: solid 1px #dedede">
                <span class="search-header">Batch Detail</span>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: text-bottom;">
                <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                    Text="Back" OnClick="btnBack_Click" />
                <%--<asp:Button ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" />--%>
            </td>
        </tr>
    </table>
    
        <%--<asp:UpdatePanel ID="pnlUp" runat="server">
            <ContentTemplate>
                <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
                    <tr>
                        <td style="border-bottom: solid 1px #dedede">
                            <span class="search-header">Batch Detail</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                                Text="Back" OnClick="btnBack_Click" />
                        </td>
                    </tr>
                </table>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr style="display: none">
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblLSBUYAGREEMENTID" runat="server" DataType="Integer" DBColumnName="LSBUYAGREEMENTID"
                                BindType="Both" SPParameterName="p_ls_buyagreementid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>--%>
        
        
        <div id="pages" style="margin: 5px 3px">
            <ul style="font-size: smaller">
                <li><a href="#page-0"><span>Batch</span></a></li>
                <li><a href="#page-1"><span>Agreement</span></a></li>
            </ul>
            <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow-y: auto">
                <asp:UpdatePanel ID="pnlBatch" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--<table id="tblBatch" cellpadding="1px" cellspacing="0px" class="detail-header-table">--%>
                        <table id="tblBatch" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td>
                                    <cc1:XUIButton RoleCode="B200019" ID="btnSaveAdd" runat="server" CssClass="save" Text="Save"
                                        OnClick="btnSaveAdd_Click" />
                                    <cc1:XUIButton RoleCode="B200020" ID="btnSaveEdit" runat="server" CssClass="save" Text="Save"
                                        OnClick="btnSaveEdit_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="border-top: solid 1px black;">
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td width="20%">
                                    <span>ID</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUILabel ID="lblLSBUYAGREEMENTID" runat="server" DataType="Integer" DBColumnName="LS_BUYAGREEMENTID"
                                        BindType="Both" SPParameterName="p_ls_buyagreementid" Text="0"></cc1:XUILabel>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Batch Code</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="79%">
                                    <cc1:XUITextBox ID="txtCode" runat="server" DataType="String" DBColumnName="CODE"
                                        BindType="Both" SPParameterName="p_code" MaxLength="10" Width="80px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Description</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtDescription" runat="server" DataType="String" DBColumnName="DESCS"
                                        BindType="Both" SPParameterName="p_descs" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="20%">
                                    <span>Due Date</span>
                                </td>
                                <td width="1%">
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtDueDate" runat="server" DataType="DateTime" DBColumnName="DUEDATE"
                                        BindType="Both" SPParameterName="p_duedate" MaxLength="8" Width="68px" Format="dd/MM/yyyy"
                                        style="text-align:center;">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
                color: #000; height: 430px; overflow-y: auto">
                <asp:UpdatePanel ID="pnlAgreement" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--<table id="tblAgreement" cellpadding="3px" cellspacing="0px" class="detail-header-table">--%>
                        <table id="tblAgreement" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="5" style="border-bottom: solid 1px #dedede">
                                    <asp:TextBox ID="txtCodeBatch" runat="server" Enabled="false"></asp:TextBox>
                                    <asp:TextBox ID="txtDesc" runat="server" Enabled="false" Width="320px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td width="10%"><span>Agreement</span></td>
                                <td width="40%" align="right">
                                    <asp:Panel ID="pnlSearchAgreement" runat="server" DefaultButton="btnSearchAgreement">
                                        <asp:TextBox ID="txtSearchAgreement" runat="server" />
                                        <asp:Button ID="btnSearchAgreement" runat="server" CssClass="search" Text="Search"
                                            OnClick="btnSearchAgreement_Click" />
                                    </asp:Panel>
                                </td>
                                <td>
                                  <span></span>
                                </td>
                                <td width="10%"><span>Trade Channeling</span></td>
                                <td width="40%" align="right">
                                    <asp:Panel ID="pnlSearchChanneling" runat="server" DefaultButton="btnSearchChanneling">
                                        <asp:TextBox ID="txtSearchChanneling" runat="server"  />
                                        <asp:Button ID="btnSearchChanneling" runat="server" CssClass="search" Text="Search"
                                            OnClick="btnSearchChanneling_Click" />
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td colspan="2">
                                    <asp:GridView ID="gvwAgreement" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="LS_AGREEMENTID, LSAGREE, NAME, LSPERIOD, EFFRATE, AMTLEASE, RENTAL"
                                        AllowPaging="true" PageSize="25" EmptyDataText="There is no data." GridLines="None"
                                        CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                        OnPageIndexChanging="gvwAgreement_PageIndexChanging">
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
                                            <asp:BoundField DataField="LSAGREE" HeaderText="Agreement">
                                                <ItemStyle Width="25%" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NAME" HeaderText="Name">
                                                <ItemStyle Width="40%" HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="AMTLEASE" HeaderText="Amount" DataFormatString="{0:N2}">
                                                <ItemStyle Width="35%" HorizontalAlign="Right" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                                <td>
                                    
                                    <asp:Button ID="btnAddToACAdd" RoleCode="B200019" runat="server" Text=">>" Style="border: solid 1px #ccc"
                                        OnClick="btnAddToACAdd_Click" />
                                    <br />
                                    <asp:Button ID="btnRemoveFromACAdd" RoleCode="B200019" runat="server" Text="<<" Style="border: solid 1px #ccc"
                                        OnClick="btnRemoveFromACAdd_Click" />
                                        
                                    <asp:Button ID="btnAddToACEdit" RoleCode="B200020" runat="server" Text=">>" Style="border: solid 1px #ccc"
                                        OnClick="btnAddToACEdit_Click" />
                                    <br />
                                    <asp:Button ID="btnRemoveFromACEdit" RoleCode="B200020" runat="server" Text="<<" Style="border: solid 1px #ccc"
                                        OnClick="btnRemoveFromACEdit_Click" />
                                </td>
                                <td colspan="2">
                                    <asp:GridView ID="gvwChanneling" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="LS_BUYAGREEDTLID" OnPageIndexChanging="gvwChanneling_PageIndexChanging"
                                        AllowPaging="true" PageSize="25" EmptyDataText="There is no data." GridLines="None"
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
                                            <asp:BoundField DataField="LSAGREE" HeaderText="Agreement">
                                                <ItemStyle Width="25%" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NAME" HeaderText="Name">
                                                <ItemStyle Width="40%" HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="PLAFOND" HeaderText="Plafond" DataFormatString="{0:N2}">
                                                <ItemStyle Width="35%" HorizontalAlign="Right" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                   
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                     <triggers>
                         <asp:AsyncPostBackTrigger ControlID="btnAddToACAdd" EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="btnAddToACEdit" EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="btnSearchAgreement" EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="btnSearchChanneling" EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="btnRemoveFromACAdd" EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="btnRemoveFromACEdit" EventName="Click" />
                     </triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    
</asp:Content>

