<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="mstjabatanlist.aspx.cs" Inherits="module_sysadmin_master_mstjabatanlist" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 18%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
      <script type="text/javascript" language="javascript">
          function isNumber(evt) {
              evt = (evt) ? evt : window.event;
              var charCode = (evt.which) ? evt.which : evt.keyCode;
              if ((charCode >= 48 && charCode <= 57) || charCode == 46 || charCode == 8 || (charCode >= 35 && charCode <= 40)) {
                  return true;
              }
              return false;
          }

          function chop(value) {
              return value.substr(1);
          }

          function hapus(id, value) {
              if (value == "0") {
                  id.value = "";
                  return 0;
              }
          }

          function muncul(id, value) {
              if (value == "") {
                  id.value = "0";
                  return 0;
              }
          }

          function detectComma(lvalue, lfield) {
              if (lvalue.length > 1) {
                  var temp = removeComma(lvalue);
                  if (temp.substr(0, 1) == "0" || temp.substr(0, 1) == ",") {
                      var temp2 = chop(temp);
                      detectComma(temp2, lfield);
                  }
                  else {
                      lfield.value = putComma(temp);
                  }
              }
              else {
                  lfield.value = putComma(lvalue);
              }
          }

          function putComma(in_fld) {
              var t = 0;
              var o_fld = "";
              var w_fld = "";

              min_sign = minus_sign(in_fld)
              period_fld = removeperiod(in_fld)
              in_fld = removeComma2(in_fld)

              t = in_fld.length;
              for (t; t > 3; (t = t - 3)) {
                  w_fld = "," + in_fld.substring(t - 3, t);
                  o_fld = w_fld + o_fld;
              }
              w_fld = in_fld.substring(0, t);
              o_fld = min_sign + w_fld + o_fld + period_fld;

              in_fld = o_fld;
              return (o_fld);
          }

          function minus_sign(in_fld) {
              var w_fld = "";
              var o_fld = "";

              w_fld = in_fld.substring(0, 1);
              if (w_fld == "-") {
                  o_fld = "-"
              }
              return (o_fld);
          }

          function removeperiod(in_fld) {
              var t = 0;
              t = in_fld.length;
              var o_fld = "";
              var w_fld = "";
              var trig = 0;
              for (var i = 0; i < t; i++) {
                  w_fld = in_fld.substring(i, i + 1);
                  if ((w_fld >= "0" && w_fld <= "9" && trig == 1) || (w_fld == "." && trig == 0)) {
                      o_fld = o_fld + w_fld;
                      if (w_fld == ".") trig = 1;
                  }
              }
              return (o_fld);
          }

          function removeComma2(in_fld) {
              var t = 0;
              t = in_fld.length;
              var o_fld = "";
              var w_fld = "";
              var trig = 0;
              for (var i = 0; i < t; i++) {
                  w_fld = in_fld.substring(i, i + 1);
                  if ((w_fld >= "0" && w_fld <= "9" && trig == 0) || (w_fld == "." && trig == 0)) {
                      if (w_fld == ".") {
                          trig = 1;
                      } else o_fld = o_fld + w_fld;
                  }
              }
              return (o_fld);
          }
          function removeComma(in_fld) {
              var t = 0;
              t = in_fld.length;
              var o_fld = "";
              var w_fld = "";

              for (var i = 0; i < t; i++) {
                  w_fld = in_fld.substring(i, i + 1);
                  if ((w_fld >= "0" && w_fld <= "9") || (w_fld == ".")) {
                      o_fld = o_fld + w_fld;
                  }
              }
              return (o_fld);
          }
      </script>

    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">List Master Jabatan</span>
            </td>
        </tr>
        <tr>
            <td>
                <cc2:XUIButton ID="btnAdd" runat="server" CssClass="add" Text="Add" OnClick="btnAdd_Click" RoleCode="B100080" />              
                <asp:Button ID="BtnLookUpKenaikan" runat="server" CssClass="add" Width="14%" Text="Kenaikan" OnClick="BtnLookUpKenaikan_Click" />               
            </td>
            <td align="right">
                <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">              
                    <asp:Button ID="btnSearch" runat="server" CssClass="search" Text="Search" OnClick="btnSearch_Click" />
                </asp:Panel>
            </td>
        </tr>
    </table>
     <table id="tblBody" cellpadding="3px" cellspacing="0px" class="search-list-table">  
         <tr>
                        <td width="20%">
                            <span>Unit Kerja</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                             <asp:DropDownList ID="ddlUnitKerja" runat="server" CssClass="DropDownList" Width="30%" AutoPostBack="True" OnSelectedIndexChanged="ddlUnitKerja_SelectedIndexChanged">
                     </asp:DropDownList>
                        </td>
                    </tr>     
        <tr>
            <td colspan="3">
                <asp:UpdatePanel ID="updMain" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                            OnSelectedIndexChanged="gvwList_SelectedIndexChanged" EmptyDataText="There is no data."
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
                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="JABATAN" HeaderText="JABATAN">
                                    <ItemStyle Width="80%" HorizontalAlign="Left" />
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

      <%-- Lookup Kenaikan--%>
    <asp:Panel ID="pnlPopUpGetKenaikan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetKenaikan" runat="server"></asp:Button>
        <cc1:ModalPopupExtender ID="mdlPopupGetKenaikan" runat="server" BehaviorID="mdlPopupGetKenaikan"
            PopupControlID="pnlPopUpGetKenaikan" TargetControlID="btnShowPopupGetKenaikan"
            BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <cc1:DragPanelExtender ID="DragPanelExtender16" runat="server" TargetControlID="pnlPopUpGetKenaikan"
            DragHandleID="pnlPopupGetKenaikanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetKenaikanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label15" runat="server" CssClass="msg" Text="Kenaikan" />
                <asp:LinkButton ID="LinkButton15" runat="server" CssClass="close" OnClientClick="$find('pnlPopUpGetKenaikan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="pnlBody" runat="server" UpdateMode="Conditional">
                <ContentTemplate>                    
                    <div class="body">
                       <table id="Table1" cellpadding="4px" cellspacing="0px" width="100%" border="0px">                   
                    <tr>
                        <td width="20%">
                            <span>Tahun</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">                            
							  <cc2:XUIDropDownList ID="ddlTahun" runat="server" DataType="String" BindType="Both" SPParameterName="p_TAHUN" Width="20%">
                            </cc2:XUIDropDownList>                                          
                        </td>
                    </tr>
					 <tr>
                        <td width="20%">
                            <span>Kenaikan Dalam</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td class="auto-style1">                           
                           <cc2:XUITextBox ID="txtPersen" runat="server" DataType="String" BindType="Both" style="text-align:right"
                                SPParameterName="p_PERSEN" MaxLength="4" Width="40%" 
								onkeypress="javascript:hapus(this,this.value);" onblur="if (this.value){this.onchange();} javascript:muncul(this,this.value);"
                                 onkeyup="javascript:detectComma(this.value,this);">
                           </cc2:XUITextBox>
                            <cc2:XUITextBox ID="txtRupiah" runat="server" DataType="String" BindType="Both" SPParameterName="p_RUPIAH" 
							      MaxLength="20"  Width="89%" style="text-align:right" Visible="false"
                                 onkeypress="javascript:hapus(this,this.value);" onblur="if (this.value){this.onchange();} javascript:muncul(this,this.value);"
                                 onkeyup="javascript:detectComma(this.value,this);"></cc2:XUITextBox>
                         </td>
                          <td>
                             <cc2:XUIRadioButtonList ID="rbKenaikan" runat="server" DataType="String" 
                                BindType="Both" SPParameterName="p_KENAIKAN" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="rbKenaikan_SelectedIndexChanged">                                
                                <asp:ListItem Value="0" Selected="True">Persen</asp:ListItem>
                                <asp:ListItem Value="1">Rupiah</asp:ListItem>
                            </cc2:XUIRadioButtonList>
                          </td>
                    </tr>					                            
                </table>
                    </div>
                    <div class="footer">                                
                        <table cellpadding="4px" cellspacing="0px" width="100%" border="0px">                           
                            <tr>
                                <td align="right">
                                      <asp:Button ID="btnCloseKenaikan" OnClientClick="$find('mdlPopupGetKenaikan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false" Width="53px"></asp:Button>
                                </td>                               
                                <td align="left">
                                     <asp:Button ID="btnOk" runat="server" Text="OK" CssClass="post" Width="72px" OnClick="btnOk_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Kenaikan--%>
</asp:Content>
