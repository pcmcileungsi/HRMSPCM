<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="appspddtl.aspx.cs" Inherits="module_approval_appspddtl" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
            jsPopUpDate('ctl00_cphbd_txtSPD_Date');
            jsPopUpDate('ctl00_cphbd_txtDepart_Date');
            jsPopUpDate('ctl00_cphbd_txtArrive_Date');
        });
    </script>
    <div>
        <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="page-0" />
        <asp:HiddenField ID="TabName" runat="server" />
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Approval SPD Detail</span>
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
                            <span>SPD No</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtSPD_No" runat="server" DBColumnName="SPD_No"
                                BindType="Both" SPParameterName="p_SPD_No" Width="72px" Enabled="false">
                            </cc1:XUITextBox>
                            <cc1:XUILabel ID="lbl_ID" runat="server" DataType="Integer" DBColumnName="ID"
                                BindType="Both" SPParameterName="p_ID" Text="0" Visible="false"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Employee</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updEmployeeInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtEmployee_Code" runat="server" DataType="String" DBColumnName="Employee_Code"
                                        BindType="Both" SPParameterName="p_Employee_Code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpEmployee" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" Enabled="false" />
                                    <cc1:XUITextBox ID="txtEmployee_Descs" runat="server" DataType="String" DBColumnName="Employee_DESCS"
                                        BindType="DBToUIOnly" MaxLength="250" Width="320px" Enabled="false"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>SPD Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtSPD_Date" runat="server" DataType="DateTime" DBColumnName="SPD_Date"
                                BindType="Both" SPParameterName="p_SPD_Date" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;" Enabled="false">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvSPD_Date" runat="server" ControlToValidate="txtSPD_Date"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Destination</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtDestination" runat="server" DataType="String" DBColumnName="Destination"
                                BindType="Both" SPParameterName="p_Destination" Width="400px" Enabled="false"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDestination"
                                ErrorMessage="* Harus diisi" />
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
        <asp:Panel ID="pnlshow" runat="server">
            <div id="pages" style="margin: 5px 3px">
                <ul style="font-size: smaller">
                    <li><a href="#page-0"><span>Accomodation</span></a></li>
                    <li><a href="#page-1"><span>Task Description</span></a></li>
                    <li><a href="#page-2"><span>Cost Estimation</span></a></li>
                </ul>
                <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
                    <asp:UpdatePanel ID="pnlBody1" runat="server">
                        <ContentTemplate>
                            <table id="tblBody1_0" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                                <tr>
                                    <td width="20%" valign="top">
                                        <span>Transportation</span>
                                    </td>
                                    <td valign="top">
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2" valign="top">
                                        <cc1:XUIDropDownList ID="ddlTransportation" runat="server" DataType="String" DBColumnName="Transportation"
                                            BindType="Both" SPParameterName="p_Transportation" Style="min-width: 250px" Enabled="false">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1" Text="Company Vehicle"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Personal Vehicle"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Train"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Plane"></asp:ListItem>
                                        </cc1:XUIDropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Vehicle Number</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">
                                        <cc1:XUITextBox ID="txtVehicleNo" runat="server" DataType="String" DBColumnName="VehicleNo"
                                            BindType="Both" SPParameterName="p_VehicleNo" MaxLength="10" Width="150px" Enabled="false"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Driver</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">
                                        <cc1:XUITextBox ID="txtDriver" runat="server" DataType="String" DBColumnName="Driver"
                                            BindType="Both" SPParameterName="p_Driver" MaxLength="100" Width="200px" Enabled="false"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Hotel</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">
                                        <cc1:XUITextBox ID="txtHotel" runat="server" DataType="String" DBColumnName="Hotel"
                                            BindType="Both" SPParameterName="p_Hotel" MaxLength="100" Width="350px" Enabled="false"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Cash Advanced</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">

                                        <cc1:XUITextBox ID="txtCash_Advance" runat="server" DataType="Number" DBColumnName="Cash_Advance"
                                            BindType="Both" SPParameterName="p_Cash_Advance" Width="150px" Format="N2" Enabled="false"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%"><span>Bank Name</span></td>
                                    <td width="1%"><span>:</span></td>
                                    <td width="79%">
                                        <cc1:XUITextBox ID="txtBank_Name" runat="server" DataType="String" DBColumnName="Bank_Name" SPParameterName="p_Bank_Name"
                                            BindType="Both" MaxLength="50" Width="350px" Enabled="false"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%"><span>Account No</span></td>
                                    <td width="1%"><span>:</span></td>
                                    <td width="79%">
                                        <cc1:XUITextBox ID="txtAccount_No" runat="server" DataType="String" DBColumnName="Account_No"
                                            BindType="Both" SPParameterName="p_Account_No" MaxLength="30" Width="150px" Enabled="false">
                                        </cc1:XUITextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%"><span>Account Name</span></td>
                                    <td width="1%"><span>:</span></td>
                                    <td width="79%">
                                        <cc1:XUITextBox ID="txtAccount_Name" runat="server" DataType="String" DBColumnName="Account_Name" SPParameterName="p_Account_Name"
                                            BindType="Both" MaxLength="50" Width="350px" Enabled="false"></cc1:XUITextBox>
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

                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
                    <asp:UpdatePanel ID="UpTask" runat="server" UpdateMode="Always">
                        <ContentTemplate>

                            <asp:GridView ID="grvTask" runat="server" AutoGenerateColumns="False" EmptyDataText="There is no data." DataKeyNames="ID"
                                GridLines="None" AllowPaging="false" CssClass="mGrid"
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
                                    <asp:BoundField DataField="Description_Task" HeaderText="Task Description" SortExpression="Description_Task" />
                                    <asp:BoundField DataField="Depart_Date" HeaderText="Departure Date" SortExpression="Depart_Date" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="Arrive_Date" HeaderText="Arriving Date" SortExpression="Arrive_Date" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="City_Destination" HeaderText="City Destination" SortExpression="City_Destination" />
                                    <asp:BoundField DataField="Contact_Person" HeaderText="Contact Person" SortExpression="Contact_Person" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="grvTask" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
                    <asp:UpdatePanel ID="UpCost" runat="server" UpdateMode="Always">
                        <ContentTemplate>

                            <asp:GridView ID="grvCost" runat="server" AutoGenerateColumns="False" EmptyDataText="There is no data." DataKeyNames="ID"
                                GridLines="None" AllowPaging="false" CssClass="mGrid"
                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" ShowFooter="true">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <span>No</span>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Cost_Code" HeaderText="Code" SortExpression="Cost_Code" HeaderStyle-Width="15%" />
                                    <asp:BoundField DataField="Cost_Description" HeaderText="Description" SortExpression="Cost_Description" HeaderStyle-Width="45%" />
                                    <asp:BoundField DataField="Cost_Value" HeaderText="Cost" SortExpression="Cost_Value" DataFormatString="{0:N2}" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" DataFormatString="{0:N0}" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="Total_Cost" HeaderText="Total" SortExpression="Total_Cost" DataFormatString="{0:N2}" HeaderStyle-Width="28%" ItemStyle-HorizontalAlign="Right" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="grvCost" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </asp:Panel>

    </div>
</asp:Content>

