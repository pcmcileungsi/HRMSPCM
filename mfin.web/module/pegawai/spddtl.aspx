<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true"
    CodeFile="spddtl.aspx.cs" Inherits="module_form_spddtl" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
        });

        function ToggleCheckUncheckAllOptionAsNeeded() {
            var totalCheckboxes = $(checkBoxSelector),
                checkedCheckboxes = totalCheckboxes.filter(":checked"),
                noCheckboxesAreChecked = (checkedCheckboxes.length === 0),
                allCheckboxesAreChecked = (totalCheckboxes.length === checkedCheckboxes.length);

            $(allCheckBoxSelector).attr('checked', allCheckboxesAreChecked);
        }

        $(document).ready(function () {
            $(allCheckBoxSelector).live('click', function () {
                $(checkBoxSelector).attr('checked', $(this).is(':checked'));

                ToggleCheckUncheckAllOptionAsNeeded();
            });

            $(checkBoxSelector).live('click', ToggleCheckUncheckAllOptionAsNeeded);

            ToggleCheckUncheckAllOptionAsNeeded();
        });


        function ToggleCheckUncheckAllOptionAsNeeded1() {
            var totalCheckboxes1 = $(checkBoxSelector1),
                checkedCheckboxes1 = totalCheckboxes1.filter(":checked"),
                noCheckboxesAreChecked1 = (checkedCheckboxes1.length === 0),
                allCheckboxesAreChecked1 = (totalCheckboxes1.length === checkedCheckboxes1.length);

            $(allCheckBoxSelector1).attr('checked', allCheckboxesAreChecked1);
        }

        $(document).ready(function () {
            $(allCheckBoxSelector1).live('click', function () {
                $(checkBoxSelector1).attr('checked', $(this).is(':checked'));

                ToggleCheckUncheckAllOptionAsNeeded1();
            });

            $(checkBoxSelector1).live('click', ToggleCheckUncheckAllOptionAsNeeded1);

            ToggleCheckUncheckAllOptionAsNeeded1();
        });
    </script>
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {
                var $maintab = $("#pages").tabs();
                jsPopUpDate('ctl00_cphbd_txtSPD_Date');
                jsPopUpDate('ctl00_cphbd_txtDepart_Date');
                jsPopUpDate('ctl00_cphbd_txtArrive_Date');
            });
        }

        function jsCalculate() {

            //var a = jsToNumber($get('ctl00_cphbd_txtAMOUNT').value) / 1
            var a = jsToNumber($get('ctl00_cphbd_txtCost_Value').value) / 1
            var b = jsToNumber($get('ctl00_cphbd_txtQty').value) / 1

            $get('ctl00_cphbd_txtTotal_Cost').value = jsToCurrency(a * b);
        }
    </script>
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Pelamar Detail</span>
            </td>
        </tr>
    </table>
    <div id="pages" style="margin: 5px 3px">
        <ul style="font-size: smaller">
            <li><a href="#page-0"><span>Data Diri</span></a></li>
            <li><a href="#page-1"><span>Alamat</span></a></li>
            <li><a href="#page-2"><span>Pendidikan</span></a></li>
            <li><a href="#page-3"><span>Keluarga</span></a></li>
            <li><a href="#page-4"><span>Training</span></a></li>
            <li><a href="#page-5"><span>Penghargaan</span></a></li>
            <li><a href="#page-6"><span>Organisasi</span></a></li>
            <li><a href="#page-7"><span>Ketrampilan</span></a></li>
            <li><a href="#page-8"><span>Peng Kerja</span></a></li>
            <li><a href="#page-9"><span>Lainnya</span></a></li>
        </ul>
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <asp:UpdatePanel ID="pnlBody" runat="server">
                <ContentTemplate>
                    <table id="tblDataDiri" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                        <tr>
                            <td colspan="2" style="border-bottom: solid 1px #dedede">
                                <span class="search-header">Data Diri</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnBack_Data_diri" runat="server" CausesValidation="false" CssClass="back"
                                    Text="Back" OnClick="btnBack_Data_Diri_Click" />
                                <cc1:XUIButton ID="btnSave_Data_diri" runat="server" CssClass="save" Text="Save" RoleCode="B100123" OnClick="btnSave_Data_Diri_Click" />
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td width="20%">
                                <span>Pelamarid</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="80%">
                                <cc1:XUILabel ID="lblid" runat="server" DataType="Integer" DBColumnName="id"
                                    BindType="Both" SPParameterName="p_id" Text="0"></cc1:XUILabel>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="7" style="width: 30%">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/hrms.png" Width="70%"
                                    Height="20%" CssClass="img-responsive" ToolTip="Klik untuk mengubah gambar" />
                            </td>
                            <td width="20%">
                                <span>Posisi</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUIDropDownList ID="ddlposisi" runat="server" CssClass="DropDownList"></cc1:XUIDropDownList>
                            </td>
                            <td width="20%">
                                <span>Tanggal Melamar</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txttgl_lamar" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Kode Pelamar</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txtKode_Pelamar" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                            <td width="20%">
                                <span>Tanggal Batas Akhir</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txtTgl_Batas_Akhir" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Nama</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txtNama" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="100px"></cc1:XUITextBox>
                            </td>
                            <td width="20%">
                                <span>No KTP</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txtNo_KTP" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Nama Panggilan</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txtNama_Panggilan" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                            <td width="20%">
                                <span>No SIM</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txtNo_SIM" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Tempat lahir</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txttempat_lahir" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                            <td width="20%">
                                <span>No NPWP</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txtno_npwp" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Tgl Lahir</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUITextBox ID="txttgl_lahir" runat="server" DataType="String" DBColumnName="USER_ID"
                                    BindType="Both" SPParameterName="p_user_id" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                            <td width="20%">
                                <span>Status Pernikahan</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUIRadioButtonList runat="server" ID="rdbtnStatusNikah">
                                    <asp:ListItem Text="BM" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="M" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="J/D" Value="3"></asp:ListItem>
                                </cc1:XUIRadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <span>Jenis Kelamin</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUIRadioButtonList runat="server" ID="rdbtnJenKel">
                                    <asp:ListItem Text="L" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="W" Value="0"></asp:ListItem>
                                </cc1:XUIRadioButtonList>
                            </td>
                            <td width="20%">
                                <span>Pendidikan Terakhir</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUIDropDownList ID="ddlPendidikan" runat="server" CssClass="DropDownList"></cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%"></td>
                            <td width="20%">
                                <span>Agama</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUIDropDownList ID="DdlAgama" runat="server" CssClass="DropDownList"></cc1:XUIDropDownList>

                            </td>
                            <td width="20%">
                                <span>Unit Kerja</span>
                            </td>
                            <td>
                                <span>:</span>
                            </td>
                            <td width="30%">
                                <cc1:XUIDropDownList ID="ddlUnitKerja" runat="server" CssClass="DropDownList"></cc1:XUIDropDownList>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblAlamat" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Alamat</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBackAlamat" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSaveAlamat" runat="server" CssClass="save" Text="Save" RoleCode="B100123" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblPendidikan" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Pendidikan</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBack_Pendidikan" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSave_Pendidikan" runat="server" CssClass="save" Text="Save" RoleCode="B100003" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-3" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblKeluarga" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Keluarga</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBack_Keluarga" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSave_Keluarga" runat="server" CssClass="save" Text="Save" RoleCode="B100003" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-4" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblTraining" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Training</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBack_training" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSave_training" runat="server" CssClass="save" Text="Save" RoleCode="B100003" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-5" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblPenghargaan" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Penghargaan</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBack_Penghargaan" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSave_Penghargaan" runat="server" CssClass="save" Text="Save" RoleCode="B100003" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-6" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblOrganisasi" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Organisasi</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnback_Organisasi" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSave_Organisasi" runat="server" CssClass="save" Text="Save" RoleCode="B100003" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-7" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblKetrampilan" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Ketrampilan</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBack_Ketrampilan" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSave_Ketrampilan" runat="server" CssClass="save" Text="Save" RoleCode="B100003" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-8" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tblPengkerja" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Pengalaman Kerja</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBack_Pengalaman_kerja" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSave_pengalaman_kerja" runat="server" CssClass="save" Text="Save" RoleCode="B100003" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="page-9" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
            <table id="tbllainnya" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                <tr>
                    <td colspan="2" style="border-bottom: solid 1px #dedede">
                        <span class="search-header">Lainnya</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBack_Lainnya" runat="server" CausesValidation="false" CssClass="back"
                            Text="Back" />
                        <cc1:XUIButton ID="btnSave_Lainnya" runat="server" CssClass="save" Text="Save" RoleCode="B100003" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
