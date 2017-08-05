<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="usergroupdetail.aspx.cs" 
    Inherits="module_sysadmin_usergroupdetail" Title="Untitled Page" %>

    
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
                    <span class="search-header">User Metrics</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B000512" />
                </td>
            </tr>
        </table>
        <div id="pages" style="margin: 5px 3px">
            <ul style="font-size: smaller">
                <li><a href="#page-0"><span>Info</span></a></li>
                <li><a href="#page-1"><span>User Role</span></a></li>
            </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <asp:UpdatePanel ID="pnlBody" runat="server">
                <ContentTemplate>
                    <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                        <tr style="display: none">
                            <td width="20%">
                                <span>Usergroup</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUILabel ID="lblUSERGROUPID" runat="server" DataType="Integer" DBColumnName="USERGROUPID"
                                    BindType="Both" SPParameterName="p_usergroupid" Text="0"></cc1:XUILabel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Usergroup</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtUSERGROUP" runat="server" DataType="String" DBColumnName="USERGROUP"
                                    BindType="Both" SPParameterName="p_usergroup" MaxLength="10" Width="80px"></cc1:XUITextBox>
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
                                <cc1:XUITextBox ID="txtSTATUS" runat="server" DataType="String" DBColumnName="USERGROUPDESC"
                                    BindType="Both" SPParameterName="p_usergroupdesc" MaxLength="40" Width="320px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table width="100%">
                <tr>
                    <td align="right">
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" CssClass="search" OnClick="btnSearch_Click" Text="Search" />
                        
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="MODULE_ID, ROLE_ACCESS, ROLE_ADD, ROLE_EDIT, ROLE_DELETE, ROLE_PRINT, ROLE_APPROVE"
                        OnSelectedIndexChanged="gvwList_SelectedIndexChanged" EmptyDataText="There is no data."
                        AllowPaging="false"
                        OnRowDataBound="gvwList_RowDataBound" OnRowCreated="gvwList_RowCreated" 
                        GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt">
                        <Columns>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    <span>No</span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="MODULE_NAME" HeaderText="Module Name">
                                <ItemStyle Width="52%" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Access">
                                <ItemStyle Width="8%" HorizontalAlign="Center"  />
                                <HeaderTemplate>
                                   <asp:CheckBox ID="chbAccessAll" runat="server" Text="Access" TextAlign="Left" 
                                    OnCheckedChanged="chbAccessAll_CheckedChanged" AutoPostBack="true" /> 
                                </HeaderTemplate>
                                <ItemTemplate>
                                <cc1:XUICheckBox ID="chkAccess" runat="server"  
                                        SPParameterName="p_allowacc" >
                                    </cc1:XUICheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="New">
                                <ItemStyle Width="8%" HorizontalAlign="Center"  />
                                <HeaderTemplate>
                                   <asp:CheckBox ID="chbNewAll" runat="server" Text="New" TextAlign="Left" 
                                    OnCheckedChanged="chbNewAll_CheckedChanged" AutoPostBack="true" /> 
                                </HeaderTemplate>
                                <ItemTemplate>                                    
                                    <cc1:XUICheckBox ID="chkNew" runat="server"
                                        SPParameterName="p_allownew">
                                    </cc1:XUICheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemStyle Width="8%" HorizontalAlign="Center"  />
                                <HeaderTemplate>
                                   <asp:CheckBox ID="chbEditAll" runat="server" Text="Edit" TextAlign="Left" 
                                    OnCheckedChanged="chbEditAll_CheckedChanged" AutoPostBack="true" /> 
                                </HeaderTemplate>
                                <ItemTemplate>                                    
                                    <cc1:XUICheckBox ID="chkEdit" runat="server"
                                        SPParameterName="p_allowedit" >
                                    </cc1:XUICheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemStyle Width="8%" HorizontalAlign="Center"  />
                                <HeaderTemplate>
                                   <asp:CheckBox ID="chbDeleteAll" runat="server" Text="Delete" TextAlign="Left" 
                                    OnCheckedChanged="chbDeleteAll_CheckedChanged" AutoPostBack="true" /> 
                                </HeaderTemplate>
                                <ItemTemplate>                                    
                                    <cc1:XUICheckBox ID="chkDelete" runat="server"
                                        SPParameterName="p_allowdel" >
                                    </cc1:XUICheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Print">
                                <ItemStyle Width="8%" HorizontalAlign="Center"  />
                                <HeaderTemplate>
                                   <asp:CheckBox ID="chbPrintAll" runat="server" Text="Print" TextAlign="Left"
                                    OnCheckedChanged="chbPrintAll_CheckedChanged" AutoPostBack="true" /> 
                                </HeaderTemplate>
                                <ItemTemplate>                                    
                                    <cc1:XUICheckBox ID="chkPrint" runat="server"
                                        SPParameterName="p_allowprint">
                                    </cc1:XUICheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Approve" >
                                <ItemStyle Width="8%" HorizontalAlign="Center" />
                                <HeaderTemplate>
                                   <asp:CheckBox ID="chbApproveAll" runat="server" Text="Approve" TextAlign="Left" 
                                    OnCheckedChanged="chbApproveAll_CheckedChanged" AutoPostBack="true" /> 
                                </HeaderTemplate>
                                <ItemTemplate>                                    
                                    <cc1:XUICheckBox ID="chkAppr" runat="server"
                                        SPParameterName="p_allowappr" >
                                    </cc1:XUICheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        </div>
    </div>
</asp:Content>
