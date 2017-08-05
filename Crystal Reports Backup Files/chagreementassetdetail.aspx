<%@ Page Title="" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true"
    CodeFile="chagreementassetdetail.aspx.cs" Inherits="module_channelling_transaction_chagreementassetdetail" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Collateral</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton RoleCode="B200012" ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" />
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
                            <cc1:XUILabel ID="lblLSASSETVEHICLEID" runat="server" DataType="Integer" DBColumnName="LS_ASSETVEHICLEID"
                                BindType="Both" SPParameterName="p_ls_assetvehicleid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Applic. No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="txtLSAGREE" runat="server" Enabled="false" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Lessee</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="txtLessee" runat="server" Enabled="false" Width="160px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Leased Amount</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="txtLeasedAmount" runat="server" MaxLength="21" Width="100px" style="text-align:right;" Enabled="false" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Asset Description</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtDescription" runat="server" DataType="String" DBColumnName="DESCRIPTION"
                                BindType="Both" SPParameterName="p_description" MaxLength="40" Width="320px" ></cc1:XUITextBox>
                        </td>
                    </tr>
                    <%--<tr>
                        <td width="20%">
                            <span>Type</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlType" runat="server" DataType="String" DBColumnName="ASSETTYPE"
                                    BindType="Both" SPParameterName="p_type"></cc1:XUIDropDownList>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td width="20%">
                            <span>Merk</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:UpdatePanel ID="updMakeInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtMerk" runat="server" DataType="String" DBColumnName="MERK"
                                        BindType="Both" SPParameterName="p_merk"  style="display:none;">
                                    </cc1:XUITextBox>    
                                    <cc1:XUILabel ID="lblMerk" ReadOnly="true" runat="server" DataType="String" DBColumnName="MERK"
                                        BindType="DBToUIOnly" SPParameterName="p_merk"></cc1:XUILabel>
                                    <asp:ImageButton ID="btnLookUpMake" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                            ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpMake_Click" />                                    
                                    <cc1:XUITextBox ID="txtMerkDesc" runat="server" ReadOnly="true" DataType="String" 
                                        DBColumnName="MERKNAME" BindType="DBToUIOnly" MaxLength="40" Width="320px"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td width="20%">
                            <span>Year</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtYear" runat="server" DataType="String" DBColumnName="YEAR"
                                BindType="Both" SPParameterName="p_year" MaxLength="4" Width="32px" ></cc1:XUITextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td width="20%">
                            <span>Serial/Chasis No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSerialNo" runat="server" DataType="String" DBColumnName="SERIALNO"
                                BindType="Both" SPParameterName="p_serialno" MaxLength="30" Width="240px" ></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Engine No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEngineNo" runat="server" DataType="String" DBColumnName="ENGINENO"
                                BindType="Both" SPParameterName="p_engineno" MaxLength="30" Width="240px" ></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Unit Price</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtCostPrice" runat="server" DataType="Number" Format="N0" DBColumnName="COSTPRICE"
                                BindType="Both" SPParameterName="p_costprice" MaxLength="18" Width="144px" Text="0" ></cc1:XUITextBox>
                        </td>
                    </tr>
                    <%--<tr>
                        <td width="20%">
                            <span>FA Type</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlTypeCol" runat="server" DataType="String" DBColumnName="TYPECOL"
                                BindType="Both" SPParameterName="p_typecol">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td width="20%">
                            <span>Invoice No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtInvoice" runat="server" DataType="String" DBColumnName="INVOICE"
                                BindType="Both" SPParameterName="p_invoice" MaxLength="30" Width="240px" ></cc1:XUITextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td width="20%">
                            <span>Plat No.</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtPolice" runat="server" DataType="String" DBColumnName="POLICE"
                                BindType="Both" SPParameterName="p_police" MaxLength="10" Width="80px" ></cc1:XUITextBox>
                        </td>
                    </tr>
                    <%--<tr>
                        <td width="20%">
                            <span>Condition</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboCondition" runat="server" DataType="String" DBColumnName="CONDITION"
                                BindType="Both" SPParameterName="p_condition" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                style="display:none;">
                                <asp:ListItem Value="1">New</asp:ListItem>
                                <asp:ListItem Value="2">Used</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                            <cc1:XUILabel ID="txtCondition" runat="server" DataType="String" BindType="DBToUIOnly"
                                DBColumnName="CONDITIONS" />
                            <cc1:XUILabel ID="txtConditionValue" runat="server" DataType="Number" BindType="UIToDBOnly"
                                SPParameterName="p_condition" style="display:none;"/>
                        </td>
                    </tr>--%>
                    <tr>
                        <td width="20%">
                            <span>Color</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtColor" runat="server" DataType="String" DBColumnName="COLOR"
                                BindType="Both" SPParameterName="p_color" MaxLength="20" Width="160px" ></cc1:XUITextBox>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
