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
        <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 470px; overflow-y: auto">
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
                            <td>
                                <span>Pelamarid</span>
                            </td>
                            <td>
                                <cc1:XUILabel ID="lblid" runat="server" DataType="Integer" DBColumnName="id"
                                    BindType="Both" SPParameterName="p_ID" Text="0"></cc1:XUILabel>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2" style="width: 30%">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/hrms.png" Width="70%"
                                    Height="20%" CssClass="img-responsive" ToolTip="Klik untuk mengubah gambar" />
                            </td>
                            <td>
                                <span>Posisi</span>
                            </td>
                            <td>
                                <cc1:XUIDropDownList ID="ddlposisi" runat="server" CssClass="DropDownList" SPParameterName="p_KODE_POSISI"></cc1:XUIDropDownList>
                            </td>
                            <td>
                                <span>Tanggal Melamar</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txttgl_lamar" runat="server" DataType="String" DBColumnName="tanggal_mulai_melamar"
                                    BindType="Both" SPParameterName="p_TANGGAL_MULAI_MELAMAR" MaxLength="10" Width="80px"></cc1:XUITextBox>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Kode Pelamar</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtKode_Pelamar" runat="server" DataType="String" DBColumnName="KODE"
                                    BindType="Both" SPParameterName="p_KODE" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                            <td>
                                <span>Tanggal Batas Akhir</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtTgl_Batas_Akhir" runat="server" DataType="String" DBColumnName="TANGGAL_END_PROSES"
                                    BindType="Both" SPParameterName="p_TANGGAL_END_PROSES" MaxLength="10" Width="80px"></cc1:XUITextBox>

                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <span>Nama</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtNama" runat="server" DataType="String" DBColumnName="NAMA"
                                    BindType="Both" SPParameterName="p_NAMA" MaxLength="70" Width="100px"></cc1:XUITextBox>
                            </td>
                            <td>
                                <span>No KTP</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtNo_KTP" runat="server" DataType="String" DBColumnName="NO_KTP"
                                    BindType="Both" SPParameterName="p_NO_KTP" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <span>Nama Panggilan</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtNama_Panggilan" runat="server" DataType="String" DBColumnName="NAMA_PANGGILAN"
                                    BindType="Both" SPParameterName="p_NAMA_PANGGILAN" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                            <td>
                                <span>No NPWP</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtno_npwp" runat="server" DataType="String" DBColumnName="NO_NPWP"
                                    BindType="Both" SPParameterName="p_NO_NPWP" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <span>Tempat lahir</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txttempat_lahir" runat="server" DataType="String" DBColumnName="TEMPAT_LAHIR"
                                    BindType="Both" SPParameterName="p_TEMPAT_LAHIR" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                            <td>Jenis SIM:</td>
                            <td>
                                <cc1:XUIDropDownList ID="ddlJenisSIM" runat="server" SPParameterName="p_JENIS_SIM" CssClass="DropDownList">
                                    <asp:ListItem Text="Tidak Punya" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="B1" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="B2" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="C" Value="4"></asp:ListItem>
                                </cc1:XUIDropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <span>Tgl Lahir</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txttgl_lahir" runat="server" DataType="String" DBColumnName="TANGGAL_LAHIR"
                                    BindType="Both" SPParameterName="p_TANGGAL_LAHIR" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                            <td>
                                <span>No SIM</span>
                            </td>
                            <td>
                                <cc1:XUITextBox ID="txtNo_SIM" runat="server" DataType="String" DBColumnName="NO_SIM"
                                    BindType="Both" SPParameterName="p_NO_SIM" MaxLength="10" Width="80px"></cc1:XUITextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <span>Status Pernikahan</span>
                            </td>
                            <td>
                                <cc1:XUIRadioButtonList runat="server" ID="rdbtnStatusNikah" SPParameterName="p_STATUS_KAWIN">
                                    <asp:ListItem Text="BM" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="M" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="J/D" Value="3"></asp:ListItem>
                                </cc1:XUIRadioButtonList>
                            </td>
                            <td>
                                <span>Kendaraan</span>
                            </td>
                            <td>
                                <cc1:XUIDropDownList ID="ddlKendaraan" runat="server" CssClass="DropDownList" SPParameterName="p_KENDARAAN">
                                    <asp:ListItem Text="Tidak Punya" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Sepeda" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Motor" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Angkutan" Value="3"></asp:ListItem>

                                </cc1:XUIDropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <span>Jenis Kelamin</span>
                            </td>
                            <td>
                                <cc1:XUIRadioButtonList runat="server" ID="rdbtnJenKel" SPParameterName="p_JENIS_KELAMIN">
                                    <asp:ListItem Text="L" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="W" Value="0"></asp:ListItem>
                                </cc1:XUIRadioButtonList>
                            </td>
                            <td>
                                <span>Pendidikan Terakhir</span>
                            </td>
                            <td>
                                <cc1:XUIDropDownList ID="ddlPendidikan" runat="server" CssClass="DropDownList" SPParameterName="p_PENDIDIKAN_TERAKHIR"></cc1:XUIDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <span>Agama</span>
                            </td>
                            <td>
                                <cc1:XUIDropDownList ID="DdlAgama" runat="server" CssClass="DropDownList" SPParameterName="p_KODE_AGAMA"></cc1:XUIDropDownList>

                            </td>
                            <td>
                                <span>Unit Kerja</span>
                            </td>
                            <td>
                                <cc1:XUIDropDownList ID="ddlUnitKerja" runat="server" CssClass="DropDownList" SPParameterName="p_UNIT_KERJA"></cc1:XUIDropDownList>
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
                <tr>
                    <td>Alamat Sekarang</td>
                    <td>
                        <cc1:XUITextBox ID="txtalamat_sekarang" TextMode="MultiLine" runat="server" DataType="String" DBColumnName="alamat_sekarang"
                            BindType="Both" SPParameterName="p_ALAMAT_SEKARANG" Width="80px"></cc1:XUITextBox></td>
                    <td>HP1</td>
                    <td>
                        <cc1:XUITextBox ID="txtHP1" runat="server" DataType="String" DBColumnName="HP1"
                            BindType="Both" SPParameterName="p_HP1" Width="80px"></cc1:XUITextBox></td>
                </tr>
                <tr>
                    <td>Provinsi</td>
                    <td>
                        <cc1:XUIDropDownList ID="ddlProvinsi" runat="server" CssClass="DropDownList"></cc1:XUIDropDownList>
                    </td>
                    <td>HP2</td>
                    <td>
                        <cc1:XUITextBox ID="txtHP2" runat="server" DataType="String" DBColumnName="HP1"
                            BindType="Both" SPParameterName="p_HP2" Width="80px"></cc1:XUITextBox></td>
                </tr>
                <tr>
                    <td>Kabupaten</td>
                    <td>
                        <cc1:XUIDropDownList ID="ddlKabupaten" runat="server" CssClass="DropDownList"></cc1:XUIDropDownList>
                    </td>
                    <td>Email</td>
                    <td>
                        <cc1:XUITextBox ID="txtEmail" runat="server" DataType="String" DBColumnName="email"
                            BindType="Both" SPParameterName="p_EMAIL" Width="80px"></cc1:XUITextBox></td>

                </tr>
                <tr>
                    <td>Kecamatan</td>
                    <td>
                        <cc1:XUIDropDownList ID="ddlKecamatan" runat="server" CssClass="DropDownList"></cc1:XUIDropDownList>
                    </td>
                    <td>Status Rumah</td>
                    <td>
                        <cc1:XUIDropDownList ID="ddlstatus_rumah" runat="server" SPParameterName="p_STATUS_RUMAH" CssClass="DropDownList">
                            <asp:ListItem Text="Sewa" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Sendiri" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Sewa" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Orang Tua/Saudara" Value="3"></asp:ListItem>
                        </cc1:XUIDropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Desa</td>
                    <td>
                        <cc1:XUIDropDownList ID="ddlDesa" runat="server" CssClass="DropDownList"></cc1:XUIDropDownList>
                    </td>
                    <td>Alamat KTP</td>
                    <td>
                        <cc1:XUITextBox ID="txtAlamat_KTP" runat="server" TextMode="MultiLine" DataType="String" DBColumnName="ALAMAT_KTP"
                            BindType="Both" SPParameterName="p_ALAMAT_KTP" Width="80px"></cc1:XUITextBox></td>
                </tr>
                <tr>
                    <td>Telp</td>
                    <td>
                        <cc1:XUITextBox ID="txtTelp" runat="server" DataType="String" DBColumnName="TELP"
                            BindType="Both" SPParameterName="p_TELP" Width="80px"></cc1:XUITextBox></td>
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
                        <cc1:XUIButton ID="btnSave_Pendidikan" runat="server" CssClass="save" Text="Save" RoleCode="B100003" OnClick="btnSave_Pendidikan_Click" />
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
