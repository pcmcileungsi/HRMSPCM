<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userroledetail.aspx.cs" Inherits="module_sysadmin_userroledetail" MasterPageFile="~/mfin.master" %>

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
    </script>

    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">User Role</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100003" />
                </td>
            </tr>
            
        </table>
        <div id="pages" style="margin: 5px 3px">
            <ul style="font-size: smaller">
                <li><a href="#page-0"><span>User Role</span></a></li>
            </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <asp:UpdatePanel ID="pnlBody" runat="server">
                <ContentTemplate>
                    <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                        <tr>
                            <td width="20%">
                                <span>User ID</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUILabel ID="txtUSER_ID" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUILabel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Role</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIDropDownList ID="ddlCCODE" runat="server" BindType="Both" DataType="String" 
                                    DBColumnName="C_CODE" SPParameterName="p_c_code"></cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <%--<tr>
                            <td width="20%">
                                <span>DIVISI</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIDropDownList ID='ddlDIVISI' runat="server" BindType="Both" 
                                    DataType="String" DBColumnName="DIVISI" SPParameterName="p_divisi"></cc1:XUIDropDownList>
                            </td>
                        </tr>--%>
                        <tr>
                            <td width="20%">
                                <span>Group</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIDropDownList ID="ddlUSERGROUP" runat="server" BindType="Both" 
                                    DataType="String" DBColumnName="GROUP_CODE" SPParameterName="p_group_code">
                                </cc1:XUIDropDownList>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

