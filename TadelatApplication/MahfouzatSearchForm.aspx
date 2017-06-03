<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MahfouzatSearchForm.aspx.cs" Inherits="TadelatApplication.MahfouzatSearchForm" %>

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
    <div class="container" style="padding:30px 15px 0;">
        <!-- Fixed navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">

            <div class="container" dir="rtl">
                <div class="navbar-header navbar-right">
                    <a class="navbar-brand" href="#">المحفوظات</a>
                </div>
                <div class="navbar-header navbar-right">
                    <a class="navbar-brand" href="#"><%= Session["FullName"].ToString() %></a>
                </div>
                <div id="navbar" class="collapse navbar-collapse navbar-left">
                    <ul class="nav navbar-nav">
                        <li><a href="LogoutForm.aspx"><b>تسجيل الخروج</b></a></li>
                        <li><a href="MahfouzatRegisterationForm.aspx"><b>تسجيل قرار</b></a></li>
                        <li><a href="RecoveryForm.aspx"><b>تغيير كلمة المرور</b></a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>

        <div style="overflow: hidden;">
            <div style="float: left; width: 33.333333%;">
                <asp:Image ID="ImageLogo" runat="server" ImageUrl="~/Images/logoalex.png" Height="70" Width="70" ImageAlign="Left" />
            </div>

            <div style="float: left; width: 33.333333%; text-align: center; font-weight: bold; font-size: 20px;">
                <p>منظومة المحفوظات</p>
                <p style="text-decoration: underline">بحث عن قرار شهادة</p>
            </div>

            <div dir="rtl" style="float: left; width: 33.333333%; text-align: right;">
                <p style="font-weight: bold; font-size: 25px;">منطقة تجنيد و تعبئة الاسكندرية</p>
                <p style="font-weight: bold; font-size: 25px;">فرع نظم المعلومات</p>
            </div>
            <br />
        </div>
        <br />

        <form id="form1" runat="server" class="form-inline" style="margin-left: 15px; margin-right: 15px;"
            autocomplete="off">

            <div class="container-fluid">
                <div class="row" style="margin:auto;">



                    <div dir="rtl" style=" float: right;padding: 1em;">

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:Label ID="LblTitle" runat="server" Text="بحث عن قرار شهادة" Font-Bold="True"
                                Font-Size="Large" Font-Underline="True"></asp:Label>
                        </div>

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:TextBox ID="TextKararNo" runat="server" CssClass="form-control" Width="90px"
                                PlaceHolder="رقم القرار" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ErrorMessage="أدخل رقم القرار" Display="None" Text="*" ForeColor="Red"
                                ControlToValidate="TextKararNo" ValidationGroup="KararValGroup"></asp:RequiredFieldValidator>

                            <asp:TextBox ID="TextKararCode" runat="server" CssClass="form-control" Width="90px"
                                PlaceHolder="كود القرار" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="أدخل كود القرار" Display="None" Text="*"
                                ForeColor="Red" ValidationGroup="KararValGroup"
                                ControlToValidate="TextKararCode"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                                runat="server" ErrorMessage="اكتب كود القرار من رقم واحد " ValidationExpression="\b\d{1}\b"
                                Display="None" ControlToValidate="TextKararCode" ForeColor="Red" ValidationGroup="KararValGroup"> 
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="TextKararYear" runat="server" CssClass="form-control" Width="90px"
                                PlaceHolder="تاريخ السنة" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ErrorMessage="أدخل تاريخ السنة" Display="None" Text="*" ForeColor="Red"
                                ControlToValidate="TextKararYear" ValidationGroup="KararValGroup"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                                runat="server" ErrorMessage="اكتب تاريخ السنة من 4 أرقام" ValidationExpression="\b\d{4}\b"
                                Display="None" ControlToValidate="TextKararYear" ForeColor="Red" ValidationGroup="KararValGroup"> 
                            </asp:RegularExpressionValidator>

                            <asp:Button ID="BtnSearchKarar" runat="server" Text="بحث بكود القرار" CssClass="btn btn-primary"
                                ValidationGroup="KararValGroup" OnClick="BtnSearchKarar_Click" />
                        </div>

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:TextBox ID="TextMilad" runat="server" CssClass="form-control" Width="90px"
                                PlaceHolder="ميلاد" TextMode="Number" ValidationGroup="SearchSolasyValGroup"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ErrorMessage="أدخل سنة الميلاد" Display="None" Text="*" ForeColor="Red"
                                ControlToValidate="TextMilad" ValidationGroup="SearchSolasyValGroup"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7"
                                runat="server" ErrorMessage="اكتب الميلاد من 4 أرقام" ValidationExpression="\b\d{4}\b"
                                Display="None" ControlToValidate="TextMilad" ForeColor="Red" ValidationGroup="SearchSolasyValGroup"> 
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="TextMarkaz" runat="server" CssClass="form-control" Width="90px"
                                PlaceHolder="مركز" TextMode="Number" ValidationGroup="SearchSolasyValGroup"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                ErrorMessage="أدخل المركز" Display="None" Text="*"
                                ForeColor="Red" ValidationGroup="SearchSolasyValGroup"
                                ControlToValidate="TextMarkaz"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9"
                                runat="server" ErrorMessage="اكتب كود المركز بشكل صحيح " ValidationExpression="^\d{1,3}$"
                                Display="None" ControlToValidate="TextMarkaz" ForeColor="Red" ValidationGroup="SearchSolasyValGroup"> 
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="TextMosalsal" runat="server" CssClass="form-control" Width="90px"
                                PlaceHolder="مسلسل" TextMode="Number" ValidationGroup="SearchSolasyValGroup"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                ErrorMessage="أدخل المسلسل" Display="None" Text="*" ForeColor="Red"
                                ControlToValidate="TextMosalsal" ValidationGroup="SearchSolasyValGroup"></asp:RequiredFieldValidator>

                            <asp:Button ID="BtnSEarchSolasy" runat="server" Text="بحث بالرقم الثلاثي" CssClass="btn btn-primary"
                                ValidationGroup="SearchSolasyValGroup" OnClick="BtnSEarchSolasy_Click" />
                        </div>

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:Label ID="Label1" runat="server" Text="الاسم / " Font-Bold="True" Font-Size="Large"></asp:Label>
                            <asp:Label ID="LblFullName" runat="server" CssClass="label label-default form-control"
                                Width="280px" Font-Size="Large"></asp:Label>
                        </div>

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:Label ID="Label2" runat="server" Text="الرقم الثلاثي / "
                                Font-Bold="True" Font-Size="Large"></asp:Label>
                            <asp:Label ID="LblMilad" runat="server" CssClass="label label-default form-control" Width="90px"
                                Font-Size="Large"></asp:Label>

                            <asp:Label ID="LblMarkaz" runat="server" CssClass="label label-default form-control" Width="90px"
                                Font-Size="Large"></asp:Label>

                            <asp:Label ID="LblMosalsal" runat="server" CssClass="label label-default form-control" Width="90px"
                                Font-Size="Large"></asp:Label>

                        </div>
                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:Label ID="Label3" runat="server" Text="رقم القرار / " Font-Bold="True"
                                Font-Size="Large"></asp:Label>
                            <asp:Label ID="LblKararNo" runat="server" CssClass="label label-default form-control" Width="90px"
                                Font-Size="Large"></asp:Label>

                            <asp:Label ID="LblKararCode" runat="server" CssClass="label label-default form-control" Width="90px"
                                Font-Size="Large"></asp:Label>

                            <asp:Label ID="LblKararYear" runat="server" CssClass="label label-default form-control" Width="90px"
                                Font-Size="Large"></asp:Label>

                        </div>

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:Label ID="LblDate" runat="server" Text="التاريخ / " Font-Bold="True"
                                Font-Size="Large"></asp:Label>
                            <asp:Label ID="LblCreatedDate" runat="server" CssClass="label label-default form-control" Font-Size="Large"></asp:Label>
                        </div>

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:Label ID="LblUser" runat="server" Text="اسم المسجل / " Font-Bold="True"
                                Font-Size="Large"></asp:Label>
                            <asp:Label ID="LblCreatedBy" runat="server" CssClass="label label-default form-control" Font-Size="Large"></asp:Label>
                        </div>

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:Label ID="LblMsg" runat="server" Font-Size="Large" Font-Bold="true"></asp:Label>
                        </div>

                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"
                                ValidationGroup="KararValGroup" />
                        </div>
                        <div class="form-group" style="display: block; padding: 5px;">
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red"
                                ValidationGroup="SearchSolasyValGroup" />
                        </div>

                    </div>


                     <div dir="rtl"  style=" float: left;padding: 1em;">
                        <asp:Image ID="KararImage" runat="server" Width="600" Height="800"  />
                    </div>
                    


                </div>
            </div>
        </form>
    </div>
</body>
</html>
