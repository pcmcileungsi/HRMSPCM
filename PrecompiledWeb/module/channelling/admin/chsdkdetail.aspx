<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_channelling_admin_chsdkdetail, App_Web_6nlwv8yu" title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">

    <script type="text/javascript">
         $(document).ready(function() {
            var $maintab = $("#pages").tabs();
            $("#subpages-0").tabs();
            $("#subpages-1").tabs();
            $("#subpages-2").tabs();
            jsPopUpDate("ctl00_cphbd_txtSCHMPTDT");
            jsPopUpDate("ctl00_cphbd_txtDUEDATE");
        });

        function onLoadFunction() {
            jsPopUpDate("ctl00_cphbd_txtSCHMPTDT");
            jsPopUpDate("ctl00_cphbd_txtDUEDATE");
            hitungBiaya();
        }
        
        function hitungBiaya() {
             //biaya
             var biaya = 0;
             var rental = jsToNumber($get('ctl00_cphbd_txtRENTAL').value) / 1
             var provisi    = jsToNumber($get('ctl00_cphbd_txtPROVISI').value) / 1
             var admin = jsToNumber($get('ctl00_cphbd_txtADMIN').value) / 1
             var notaris    = jsToNumber($get('ctl00_cphbd_txtNOTARIS').value) / 1
             var asuransi   = jsToNumber($get('ctl00_cphbd_txtASURANSI').value) / 1
             var asuransi2  = jsToNumber($get('ctl00_cphbd_txtASURANSI2').value) / 1
             var asuransi3  = jsToNumber($get('ctl00_cphbd_txtASURANSI3').value) /1
             var lain       = jsToNumber($get('ctl00_cphbd_txtLAIN').value) / 1
             var titipan2   = jsToNumber($get('ctl00_cphbd_txtTITIPAN2').value) / 1

             if ($get('ctl00_cphbd_chbSTSTITIPAN1').checked) { biaya = rental + provisi + admin + notaris + asuransi + asuransi2 + asuransi3 + lain; }
             else { biaya = rental + provisi + admin + notaris + asuransi + asuransi2 + asuransi3 + +titipan2 + lain; }

             biaya = jsToCurrency(biaya);
             $get('ctl00_cphbd_txtBiaya').value = biaya;
             hitungNetto();
        }

        function hitungNetto() {
            var netto = 0;
            var amtlease = jsToNumber($get('ctl00_cphbd_txtAMTLEASE').value) / 1;
            var rental = jsToNumber($get('ctl00_cphbd_txtRENTAL').value) / 1;
            var provisi = jsToNumber($get('ctl00_cphbd_txtPROVISI').value) / 1;
            var admin = jsToNumber($get('ctl00_cphbd_txtADMIN').value) / 1;
            var notaris = jsToNumber($get('ctl00_cphbd_txtNOTARIS').value) / 1;
            var asuransi = jsToNumber($get('ctl00_cphbd_txtASURANSI').value) / 1;
            var asuransi2 = jsToNumber($get('ctl00_cphbd_txtASURANSI2').value) / 1;
            var asuransi3 = jsToNumber($get('ctl00_cphbd_txtASURANSI3').value) / 1;
            var titipan2 = jsToNumber($get('ctl00_cphbd_txtTITIPAN2').value) / 1;
            var lain = jsToNumber($get('ctl00_cphbd_txtLAIN').value) / 1;
            var uangmuka = jsToNumber($get('ctl00_cphbd_txtUangMuka').value) / 1
            
            if ($get('ctl00_cphbd_chbSTSTITIPAN1').checked) {
                if ($get('ctl00_cphbd_chbSTSTITIPAN2').checked) {
                    netto = amtlease;
                } else {
                    netto = amtlease + titipan2;
                }
            }else {
            if ($get('ctl00_cphbd_chbSTSTITIPAN2').checked) {
                netto = amtlease;
                }else {
                    netto = amtlease - titipan2;
                }
            }
            if ($get('ctl00_cphbd_chbSTSRENTAL').checked) { netto = netto; }
            else { netto -= rental; }
            if ($get('ctl00_cphbd_chbSTSPROVISI').checked) { netto = netto; }
            else { netto -= provisi; }

            if ($get('ctl00_cphbd_chbSTSADMIN').checked) { netto = netto }
            else { netto -= admin; }

            if ($get('ctl00_cphbd_chbSTSNOTARIS').checked) { netto = netto }
            else { netto -= notaris; }

            if ($get("ctl00_cphbd_ddlSTSASURANSI1").value == "1") { netto -= asuransi; }
            else { netto = netto; }
            
            if($get("ctl00_cphbd_ddlSTSASURANSI2").value == "1") { netto -= asuransi2; }
            else {netto = netto; }
            
            if($get("ctl00_cphbd_ddlSTSASURANSI3").value == "1"){ netto -= asuransi3; }
            else {netto = netto; }

            if ($get('ctl00_cphbd_chbSTSLAIN').checked) { netto = netto; }
            else {netto -= lain; }

            //uangmuka
            if ($get('ctl00_cphbd_chbSTSUANGMUKA').checked) { netto = netto + uangmuka; }
            else { netto = netto; }
            
            netto = jsToCurrency(netto);
            $get('ctl00_cphbd_txtNetto').value = netto;
        }

        function jsCopyRemark() {
            $get('ct100_cphbd_txtREMARKOnDocuments').value = $get('ct100_cphbd_txtREMARK').value;
        }

        function jsChangeLeaseRequestState() {
            //alert($get('ctl00_cphbd_rboPAIDBY_0').checked);
            if ($get('ctl00_cphbd_rboPAIDBY_1').checked) {
                $get('ctl00_cphbd_txtBank').disabled = true;
                $get('ctl00_cphbd_txtBANKACC').disabled = true;

            }
            else if ($get('ctl00_cphbd_rboPAIDBY_2').checked) {
                $get('ctl00_cphbd_txtBank').disabled = false;
                $get('ctl00_cphbd_txtBANKACC').disabled = false;
            }

        }
       
    </script>

    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="search-header-table">
        <tr>
            <td style="border-bottom: solid 1px #dedede">
                <span class="search-header">Channelling Disbursement Requisition Detail</span>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: text-bottom;">
                <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                    Text="Back" OnClick="btnBack_Click" />
            </td>
        </tr>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>SDK Detail</span></a></li>
            <li><a href="#page-1"><span>Agreement</span></a></li>
            <li><a href="#page-2"><span>Collateral</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow: auto">
            <asp:UpdatePanel ID="pnlBody0" runat="server"  >
                <ContentTemplate>
                    <table id="tblBody0" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                        <tr>
                            <td>
                                <cc1:XUIButton RoleCode="B200025" ID="btnSaveSDK" runat="server" CssClass="save" Text="Save" OnClick="btnSaveSDK_Click" />
                            </td>
                            <td colspan="3" align="right">
                                <%--<cc1:XUIButton RoleCode="B200027" ID="btnPrintPlakat" runat="server" CssClass="print" Text="App Penempelan Plakat" OnClick="btnPrintPlakat_Click" />--%>
                                <cc1:XUIButton RoleCode="B200027" ID="btnPrintSDK" runat="server" CssClass="print" Text="SDK" OnClick="btnPrintSDK_Click" />
                                <%--<cc1:XUIButton ID="btnPrintPO" runat="server" CssClass="print" Text="PO" 
                                ToolTip="Print Purchase Order" OnClick="btnPrintPO_Click" RoleCode="B200027" />--%>
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td width="20%">
                                <span>ID</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUILabel ID="lblCHPAYMENTREQUESTID" runat="server" DataType="String" DBColumnName="CH_PAYMENTREQUESTID"
                                    BindType="Both" SPParameterName="p_ch_paymentrequestid" Text="0"></cc1:XUILabel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Batch No.</span>
                            </td>
                            <td width="1%">
                                <span>:</span>
                            </td>
                            <td width="79%">
                                <cc1:XUITextBox ID="txtLSAGREE" runat="server" DataType="String" DBColumnName="LSAGREE"
                                    BindType="Both" SPParameterName="p_lsagree" MaxLength="20" Width="160px" Enabled="false"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td width="20%">
                                <span>Client</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td>
                                <cc1:XUILabel ID="lblClient" runat="server" DataType="String" DBColumnName="NAME"
                                    BindType="Both" SPParameterName="p_client" MaxLength="60" Width="320px" Enabled="false">
                                </cc1:XUILabel>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Lessee</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtName" runat="server" DataType="String" DBColumnName="NAME"
                                    BindType="Both" SPParameterName="p_name" MaxLength="40" Width="320px" Enabled="false"></cc1:XUITextBox>
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
                                <cc1:XUITextBox ID="txtAMTLEASE" runat="server" DataType="Number" DBColumnName="AMTLEASE"
                                    BindType="Both" SPParameterName="p_amtlease" MaxLength="17" Width="136px" Format="N2"
                                    Enabled="false">
                                </cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td width="20%">
                                <span>Margin</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtMARGIN" runat="server" DataType="Number" DBColumnName="MARGIN"
                                    BindType="Both" SPParameterName="p_margin" MaxLength="18" Width="144px" Format="N0"
                                    Enabled="false">
                                </cc1:XUITextBox>
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
                                <cc1:XUIRadioButtonList ID="rboMODULE" runat="server" DataType="String" DBColumnName="MODULE"
                                    BindType="Both" SPParameterName="p_module" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                    Enabled="false">
                                    <asp:ListItem Value="0" Selected="True" style="display:none;"></asp:ListItem>
                                    <asp:ListItem Value="1">Leasing </asp:ListItem>
                                    <asp:ListItem Value="2">Consumer Finance </asp:ListItem>
                                    <asp:ListItem Value="3">Ijarah Mumtahiyyah Bi Al Tamlik </asp:ListItem>
                                    <asp:ListItem Value="4">Murabahah </asp:ListItem>
                                </cc1:XUIRadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Lease Type</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIRadioButtonList ID="rboLEASETYPE" runat="server" DataType="String" DBColumnName="LEASETYPE"
                                    BindType="Both" SPParameterName="p_leasetype" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="0" Selected="True" style="display:none;"></asp:ListItem>
                                    <asp:ListItem Value="1">Finance lease </asp:ListItem>
                                    <asp:ListItem Value="2">Syariah umum </asp:ListItem>
                                    <asp:ListItem Value="3">Syariah Niaga </asp:ListItem>
                                </cc1:XUIRadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <span>&nbsp;</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-bottom: solid 1px #dedede;">
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td width="100%" colspan="3">
                                <h2>Payment Instruction</h2>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Lessee's Request</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUIRadioButtonList ID="rboPAIDBY" runat="server" BindType="Both" DataType="String"
                                    DBColumnName="PAIDBY" SPParameterName="p_paidby" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                    onclick="jsChangeLeaseRequestState();">
                                    <asp:ListItem Value="9" Selected="True" style="display:none;"></asp:ListItem>
                                    <asp:ListItem Value="1">Pay By Check/Giro</asp:ListItem>
                                    <asp:ListItem Value="2">Pay By bank transfer</asp:ListItem>
                                </cc1:XUIRadioButtonList>
                                <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvPAIDBY" runat="server" ControlToValidate="rboPAIDBY"
                                ErrorMessage="* Harus diisi" />
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Bank</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtBank" runat="server" DataType="String" DBColumnName="BANK"
                                    BindType="Both" SPParameterName="p_bank" MaxLength="40" Width="320px" Enabled="false">
                                </cc1:XUITextBox>
                                <asp:CustomValidator Text="* Harus diisi" ID="CustomValidator1" ControlToValidate="txtBank"
                                    runat="server" SetFocusOnError="true" OnServerValidate="BankValidate"></asp:CustomValidator>

                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Account Name</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtAddress" runat="server" DataType="String" DBColumnName="ADDRESS1"
                                    BindType="Both" SPParameterName="p_address1" MaxLength="40" Width="320px">
                                </cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Bank Account No.</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtBANKACC" runat="server" DataType="String" DBColumnName="BANKACC"
                                    BindType="Both" SPParameterName="p_bankacc" MaxLength="20" Width="160px" Enabled="false">
                                </cc1:XUITextBox>
                                <asp:CustomValidator Text="* Harus diisi" ID="cvlBANKACC" ControlToValidate="txtBANKACC"
                                    runat="server" SetFocusOnError="true" OnServerValidate="BankaccValidate"></asp:CustomValidator>

                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Disburse date</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtSCHMPTDT" runat="server" DataType="DateTime" DBColumnName="SCHPMTDT"
                                    BindType="Both" SPParameterName="p_schpmtdt" Width="72px" Format="dd/MM/yyyy"
                                    style="text-align:center; vertical-align:middle;">
                                </cc1:XUITextBox>
                                <asp:RequiredFieldValidator ID="rfvSCHMPTDT" runat="server" ControlToValidate="txtSCHMPTDT"
                                ErrorMessage="* Harus diisi" />
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>First Due date</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtDUEDATE" runat="server" CausesValidation="false" DataType="DateTime" DBColumnName="DUEDATE"
                                    BindType="Both" SPParameterName="p_duedate" Width="72px" Format="dd/MM/yyyy"
                                    style="text-align:center; vertical-align:middle;">
                                </cc1:XUITextBox>
                                <asp:RequiredFieldValidator ID="rfvDUEDATE" runat="server" ControlToValidate="txtDUEDATE"
                                ErrorMessage="* Harus diisi" />
                            </td>
                        </tr>
                        <tr style="vertical-align:top;">
                            <td width="20%">
                                <span>Note</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtNote" runat="server" DataType="String" DBColumnName="CATATAN"
                                    BindType="Both" SPParameterName="p_catatan" TextMode="MultiLine"
                                    Rows="5" Width="320px">
                                </cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td width="20%">
                                <span>Bank Account No.</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtPMTREQUEST" runat="server" DataType="String" DBColumnName="PMTREQUEST"
                                    BindType="Both" SPParameterName="p_pmtrequest" MaxLength="20" Width="160px">
                                </cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr><td colspan="3"><span>&nbsp;</span></td></tr>
                        <tr><td colspan="3" style="border-bottom: solid 1px #dedede;"></td></tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td width="100%" colspan="3">
                                <h2>
                                    Payment Detail
                                </h2>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>A. </span>
                            </td>
                            <td width="20%">
                                <span>Jumlah Pencairan</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtAMTLEASED" runat="server" DBColumnName="AMTLEASE" BindType="Both"
                                    SPParameterName="p_amtlease" DataType="Number" Format="N2" MaxLength="17" Width="136px"
                                    Enabled="false" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>1. </span>
                            </td>
                            <td width="20%">
                                <span>Security Deposit</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtUangMuka" runat="server" DBColumnName="UANGMUKA" BindType="Both"
                                    SPParameterName="p_uangmuka" DataType="Number" Format="N2" MaxLength="17" Width="136px"
                                    Enabled="false" />
                                <cc1:XUICheckBox ID="chbSTSUANGMUKA" runat="server" DBColumnName="STSUANGMUKA" BindType="Both"
                                    SPParameterName="p_stsuangmuka" DataType="String" onclick="hitungBiaya();" ToolTip="Check if payment to TIFA"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>2. </span>
                            </td>
                            <td width="20%">
                                <span>Angsuran ke 1</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtRENTAL" runat="server" DBColumnName="RENTAL" BindType="Both"
                                    SPParameterName="p_rental" DataType="Number" Format="N2" MaxLength="17" Width="136px"
                                    Enabled="true" />
                                <cc1:XUICheckBox ID="chbSTSRENTAL" runat="server" DBColumnName="STSRENTAL" BindType="Both"
                                    SPParameterName="p_stsrental" DataType="String" onclick="hitungBiaya();" ToolTip="Check to exclude"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>3. </span>
                            </td>
                            <td width="20%">
                                <span>Biaya Provisi</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtPROVISI" runat="server" DBColumnName="PROVISI" BindType="Both"
                                    SPParameterName="p_provisi" DataType="Number" Format="N2" MaxLength="17" Width="136px"
                                    Enabled="true" />
                                <cc1:XUICheckBox ID="chbSTSPROVISI" runat="server" DBColumnName="STSPROVISI" BindType="Both"
                                    SPParameterName="p_stsprovisi" DataType="String" onclick="hitungBiaya();" ToolTip="Check to exclude"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>4. </span>
                            </td>
                            <td>
                                <span>Biaya Administrasi</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtADMIN" runat="server" DBColumnName="ADMIN" BindType="Both"
                           
                           
                                    SPParameterName="p_admin" DataType="Number" Format="N2" MaxLength="17" Width="136px"
                                    Enabled="false" />
                                <cc1:XUICheckBox ID="chbSTSADMIN" runat="server" DBColumnName="STSADMIN" BindType="Both"
                                    SPParameterName="p_stsadmin" DataType="String" onclick="hitungBiaya();" ToolTip="Check to exclude"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>5. </span>
                            </td>
                            <td>
                                <span>Biaya Notaris</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtNOTARIS" runat="server" DBColumnName="NOTARIS" BindType="Both"
                                    SPParameterName="p_notaris" DataType="Number" Format="N2" MaxLength="17" Width="136px" 
                                    Enabled="false"/>
                                <cc1:XUICheckBox ID="chbSTSNOTARIS" runat="server" DBColumnName="STSNOTARIS" BindType="Both"
                                    SPParameterName="p_stsnotaris" DataType="String" onclick="hitungBiaya();" ToolTip="Check to exclude"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>6. </span>
                            </td>
                            <td>
                                <span>Asuransi Tahun 1</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtASURANSI" runat="server" DBColumnName="ASURANSI" BindType="Both"
                                    SPParameterName="p_asuransi" DataType="Number" Format="N2" MaxLength="17" Width="136px" 
                                    Enabled="false"/>
                                <cc1:XUIDropDownList ID="ddlSTSASURANSI1" runat="server" DBColumnName="STSASURANSI1" BindType="Both"
                                    SPParameterName="p_stsasuransi1" DataType="String" 
                                    Enabled="false">
                                    <asp:ListItem Value="0">Tunai/Transfer</asp:ListItem>
                                    <asp:ListItem Value="1">Potong Pencairan</asp:ListItem>
                                    <asp:ListItem Value="2">Titip Giro</asp:ListItem>
                                    <asp:ListItem Value="3">Bayar Saat Jatuh Tempo</asp:ListItem>
                                </cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <span>Asuransi Tahun 2</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtASURANSI2" runat="server" DBColumnName="ASURANSI2" BindType="Both"
                                    SPParameterName="p_asuransi2" DataType="Number" Format="N2" MaxLength="17" Width="136px" 
                                    Enabled="false"/>
                                <cc1:XUIDropDownList ID="ddlSTSASURANSI2" runat="server" DBColumnName="STSASURANSI2" BindType="Both"
                                    SPParameterName="p_stsasuransi2" DataType="String"
                                    Enabled="false">
                                    <asp:ListItem Value="0">Tunai/Transfer</asp:ListItem>
                                    <asp:ListItem Value="1">Potong Pencairan</asp:ListItem>
                                    <asp:ListItem Value="2">Titip Giro</asp:ListItem>
                                    <asp:ListItem Value="3">Bayar Saat Jatuh Tempo</asp:ListItem>    
                                </cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Asuransi tahun 3
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtASURANSI3" runat="server" DBColumnName="ASURANSI3" BindType="Both"
                                    SPParameterName="p_asuransi3" DataType="Number" Format="N2" MaxLength="17" Width="136px"
                                    Enabled="false"/>
                                <cc1:XUIDropDownList ID="ddlSTSASURANSI3" runat="server" DBColumnName="STSASURANSI3" BindType="Both"
                                    SPParameterName="p_stsasuransi3" DataType="String" onchange="hitungBiaya();"
                                    Enabled="false">
                                    <asp:ListItem Value="0">Tunai/Transfer</asp:ListItem>
                                    <asp:ListItem Value="1">Potong Pencairan</asp:ListItem>
                                    <asp:ListItem Value="2">Titip Giro</asp:ListItem>
                                    <asp:ListItem Value="3">Bayar Saat Jatuh Tempo</asp:ListItem>
                                </cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>7.</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtTITIPAN1" runat="server" DBColumnName="TITIPAN1" BindType="Both"
                                    SPParameterName="p_titipan1" DataType="String" MaxLength="30" Width="240px"  />
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtTITIPAN2" runat="server" DBColumnName="TITIPAN2" BindType="Both"
                                    SPParameterName="p_titipan2" DataType="Number" MaxLength="17" Width="136px" Format="N2"/>
                                <cc1:XUICheckBox ID="chbSTSTITIPAN2" runat="server" DBColumnName="STSTITIPAN2" BindType="Both"
                                    SPParameterName="p_ststitipan2" DataType="String" onclick="hitungBiaya();" ToolTip="Check to include"/>
                                <cc1:XUICheckBox ID="chbSTSTITIPAN1" runat="server" DBColumnName="STSTITIPAN1" BindType="Both"
                                    SPParameterName="p_ststitipan1" DataType="String" onclick="hitungBiaya();" ToolTip="Check to include"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>8. </span>
                            </td>
                            <td>
                                <span>Biaya Lain-lain</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtLAIN" runat="server" DBColumnName="LAIN" BindType="Both" SPParameterName="p_lain"
                                    DataType="Number" Format="N2" MaxLength="17" Width="136px" Enabled="false"/>
                                <cc1:XUICheckBox ID="chbSTSLAIN" runat="server" DBColumnName="STSLAIN" BindType="Both"
                                    SPParameterName="p_stslain" DataType="String" onclick="hitungBiaya();" ToolTip="Check to exclude"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>B. </span>
                            </td>
                            <td>
                                <span>Jumlah No. 1 s/d 8</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtBiaya" runat="server" BindType="DBToUIOnly" DBColumnName="AMTBIAYA"
                                    Enabled="false" DataType="Number" style="text-align:right;" Format="N0"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>C.</span>
                            </td>
                            <td>
                                <span>Jumlah A-B</span>
                            </td>
                            <td width="80%">
                                <cc1:XUITextBox ID="txtNetto" runat="server" BindType="DBToUIOnly" DBColumnName="AMTNETTO"
                                    Enabled="false" DataType="Number" style="text-align:right;" Format="N0"
                                    onChange="jsFormatCurrency(this);"/>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow-y: auto">
            <table id="tblBody2" cellpadding="3px" cellspacing="0px" class="search-list-table">
                <tr>
                    <td align="right">
                        <asp:Panel ID="pnlSearchAgreement" runat="server" DefaultButton="btnSearchAgreement">
                            <asp:TextBox ID="txtSearchAgreement" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchAgreement" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchAgreement_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updPanel2" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListAgreement" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="LS_AGREEMENTID" OnSelectedIndexChanged="gvwListAgreement_SelectedIndexChanged"
                                    EmptyDataText="There is no data." AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListAgreement_PageIndexChanging"
                                    OnRowCreated="gvwListAgreement_RowCreated" GridLines="None" CssClass="mGrid"
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
                                        <asp:BoundField DataField="LSAGREE" HeaderText="Agreement No.">
                                            <ItemStyle Width="13%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LESSEE" HeaderText="Client Name">
                                            <ItemStyle Width="27%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="APPLICDT" HeaderText="App. Date" DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESCS" HeaderText="Description">
                                            <ItemStyle Width="35%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AMTLEASE" HeaderText="Amount" DataFormatString="{0:N2}">
                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <%--<asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnSelectAgreement" runat="server" CausesValidation="False"
                                                    CommandName="Select" ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" Visible = "False" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearchAgreement" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff;
            color: #000; height: 430px; overflow: auto">
            <table id="tblBodyCollacteral" runat="server" cellpadding="3" cellspacing="0" class="search-list-table"
            width="100%">
                <tr style="display:none;">
                    <td>
                        <asp:TextBox ID="txtLSAGREED2" runat="server" DBColumnName="LSAGREE" DataType="String"
                            BindType="Both" SPParameterName="p_lsagree" MaxLength="20" Width="160px" Enabled="false"/>
                    </td>
                    <td align="right">
                        <asp:TextBox ID="txtNAME2_1" runat="server" DBColumnName="NAME" DataType="String"
                            MaxLength="40" Width="320px" SPParameterName="p_name" BindType="Both" Enabled="false" />
                    </td>
                </tr>
                <tr style="display:none;">
                    <td>
                        <asp:Button ID="btnAddCollateral" runat="server" CssClass="add" Text="Add" OnClick="btnAddCollateral_Click" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Panel ID="pnlSearchCollacteral" runat="server" DefaultButton="btnSearchCollacteral">
                            <asp:TextBox ID="txtSearchCollacteral" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchCollacteral" runat="server" CssClass="search" Text="Search"
                                OnClick="btnSearchCollacteral_Click" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel ID="pnlBody2" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvwListCollateral" runat="server" AutoGenerateColumns="False" DataKeyNames="LS_ASSETVEHICLEID,ASSETNO"
                                    OnSelectedIndexChanged="gvwListCollateral_SelectedIndexChanged" EmptyDataText="There is no data."
                                    AllowPaging="true" PageSize="10" OnPageIndexChanging="gvwListCollateral_PageIndexChanging"
                                    OnRowCommand="gvwListCollateral_RowCommand"
                                    OnRowCreated="gvwListCollateral_RowCreated" GridLines="None" CssClass="mGrid"
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
                                        <asp:BoundField DataField="ASSETNO" HeaderText="Asset No.">
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESCRIPTION" HeaderText="Description Asset">
                                            <ItemStyle Width="28%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MAKE" HeaderText="Merk">
                                            <ItemStyle Width="5%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ASSETTYPE" HeaderText="Type">
                                            <ItemStyle Width="10%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MODEL" HeaderText="Jenis">
                                            <ItemStyle Width="5%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SERIALNO" HeaderText="E/N">
                                            <ItemStyle Width="10%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="VHCCHASS" HeaderText="Vhc. Chass">
                                            <ItemStyle Width="10%" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ASSETCOST" HeaderText="Cost Price" DataFormatString="{0:N2}">
                                            <ItemStyle Width="12%" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                       <%-- <asp:TemplateField>--%>
                                            <%--<ItemTemplate>
                                                <asp:ImageButton ID="btnSelect" runat="server" CausesValidation="False" CommandName="sel2"
                                                    ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" CommandArgument="<%# Container.DataItemIndex %>"  />
                                            </ItemTemplate>--%>
                                            <%--<ItemTemplate>
                                                <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                    ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" Visible = "false" />
                                            </ItemTemplate>--%>
                                       <%-- </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>
                        <%--<table id="tblBody9_1" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                            <tr>
                                <td colspan="2">
                                    <cc1:XUITextBox ID="txtREMARK" runat="server" DBColumnName="REMARK"
                                        BindType="Both" SPParameterName="p_remark" DataType="String"  
                                        MaxLength="40" Width="320px" Rows="5" onblur="jsCopyRemark();" Visible="false">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                        </table>--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
