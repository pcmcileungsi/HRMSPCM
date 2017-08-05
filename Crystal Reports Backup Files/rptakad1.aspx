<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="rptakad1.aspx.cs"
    Inherits="module_channelling_report_rptakad1" Title="Untitled Page" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

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
            jsPopUpDate("ctl00_cphbd_txtTglSurat");
        });
    </script>

    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Perjanjian Sewa Guna Usaha</span>
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
                            <span>Tanggal Surat</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTglSurat" runat="server" DataType="DateTime" BindType="UIToDBOnly"
                                Format="dd/MM/yyyy" SPParameterName="p_tglsurat" MaxLength="10" Width="64px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Signer TIFA</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSignerTifa" runat="server" DataType="String" DBColumnName="SIGNERTIFA"
                                BindType="UIToDBOnly" SPParameterName="p_signertifa" MaxLength="60" Width="240px" 
                                CausesValidation="false">
                            </cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Saksi1</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSaksi1" runat="server" DataType="String" DBColumnName="SAKSI1"
                                BindType="UIToDBOnly" SPParameterName="p_saksi1" MaxLength="60" Width="240px" 
                                CausesValidation="false">
                            </cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Saksi 2</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSaksi2" runat="server" DataType="String" DBColumnName="SAKSI2"
                                BindType="UIToDBOnly" SPParameterName="p_saksi2" MaxLength="60" Width="240px" 
                                CausesValidation="false">
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
                                <asp:ListItem Value='1' Selected="True">Printer</asp:ListItem>
                               <%-- <asp:ListItem Value='2'>Preview</asp:ListItem>
                                <asp:ListItem Value='3'>Export to Excel</asp:ListItem>--%>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-bottom: solid 1px #DEDEDE;" class="style1">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnPrint" runat="server" CssClass="print" Text="Print" OnClick="btnPrint_Click"
                                Style="width: auto;" RoleCode="B200017" />
                            <%--<asp:Button ID="btnPrintAll" runat="server" CssClass="print" Text="PrintAll" OnClick="btnPrintAll_Click"
                                Style="width: auto;" />--%>
                        </td>
                        <td colspan="2" align="right">
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="LS_AGREEMENTID, LSAGREE, STATUS, APPLSTYPE"
                                        EmptyDataText="There is no data." AllowPaging="true" OnPageIndexChanging="gvwList_PageIndexChanging"
                                        PageSize="30" OnRowCreated="gvwList_RowCreated" GridLines="None" CssClass="mGrid"
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
                                                        <%--<span><asp:CheckBox ID="chbSelectAll" runat="server" CssClass="set" Text="" AutoPostBack="true" 
                                                        OnCheckedChanged="btnSelectAll_Click"/></span>--%>
                                                    <asp:CheckBox ID="chbSelectAll" runat="server" />    
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chbSelect" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="LSAGREE" HeaderText="Lease Agreement">
                                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CURRENCY" HeaderText="Currency">
                                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NAME" HeaderText="Name">
                                                <ItemStyle Width="75%" HorizontalAlign="Left" />
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
