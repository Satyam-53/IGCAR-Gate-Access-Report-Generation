<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportGeneration.aspx.cs" Inherits="TestApplication_1.WebForm1" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 910px;
            margin-left: auto; margin-right: auto;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style6 {
            width: 207px;
            height: 20px;
        }
        .auto-style7 {
            width: 201px;
        }
        .auto-style18 {
            width: 206px;
        }
        .auto-style26 {
            float: left;
            width: 683px;
        }
        
        </style>
</head>
<body style="width: 1400px; height: 1384px">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <table cellpadding="4px" cellspacing="0px" style="border-bottom:2px solid #FFDFDF;">
                <tbody><tr>
                <td><asp:Image ID="Image3" runat="server" ImageUrl="~/Images/satyam.gif" Height="70px" Width="56px" />
                <td style="width:763px;height:80px;text-align:center;vertical-align:middle;color:maroon;font-family:verdana;" class="ffa_2" id="tda1">
                Government of India<br>
                Department of Atomic Energy<br>
                <b>Indira Gandhi Centre for Atomic Research</b>
                </td>
                <td>
                <p align="center"><asp:Image ID="Image4" runat="server" ImageUrl="~/Images/igclogo.png" Height="70px" Width="69px" /></p>
                </td>
                </tr>

                <tr>
                    <td colspan=3 style="width:763px;height:80px;text-align:center;vertical-align:middle;color:maroon;font-family:verdana;" class="ffa_2" id="tda1">
                        Report Generation For Gate Access Control System<br /></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div style="align-content:center; margin-top:auto; margin-left:60px;" class="auto-style26">

            <table style="border: 1px solid black; font-family:Arial", class="auto-style19">
                <tr>
                    <td colspan="3">

                        <h3 align="center">Report of Transactions, Turnstile Wise</h3>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <b>Select Date Range:</b>
                    </td>
                    <td class="auto-style6">
                        From: <asp:TextBox ID="TextBox1" runat="server" Width="88px"></asp:TextBox>&nbsp; <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style3" Height="30px" ImageUrl="~/Images/download1.jfif" OnClick="ImageButton1_Click" Width="30px" />
                    </td>
                    <td class="auto-style18">
                        To:&nbsp;&nbsp; &nbsp;   <asp:TextBox ID="TextBox2" runat="server" Width="88px"></asp:TextBox>&nbsp; <asp:ImageButton ID="ImageButton2" runat="server" Width="30px" Height="30px" ImageUrl="~/Images/download1.jfif" OnClick="ImageButton2_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style6">

                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="172px" Width="185px" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>

                    </td>
                    <td class="auto-style6">

                        <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="172px" Width="185px" OnDayRender="Calendar2_DayRender" OnSelectionChanged="Calendar2_SelectionChanged1">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"> 
                        <b>Select Chart Type:</b>
                    </td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                        
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Chart ID="Chart1" runat="server" CssClass="auto-style3" style="margin-right: 0px" Height="297px" Width="623px" EnableViewState="true">
                            <series>
                                <asp:Series Name="Series1" ChartArea="ChartArea1">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisY Title="Total Number of Transactions">
                                    </AxisY>
                                    <AxisX Title="Door Name">
                                    </AxisX>
                                </asp:ChartArea>
                            </chartareas>
                        </asp:Chart>   
                    </td>
                </tr>
            </table>
        </div>
            
        <div align="center" style="float: right; width:650px; align-content:center; margin-top:auto;">
            <table style="border: 1px solid black; font-family:Arial">
                <tr>
                    <td colspan="3">
                        <h3 align="center">Success/Failure Transactions, Turnstile Wise</h3>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <b>Select Date Range:</b>
                    </td>
                    <td class="auto-style6">
                        From: <asp:TextBox ID="TextBox3" runat="server" Width="88px"></asp:TextBox>&nbsp; <asp:ImageButton ID="ImageButton3" runat="server" CssClass="auto-style3" Height="30px" ImageUrl="~/Images/download1.jfif" OnClick="ImageButton3_Click" Width="30px" />
                    </td>
                    <td class="auto-style18">
                        To:&nbsp;&nbsp; &nbsp;   <asp:TextBox ID="TextBox4" runat="server" Width="88px"></asp:TextBox>&nbsp; <asp:ImageButton ID="ImageButton4" runat="server" Width="30px" Height="30px" ImageUrl="~/Images/download1.jfif" OnClick="ImageButton4_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style6">

                        <asp:Calendar ID="Calendar3" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="172px" Width="185px" OnSelectionChanged="Calendar3_SelectionChanged" OnDayRender="Calendar3_DayRender">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>

                    </td>
                    <td class="auto-style6">

                        <asp:Calendar ID="Calendar4" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="172px" Width="185px" OnDayRender="Calendar4_DayRender" OnSelectionChanged="Calendar4_SelectionChanged1">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"> 
                        <b>Select Chart Type:</b>
                    </td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="DropDownList2" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Chart ID="Chart2" runat="server" CssClass="auto-style14" style="margin-right: 0px" Height="297px" Width="623px" EnableViewState="true">
                            <series>
                                <asp:Series Name="Success" ChartArea="ChartArea2" BorderColor="0, 64, 0" IsValueShownAsLabel="True" Legend="legend">
                                </asp:Series>
                                <asp:Series Name="Failure" ChartArea="ChartArea2" BorderColor="0, 64, 64" Legend="legend" IsValueShownAsLabel="True">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="ChartArea2">
                                    <AxisX Title="Door Name">
                                    </AxisX>
                                    <AxisY Title="Total Number of Transactions">
                                    </AxisY>
                                </asp:ChartArea>
                            </chartareas>
                            <Legends>
                                <asp:Legend LegendStyle="Column" Name="legend">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>   
                    </td>
                </tr>
            </table>
        </div>

        <div align="center" style="align-content:center; margin-top:580px;">

            <table style="border: 1px solid black; font-family:Arial", class="auto-style19">
                <tr>
                    <td colspan="3">

                        <h3 align="center">Types of Failures, Turnstile Wise</h3>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <b>Select Date Range:</b>
                    </td>
                    <td class="auto-style6">
                        From: <asp:TextBox ID="TextBox5" runat="server" Width="88px"></asp:TextBox>&nbsp; <asp:ImageButton ID="ImageButton5" runat="server" CssClass="auto-style3" Height="30px" ImageUrl="~/Images/download1.jfif" OnClick="ImageButton5_Click" Width="30px" />
                    </td>
                    <td class="auto-style18">
                        To:&nbsp;&nbsp; &nbsp;   <asp:TextBox ID="TextBox6" runat="server" Width="88px"></asp:TextBox>&nbsp; <asp:ImageButton ID="ImageButton6" runat="server" Width="30px" Height="30px" ImageUrl="~/Images/download1.jfif" OnClick="ImageButton6_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style6">

                        <asp:Calendar ID="Calendar5" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="172px" Width="185px" OnSelectionChanged="Calendar5_SelectionChanged" OnDayRender="Calendar5_DayRender">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>

                    </td>
                    <td class="auto-style6">

                        <asp:Calendar ID="Calendar6" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="172px" Width="185px" OnDayRender="Calendar6_DayRender" OnSelectionChanged="Calendar6_SelectionChanged1">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"> 
                        <b>Select Chart Type:</b>
                    </td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="DropDownList3" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                        
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Chart ID="Chart3" runat="server" CssClass="auto-style3" style="margin-right: 0px" Height="297px" Width="623px" EnableViewState="true">
                            <series>
                                <asp:Series Name="Validity Expired" ChartArea="ChartArea3" IsValueShownAsLabel="True" Legend="Legend1">
                                </asp:Series>
                                <asp:Series Name="Access Not Taken" ChartArea="ChartArea3" IsValueShownAsLabel="True" Legend="Legend1">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="ChartArea3">
                                    <AxisY Title="Total Number of Transactions">
                                    </AxisY>
                                    <AxisX Title="Door Name">
                                    </AxisX>
                                </asp:ChartArea>
                            </chartareas>
                            <Legends>
                                <asp:Legend Name="Legend1">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>   
                    </td>
                </tr>
            </table>

            
        </div>

        <div style="float:right; padding-top:20px; padding-bottom:20px;">
             <asp:Button ID="Button1" runat="server" Text="Click here to go to Compare Report section" OnClick="Button1_Click" />
        </div>
       
    </form>
</body>
</html>
