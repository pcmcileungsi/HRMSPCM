<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="lstblleaveimport.aspx.cs" Inherits="module_master_lstblleaveimport" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {
                var $maintab = $("#pages").tabs();
                jsPopUpDate('ctl00_cphbd_txtStartDate');
                jsPopUpDate('ctl00_cphbd_txtEndDate');
            });
        }
    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Import Leave Quota</span>
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
                <table id="tblBody" cellpadding="4px" cellspacing="0px" border="0px">
                    <tr>
                        <td>
                            <span>Start Date :</span>
                        </td>
                        <td>
                            <cc1:XUITextBox ID="txtStartDate" runat="server" DataType="String" DBColumnName="StartDate"
                                BindType="Both" SPParameterName="p_StartDate" Style="width: 100px;">
                            </cc1:XUITextBox>
                        </td>
                        <td>
                            <span>End Date :</span>
                        </td>
                        <td>
                            <cc1:XUITextBox ID="txtEndDate" runat="server" DataType="String" DBColumnName="EndDate"
                                BindType="Both" SPParameterName="p_EndDate" Style="width: 100px;">
                            </cc1:XUITextBox>
                        </td>
                        <td>
                            <cc1:XUIButton ID="btnDownloadTemplate" runat="server" CssClass="dl" Text="Export" OnClick="btnDownloadTemplate_OnClick" RoleCode="B100056" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:FileUpload ID="FileUploadControl" runat="server" />
                            <cc1:XUIButton RoleCode="B100056" ID="btnUpload" runat="server" CssClass="add" Text="Upload Data" OnClick="btnUpload_Click" Width="100px" />
                            <asp:Button ID="btnLog" runat="server" Text="Log" CssClass="print" OnClick="btnLog_Click" Style="width: auto;" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">

                            <cc1:XUIButton RoleCode="B100056" ID="btnProcess" runat="server" CssClass="post" Text="Process Uploaded Data" OnClick="btnProcess_Click" Width="190px" />
                            <cc1:XUIButton RoleCode="B100056" ID="btnDeleteUpload" runat="server" CssClass="void" Text="Delete Uploaded Data" OnClick="btnDeleteUpload_Click" />
                            <asp:TextBox ID="txtSearchListUpload" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchListUpload" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchListUpload_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:UpdatePanel ID="updListUpload" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gvwListUpload" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="There is no data." AllowPaging="True" PageSize="25" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                        AlternatingRowStyle-CssClass="alt" EnableModelValidation="True" Width="100%">
                                        <AlternatingRowStyle CssClass="alt" />
                                        <Columns>
                                            <asp:BoundField DataField="Employee_NIK" HeaderText="NIK" SortExpression="Employee_NIK" />
                                            <asp:BoundField DataField="Employee_Name" HeaderText="Name" SortExpression="Employee_Name" />    
                                            <asp:BoundField DataField="BranchName" HeaderText="Branch" SortExpression="BranchName" />    
                                            <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />                                           
                                            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:dd-MM-yyyy}" />
                                            <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString="{0:dd-MM-yyyy}" />
                                            <asp:BoundField DataField="Quota" HeaderText="Quota" SortExpression="Quota" />
                                        </Columns>
                                        <PagerStyle CssClass="pgr" />
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearchListUpload" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnProcess" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="btnDeleteUpload" EventName="Click" />
                                    <asp:PostBackTrigger ControlID="btnUpload" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnDownloadTemplate" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>

