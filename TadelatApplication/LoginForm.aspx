<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="TadelatApplication.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/css/signin.css" rel="stylesheet" />
   
    <title>منظومة التعديلات</title>
</head>
<body>
    <div class="container" dir="rtl" style="overflow:hidden;padding-top:20px;">

        <div style="float:left;width:33.333333%;">
            <asp:Image ID="ImageLogo" runat="server" ImageUrl="~/Images/logoalex.png" Height="100" Width="100" ImageAlign="Left" />
        </div>

        <div style="float:left;width:33.333333%;text-align:center;font-weight:bold;font-size:25px;">
            <p>منظومة التعديلات</p>
            <p>ترحب بكم</p>
        </div>

        <div dir="rtl" style="float:left;width:33.333333%;text-align:right;">
            <p style="font-weight:bold;font-size:30px;">منطقة تجنيد و تعبئة الاسكندرية</p>
            <p style="font-weight:bold;font-size:30px;">فرع نظم المعلومات</p>
        </div>
        <br />
        <div style="width:33.333333%;margin:auto;padding-top:130px;">
      <form id="form1" runat="server" class="form-signin" autocomplete="off">
          <h2 class="form-signin-heading">تسجيل الدخول</h2>

          <asp:TextBox ID="TxtUserName" runat="server" ToolTip="اسم المستخدم" 
           AutoCompleteType="Disabled" CssClass="form-control" Width="250"
              Placeholder="اسم المستخدم"></asp:TextBox>

           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
           ErrorMessage="يجب ادخال اسم المستخدم" Text="*" ForeColor="Red" 
           Display="Dynamic"
           ControlToValidate="TxtUserName"></asp:RequiredFieldValidator>


           <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" 
           AutoCompleteType="Disabled" CssClass="form-control" Width="250"
               ToolTip="كلمة المرور" Placeholder="كلمة المرور"></asp:TextBox>

           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
           ErrorMessage="يجب ادخال كلمة المرور" Text="*" ForeColor="Red" 
           Display="Dynamic"
           ControlToValidate="TxtPassword"></asp:RequiredFieldValidator>

           <asp:Button ID="BtnLogin" runat="server"  Width="250"
                        Text="تسجيل الدخول" OnClick="BtnLogin_Click"
                        CssClass="btn btn-lg btn-primary form-control" />

            <div class="alert" role="alert">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            <asp:Label ID="LblMsg" runat="server"></asp:Label>
        </div>
      </form>
            </div>

      </div>
         
   
</body>
</html>
