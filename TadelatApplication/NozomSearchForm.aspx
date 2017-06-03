<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NozomSearchForm.aspx.cs" Inherits="TadelatApplication.NozomSearchForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/css/sticky-footer-navbar.css" rel="stylesheet" />
    <link href="Content/css/signin.css" rel="stylesheet" />

    <title>منظومة التعديلات</title>
</head>
<body>
    <div class="container">
        <!-- Fixed navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container" dir="rtl">
                <div class="navbar-header navbar-right">
                    <a class="navbar-brand" href="#">منظومة التعديلات</a>
                </div>
                <div class="navbar-header navbar-right">
                    <a class="navbar-brand" href="#"><%= Session["FullName"].ToString() %></a>
                </div>
                <div id="navbar" class="collapse navbar-collapse navbar-left">
                    <ul class="nav navbar-nav">
                        <li><a href="LogoutForm.aspx"><b>تسجيل الخروج</b></a></li>
                        <li><a href="NozomRegistirationForm.aspx"><b>تسجيل طلب تعديل</b></a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>
    </div>

    <form id="form1" runat="server" class="form-inline"
        style="margin-left: 15%; margin-right: 15%;"
        autocomplete="off">
        <div dir="rtl" class="container-fluid">
            <div class="form-group" style="display: block; padding: 10px;">

                <asp:TextBox ID="TXtFullName" runat="server" Placeholder="الاسم"
                    CssClass="form-control"></asp:TextBox>

                <asp:TextBox ID="TxtMilad" runat="server" CssClass="form-control" Width="90px"
                    PlaceHolder="ميلاد" TextMode="Number" ValidationGroup="SearchValGroup"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="أدخل سنة الميلاد" Display="Dynamic" Text="*" ForeColor="Red"
                    ControlToValidate="TxtMilad" ValidationGroup="SearchValGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                    runat="server" ErrorMessage="اكتب الميلاد من 4 أرقام" ValidationExpression="\b\d{4}\b"
                    Display="Dynamic" ControlToValidate="TxtMilad" ForeColor="Red" ValidationGroup="SearchValGroup"> </asp:RegularExpressionValidator>

                <asp:TextBox ID="TXtMarkaz" runat="server" CssClass="form-control" Width="90px"
                    PlaceHolder="مركز" TextMode="Number" ValidationGroup="SearchValGroup"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage="أدخل المركز" Display="Dynamic" Text="*"
                    ForeColor="Red" ValidationGroup="SearchValGroup"
                    ControlToValidate="TxtMarkaz"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6"
                    runat="server" ErrorMessage="اكتب كود المركز بشكل صحيح " ValidationExpression="^\d{1,3}$"
                    Display="Dynamic" ControlToValidate="TxtMarkaz" ForeColor="Red" ValidationGroup="SearchValGroup"> </asp:RegularExpressionValidator>

                <asp:TextBox ID="TxtMosalsal" runat="server" CssClass="form-control" Width="90px"
                    PlaceHolder="مسلسل" TextMode="Number" ValidationGroup="SearchValGroup"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage="أدخل المسلسل" Display="Dynamic" Text="*" ForeColor="Red"
                    ControlToValidate="TxtMosalsal" ValidationGroup="SearchValGroup"></asp:RequiredFieldValidator>

                <div class="form-group">

                    <asp:TextBox ID="TxtDate" runat="server" Width="100px" Placeholder="التاريخ"
                        CssClass="form-control"></asp:TextBox>

                    <asp:ImageButton ID="ImgBtn" runat="server" ImageUrl="~/Images/date.jpg"
                        OnClick="ImgBtn_Click" CssClass="form-control" Height="35px" ImageAlign="Middle" Width="60px" />

                    <asp:Calendar ID="CalControl" runat="server" CssClass="datepicker"
                        BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1"
                        DayNameFormat="Shortest" FirstDayOfWeek="Saturday" Font-Names="Verdana"
                        Font-Size="8pt" ForeColor="#003399" Height="200px"
                        OnSelectionChanged="CalControl_SelectionChanged" Width="220px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>

                </div>

                <asp:Button ID="BtnSearch" runat="server" Text="بحث" CssClass="btn btn-primary"
                    ValidationGroup="SearchValGroup" OnClick="BtnSearch_Click" />
            </div>


            <div class="form-group" style="display: block; padding: 10px;">
                <asp:Label ID="LblFullName" runat="server"
                    CssClass="label label-default form-control" Font-Size="Large"></asp:Label>
            </div>

            <div class="form-group" style="display: block; padding: 10px;">
                <asp:Label ID="LblTadelType" runat="server"
                    CssClass="label label-default form-control" Font-Size="Large"></asp:Label>
            </div>

            <div class="form-group" style="display: block; padding: 10px;">
                <asp:Label ID="LblBayanatFalse" runat="server"
                    CssClass="label label-default form-control" Font-Size="Large"></asp:Label>
            </div>
            <div class="form-group" style="display: block; padding: 10px;">
                <asp:Label ID="LblBayanbatTrue" runat="server"
                    CssClass="label label-default form-control" Font-Size="Large"></asp:Label>
            </div>
            <div class="form-group" style="display: block; padding: 10px;">
                <asp:Label ID="LblCreatedOn" runat="server"
                    CssClass="label label-default form-control" Font-Size="Large"></asp:Label>
            </div>


            <div class="form-group" style="display: block; padding: 10px;">
                <asp:FileUpload ID="ImageUpload" runat="server" />
            </div>

            <div class="form-group" style="display: block; padding: 10px;">
                <asp:Button ID="BtnSave" runat="server" Text="حفظ"
                    CssClass="btn btn-primary" OnClick="BtnSave_Click" />
            </div>
            <div class="form-group" style="display: block; padding: 10px;">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"
                    ValidationGroup="SearchValGroup" />
            </div>

                        <div class="form-group" style="display: block; padding: 10px;">
                            <asp:Label ID="LblMsg" runat="server" ForeColor="Green"></asp:Label>
            </div>
        </div>


    </form>
</body>
</html>
