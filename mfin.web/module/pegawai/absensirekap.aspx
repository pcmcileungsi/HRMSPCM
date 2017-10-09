<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="absensirekap.aspx.cs" Inherits="module_pegawai_absensirekap" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 134px;
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
                    <asp:DropDownList ID="ddlMonth" runat="server">
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
                     <asp:DropDownList ID="ddlYear" runat="server">
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
                      <asp:DropDownList ID="ddlUnitKerja" runat="server" Width="30%">
                    </asp:DropDownList>
					<asp:RequiredFieldValidator ID="ReqUnitKerja" runat="server" ControlToValidate="ddlUnitKerja"
                         ErrorMessage="* Harus Diisi" />
                </td>
            </tr>          
        </table>
    </div>

     <table style="width: 25%">
         <tr>
		  <td class="auto-style1" >
                  <asp:Button ID="btnAdd" CssClass="add" CausesValidation="false" Text="Tarik Data" runat="server" OnClick="btnAdd_Click" Width="69%" ></asp:Button>   
             </td>  
              <td >
                  <asp:Button ID="btnSearch" runat="server" CssClass="search" CausesValidation="false" Text="Search" OnClick="btnSearch_Click" />
             </td>          
         </tr>
     </table>   
	
     <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">  
       <tr>
            <td>
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="NIK,NAMA" 
                             EmptyDataText="There is no data." OnSelectedIndexChanged="gvwList_SelectedIndexChanged"
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
                            OnRowCreated="gvwList_RowCreated"  GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NIK" HeaderText="NIK">
                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NAMA" HeaderText="NAMA">
                                    <ItemStyle Width="40%" HorizontalAlign="Left" />
                                </asp:BoundField>  
                                 <asp:BoundField DataField="Hadir" HeaderText="HADIR">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField> 
                                 <asp:BoundField DataField="Telat" HeaderText="TELAT">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField> 
                                 <asp:BoundField DataField="PulangCepat" HeaderText="PULANG CEPAT">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField> 
                                <asp:BoundField DataField="Sakit" HeaderText="SAKIT">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField>   
                                 <asp:BoundField DataField="Cuti" HeaderText="CUTI">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="Ijin" HeaderText="IJIN">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField> 
                                 <asp:BoundField DataField="Alpha" HeaderText="ALPHA">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField>  						
                               <asp:CommandField ShowSelectButton="True" SelectText="Detail" ItemStyle-HorizontalAlign="Center" ControlStyle-ForeColor="RED" ControlStyle-BorderColor="RED"></asp:CommandField>
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


</asp:Content>
