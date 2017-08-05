<%@ Page Language="C#" MasterPageFile="~/mfin2.master" AutoEventWireup="true" CodeFile="chsetupdetail.aspx.cs"
    Inherits="module_channelling_admin_chsetupdetail" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
    
        $(document).ready(function() {
            var $maintab = $("#pages").tabs();
        });

        function maskCurrency(id) {
            var val = $get(id).value;
            var mask = jsToCurrency(val);
            $get(id).value = mask;
        }
            
        function jnsProduk() {
            if ($get("ctl00_cphbd_rboLSModule_0").checked) {
                $get("ctl00_cphbd_ddljnsProduk").value = "11";
            }
            else if ($get("ctl00_cphbd_rboLSModule_1").checked) {
                $get("ctl00_cphbd_ddljnsProduk").value = "35";
            }
            else if ($get("ctl00_cphbd_rboLSModule_2").checked) {
                $get("ctl00_cphbd_ddljnsProduk").value = "73";
            }
            else if ($get("ctl00_cphbd_rboLSModule_3").checked) {
                $get("ctl00_cphbd_ddljnsProduk").value = "60";
            }
        }

        function fnFloating() {
            if ($get("ctl00_cphbd_rboIntType_2").checked) {
                $get("ctl00_cphbd_txtNoOfInit").disabled = false;
                $get("ctl00_cphbd_txtIntRateRev").disabled = false;
            }
            else if ($get("ctl00_cphbd_rboIntType_1").checked) {
                $get("ctl00_cphbd_txtNoOfInit").disabled = true;
                $get("ctl00_cphbd_txtIntRateRev").disabled = true;
            }
        }

        function onLoadFunction() {
            $('#ctl00_cphbd_txtNoOfInit').unbind();
            $('#ctl00_cphbd_txtIntRateRev').unbind();

        }
        

    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Setup Detail</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B200035" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr style="display: none">
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblCHSETUP" runat="server" DataType="Integer" DBColumnName="CH_SETUPID"
                                BindType="Both" SPParameterName="p_ch_setupid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Module</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:UpdatePanel ID="pnlUpdModuleID" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtMODULE" runat="server" DataType="String" DBColumnName="MODULE"
                                        BindType="Both" SPParameterName="p_module" MaxLength="10" Width="64px"
                                        Enabled="false" ></cc1:XUITextBox>
                                    <asp:ImageButton ID="btnLookUpModule" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpModule_Click" />
                                    <cc1:XUITextBox ID="txtNAME" runat="server" DataType="String" DBColumnName="NAME"
                                        BindType="Both" SPParameterName="p_name" MaxLength="50" Width="320px"
                                        Enabled="false"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Facility Type</span>
                        </td>
                        <td width="1%">
                            <span>:</span>
                        </td>
                        <td width="79%">
                            <cc1:XUIRadioButtonList ID="rboLSModule" runat="server" DataType="String" DBColumnName="LS_MODULE"
                                BindType="Both" SPParameterName="p_ls_module" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                onclick="jnsProduk();">
                                <asp:ListItem Value="1" Selected="True">Leasing</asp:ListItem>
                                <asp:ListItem Value="2">Consumer Finance</asp:ListItem>
                                <asp:ListItem Value="3">IMBT</asp:ListItem>
                                <asp:ListItem Value="4">Murabahah</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" rowspan="5" valign="top">
                            <span>Lease Type</span>
                        </td>
                        <td rowspan="5" valign="top">
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboLeaseType" runat="server" DataType="String" DBColumnName="LEASETYPE"
                                BindType="Both" SPParameterName="p_leasetype" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1" Selected="True">Finance Lease</asp:ListItem>
                                <asp:ListItem Value="2">Syariah Umum</asp:ListItem>
                                <asp:ListItem Value="3">Syariah Niaga</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <cc1:XUIRadioButtonList ID="rboAppLsBack" runat="server" DataType="String" DBColumnName="APPLSBACK"
                                BindType="Both" SPParameterName="p_applsback" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1" Selected="True">Normal</asp:ListItem>
                                <asp:ListItem Value="2">Back to Back</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <cc1:XUIRadioButtonList ID="rboAppLsType" runat="server" DataType="String" DBColumnName="APPLSTYPE"
                                BindType="Both" SPParameterName="p_applstype" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1" Selected="True">Direct Lease</asp:ListItem>
                                <asp:ListItem Value="2">Sale and Lease Back</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <cc1:XUIRadioButtonList ID="rboBuyBack" runat="server" DataType="String" DBColumnName="BUYBACK"
                                BindType="Both" SPParameterName="p_buyback" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1" >Buy Back Guarantee</asp:ListItem>
                                <asp:ListItem Value="2" Selected="True">No Buy Back</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <cc1:XUIRadioButtonList ID="rboVendor" runat="server" DataType="String" DBColumnName="VENDOR"
                                BindType="Both" SPParameterName="p_vendor" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1" >Vendor</asp:ListItem>
                                <asp:ListItem Value="2" Selected="True">Non Vendor</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Industri *</span></td>
                        <td><span>:</span></td>
                        <td width="80%">
                            <asp:UpdatePanel ID="updIndustryInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtInd_Code" runat="server" DataType="String" DBColumnName="IND_CODE"
                                        BindType="Both" SPParameterName="p_ind_code" MaxLength="2" Width="16px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpIndustry" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpIndustry_Click" />                                    
                                    <cc1:XUITextBox ID="txtInd_Desc" runat="server" DataType="String" DBColumnName="IND_DESCS"
                                        BindType="DBToUIOnly" MaxLength="40" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                   <%-- <asp:RequiredFieldValidator ID="txtIndustry" runat="server" ControlToValidate="txtInd_Code" Display="Dynamic" Text="Industry harus diisi">
                                    </asp:RequiredFieldValidator>--%>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Sub Industry Type</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlInd_Sub" runat="server" DataType="String" DBColumnName="IND_SUB" BindType="Both"
                                SPParameterName="p_ind_sub" Style="width: 600px;">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Marketing Officer</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlMktCode" runat="server" DataType="String" DBColumnName="AO"
                                BindType="Both" SPParameterName="p_ao" Style="width: 600px;">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Asset Type</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlCat_Code" runat="server" DataType="String" DBColumnName="CAT_CODE"
                                BindType="Both" SPParameterName="p_cat_code" Style="width: 600px;">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Supplier</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:UpdatePanel ID="updSupplierInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtSupp_Code" runat="server" DataType="String" DBColumnName="SUPP_CODE"
                                        BindType="Both" SPParameterName="p_supp_code" MaxLength="10" Width="80px" Style="display: none;">
                                    </cc1:XUITextBox>
                                    <cc1:XUILabel ID="lblSupp_Code" ReadOnly="true" runat="server" DataType="String"
                                        DBColumnName="SUPP_CODE" BindType="DBToUIOnly" SPParameterName="p_supp_code"></cc1:XUILabel>
                                    <asp:ImageButton ID="btnLookUpSupplier" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpSupplier_Click" />
                                    <cc1:XUITextBox ID="txtSupp_CodeDesc" runat="server" DataType="String" DBColumnName="SUPPLIERNAME"
                                        BindType="DBToUIOnly" Enabled="False" MaxLength="40" Width="494px"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Produk</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                        <%--
                            <cc1:XUILabel ID="lbljnsProduk" runat="server" DataType="String" BindType="DBToUIOnly"
                                DBColumnName="JNSPRODUKA" />
                        --%>
                        <asp:UpdatePanel runat="server" ID="upnJnsProduk" UpdateMode="Conditional">
                            <ContentTemplate>
                            <cc1:XUIDropDownList ID="ddljnsProduk" runat="server" DataType="String" DBColumnName="JNSPRODUK"
                                BindType="Both" Enabled="False" SPParameterName="p_jnsproduk"  Width="600px"></cc1:XUIDropDownList>
                            </ContentTemplate>
                            
                        </asp:UpdatePanel>
                    
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Jenis Penggunaan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlJnsGuna" runat="server" DataType="String" DBColumnName="JNSGUNA"
                                BindType="Both" SPParameterName="p_jnsguna" Style="width: 600px;">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Orientasi</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlOrientasi" runat="server" DataType="String" DBColumnName="ORIENTASI"
                                BindType="Both" SPParameterName="p_orientasi" Style="width: 600px;">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Condition</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboAsCondition" runat="server" DataType="String" DBColumnName="ASCONDITION"
                                BindType="Both" SPParameterName="p_ascondition" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <asp:ListItem Value="1" Selected="True">New</asp:ListItem>
                                <asp:ListItem Value="2">Used</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Currency</span>
                        </td>
                        <td width="1%">
                            <span>:</span>
                        </td>
                        <td width="79%">
                            <cc1:XUIDropDownList ID="ddlCurrency" runat="server" DataType="String" DBColumnName="CURRENCY"
                                BindType="Both" SPParameterName="p_currency">
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Payment Schedule</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlPmtSched" runat="server" DataType="String" DBColumnName="PMTSCHED"
                                BindType="Both" SPParameterName="p_pmtsched">
                                <asp:ListItem Value="1">Monthly</asp:ListItem>
                                <asp:ListItem Value="2">Bi-Monthly</asp:ListItem>
                                <asp:ListItem Value="3">Quarterly</asp:ListItem>
                                <asp:ListItem Value="4">Semi-Annual</asp:ListItem>
                                <asp:ListItem Value="5">Annualy</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Amort. Structure</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlStrcLease" runat="server" DataType="String" DBColumnName="STRCLEASE"
                                BindType="Both" SPParameterName="p_strclease">
                                <asp:ListItem> </asp:ListItem>
                                <asp:ListItem Value="1">1 -- Even rentals, uneven principal recovery</asp:ListItem>
                                <asp:ListItem Value="2">2 -- Uneven rentals, even principal recovery (360 days year)</asp:ListItem>
                                <asp:ListItem Value="3">3 -- Uneven rentals, even principal recovery (365 days year)</asp:ListItem>
                                <asp:ListItem Value="4">4 -- Stepped rentals</asp:ListItem>
                                <asp:ListItem Value="5">5 -- Manually input amortisation structure</asp:ListItem>
                                <asp:ListItem Value="6">6 -- Flat rate structure</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Rental Payable In</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboRentalPay" runat="server" DataType="String" DBColumnName="RENTALPAY"
                                BindType="Both" SPParameterName="p_rentalpay" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="1" Selected="True">Advance</asp:ListItem>
                                <asp:ListItem Value="2">Arrears</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Rental Type</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIRadioButtonList ID="rboIntType" runat="server" DataType="String" DBColumnName="INTTYPE"
                                BindType="Both" SPParameterName="p_inttype" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                onclick="fnFloating();">
                                <asp:ListItem Value="0" Selected="False" style="display: none;"></asp:ListItem>
                                <asp:ListItem Value="1" Selected="True">Fixed</asp:ListItem>
                                <asp:ListItem Value="2">Floating</asp:ListItem>
                            </cc1:XUIRadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Start Period</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtNoOfInit" runat="server" DataType="Number" Format="N0" DBColumnName="NOOFINIT"
                                BindType="Both" SPParameterName="p_noofinit" Text="0" Width="24px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Period Cycle</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtIntRateRev" runat="server" DataType="Number" Format="N0" DBColumnName="INTRATEREV"
                                BindType="Both" SPParameterName="p_intraterev" Text="0" Width="24px" />
                            <span>rental</span>
                        </td>
                    </tr>
                     <tr>
                        <td width="20%">
                            <span>Margin (Anuitas)</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEffRate" runat="server" DataType="Number" Format="N8" DBColumnName="EFFRATE"
                                BindType="Both" SPParameterName="p_effrate" Text="0.00000000" Width="144px"
                                MaxLength="20"></cc1:XUITextBox>
                            <span>% p.a</span>
                            <asp:RequiredFieldValidator ID="rfvTxtEffRate" SetFocusOnError="true" runat="server" ControlToValidate="txtEffRate"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Penalty Interest</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtOvdInt" runat="server" DataType="Number" Format="N8" DBColumnName="OVDINT"
                                BindType="Both" SPParameterName="p_ovdint" Text="0.00000000" Width="144px"
                                MaxLength="20"></cc1:XUITextBox>
                            <span>% p.a</span>
                            <asp:RequiredFieldValidator ID="rfvTxtOvdInt" runat="server" ControlToValidate="txtOvdInt"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Administrasi Pelunasan</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSlvRate" runat="server" DataType="Number" Format="N8" DBColumnName="SLVRATE"
                                BindType="Both" SPParameterName="p_slvrate" Text="0.00000000" Width="144px"
                                MaxLength="20"></cc1:XUITextBox>
                            <span>% p.a</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>Group</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="updGroupInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtGroup_" runat="server" DataType="String" DBColumnName="GROUP_"
                                        BindType="Both" SPParameterName="p_group_" MaxLength="10" Width="80px" >
                                    </cc1:XUITextBox>
                                    <%--<cc1:XUILabel ID="lblGroup_" ReadOnly="true" runat="server" DataType="String" DBColumnName="GROUP_"
                                        BindType="DBToUIOnly"></cc1:XUILabel>--%>
                                    <asp:ImageButton ID="btnLookUpGroup" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="btnLookUpGroup_Click" />                                    
                                    <cc1:XUITextBox ID="txtGroupName" runat="server" DataType="String" DBColumnName="GROUPNAME"
                                        BindType="DBToUIOnly" MaxLength="40" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Charges</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlTranCode" runat="server" DataType="String" DBColumnName="TRANCODE" 
                                BindType="Both" SPParameterName="p_trancode"  Style="width: 600px;" ></cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <%--<tr>
                        <td width="20%">
                            <span>Charge Code</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:UpdatePanel runat="server" ID="pnlUpdateCharge" UpdateMode="Conditional" >
                                <ContentTemplate>
                                    <asp:TextBox ID="txtChargeCode" runat="server" ReadOnly="true" MaxLength="3" Width="24px">
                                    </asp:TextBox>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlTranCode" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>--%>
                    <tr>
                        <td width="20%">
                            <span>Persentase</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <asp:UpdatePanel runat="server" ID="pnlUpdateFeePercentage" UpdateMode="Conditional" >
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtAmount" runat="server" DataType="Number" Format="N8" DBColumnName="FEEPERCENTAGE"
                                        BindType="Both" SPParameterName="p_feepercentage" Text="0.00000000" ></cc1:XUITextBox>
                                        <span>% p.a</span>
                                </ContentTemplate>
                                <%--<Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlTranCode" EventName="SelectedIndexChanged" />
                                </Triggers>--%>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Cara Bayar</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlPayWith" runat="server" DataType="String" DBColumnName="PAYWITH"
                                BindType="Both" SPParameterName="p_paywith">
                                <asp:ListItem Value="0">Tunai/Transfer</asp:ListItem>
                                <asp:ListItem Value="1">Potong Pencarian</asp:ListItem>
                                <asp:ListItem Value="2">Titip Giro</asp:ListItem>
                                <asp:ListItem Value="3">Bayar Saat Jatuh Tempo</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Plafond</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtPlafond" runat="server" DataType="Number" Format="N0" DBColumnName="PLAFOND"
                                BindType="Both" SPParameterName="p_plafond" MaxLength="15" Width="160px" Text="0.00"
                                onBlur="javascript:jsFormatCurrency('ctl00_cphbd_txtPlafond')">
                            </cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h2>
                                OJK Information
                            </h2>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Jenis Pembiayaan *</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updOJKJenisPembiayaanInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtOJKJenisPembiayaan_Code" runat="server" DataType="String" DBColumnName="OJKJENISPEMBIAYAAN_CODE"
                                        BindType="Both" SPParameterName="p_ojkjenispembiayaan_code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpOJKJenisPembiayaan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKJenisPembiayaan_Click" />                                    
                                    <cc1:XUITextBox ID="txtOJKJenisPembiayaan_Descs" runat="server" DataType="String" DBColumnName="OJKJENISPEMBIAYAAN_DESCS"
                                        BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Skema Pembiayaan *</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updOJKSkemaPembiayaanInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtOJKSkemaPembiayaan_Code" runat="server" DataType="String" DBColumnName="OJKSKEMAPEMBIAYAAN_CODE"
                                        BindType="Both" SPParameterName="p_ojkskemapembiayaan_code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpOJKSkemaPembiayaan" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKSkemaPembiayaan_Click" />                                    
                                    <cc1:XUITextBox ID="txtOJKSkemaPembiayaan_Descs" runat="server" DataType="String" DBColumnName="OJKSKEMAPEMBIAYAAN_DESCS"
                                        BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Jenis Barang dan Jasa *</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updOJKJenisBarangdanJasaInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtOJKJenisBarangdanJasa_Code" runat="server" DataType="String" DBColumnName="OJKJENISBARANGDANJASA_CODE"
                                        BindType="Both" SPParameterName="p_ojkjenisbarangdanjasa_code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpOJKJenisBarangdanJasa" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKJenisBarangdanJasa_Click" />                                    
                                    <cc1:XUITextBox ID="txtOJKJenisBarangdanJasa_Descs" runat="server" DataType="String" DBColumnName="OJKJENISBARANGDANJASA_DESCS"
                                        BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Jenis Suku Bunga/Bagi Hasil *</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updOJKJenisSukuBungaInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtOJKJenisSukuBunga_Code" runat="server" DataType="String" DBColumnName="OJKJENISSUKUBUNGA_CODE"
                                        BindType="Both" SPParameterName="p_ojkjenissukubunga_code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpOJKJenisSukuBunga" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKJenisSukuBunga_Click" />                                    
                                    <cc1:XUITextBox ID="txtOJKJenisSukuBunga_Descs" runat="server" DataType="String" DBColumnName="OJKJENISSUKUBUNGA_DESCS"
                                        BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Mata Uang *</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updOJKMataUangInfo" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtOJKMataUang_Code" runat="server" DataType="String" DBColumnName="OJKMATAUANG_CODE"
                                        BindType="Both" SPParameterName="p_ojkmatauang_code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpOJKMataUang" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpOJKMataUang_Click" Enabled ="false"/>                                    
                                    <cc1:XUITextBox ID="txtOJKMataUang_Descs" runat="server" DataType="String" DBColumnName="OJKMATAUANG_DESCS"
                                        BindType="DBToUIOnly" MaxLength="100" Width="320px" ReadOnly="true" Enabled ="false"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-bottom: solid 1px black;">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
      <%-- Pop Up module --%>
    <asp:Panel ID="pnlPopUpGetModuleID" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopUpGetModuleID" runat="server">
        </asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetModuleID" runat="server" BehaviorID="mdlPopupGetModuleID"
            PopupControlID="pnlPopUpGetModuleID" TargetControlID="btnShowPopUpGetModuleID"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnlPopUpGetModuleID"
            DragHandleID="pnlPopUpGetModuleIDHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopUpGetModuleIDHeader" runat="server" CssClass="header">
                <asp:Label ID="lblPopUpModule" runat="server" CssClass="msg" Text="Module" />
                <asp:LinkButton ID="btnClosePopupModule" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetModuleID').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnGetModuleDetail" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:TextBox ID="txtSearchModule" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearchModule" OnClick="btnSearchModule_Click" runat="server"
                            Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwModule" runat="server" OnSelectedIndexChanged="gvwListModule_SelectedIndexChanged"
                            DataKeyNames="MODULE, NAME" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListModule_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListModule_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="MODULE" HeaderText="Module ID">
                                    <ItemStyle Width="30%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="NAME" HeaderText="Nama">
                                    <ItemStyle Width="70%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseModule" OnClientClick="$find('mdlPopupGetModuleID').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
     <%-- Lookup industry--%>
    <asp:Panel ID="pnlPopUpGetIndustry" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetIndustry" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetIndustry" runat="server" BehaviorID="mdlPopupGetIndustry"
            PopupControlID="pnlPopupGetIndustry" TargetControlID="btnShowPopupGetIndustry"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender3" runat="server" TargetControlID="pnlPopUpGetIndustry"
            DragHandleID="pnlPopupGetIndustryHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetIndustryHeader" runat="server" CssClass="header">
                <asp:Label ID="Label2" runat="server" CssClass="msg" Text="Industry" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetIndustry').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetIndustry" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchIndustry" runat="server" DefaultButton="btnSearchIndustry">
                            <asp:TextBox ID="txtSearchIndustry" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchIndustry" OnClick="btnSearchIndustry_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListIndustry" runat="server" OnSelectedIndexChanged="gvwListIndustry_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListIndustry_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListIndustry_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Industry">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseIndustry" OnClientClick="$find('mdlPopupGetIndustry').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
    <asp:Panel ID="pnlPopupGetSupplier" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetSupplier" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetSupplier" runat="server" BehaviorID="mdlPopupGetSupplier"
            PopupControlID="pnlPopupGetSupplier" TargetControlID="btnShowPopupGetSupplier"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender2" runat="server" TargetControlID="pnlPopupGetSupplier"
            DragHandleID="pnlPopupGetSupplierHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetSupplierHeader" runat="server" CssClass="header">
                <asp:Label ID="lblHeaderSupplier" runat="server" CssClass="msg" Text="Supplier" />
                <asp:LinkButton ID="btnCloseSupplier" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetSupplier').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetSupplier" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchSupplier" runat="server" DefaultButton="btnSearchSupplier">
                            <asp:TextBox ID="txtSearchSupplier" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSupplier" OnClick="btnSearchSupplier_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListSupplier" runat="server" OnSelectedIndexChanged="gvwListSupplier_SelectedIndexChanged"
                            DataKeyNames="SUPP_CODE, SUPP_NAME" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListSupplier_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListSupplier_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="SUPP_CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="SUPP_NAME" HeaderText="Name">
                                    <ItemStyle Width="70%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="CONTACT" HeaderText="Branch">
                                    <ItemStyle Width="20%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseSupplierFooter" OnClientClick="$find('mdlPopupGetSupplier').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearchSupplier" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
    <asp:Panel ID="pnlPopupGetGroup" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetGroup" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetGroup" runat="server" BehaviorID="mdlPopupGetGroup"
            PopupControlID="pnlPopupGetGroup" TargetControlID="btnShowPopupGetGroup"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender4" runat="server" TargetControlID="pnlPopupGetGroup"
            DragHandleID="pnlPopupGetGroupHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetGroupHeader" runat="server" CssClass="header">
                <asp:Label ID="lblHeader" runat="server" CssClass="msg" Text="Group" />
                <asp:LinkButton ID="LinkButton0" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetGroup').hide(); return false;" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetGroup" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                    <asp:Panel ID="pnlSearchGroup" runat="server" DefaultButton="btnSearchGroup">
                        <asp:TextBox ID="txtSearchGroup" runat="server"></asp:TextBox>
                        <asp:Button ID="btnSearchGroup" OnClick="btnSearchGroup_Click" runat="server"
                            Text="Search" CssClass="search" CausesValidation="false">
                        </asp:Button>
                    </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListGroup" runat="server" OnSelectedIndexChanged="gvwListGroup_SelectedIndexChanged"
                            DataKeyNames="GROUP_, DESCRIP" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListGroup_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListGroup_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="GROUP_" HeaderText="Code">
                                    <ItemStyle Width="25%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCRIP" HeaderText="Description">
                                    <ItemStyle Width="75%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseGroup" OnClientClick="$find('mdlPopupGetGroup').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
     <%-- Lookup OJK Jenis Pembiayaan--%>
    <asp:Panel ID="pnlPopUpGetOJKJenisPembiayaan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKJenisPembiayaan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKJenisPembiayaan" runat="server" BehaviorID="mdlPopupGetOJKJenisPembiayaan"
            PopupControlID="pnlPopupGetOJKJenisPembiayaan" TargetControlID="btnShowPopupGetOJKJenisPembiayaan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender5" runat="server" TargetControlID="pnlPopUpGetOJKJenisPembiayaan"
            DragHandleID="pnlPopupGetOJKJenisPembiayaanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKJenisPembiayaanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label3" runat="server" CssClass="msg" Text="OJKJenisPembiayaan" />
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKJenisPembiayaan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKJenisPembiayaan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKJenisPembiayaan" runat="server" DefaultButton="btnSearchOJKJenisPembiayaan">
                            <asp:TextBox ID="txtSearchOJKJenisPembiayaan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKJenisPembiayaan" OnClick="btnSearchOJKJenisPembiayaan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKJenisPembiayaan" runat="server" OnSelectedIndexChanged="gvwListOJKJenisPembiayaan_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKJenisPembiayaan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKJenisPembiayaan_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKJenisPembiayaan" OnClientClick="$find('mdlPopupGetOJKJenisPembiayaan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Skema Pembiayaan--%>
    <asp:Panel ID="pnlPopUpGetOJKSkemaPembiayaan" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKSkemaPembiayaan" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKSkemaPembiayaan" runat="server" BehaviorID="mdlPopupGetOJKSkemaPembiayaan"
            PopupControlID="pnlPopupGetOJKSkemaPembiayaan" TargetControlID="btnShowPopupGetOJKSkemaPembiayaan"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender6" runat="server" TargetControlID="pnlPopUpGetOJKSkemaPembiayaan"
            DragHandleID="pnlPopupGetOJKSkemaPembiayaanHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKSkemaPembiayaanHeader" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="OJKSkemaPembiayaan" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKSkemaPembiayaan').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKSkemaPembiayaan" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKSkemaPembiayaan" runat="server" DefaultButton="btnSearchOJKSkemaPembiayaan">
                            <asp:TextBox ID="txtSearchOJKSkemaPembiayaan" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKSkemaPembiayaan" OnClick="btnSearchOJKSkemaPembiayaan_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKSkemaPembiayaan" runat="server" OnSelectedIndexChanged="gvwListOJKSkemaPembiayaan_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKSkemaPembiayaan_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKSkemaPembiayaan_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKSkemaPembiayaan" OnClientClick="$find('mdlPopupGetOJKSkemaPembiayaan').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Jenis Barang dan Jasa--%>
    <asp:Panel ID="pnlPopUpGetOJKJenisBarangdanJasa" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKJenisBarangdanJasa" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKJenisBarangdanJasa" runat="server" BehaviorID="mdlPopupGetOJKJenisBarangdanJasa"
            PopupControlID="pnlPopupGetOJKJenisBarangdanJasa" TargetControlID="btnShowPopupGetOJKJenisBarangdanJasa"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender7" runat="server" TargetControlID="pnlPopUpGetOJKJenisBarangdanJasa"
            DragHandleID="pnlPopupGetOJKJenisBarangdanJasaHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKJenisBarangdanJasaHeader" runat="server" CssClass="header">
                <asp:Label ID="Label4" runat="server" CssClass="msg" Text="OJKJenisBarangdanJasa" />
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKJenisBarangdanJasa').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKJenisBarangdanJasa" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKJenisBarangdanJasa" runat="server" DefaultButton="btnSearchOJKJenisBarangdanJasa">
                            <asp:TextBox ID="txtSearchOJKJenisBarangdanJasa" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKJenisBarangdanJasa" OnClick="btnSearchOJKJenisBarangdanJasa_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKJenisBarangdanJasa" runat="server" OnSelectedIndexChanged="gvwListOJKJenisBarangdanJasa_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKJenisBarangdanJasa_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKJenisBarangdanJasa_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKJenisBarangdanJasa" OnClientClick="$find('mdlPopupGetOJKJenisBarangdanJasa').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Jenis Suku Bunga--%>
    <asp:Panel ID="pnlPopUpGetOJKJenisSukuBunga" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKJenisSukuBunga" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKJenisSukuBunga" runat="server" BehaviorID="mdlPopupGetOJKJenisSukuBunga"
            PopupControlID="pnlPopupGetOJKJenisSukuBunga" TargetControlID="btnShowPopupGetOJKJenisSukuBunga"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender8" runat="server" TargetControlID="pnlPopUpGetOJKJenisSukuBunga"
            DragHandleID="pnlPopupGetOJKJenisSukuBungaHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKJenisSukuBungaHeader" runat="server" CssClass="header">
                <asp:Label ID="Label5" runat="server" CssClass="msg" Text="OJKJenisSukuBunga" />
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKJenisSukuBunga').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKJenisSukuBunga" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKJenisSukuBunga" runat="server" DefaultButton="btnSearchOJKJenisSukuBunga">
                            <asp:TextBox ID="txtSearchOJKJenisSukuBunga" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKJenisSukuBunga" OnClick="btnSearchOJKJenisSukuBunga_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKJenisSukuBunga" runat="server" OnSelectedIndexChanged="gvwListOJKJenisSukuBunga_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKJenisSukuBunga_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKJenisSukuBunga_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKJenisSukuBunga" OnClientClick="$find('mdlPopupGetOJKJenisSukuBunga').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- Lookup OJK Mata Uang--%>
    <asp:Panel ID="pnlPopUpGetOJKMataUang" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetOJKMataUang" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetOJKMataUang" runat="server" BehaviorID="mdlPopupGetOJKMataUang"
            PopupControlID="pnlPopupGetOJKMataUang" TargetControlID="btnShowPopupGetOJKMataUang"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender9" runat="server" TargetControlID="pnlPopUpGetOJKMataUang"
            DragHandleID="pnlPopupGetOJKMataUangHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetOJKMataUangHeader" runat="server" CssClass="header">
                <asp:Label ID="Label6" runat="server" CssClass="msg" Text="OJKMataUang" />
                <asp:LinkButton ID="LinkButton6" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetOJKMataUang').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetOJKMataUang" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchOJKMataUang" runat="server" DefaultButton="btnSearchOJKMataUang">
                            <asp:TextBox ID="txtSearchOJKMataUang" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchOJKMataUang" OnClick="btnSearchOJKMataUang_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListOJKMataUang" runat="server" OnSelectedIndexChanged="gvwListOJKMataUang_SelectedIndexChanged"
                            DataKeyNames="CODE,DESCS" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListOJKMataUang_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListOJKMataUang_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="CODE" HeaderText="Code">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCS" HeaderText="Description">
                                    <ItemStyle Width="90%" HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseOJKMataUang" OnClientClick="$find('mdlPopupGetOJKMataUang').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
</asp:Content>
