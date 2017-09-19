<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="shiftlist.aspx.cs" Inherits="module_transaksi_shiftlist" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 87px;
        }
        .auto-style2 {
            width: 94px;
        }
        .auto-style3 {
            width: 85px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <div style="padding: 7px; width: 100%; margin: 0 auto;">
        <table style="width: 100%">
            <tr>
                <td width="20%">Bulan/Tahun
                </td>
                 <td>
                            <span>:</span>
                        </td>
                <td width="30%">
                    <asp:DropDownList ID="ddlMonth" runat="server" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="01">January</asp:ListItem>
                        <asp:ListItem Value="02">February</asp:ListItem>
                        <asp:ListItem Value="03">March</asp:ListItem>
                        <asp:ListItem Value="04">April</asp:ListItem>
                        <asp:ListItem Value="05">May</asp:ListItem>
                        <asp:ListItem Value="06">June</asp:ListItem>
                        <asp:ListItem Value="07">July</asp:ListItem>
                        <asp:ListItem Value="08">August</asp:ListItem>
                        <asp:ListItem Value="09">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp
                     <asp:DropDownList ID="ddlYear" runat="server" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
                <td width="80%">                    
                  
                </td>                             
            </tr>            
             <tr>
                 <td width="20%">Unit kerja
                </td>
                  <td>
                            <span>:</span>
                        </td>
                <td colspan="2">
                      <asp:DropDownList ID="ddlUnitKerja" runat="server" Width="30%" OnSelectedIndexChanged="ddlUnitKerja_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
					<asp:RequiredFieldValidator ID="ReqUnitKerja" runat="server" ControlToValidate="ddlUnitKerja"
                         ErrorMessage="* Harus Diisi" />
                </td>
            </tr>
            <tr>
                 <td width="20%">Status Shift
                </td>
                 <td>
                            <span>:</span>
                        </td>
                <td colspan="2">  
                   <asp:DropDownList ID="ddlStatus" runat="server" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">Aktif</asp:ListItem>
                        <asp:ListItem Value="2">Tidak Aktif</asp:ListItem>                       
                    </asp:DropDownList>                 
                </td>
            </tr>
           
        </table>
    </div>

     <table style="width: 25%">
         <tr>
		  <td align="center" >
                  <asp:Button ID="btnAdd" CssClass="add" Text="Add" runat="server" OnClick="btnAdd_Click" Visible="false"></asp:Button>   
             </td>
             <td align="center" width="50px">
                  <asp:Button runat="server" ID="btnsimpan" Width="50px" Text="Edit" OnClick="btnsimpan_Click" />
             </td>
             <td align="center">
                 <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click"  />
             </td>
             <td align="right">
                  <asp:Button ID="btnSearch" runat="server" CssClass="search" CausesValidation="false" Text="Search" OnClick="btnSearch_Click" />
             </td>
         </tr>
     </table>   
	
    <div style="width: 99.9%; overflow-x: scroll; margin-top: 5px;">
     <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">  
       <tr>
            <td>
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" 
                             EmptyDataText="There is no data."
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="GridView_PageIndexChanging"
                            GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" 
                            AlternatingRowStyle-CssClass="alt">
                            <%--<Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="KODE" HeaderText="KODE">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DESKRIPSI" HeaderText="DESKRIPSI">
                                    <ItemStyle Width="30%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="START_TIME" HeaderText="JAM MULAI">
                                    <ItemStyle Width="30%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="END_TIME" HeaderText="JAM SELESAI">
                                    <ItemStyle Width="30%" HorizontalAlign="Center" />
                                </asp:BoundField>                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                            ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="~/img/im4_grid_delete.png" ToolTip="Delete" />
                                            <cc1:ConfirmButtonExtender
                                                ID="cbeDelete" runat="server" ConfirmText="Do you want to delete this record?" TargetControlID="btnDelete">
                                            </cc1:ConfirmButtonExtender>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>--%>
                        </asp:GridView>
                    </ContentTemplate>
                   <%-- <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    </Triggers>--%>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    </div>


</asp:Content>
