<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MahfouzatRegisterationForm.aspx.cs" Inherits="TadelatApplication.MahfouzatRegisterationForm" %>

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
                    <a class="navbar-brand" href="#">المحفوظات</a>
                </div>
                <div class="navbar-header navbar-right">
                   <%--<a class="navbar-brand" href="#"><%= Session["FullName"].ToString() %></a>--%>
                </div>
                <div id="navbar" class="collapse navbar-collapse navbar-left">
                    <ul class="nav navbar-nav">
                        <li><a href="LogoutForm.aspx"><b>تسجيل الخروج</b></a></li>
                        <li><a href="MahfouzatSearchForm.aspx"><b>بحث</b></a></li>
                        <li><a href="RecoveryForm.aspx"><b>تغيير كلمة المرور</b></a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>

        <div style="overflow: hidden;">
            <div style="float: left; width: 33.333333%;">
                <asp:Image ID="ImageLogo" runat="server" ImageUrl="~/Images/logoalex.png" Height="90" Width="90" ImageAlign="Left" />
            </div>

            <div style="float: left; width: 33.333333%; text-align: center; font-weight: bold; font-size: 20px;">
                <p>منظومة المحفوظات</p>
                <p style="text-decoration:underline">تسجيل قرار شهادة</p>
            </div>

            <div dir="rtl" style="float: left; width: 33.333333%; text-align: right;">
                <p style="font-weight: bold; font-size: 25px;">منطقة تجنيد و تعبئة الاسكندرية</p>
                <p style="font-weight: bold; font-size: 25px;">فرع نظم المعلومات</p>
            </div>
            <br />
        </div>
        <br />

        <div style="margin:auto;">
        <form id="form1" runat="server" class="form-inline" style="margin-left: 15%; margin-right: 15%;"
            autocomplete="off">
            <div dir="rtl" class="container-fluid">

                <div class="form-group" style="display: block; padding: 5px;">
                    <asp:TextBox ID="TXtFullName" runat="server" Placeholder="الاسم"
                        CssClass="form-control" Width="280px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                        ErrorMessage="أدخل الاسم" Display="None" Text="*" ControlToValidate="TxtFullName"
                        ValidationGroup="KararValGroup">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="form-group" style="display: block; padding: 5px;">
                    <asp:TextBox ID="TxtMilad" runat="server" CssClass="form-control" Width="90px"
                        PlaceHolder="ميلاد" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="أدخل سنة الميلاد" Display="None" Text="*" ForeColor="Red"
                        ControlToValidate="TxtMilad" ValidationGroup="KararValGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                        runat="server" ErrorMessage="اكتب الميلاد من 4 أرقام" ValidationExpression="\b\d{4}\b"
                        Display="None" ControlToValidate="TxtMilad" ForeColor="Red" ValidationGroup="KararValGroup"> 
                    </asp:RegularExpressionValidator>

                    <asp:TextBox ID="TXtMarkaz" runat="server" CssClass="form-control" Width="90px"
                        PlaceHolder="مركز" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="أدخل المركز" Display="None" Text="*"
                        ForeColor="Red" ValidationGroup="KararValGroup"
                        ControlToValidate="TxtMarkaz"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                        runat="server" ErrorMessage="اكتب كود المركز بشكل صحيح " ValidationExpression="^\d{1,3}$"
                        Display="None" ControlToValidate="TxtMarkaz" ForeColor="Red" ValidationGroup="KararValGroup">
                    </asp:RegularExpressionValidator>

                    <asp:TextBox ID="TxtMosalsal" runat="server" CssClass="form-control" Width="90px"
                        PlaceHolder="مسلسل" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                        ErrorMessage="أدخل المسلسل" Display="None" Text="*" ForeColor="Red"
                        ControlToValidate="TxtMosalsal" ValidationGroup="KararValGroup"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group" style="display: block; padding: 5px;">
                    <asp:TextBox ID="TextKararNo" runat="server" CssClass="form-control" Width="90px"
                        PlaceHolder="رقم القرار" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                        ErrorMessage="أدخل رقم القرار" Display="None" Text="*" ForeColor="Red"
                        ControlToValidate="TextKararNo" ValidationGroup="KararValGroup"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="TextKararCode" runat="server" CssClass="form-control" Width="90px"
                        PlaceHolder="كود القرار" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                        ErrorMessage="أدخل كود القرار" Display="None" Text="*"
                        ForeColor="Red" ValidationGroup="KararValGroup"
                        ControlToValidate="TextKararCode"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9"
                        runat="server" ErrorMessage="اكتب كود القرار من رقم واحد " ValidationExpression="\b\d{1}\b"
                        Display="None" ControlToValidate="TextKararCode" ForeColor="Red" ValidationGroup="KararValGroup"> 
                    </asp:RegularExpressionValidator>

                    <asp:TextBox ID="TextKararYear" runat="server" CssClass="form-control" Width="90px"
                        PlaceHolder="تاريخ السنة" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                        ErrorMessage="أدخل تاريخ السنة" Display="None" Text="*" ForeColor="Red"
                        ControlToValidate="TextKararYear" ValidationGroup="KararValGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11"
                        runat="server" ErrorMessage="اكتب تاريخ السنة من 4 أرقام" ValidationExpression="\b\d{4}\b"
                        Display="None" ControlToValidate="TextKararYear" ForeColor="Red" ValidationGroup="KararValGroup"> 
                    </asp:RegularExpressionValidator>
                </div>

                <div class="form-group" style="display: block; padding: 5px;">
                    <asp:FileUpload ID="ImageUploader" runat="server" />
                </div>

                <div class="form-group" style="display: block; padding: 5px;">
                    <asp:Button ID="BtnSave" runat="server" Text="حفظ" ValidationGroup="KararValGroup"
                        CssClass="btn btn-primary" OnClick="BtnSave_Click" />
                </div>

                <div class="form-group" style="display: block; padding: 5px;">
                    <asp:Label ID="LblMsg" runat="server"></asp:Label>
                </div>

                <div class="form-group" style="display: block; padding: 5px;">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"
                        ValidationGroup="KararValGroup" />
                </div>

            </div>
        </form>
            </div>
    </div>
</body>
</html>
