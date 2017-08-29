<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="kontraklist.aspx.cs" Inherits="module_pegawai_kontraklist" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">List Kontrak</span>
            </td>
        </tr>
        <tr>
            <td>
                <cc2:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B100122" />
            </td>
            <td align="right">
                <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">   
                     <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>               
                    <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                </asp:Panel>
            </td>
        </tr>
    </table>
     <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">  
         <tr>
            <td>
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="NO,ID,DOKUMEN_NAME"
                            EmptyDataText="There is no data."
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
                            OnRowCreated="gvwList_RowCreated" OnRowCommand="gvwList_RowCommand" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"                           
                            AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="KODE" HeaderText="KODE">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField>
								 <asp:BoundField DataField="NAMA_PEGAWAI" HeaderText="NAMA PEGAWAI">
                                    <ItemStyle Width="20%" HorizontalAlign="Left" />
                                </asp:BoundField> 
                                <asp:BoundField DataField="TANGGAL_MULAI_KONTRAK" HeaderText="TANGGAL MULAI" DataFormatString="{0:dd-MM-yyyy}">
                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                </asp:BoundField> 
                                 <asp:BoundField DataField="TANGGAL_AKHIR_KONTRAK" HeaderText="TANGGAL SELESAI" DataFormatString="{0:dd-MM-yyyy}">
                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="UNIT_KERJA" HeaderText="UNIT KERJA">
                                    <ItemStyle Width="20%" HorizontalAlign="Left" />
                                </asp:BoundField> 
                                <asp:BoundField DataField="POSISI" HeaderText="POSISI">
                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="JABATAN" HeaderText="JABATAN">
                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                </asp:BoundField> 
                                  
                              <%--   <asp:BoundField DataField="DOKUMEN_NAME" HeaderText="ATTACHMENT">
                                    <ItemStyle Width="20%" HorizontalAlign="Left" />
                                </asp:BoundField> --%>    
                                 <asp:TemplateField HeaderText ="ATTACHMENT">
                                    <ItemTemplate>                                      
                                        <a href='../../FileAttachments/<%# Eval("DOKUMEN_NAME") %>' style="color:black"><%# Eval("DOKUMEN_NAME") %></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                        
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
