<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error_Page.aspx.cs" Inherits="TadelatApplication.Error_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/css/starter-template.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title>منظومة التعديلات</title>
</head>
<body>
    <div class="container">

        <div class="starter-template conta" style="margin-top: 15%;">
            <h1 class="form-signin-heading">منظومة التعديلات</h1>
            <p style="font-size: large"><b>خطأ في المنظومة</b></p>
            <p style="font-size: large"><b>برجاء التأكد من صحة البيانات و الاتصال بفرع النظم</b></p>
            <p style="font-size: large"><b>و اعادة تسجيل الدخول مرة أخرى</b></p>
            <form id="form1" runat="server">

                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" Interval="7000" OnTick="Timer1_Tick">
                            </asp:Timer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </form>
        </div>
    </div>
</body>
</html>
