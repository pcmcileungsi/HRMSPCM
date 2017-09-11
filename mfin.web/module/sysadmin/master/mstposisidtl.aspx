<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="mstposisidtl.aspx.cs" Inherits="module_sysadmin_master_mstposisidtl" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">
     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Master Posisi</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100075" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <%--<tr style="display: none">--%>
                    <tr>
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblID" runat="server" DataType="String" DBColumnName="ID"
                                BindType="Both" SPParameterName="p_ID" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Kode</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtKode" runat="server" DataType="String" DBColumnName="KODE"
                                BindType="Both" SPParameterName="p_KODE" MaxLength="5" Width="50px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqCKode" runat="server" ControlToValidate="txtKode"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Unit Kerja</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                             <cc1:XUIDropDownList ID="ddlUnitKerja" runat="server" DataType="String" DBColumnName="KODE_UNIT_KERJA"
                                BindType="Both" SPParameterName="p_KODE_UNIT_KERJA" Style="min-width: 250px">
                            </cc1:XUIDropDownList>                           
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Posisi</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                           <cc1:XUIDropDownList ID="ddlPosisi" runat="server" DataType="String" DBColumnName="KODE_POSISI"
                                BindType="Both" SPParameterName="p_KODE_POSISI" Style="min-width: 250px">
                            </cc1:XUIDropDownList>
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
                              <cc1:XUICheckBox ID="cbShift" runat="server" DataType="String">
                            </cc1:XUICheckBox>     
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Cuti</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                              <cc1:XUICheckBox ID="cbCuti" runat="server" DataType="String">
                            </cc1:XUICheckBox>   
                        </td>
                    </tr>                                  
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

