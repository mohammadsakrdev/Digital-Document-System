<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NozomRegistirationForm.aspx.cs" Inherits="TadelatApplication.NozomUserForm" %>

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
                    <%--                <a class="navbar-brand" href="#"><%= Session["FullName"].ToString() %></a>--%>
                </div>
                <div id="navbar" class="collapse navbar-collapse navbar-left">
                    <ul class="nav navbar-nav">
                        <li><a href="LogoutForm.aspx"><b>تسجيل الخروج</b></a></li>
                        <li><a href="NozomSearchForm.aspx"><b>بحث و إضافة صورة</b></a></li>
                        <li><a href="RecoveryForm.aspx"><b>تغيير كلمة المرور</b></a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>

        <form id="form1" runat="server" class="form-signin">
            <div dir="rtl" class="container-fluid">

                <table id="pnlGridView" class="ContentTable container-fluid">

                    <tr>
                        <td colspan="9">
                            <asp:TextBox ID="TxtFullName" runat="server" CssClass="form-control"
                                PlaceHolder="الاسم"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                                ErrorMessage="أدخل الاسم" Display="Dynamic" Text="*" ControlToValidate="TxtFullName">

                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="3">
                            <asp:TextBox ID="TxtMilad" runat="server" CssClass="form-control"
                                PlaceHolder="ميلاد" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="أدخل سنة الميلاد" Display="Dynamic" Text="*" ForeColor="Red"
                                ControlToValidate="TxtMilad"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                                runat="server" ErrorMessage="اكتب الميلاد من 4 أرقام" ValidationExpression="\b\d{4}\b"
                                Display="Dynamic" ControlToValidate="TxtMilad" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </td>


                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:TextBox ID="TXtMarkaz" runat="server" CssClass="form-control"
                                PlaceHolder="مركز" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ErrorMessage="أدخل المركز" Display="Dynamic" Text="*" 
                                ForeColor="Red"
                                ControlToValidate="TxtMarkaz"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6"
                                runat="server" ErrorMessage="اكتب كود المركز بشكل صحيح " ValidationExpression="^\d{1,3}$"
                                Display="Dynamic" ControlToValidate="TxtMarkaz" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:TextBox ID="TxtMosalsal" runat="server" CssClass="form-control"
                                PlaceHolder="مسلسل" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ErrorMessage="أدخل المسلسل" Display="Dynamic" Text="*"  ForeColor="Red"
                                ControlToValidate="TxtMosalsal"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:DropDownList ID="DDLTadelatTypes" runat="server" CssClass="form-control"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <asp:TextBox ID="TxtBayanatFalse" runat="server" CssClass="form-control"
                                PlaceHolder="قبل التعديل"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ErrorMessage="أدخل بيانات قبل التعديل" Display="Dynamic" Text="*" 
                                ControlToValidate="TxtBayanatFalse" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9">
                            <asp:TextBox ID="TxtBayanatTrue" runat="server" CssClass="form-control"
                                PlaceHolder="بعد التعديل"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ErrorMessage="أدخل بيانات بعد التعديل" Display="Dynamic" Text="*" 
                                ControlToValidate="TxtBayanatTrue" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:FileUpload ID="ImageUploader" runat="server"
                                CssClass="form-control-file" />
                        </td>

                    </tr>

                    <tr>
                        <td colspan="3">
                            <asp:Button ID="BtnSave" runat="server" Text="حفظ" CssClass="btn btn-primary"
                                OnClick="BtnSave_Click" CausesValidation="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblMsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>



        </form>
    </div>
</body>
</html>
