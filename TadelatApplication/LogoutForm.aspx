<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogoutForm.aspx.cs" Inherits="TadelatApplication.LogoutForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/css/starter-template.css" rel="stylesheet" />
    <title>منظومة التعديلات</title>
</head>
<body>
    <div class="container">

        <div class="starter-template">
            <h1 class="form-signin-heading">منظومة التعديلات</h1>
            <form id="form1" runat="server">
                <asp:Label ID="Label1" Text="جاري تسجيل الخروج" runat="server" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                            </asp:Timer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </form>
        </div>
    </div>
    <!-- /.container -->
</body>
</html>
