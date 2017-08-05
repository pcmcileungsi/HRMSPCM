<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="employeedetail.aspx.cs" Inherits="module_master_employeedetail" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {
                var $maintab = $("#pages").tabs();
                jsPopUpDate('ctl00_cphbd_txtEmployee_BirthDate');
                jsPopUpDate('ctl00_cphbd_txtEmployee_JoinDate');
            });
        }
    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Employee Detail</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100051" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr>
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblEmployee_ID" runat="server" DataType="Integer" DBColumnName="Employee_ID"
                                BindType="Both" SPParameterName="p_Employee_ID" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>NIK</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_NIK" runat="server" DataType="String" DBColumnName="Employee_NIK"
                                BindType="Both" SPParameterName="p_Employee_NIK" MaxLength="10" Width="50px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqEmployee_NIK" runat="server" ControlToValidate="txtEmployee_NIK"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Employee Name</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">

                            <cc1:XUITextBox ID="txtEmployee_Name" runat="server" DataType="String" DBColumnName="Employee_Name"
                                BindType="Both" SPParameterName="p_Employee_Name" MaxLength="100" Width="350px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqEmployee_Name" runat="server" ControlToValidate="txtEmployee_Name"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Join Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_JoinDate" runat="server" DataType="DateTime" DBColumnName="Employee_JoinDate"
                                BindType="Both" SPParameterName="p_Employee_JoinDate" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployee_JoinDate"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Religion</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlEmployee_ReligionCode" runat="server" DataType="String" DBColumnName="Employee_ReligionCode"
                                BindType="Both" SPParameterName="p_Employee_ReligionCode" Style="min-width: 250px">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Gender</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboEmployee_Gender" runat="server" DataType="String" DBColumnName="Employee_Gender"
                                BindType="Both" SPParameterName="p_Employee_Gender" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="0" Selected="True" style="display: none;"></asp:ListItem>
                                <asp:ListItem Value="L">Male </asp:ListItem>
                                <asp:ListItem Value="P">Female </asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Birth Place / Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_BirthPlace" runat="server" DataType="String" DBColumnName="Employee_BirthPlace"
                                BindType="Both" SPParameterName="p_Employee_BirthPlace" MaxLength="100" Width="250px"></cc1:XUITextBox>
                            -                                                          
                            <cc1:XUITextBox ID="txtEmployee_BirthDate" runat="server" DataType="DateTime" DBColumnName="Employee_BirthDate"
                                BindType="Both" SPParameterName="p_Employee_BirthDate" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvEmployee_BirthDate" runat="server" ControlToValidate="txtEmployee_BirthDate"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Marital Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="txtEmployee_MaritalStatus" runat="server" DataType="String" DBColumnName="Employee_MaritalStatus"
                                BindType="Both" SPParameterName="p_Employee_MaritalStatus" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="0" Selected="True" style="display: none;"></asp:ListItem>
                                <asp:ListItem Value="1">Single </asp:ListItem>
                                <asp:ListItem Value="2">Marital </asp:ListItem>
                            </cc1:XUIRadioButtonList>

                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Dependent</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_Dependent" runat="server" DataType="String" DBColumnName="Employee_Dependent"
                                BindType="Both" SPParameterName="p_Employee_Dependent" MaxLength="2" Width="50px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Address</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_Address" runat="server" DataType="String" DBColumnName="Employee_Address"
                                BindType="Both" SPParameterName="p_Employee_Address" MaxLength="200" Width="350px" Height="50px" TextMode="MultiLine"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Telp / Hp</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_Telp" runat="server" DataType="String" DBColumnName="Employee_Telp"
                                BindType="Both" SPParameterName="p_Employee_Telp" MaxLength="30" Width="120px"></cc1:XUITextBox>
                            -                                                          
                           <cc1:XUITextBox ID="txtEmployee_Hp" runat="server" DataType="String" DBColumnName="Employee_Hp"
                               BindType="Both" SPParameterName="p_Employee_Hp" MaxLength="30" Width="120px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvtxtEmployee_Hp" runat="server" ControlToValidate="txtEmployee_Hp"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Email</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_Email" runat="server" DataType="String" DBColumnName="Employee_Email"
                                BindType="Both" SPParameterName="p_Employee_Email" MaxLength="200" Width="350px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Branch</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlEmployee_BranchCode" runat="server" DataType="String" DBColumnName="Employee_BranchCode"
                                BindType="Both" SPParameterName="p_Employee_BranchCode" Style="min-width: 250px">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Department</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlEmployee_DeptCode" runat="server" DataType="String" DBColumnName="Employee_DeptCode"
                                BindType="Both" SPParameterName="p_Employee_DeptCode" Style="min-width: 250px">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Grade</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlEmployee_GradeCode" runat="server" DataType="String" DBColumnName="Employee_GradeCode"
                                BindType="Both" SPParameterName="p_Employee_GradeCode" Style="min-width: 250px">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>User</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtUser_ID" runat="server" DataType="String" DBColumnName="User_ID"
                                        BindType="Both" SPParameterName="p_User_ID" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpUser_Click" />
                                    <cc1:XUITextBox ID="txtUser_Name" runat="server" DataType="String" DBColumnName="User_Name" SPParameterName="p_User_Name"
                                        BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Leader</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:UpdatePanel ID="updEmployeeInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtEmployee_LeaderCode" runat="server" DataType="String" DBColumnName="Employee_LeaderCode"
                                        BindType="Both" SPParameterName="p_Employee_LeaderCode" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpEmployee" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpEmployee_Click" />
                                    <cc1:XUITextBox ID="txtEmployee_LeaderName" runat="server" DataType="String" DBColumnName="Employee_LeaderName" SPParameterName="p_Employee_LeaderName"
                                        BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Leader 2</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:UpdatePanel ID="updEmployee2Info" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtEmployee_LeaderCode2" runat="server" DataType="String" DBColumnName="Employee_LeaderCode2"
                                        BindType="Both" SPParameterName="p_Employee_LeaderCode2" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpEmployee2" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpEmployee2_Click" />
                                    <cc1:XUITextBox ID="txtEmployee_LeaderName2" runat="server" DataType="String" DBColumnName="Employee_LeaderName2"
                                        BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlEmployee_Status" runat="server" DataType="String" DBColumnName="Employee_Status"
                                BindType="Both" SPParameterName="p_Employee_Status" Style="min-width: 250px">
                                <asp:ListItem Value="1">Active</asp:ListItem>
                                <asp:ListItem Value="2">Not Active</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%-- Lookup Leader 1--%>
    <asp:Panel ID="pnlPopUpGetUser" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetUser" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetUser" runat="server" BehaviorID="mdlPopupGetUser"
            PopupControlID="pnlPopupGetUser" TargetControlID="btnShowPopupGetUser"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender2" runat="server" TargetControlID="pnlPopUpGetUser"
            DragHandleID="pnlPopupGetUserHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetUserHeader" runat="server" CssClass="header">
                <asp:Label ID="Label2" runat="server" CssClass="msg" Text="Leader 1" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetUser').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetUser" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchUser" runat="server" DefaultButton="btnSearchUser">
                            <asp:TextBox ID="txtSearchUser" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchUser" OnClick="btnSearchUser_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListUser" runat="server" OnSelectedIndexChanged="gvwListUser_SelectedIndexChanged"
                            DataKeyNames="USER_ID,User_Name" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListUser_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListUser_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="USER_ID" HeaderText="USER ID" SortExpression="USER_ID" />
                                <asp:BoundField DataField="User_Name" HeaderText="User Name" SortExpression="User_Name" />
                                <asp:BoundField DataField="RoleDescs" HeaderText="ROLE" SortExpression="RoleDescs" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseUser" OnClientClick="$find('mdlPopupGetUser').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Leader 1--%>
    <%-- Lookup Leader 1--%>
    <asp:Panel ID="pnlPopUpGetEmployee" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetEmployee" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetEmployee" runat="server" BehaviorID="mdlPopupGetEmployee"
            PopupControlID="pnlPopupGetEmployee" TargetControlID="btnShowPopupGetEmployee"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender16" runat="server" TargetControlID="pnlPopUpGetEmployee"
            DragHandleID="pnlPopupGetEmployeeHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetEmployeeHeader" runat="server" CssClass="header">
                <asp:Label ID="Label15" runat="server" CssClass="msg" Text="Leader 1" />
                <asp:LinkButton ID="LinkButton15" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetEmployee').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetEmployee" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchEmployee" runat="server" DefaultButton="btnSearchEmployee">
                            <asp:TextBox ID="txtSearchEmployee" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchEmployee" OnClick="btnSearchEmployee_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListEmployee" runat="server" OnSelectedIndexChanged="gvwListEmployee_SelectedIndexChanged"
                            DataKeyNames="Employee_NIK,Employee_Name" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListEmployee_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListEmployee_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="Employee_NIK" HeaderText="NIK" SortExpression="Employee_NIK" />
                                <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                <asp:BoundField DataField="BranchName" HeaderText="Branch" SortExpression="BranchName" />
                                <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                <asp:BoundField DataField="GRADEName" HeaderText="Grade" SortExpression="GRADEName" />
                                <asp:BoundField DataField="Employee_Hp" HeaderText="Hp" SortExpression="Employee_Hp" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseEmployee" OnClientClick="$find('mdlPopupGetEmployee').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Leader 1--%>
    <%-- Lookup Leader 2--%>
    <asp:Panel ID="pnlPopupGetEmployee2" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetEmployee2" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetEmployee2" runat="server" BehaviorID="mdlPopupGetEmployee2"
            PopupControlID="pnlPopupGetEmployee2" TargetControlID="btnShowPopupGetEmployee2"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnlPopupGetEmployee2"
            DragHandleID="pnlPopupGetEmployee2Header" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetEmployee2Header" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="Leader 2" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetEmployee2').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetEmployee2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchEmployee2" runat="server" DefaultButton="btnSearchEmployee2">
                            <asp:TextBox ID="txtSearchEmployee2" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchEmployee2" OnClick="btnSearchEmployee2_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListEmployee2" runat="server" OnSelectedIndexChanged="gvwListEmployee2_SelectedIndexChanged"
                            DataKeyNames="Employee_NIK,Employee_Name" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListEmployee2_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListEmployee2_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="Employee_NIK" HeaderText="NIK" SortExpression="Employee_NIK" />
                                <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                <asp:BoundField DataField="BranchName" HeaderText="Branch" SortExpression="BranchName" />
                                <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                <asp:BoundField DataField="GRADEName" HeaderText="Grade" SortExpression="GRADEName" />
                                <asp:BoundField DataField="Employee_Hp" HeaderText="Hp" SortExpression="Employee_Hp" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseEmployee2" OnClientClick="$find('mdlPopupGetEmployee2').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Leader 2--%>
</asp:Content>

