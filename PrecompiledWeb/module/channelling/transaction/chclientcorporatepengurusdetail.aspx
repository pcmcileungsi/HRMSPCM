<%@ page language="C#" masterpagefile="~/mfin.master" autoeventwireup="true" inherits="module_channelling_transaction_chclientcorporatepengurusdetail, App_Web_pt4ne0vj" title="Untitled Page" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        function fnPangsa() {
            var e = $get('ctl00_cphbd_ddlIDJabatan');
            switch (e.option[e.selectedIndex].value) {
                case "00":
                case "01":
                case "02":
                case "03":
                case "04":
                case "05":
                case "06":
                case "07":
                case "09":
                case "10":
                case "11":
                case "12":
                case "13":
                case "19": $get('ctl00_cphbd_txtPangsa').disable = true; break;
                default: $get('ctl00_cphbd_txtPangsa').disable = false; break;
            }
        }
    </script>
    <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
        <tr>
            <td colspan="2" style="border-bottom: solid 1px #dedede">
                <span class="search-header">Data Pengurus</span>
            </td>
        </tr>
        <tr>
            <td width="20%">
                <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"    
                    Text="Back" OnClick="btnBack_Click" />
                <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B200007" />
                
            </td>
            <td width="80%">
                <cc1:XUITextBox ID="txtLocalCode" runat="server" DataType="String" BindType="UIToDBOnly"
                    SPParameterName="p_localcode" Enabled="false" Width="72px" style="text-align:center;"/>
                <asp:TextBox ID="txtClientDescs" runat="server" Width="350px" Enabled="false"/>
            </td>
        </tr>
    </table>

    <asp:UpdatePanel ID="pnlBody" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table id="tblBody2" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr style="display:none;">
                    <td colspan="3">
                        <cc1:XUILabel ID="lblSIDPengurus" runat="server" DataType="String"
                            BindType="Both" DBColumnName="SID_PENGURUSID" SPParameterName="p_sid_pengurusid"
                            Text="0">
                        </cc1:XUILabel>    
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        ID Pengurus
                    </td>
                    <td width="1%">
                        <span>:</span>
                    </td>
                    <td width="79%">
                        <cc1:XUITextBox ID="txtIDPengurus" runat="server" DataType="String" DBColumnName="IDPENGURUS"
                            BindType="Both" SPParameterName="p_idpengurus" Enabled="false"/>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Nama Pengurus
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUITextBox ID="txtNama" runat="server" DataType="String" DBColumnName="NAMA"
                            BindType="Both" SPParameterName="p_nama" MaxLength="40" Width="320px">
                        </cc1:XUITextBox>
                        <asp:RegularExpressionValidator ID="revNama" runat="server" ErrorMessage="* Tidak Boleh ada Special karakter"
                            ControlToValidate="txtNama" ValidationExpression="[A-Za-z '-]*[A-Za-z '-]" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Jenis Kelamin
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUIDropDownList ID="ddlKelamin" runat="server" DataType="String" DBColumnName="KELAMIN"
                            BindType="Both" SPParameterName="p_kelamin">
                            <asp:ListItem Value="0">Badan Usaha</asp:ListItem>
                            <asp:ListItem Value="1">Pria</asp:ListItem>
                            <asp:ListItem Value="2">Wanita</asp:ListItem>
                        </cc1:XUIDropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        No. KTP
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUITextBox ID="txtKTP" runat="server" DataType="String" DBColumnName="KTP" BindType="Both"
                            SPParameterName="p_ktp" MaxLength="30" Width="240px">
                        </cc1:XUITextBox>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        NPWP
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUITextBox ID="txtNPWPPengurus" runat="server" DataType="String" DBColumnName="NPWP"
                            BindType="Both" SPParameterName="p_npwp" MaxLength="20" Width="160px">
                        </cc1:XUITextBox>
                    </td>
                </tr>
                <tr>
                    <td width="20%" style="vertical-align: text-top;">
                        Alamat
                    </td>
                    <td style="vertical-align: text-top;">
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUITextBox ID="txtAlamat" runat="server" DataType="String" DBColumnName="ALAMAT"
                            BindType="Both" SPParameterName="p_alamat" MaxLength="100" TextMode="MultiLine"
                            Rows="5" Width="320px" Wrap="true">
                        </cc1:XUITextBox>
                        <asp:RegularExpressionValidator ID="revAlamat" runat="server" ErrorMessage="* Tidak Boleh ada Special karakter"
                            ControlToValidate="txtAlamat" ValidationExpression="^[a-zA-Z0-9 .,\/()\-']+$" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Daerah Tingkat II
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUIDropDownList ID="ddlDati2" runat="server" DataType="String" DBColumnName="DATI2"
                            BindType="Both" SPParameterName="p_dati2">
                        </cc1:XUIDropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Kelurahan
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUITextBox ID="txtKelurahanPengurus" runat="server" DataType="String" DBColumnName="KELURAHAN"
                            BindType="Both" SPParameterName="p_kelurahan" MaxLength="50" Width="400px">
                        </cc1:XUITextBox>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Kecamatan
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUITextBox ID="txtKecamatanPengurus" runat="server" DataType="String" DBColumnName="KECAMATAN"
                            BindType="Both" SPParameterName="p_kecamatan" MaxLength="50" Width="400px">
                        </cc1:XUITextBox>
                    </td>
                </tr>
                
                <tr>
                    <td width="20%">
                        Jabatan
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <cc1:XUIDropDownList ID="ddlIDJabatan" runat="server" DataType="String" DBColumnName="IDJABATAN"
                            BindType="Both" SPParameterName="p_idjabatan" AutoPostBack="true" OnSelectedIndexChanged="ddlIDJabatan_SelectedIndexChanged">
                        </cc1:XUIDropDownList>
                    </td>
                </tr>
                <tr>
                    <td width="20%">
                        Pangsa Kepemilikan
                    </td>
                    <td>
                        :
                    </td>
                    <td width="80%">
                        <asp:UpdatePanel ID="updPangsa" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <cc1:XUITextBox ID="txtPangsa" runat="server" DBColumnName="PANGSA"
                                    BindType="Both" SPParameterName="p_pangsa" MaxLength="5" Width="40px"></cc1:XUITextBox>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlIDJabatan" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
