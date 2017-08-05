<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_channelling_report_rptrentalbatch, App_Web_vt76s-wj" title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">

 <script type="text/javascript">
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

        $(document).ready(function() {
            jsPopUpDate('ctl00_cphbd_txtDate');
        });

        function onLoadFunction() {
            jsPopUpDate('ctl00_cphbd_txtDate');
        }
        
    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Batch AR Ledger</span>
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
                            <span>Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtDate" runat="server" BindType="UIToDBOnly" Width="64px"
                                SPParameterName="p_date" DataType="DateTime" Format="dd/MM/yyyy">
                            </cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Printer Option</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboPrinterOption" runat="server" DataType="String" BindType="None"
                                SPParameterName="p_printeroption" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value='1' Selected="True">PDF</asp:ListItem>
                                <asp:ListItem Value='2'>Export to Excel</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-bottom: solid 1px #DEDEDE;" class="style1">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnPrint" runat="server" CssClass="print" Text="Print" OnClick="btnPrint_Click" RoleCode="B200016" />
                        </td>
                        <td  align="right">
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="CODE" 
                                        EmptyDataText="There is no data." AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
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
                                             <asp:BoundField DataField="CODE" HeaderText="Batch Code">
                                                <ItemStyle Width="20%" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DESCS" HeaderText="Decscription">
                                                <ItemStyle Width="70%" HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="DUEDATE" HeaderText="Due Date" DataFormatString="{0:dd/MM/yyyy}">
                                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                            </asp:BoundField>
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

