<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>eH R M S | PT. Tifa Finance Tbk.</title>
    <link href="css/mfin.css" rel="stylesheet" type="text/css" />
    <link href="css/ui-darkness/jquery-ui-1.8.10.custom.css" rel="stylesheet" type="text/css" />

    <script src='<%=ResolveClientUrl("~/js/jquery-1.4.4.min.js")%>' type="text/javascript"></script>

    <script src='<%=ResolveClientUrl("~/js/jquery-ui-1.8.10.custom.min.js")%>' type="text/javascript"></script>
    <link id="Link3" runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <link id="Link4" runat="server" rel="icon" href="favicon.ico" type="image/ico"/>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="pnlMain" runat="server" UpdateMode="Conditional" EnableViewState="true">
        <ContentTemplate>
            <div class="login">
                <span style="font-size: 18px; font-weight: bold; color: rgb(38,68,110);">H R M S
                     Login</span>
                <br />
                <span style="font-size: 12px; font-weight: bold; color: rgb(38,68,110);">PT. TIFA Finance
                    Tbk.</span>
                <hr style="border: solid 1px #666666" />
                <br />
                <div class="uid">
                    <div style="width: 33%; float: left;">
                        <span style="color: #666666; font-weight: bold">User ID</span>
                    </div>
                    <div style="width: 2%; float: left;">
                        <span style="color: #666666; font-weight: bold">:</span>
                    </div>
                    <div style="width: 65%; float: left">
                        <asp:TextBox ID="txtUID" runat="server" AutoPostBack="true" OnTextChanged="txtUID_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUID" runat="server" ErrorMessage="User ID harus diisi."
                            ControlToValidate="txtUID">User ID harus diisi.</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="upass">
                    <div style="width: 33%; float: left;">
                        <span style="color: #666666; font-weight: bold">Password</span>
                    </div>
                    <div style="width: 2%; float: left;">
                        <span style="color: #666666; font-weight: bold">:</span>
                    </div>
                    <div style="width: 65%; float: left">
                        <asp:TextBox ID="txtUPass" runat="server" TextMode="password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfUPass" runat="server" ErrorMessage="Password harus diisi."
                            ControlToValidate="txtUPass">Password harus diisi.</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="uid">
                    <div style="width: 33%; float: left;">
                        <span style="color: #666666; font-weight: bold">Unit Company</span>
                    </div>
                    <div style="width: 2%; float: left;">
                        <span style="color: #666666; font-weight: bold">:</span>
                    </div>
                    <div style="width: 65%; float: left">
                        <asp:DropDownList ID="ddlCompany" runat="server">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtValueddlCompany" runat="server" Style="display: none;" />
                    </div>
                </div>
                <div class="button">
                    <asp:Button ID="btnLogin" runat="server" CssClass="log_in" Text="Login" OnClick="btnLogin_Click" />
                </div>
            </div>
            <div style="width: 500px; margin: 0px auto; text-align: center; color: rgb(38,68,110)">
                <span>&copy; PT TIFA FINANCE Tbk, 2017. All rights reserved.</span>
            </div>
        </ContentTemplate>
        <Triggers><asp:AsyncPostBackTrigger ControlID="ddlCompany" EventName="SelectedIndexChanged" /> </Triggers>
    </asp:UpdatePanel>
    <asp:Panel ID="pnlPopupLoading" runat="server" Style="display: block;background-color:#ffffff;">
            <asp:Button Style="display: none" ID="btnShowPopupLoading" runat="server"></asp:Button>
            <cc2:ModalPopupExtender ID="mdlPopupLoadingword" runat="server" BehaviorID="mdlPopupLoadingword"
                PopupControlID="pnlPopupLoading" TargetControlID="btnShowPopupLoading" BackgroundCssClass="modalBackground">
            </cc2:ModalPopupExtender>
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
    </form>
</body>

<script type="text/javascript">

    // Get the instance of PageRequestManager.
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    // Add initializeRequest and endRequest
    prm.add_beginRequest(prm_InitializeRequest);
    prm.add_endRequest(prm_EndRequest);
    // Called when async postback begins
    function prm_InitializeRequest(sender, args) {



        try {
            // Disable button that caused a postback
            $find('mdlPopupLoadingword').show();
        }
        catch (e) {
        }
    }

    // Called when async postback ends
    function prm_EndRequest(sender, args) {
        try {
            // Enable button that caused a postback
            setTimeout($find('mdlPopupLoadingword').hide(), 1250);
        }
        catch (e) {
        }
    }
</script>
</html>
