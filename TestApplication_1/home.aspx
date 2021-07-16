<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="TestApplication_1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 910px;
            margin-left: auto; margin-right: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <table cellpadding="4px" cellspacing="0px" style="border-bottom:2px solid #FFDFDF;">
                <tbody><tr>
                <td><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/satyam.gif" Height="70px" Width="56px" />
                <td style="width:763px;height:80px;text-align:center;vertical-align:middle;color:maroon;font-family:verdana;" class="ffa_2" id="tda1">
                Government of India<br>
                Department of Atomic Energy<br>
                <b>Indira Gandhi Centre for Atomic Research</b>
                </td>
                <td>
                <p align="center"><asp:Image ID="Image2" runat="server" ImageUrl="~/Images/igclogo.png" Height="70px" Width="69px" /></p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>


        <div>
            <p align="center">
                &nbsp;</p>
            <p align="center">
                &nbsp;</p>
            <p align="center">
            <asp:Button ID="Button2" runat="server" Text="Click here to go to official website" OnClick="Button2_Click" />
            </p>
        </div>

        <div>
            <p align="center">
                &nbsp;</p>
            <p align="center">
                &nbsp;</p>
            <p align="center">
            <asp:Button ID="Button1" runat="server" Text="Click here to go to report section" OnClick="Button1_Click" />
            </p>
        </div>
        
    </form>
</body>
</html>
