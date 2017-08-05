<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>eH R M S | PT. Tifa Finance Tbk.</title>
    <link href="css/mfin.css" rel="stylesheet" type="text/css" />
    <link href="css/ui-darkness/jquery-ui-1.8.10.custom.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>

    <script src="js/jquery-ui-1.8.10.custom.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {

            $.post("menu.ashx", function(response) {
                $("#menu").html(response).accordion({ autoHeight: false });
            });
        });
    </script>
    <link id="Link3" runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <link id="Link4" runat="server" rel="icon" href="favicon.ico" type="image/ico"/>
</head>
<body>
    <div id="hd">
        <div id="inner">
            <table border="0px" cellpadding="0px" cellspacing="0" width="1002px" style="height: 35px">
                <tr>
                    <td width="197px" valign="middle" style="padding-right: 5px;">
                        <span style="color: #fff; font-size: 24px;">H R M S</span> <span style="color: #fff;">v1</span>
                    </td>
                    <td width="802px" style="border-top: solid 1px #a6a6a6; border-left: solid 1px #a6a6a6;
                        border-right: solid 1px #a6a6a6; background-color: #ff7700; padding-right: 5px"
                        align="right">
                        <table width="100%">
                            <tr>
                                <td style="color:White;">
                                    <asp:Label ID="lblEntity" runat="server"></asp:Label>
                                    -
                                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                                    
                                    
                                </td>
                                <td align="right">
                                    <a href="home.aspx" target="bd-right-ws" style="color: #fff; font-weight: bold">Home</a>
                                    &nbsp; &nbsp; 
                                    <a href="profile.aspx" target="bd-right-ws" style="color: #fff; font-weight: bold">Profile</a>
                                    &nbsp;&nbsp;
                                    <a href="logout.aspx" target="bd-right-ws" style="color: #fff; font-weight: bold">Logout</a>
                                </td>
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
                <td width="195px" valign="top" style="padding-right: 5px">
                    <div id="menu">
                    </div>
                </td>
                <td width="800px" valign="top" style="border-bottom: solid 1px #a6a6a6; border-left: solid 1px #a6a6a6;
                    border-right: solid 1px #a6a6a6">
                    <iframe id="bd-right-ws" src="home.aspx" frameborder="0" name="bd-right-ws" width="100%"
                        height="850px" scrolling="auto">
                    </iframe>
                </td>
            </tr>
        </table>
    </div>
    <div id="ft">
        <div>
            <asp:Label ID="lblcurrententity" runat="server"/>
            <span>&copy; 2017. All rights reserved.</span>
        </div>
    </div>
</body>
</html>
