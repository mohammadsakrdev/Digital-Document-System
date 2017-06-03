<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoveryForm.aspx.cs" Inherits="TadelatApplication.RecoveryForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/css/signin.css" rel="stylesheet" />
    <title>منظومة التعديلات</title>
</head>
<body>
    <div class="container" dir="rtl">
        <form id="form1" runat="server" class="form-signin" autocomplete="off">
            <h2 class="form-signin-heading">تغيير كلمة المرور</h2>

            <asp:TextBox ID="TxtUserPassword1" runat="server" TextMode="Password"
                AutoCompleteType="Disabled" CssClass="form-control" Width="250"
                Placeholder="كلمة المرور"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="يجب ادخال كلمة المرور" Text="*" ForeColor="Red"
                Display="Dynamic" ValidationGroup="RecoveryValidation" SetFocusOnError="true"
                ControlToValidate="TxtUserPassword1"></asp:RequiredFieldValidator>

            <asp:TextBox ID="TxtUserPassword2" runat="server" TextMode="Password"
                AutoCompleteType="Disabled" CssClass="form-control" Width="250"
                Placeholder="أعد كلمة المرور"></asp:TextBox>

            <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToValidate="TxtUserPassword2" ControlToCompare="TxtUserPassword1"
                ErrorMessage="كلمة المرور غير متطابقة" Type="String" ForeColor="Red"
                Display="Dynamic"
                Operator="Equal" ValidationGroup="RecoveryValidation" SetFocusOnError="True"></asp:CompareValidator>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ErrorMessage="يجب اعادة كلمة المرور" Text="*" ForeColor="Red"
                Display="Dynamic" ValidationGroup="RecoveryValidation"
                ControlToValidate="TxtUserPassword2"></asp:RequiredFieldValidator>

            <asp:TextBox ID="TxtPasswordNew" runat="server" TextMode="Password"
                AutoCompleteType="Disabled" CssClass="form-control" Width="250"
                Placeholder="كلمة المرور الجديدة"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ErrorMessage="يجب ادخال كلمة المرور الجديدة" Text="*" ForeColor="Red"
                Display="Dynamic" ValidationGroup="RecoveryValidation"
                ControlToValidate="TxtPasswordNew" SetFocusOnError="True"></asp:RequiredFieldValidator>

            <div style="padding-bottom:10px;">
                <asp:Button ID="BtnRecovery" runat="server" Width="250"
                    Text="تغيير كلمة المرور" ValidationGroup="RecoveryValidation"
                    CssClass="btn btn-lg btn-primary" OnClick="BtnRecovery_Click" />
                </div>
            <div style="padding-top:10px;">
                <asp:Button ID="BtnBack" runat="server" Text="رجوع" Width="250"
                    CssClass="btn btn-lg btn-primary" OnClick="BtnBack_Click" />
            </div>

            <div class="alert" role="alert">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"
                    ValidationGroup="RecoveryValidation" />
                <asp:Label ID="LblMsg" runat="server"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
