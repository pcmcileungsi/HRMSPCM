<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="absensilist.aspx.cs" Inherits="module_pegawai_absensilist" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
     <script type="text/javascript" language="javascript">
         $(document).ready(function () {
            
         });
         function UploadFile() {
             var nama = document.getElementById('<%=upfile.ClientID %>');
            document.getElementById('<%=txtDocName.ClientID %>').value = nama.files.item(0).name;
        }
        function onBrowse() {
            document.getElementById('<%=upfile.ClientID %>').click();
        }
         function onUpload() {
             document.getElementById('<%=btnUpload.ClientID %>').click();
         }
      </script>  

    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">List Absensi</span>
            </td>
        </tr>
        <tr>
            <td>              
               <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back" Text="Back" OnClick="btnBack_Click" />
                <button type="button" onclick="onBrowse()">Browse</button>   
                                <cc2:XUITextBox ID="txtDocName" runat="server" DataType="String" 
                                BindType="Both"  Width="200px"></cc2:XUITextBox>                                                                                            
                                <input id="upfile" type="file" runat="server" name="upfile" style="display: none" onchange="UploadFile()" />    
                 <button ID="btnUpload2" type="button" runat="server" onclick="onUpload()" OnClientClick="$('[id*=btnShowPopupLoading]').click();">Upload</button>
                <asp:Button ID="btnUpload" runat="server" Text="Upload" style="display: none" OnClick="btnUpload_Click" />
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
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                             EmptyDataText="There is no data."
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwList_PageIndexChanging"
                            OnRowCreated="gvwList_RowCreated"  GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr"
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
                                <asp:BoundField DataField="NIK" HeaderText="NIK">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TANGGAL_ABSEN" HeaderText="TANGGAL ABSEN" DataFormatString="{0:yyyy-MM-dd}">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField>  
                                 <asp:BoundField DataField="IN_TIME" HeaderText="IN TIME">
                                    <ItemStyle Width="15%" HorizontalAlign="Center" />
                                </asp:BoundField> 
                                 <asp:BoundField DataField="OUT_TIME" HeaderText="OUT TIME">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField> 
                                 <asp:BoundField DataField="ATTEND_TIME" HeaderText="ATTEND TIME">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField> 
                                 <asp:BoundField DataField="LEAVE_TIME" HeaderText="LEAVE TIME">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField> 
                                <asp:BoundField DataField="KODE_JENIS_SHIFT" HeaderText="SHIFT">
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField> 							
                               
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

     <asp:Panel ID="pnlPopupLoading" runat="server" Style="display: block;background-color:#ffffff;">
            <asp:Button Style="display: none" ID="btnShowPopupLoading" runat="server"></asp:Button>
            <cc1:ModalPopupExtender ID="mdlPopupLoadingword2" runat="server" BehaviorID="mdlPopupLoadingword2"
                PopupControlID="pnlPopupLoading" TargetControlID="btnShowPopupLoading" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <div class="container" style="background-color:#ffffff;">
                <asp:UpdatePanel ID="upnLoading" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="body">
                            <div style="text-align: center;background-color:#ffffff;">
                                <asp:ImageButton ID="btnLoad" runat="server" ImageUrl="~/img/loading.gif" /><br />
                                <span>Please Wait... <b style="font-size: x-large"></b></span>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Panel>
</asp:Content>
