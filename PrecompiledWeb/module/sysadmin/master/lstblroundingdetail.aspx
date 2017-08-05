<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_sysadmin_master_lstblroundingdetail, App_Web_ptzw034j" title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Numeric Rounding</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B000504" />
                </td>
            </tr>
        </table>
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
                            <cc1:XUILabel ID="lblLSTBLROUNDINGID" runat="server" DataType="Integer" DBColumnName="LS_TBLROUNDINGID"
                                BindType="Both" SPParameterName="p_ls_tblroundingid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Currency</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlCurrency" runat="server" DataType="String" DBColumnName="CURRENCY"
                                BindType="Both" SPParameterName="p_currency">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" valign="top">
                            <span>Type</span>
                        </td>
                        <td valign="top">
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboRoundType" runat="server" DataType="String" DBColumnName="ROUND_TYPE"
                                BindType="Both" SPParameterName="p_round_type" RepeatDirection="Horizontal" RepeatLayout="Flow" >
                                <asp:ListItem Selected="True" Value="0" style="display:none"></asp:ListItem>
                                <asp:ListItem Value="1">Round Up</asp:ListItem>
                                <asp:ListItem Value="2">Round Down</asp:ListItem>   
                                <asp:ListItem Value="3">Rounding</asp:ListItem>      
                            </cc1:XUIRadioButtonList>    
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" valign="top">
                            <span>Facility</span>
                        </td>
                        <td valign="top">
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboModule" runat="server" DataType="String" DBColumnName="MODULE"
                                BindType="Both" SPParameterName="p_module" RepeatDirection="Horizontal" RepeatLayout="Flow" >
                                <asp:ListItem Selected="True" Value="0" style="display:none"></asp:ListItem>
                                <asp:ListItem Value="1">Leasing</asp:ListItem>
                                <asp:ListItem Value="2">Consumer Finance</asp:ListItem>   
                                <asp:ListItem Value="3">IMBT</asp:ListItem>
                                <asp:ListItem Value="4">Murabahah</asp:ListItem>
                            </cc1:XUIRadioButtonList>    
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Value</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlRoundTo" runat="server" DataType="Number" Format="N2" DBColumnName="ROUND_TO"
                                BindType="Both" SPParameterName="p_round_to" >
                                <asp:ListItem Value="0.01">0.01</asp:ListItem>
                                <asp:ListItem Value="0.10">0.10</asp:ListItem>   
                                 <asp:ListItem Value="0.50">0.50</asp:ListItem>   
                                <asp:ListItem Value="1">1.00</asp:ListItem>      
                                <asp:ListItem Value="10">10.00</asp:ListItem>
                                <asp:ListItem Value="100">100.00</asp:ListItem>   
                                <asp:ListItem Value="1000">1000.00</asp:ListItem>
                                <asp:ListItem Value="10000">10000.00</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

