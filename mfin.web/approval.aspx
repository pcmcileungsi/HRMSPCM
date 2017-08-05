<%@ Page Language="C#" AutoEventWireup="true" CodeFile="approval.aspx.cs" Inherits="approval" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>eH R M S | PCM Cileungsi.</title>
    <link href="css/mfin.css" rel="stylesheet" type="text/css" />
    <link href="css/ui-darkness/jquery-ui-1.8.10.custom.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>

    <script src="js/jquery-ui-1.8.10.custom.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {

            $.post("menu.ashx", function (response) {
                $("#menu").html(response).accordion({ autoHeight: false });
            });
        });
    </script>
    <link id="Link3" runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link id="Link4" runat="server" rel="icon" href="favicon.ico" type="image/ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="hd">
            <div id="inner">
                <table border="0px" cellpadding="0px" cellspacing="0" width="1002px" style="height: 35px">
                    <tr>
                        <td width="197px" valign="middle" style="padding-right: 5px;">
                            <span style="color: #fff; font-size: 24px;">H R M S</span> <span style="color: #fff;">v1</span>
                        </td>
                        <td width="802px" style="border-top: solid 1px #a6a6a6; border-left: solid 1px #a6a6a6; border-right: solid 1px #a6a6a6; background-color: #ff7700; padding-right: 5px"
                            align="right">
                            <table width="100%">
                                <tr>
                                    <td style="color: White; font-size: 14px">PT Tifa Finance Tbk &copy; 2017 All rights reserved. | Approval HRMS</td>
                                    <td align="right"></td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="bd">
            <table border="0px" cellpadding="0px" cellspacing="0" width="1002px">
                <tr>
                    <td width="800px" valign="top" style="height:600px;text-align:center">
                        <br />
                        <asp:ScriptManager ID="sm" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="pnlMain" runat="server" UpdateMode="Conditional" EnableViewState="true">
                            <ContentTemplate>
                                <asp:Label ID="lblDescs" runat="server" Font-Size="16px"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>       
        <asp:Panel ID="pnlPopupLoading" runat="server" Style="display: block; background-color: #ffffff;">
            <asp:Button Style="display: none" ID="btnShowPopupLoading" runat="server"></asp:Button>
            <cc2:ModalPopupExtender ID="mdlPopupLoadingword" runat="server" BehaviorID="mdlPopupLoadingword"
                PopupControlID="pnlPopupLoading" TargetControlID="btnShowPopupLoading" BackgroundCssClass="modalBackground">
            </cc2:ModalPopupExtender>
            <div class="container" style="background-color: #ffffff;">
                <asp:UpdatePanel ID="upnLoading" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="body">
                            <div style="text-align: center; background-color: #ffffff;">
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
