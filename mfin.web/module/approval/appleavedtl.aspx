<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="appleavedtl.aspx.cs" Inherits="module_approval_appleavedtl" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {

                var $maintab = $("#pages").tabs();
                jsPopUpDate('ctl00_cphbd_txtSubmissionDate');
                jsPopUpDate('ctl00_cphbd_txtStartDate');
                jsPopUpDate('ctl00_cphbd_txtEndDate');

            });
        }
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
            jsPopUpDate('ctl00_cphbd_txtSubmissionDate');
            jsPopUpDate('ctl00_cphbd_txtStartDate');
            jsPopUpDate('ctl00_cphbd_txtEndDate');
        });
    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Approval Leave Detail</span>
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
                            <span>Leave No </span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUILabel ID="lbl_ID" runat="server" DataType="Integer" DBColumnName="ID"
                                BindType="Both" SPParameterName="p_ID" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Employee *</span></td>
                        <td><span>:</span></td>
                        <td width="80%" colspan="2">
                            <asp:UpdatePanel ID="updKaryawanInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtEmployee_code" runat="server" DataType="String" DBColumnName="Employee_Code"
                                        BindType="Both" SPParameterName="p_Employee_Code" MaxLength="10" Width="100px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpKaryawan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" Enabled="false" />
                                    <cc1:XUITextBox ID="txtEmployee_Name" runat="server" DataType="String" DBColumnName="Employee_Name"
                                        BindType="DBToUIOnly" MaxLength="40" Width="200px" Enabled="false"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Submission Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtSubmissionDate" runat="server" DataType="DateTime" DBColumnName="SubmissionDate"
                                BindType="Both" SPParameterName="p_SubmissionDate" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;" Enabled="false">
                            </cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Start Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtStartDate" runat="server" DataType="DateTime" DBColumnName="StartDate" AutoPostBack="true"
                                BindType="Both" SPParameterName="p_StartDate" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;" Enabled="false">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate"
                                ErrorMessage="* Harus diisi" />
                            <cc1:XUICheckBox ID="CheckHAlf" runat="server" Text="Half Day" Visible="false" Enabled="false" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>End Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="20%">
                            <cc1:XUITextBox ID="txtEndDate" runat="server" DataType="DateTime" DBColumnName="EndDate"
                                BindType="Both" SPParameterName="p_EndDate" Width="72px" Format="dd/MM/yyyy" AutoPostBack="true" Enabled="false"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                        </td>
                        <td width="60%" id="tdHalf" runat="server">
                            <asp:Label ID="lblHalf" runat="server" Visible="false" Text="Half Leave Type :"></asp:Label>
                            <cc1:XUIDropDownList ID="ddlHalfType" runat="server" DataType="String" DBColumnName="HalfType"
                                BindType="Both" SPParameterName="p_HalfType" Style="min-width: 50px" Visible="false" Enabled="false">
                                <asp:ListItem Value="0">Pilih</asp:ListItem>
                                <asp:ListItem Value="1">8-12</asp:ListItem>
                                <asp:ListItem Value="2">13-17</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Total Leave</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">

                            <cc1:XUITextBox ID="txtTotDay" runat="server" DataType="String" DBColumnName="TotDay"
                                BindType="Both" SPParameterName="p_TotDay" MaxLength="2" Width="50px" Enabled="false"></cc1:XUITextBox>
                            days                               
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Description</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtDescription" runat="server" DataType="String" DBColumnName="Description"
                                BindType="Both" SPParameterName="p_Description" MaxLength="200" Width="350px" Height="50px" TextMode="MultiLine" Enabled="false"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Alternate</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtpj_pengganti" runat="server" DataType="String" DBColumnName="pj_pengganti"
                                BindType="Both" SPParameterName="p_pj_pengganti" MaxLength="50" Width="150px" Enabled="false"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td width="20%">
                            <span>Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUIDropDownList ID="ddlStatus" runat="server" DataType="String" DBColumnName="Status"
                                BindType="Both" SPParameterName="p_Status" Style="min-width: 250px">
                                <asp:ListItem Value="0">Draft</asp:ListItem>
                                <asp:ListItem Value="1">Approve</asp:ListItem>
                                <asp:ListItem Value="2">Reject</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

