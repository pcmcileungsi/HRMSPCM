<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="absensirekapdtl.aspx.cs" Inherits="module_pegawai_absensirekapdtl" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
	  <script type="text/javascript" language="javascript">
        $(document).ready(function () {             
        });

        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if ((charCode >= 48 && charCode <= 57) || charCode == 8 || (charCode >= 35 && charCode < 39)) {
                return true;
            }
            return false;
        }
      </script>  
	  
     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Absensi Rekap</span>
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
                        <td width="10%">
                            <span>NIK</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtNIK" runat="server" DataType="String" DBColumnName="NIK" Enabled="false"
                                BindType="Both" SPParameterName="p_NIK" MaxLength="5" Width="100px"></cc1:XUITextBox>                            
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Nama</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtNama" runat="server" DataType="String" DBColumnName="NAMA" Enabled="false"
                                BindType="Both" SPParameterName="p_NAMA" MaxLength="100" Width="250px"></cc1:XUITextBox>                           
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Bulan/Tahun</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                           <cc1:XUITextBox ID="txtBlnThn" runat="server" DataType="String" DBColumnName="Tanggal_Absen" Enabled="false"
                                BindType="Both" SPParameterName="p_TanggalAbsen" MaxLength="100" Width="250px"></cc1:XUITextBox>  
                        </td>
                    </tr>                 
					 <tr>
                        <td width="20%">
                            <span>Shift</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                              <cc1:XUICheckBox ID="cbShift" Enabled="false" runat="server" DataType="String">
                            </cc1:XUICheckBox>     
                        </td>
                    </tr>                       
                                 
                </table>
            </ContentTemplate>
           <%-- <Triggers>
              <asp:PostBackTrigger ControlID="btnSave" />         
            </Triggers>--%>
        </asp:UpdatePanel>

         <table id="Table1" cellpadding="3px" cellspacing="0px" class="search-list-table">  
       <tr>
            <td>
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>  
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="id"  
                             EmptyDataText="There is no data." AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
                            OnRowCreated="gvwList_RowCreated"  OnRowDataBound="gvwList_RowDataBound"
							OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating"
                             GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" width="50%">
                            <Columns>							   
								<asp:TemplateField ShowHeader="True" HeaderText=".................." HeaderStyle-ForeColor="#525252" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center">
									<ItemTemplate>
										<asp:LinkButton ID="EditButton" ForeColor="Red" runat="server" CommandName="Edit" Text="Edit" Visible="true" />
									</ItemTemplate>
									<EditItemTemplate>
										<asp:LinkButton ID="UpdateButton" ForeColor="Red" runat="server" CommandName="Update" Text="Update" />                                       
										<asp:LinkButton ID="CancelButton" ForeColor="Red" runat="server" CommandName="Cancel" Text="Cancel" />
									</EditItemTemplate>
								</asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <asp:TemplateField HeaderText="TANGGAL" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblTgl" runat="server" Text='<%# Eval("tanggal_absen") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="MASUK" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblMasuk" runat="server" Text='<%# Eval("attend_time") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMasuk" style="text-align:center" runat="server" Text='<%# Eval("attend_time") %>' MaxLength="5" 
                                        onkeyup="
                                                var date = this.value;
                                                 if (date.match(/^\d{2}$/) !== null) {
                                                     this.value = date + ':';
                                                 } else if (date.match(/^\d{2}\:\d{2}$/) !== null) {
                                                     this.value = date;
                                                 }" 
                                        onkeypress="return isNumber(event)">
                                     </asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Telat" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblTelat" runat="server" Text='<%# Eval("telat") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="PULANG" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblPulang" runat="server" Text='<%# Eval("leave_time") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPulang" style="text-align:center" runat="server" Text='<%# Eval("leave_time") %>' MaxLength="5"
                                        onkeyup="
                                                var date = this.value;
                                                 if (date.match(/^\d{2}$/) !== null) {
                                                     this.value = date + ':';
                                                 } else if (date.match(/^\d{2}\:\d{2}$/) !== null) {
                                                     this.value = date;
                                                 }" 
                                        onkeypress="return isNumber(event)">
                                    </asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>  
                              <asp:TemplateField HeaderText="Pulang Cepat" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblPC" runat="server" Text='<%# Eval("PulangCepat") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>   
                              <asp:TemplateField HeaderText="Sakit" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblSakit" runat="server" Text='<%# Eval("Sakit") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Cuti" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblCuti" runat="server" Text='<%# Eval("Cuti") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Ijin" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblIjin" runat="server" Text='<%# Eval("Ijin") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>      
                             <asp:TemplateField HeaderText="Alpha" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblAlpha" runat="server" Text='<%# Eval("Alpha") %>'></asp:Label>
                                </ItemTemplate>                               
                            </asp:TemplateField>                                       
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>                                   
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    </div> 

</asp:Content>

