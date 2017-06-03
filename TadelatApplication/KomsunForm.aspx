<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KomsunForm.aspx.cs" Inherits="TadelatApplication.KomsunForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl" lang="ar">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/css/sticky-footer-navbar.css" rel="stylesheet" />
    <script src="Scripts/TadelatScript.js"></script>

    <script type="text/javascript">

        function ValidateEmptyValue() {
            var gv = document.getElementById("<%= GridViewTalabTadelat.ClientID %>");
            var tb = gv.getElementsByTagName("input");

            for (var i = 0; i < tb.length; i++) {
                if (tb[i].type == "text" || tb[i].type == "number") {
                    if (tb[i].value < 1) {
                        alert("أكمل ادخال البيانات");
                        return false;
                    }
                }
            }
            return true;
        }

        function IsReadyToPrint() {
            var gv = document.getElementById("<%= GridViewTalabTadelat.ClientID %>");
            var tb = gv.getElementsByTagName("input");

            for (var i = 0; i < tb.length; i++) {
                if (tb[i].type == "text" || tb[i].type == "number") {
                    if (tb[i].value < 1) {
                        return false;
                    }
                }
            }
            return true;
        }

        function PrintPage() {
            if (IsReadyToPrint()) {
                var printContent = document.getElementById('pnlGridView');
                newWin = window.open("");
                printContent.style.direction = "rtl";
                newWin.document.write(printContent.outerHTML);
                newWin.print();
                newWin.close();
                return true;
            }

        }
    </script>
    <title>منظومة التعديلات</title>
</head>
<body onkeypress="return disableCtrlKeyCombination(event);"
        onkeydown="return disableCtrlKeyCombination(event);" >

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
                    <li><a href="RecoveryForm.aspx"><b>تغيير كلمة المرور</b></a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>

    <form id="form1" runat="server" style="padding: 10px; padding-top: 60px; margin-left: 15px; margin-right: 15px;"
        class="container-fluid" autocomplete="off">
        <div dir="rtl" class="container-fluid">

            <table id="pnlGridView" class="ContentTable container-fluid">
                <tr>
                    <td colspan="3">
                        <p class="lead"><b>منطقة تجنيد و تعبئة الاسكندرية</b></p>
                        <p class="lead"><b>فرع المجلس الطبي</b></p>
                                                    <p class="lead"><b>اسم المستخدم : </b><b><%= Session["FullName"].ToString() %></b></p>

                    </td>
                    <td colspan="3">
                        <div class="page-header" style="text-align: center;">
                            <p class="lead" style="display: inline-block; font-size: x-large"><b>طلب تعديل</b></p>
                        </div>
                    </td>
                    <td colspan="3">
                        <div style="float: left">
                            <img src="Images/logoalex.png" height="70" lang="ar" width="70" />
                            <p class="lead"><b>التاريخ : </b><b><%= DateTime.Now.ToShortDateString() %></b></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="9" style="align-content: center" class="container-fluid">
                    <asp:GridView ID="GridViewTalabTadelat" runat="server" ShowFooter="true"
                        CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"
                        OnRowCreated="GridViewTalabTadelat_RowCreated" BorderWidth="1px" Font-Bold="True"
                        EmptyDataText="لا توجد تعديلات" AlternatingRowStyle-HorizontalAlign="Center"
                        Width="100%" CssClass="table table-striped table-bordered table-hover">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />

                        <Columns>
                            <asp:BoundField DataField="RowNumber" HeaderText="رقم"
                                ControlStyle-Width="50px" />

                            <asp:TemplateField HeaderText="الاسم" ControlStyle-Width="235px">
                                <ItemTemplate>
                                    <asp:TextBox ID="TxtFullName" runat="server"
                                        MaxLength="200" Font-Size="Medium"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ErrorMessage="أدخل الاسم" Display="None"
                                        ValidationGroup="talabtadel" ControlToValidate="TxtFullName"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ميلاد" ControlStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:TextBox ID="TxtMilad" runat="server" TextMode="Number"
                                        MaxLength="4" Font-Size="Medium" Columns="4"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ErrorMessage="أدخل سنة الميلاد" Display="None"
                                        ValidationGroup="talabtadel" ControlToValidate="TxtMilad"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                                        runat="server" ErrorMessage="اكتب الميلاد من 4 أرقام" ValidationExpression="\b\d{4}\b"
                                        Display="None" ValidationGroup="talabtadel" ControlToValidate="TxtMilad">

                                    </asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="مركز" ControlStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:TextBox ID="TxtMarkaz" runat="server" TextMode="Number" Font-Size="Medium"
                                        Columns="3">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ErrorMessage="أدخل المركز" Display="None"
                                        ValidationGroup="talabtadel" ControlToValidate="TxtMarkaz"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6"
                                        runat="server" ErrorMessage="اكتب كود المركز بشكل صحيح " ValidationExpression="^\d{1,3}$"
                                        Display="None" ValidationGroup="talabtadel" ControlToValidate="TxtMarkaz">
                                    </asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="مسلسل" ControlStyle-Width="70px">
                                <ItemTemplate>
                                    <asp:TextBox ID="TxtMosalsal" runat="server"
                                        TextMode="Number" Font-Size="Medium"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ErrorMessage="أدخل المسلسل" Display="None"
                                        ValidationGroup="talabtadel" ControlToValidate="TxtMosalsal"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="نوع التعديل" ControlStyle-Width="135px">
                                <ItemTemplate>
                                    <asp:DropDownList ID="DDLTypeId"
                                        DataSourceID="SqlDataSrcTadelatTypes" DataTextField="TypeName"
                                        runat="server" DataValueField="TypeID">
                                    </asp:DropDownList>

                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="قبل التعديل" ControlStyle-Width="235">
                                <ItemTemplate>
                                    <asp:TextBox ID="TxtBayanatFalse" runat="server"
                                        MaxLength="200" Font-Size="Medium"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        ErrorMessage="أدخل بيانات قبل التعديل" Display="None"
                                        ValidationGroup="talabtadel" ControlToValidate="TxtBayanatFalse"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="بعد التعديل" ControlStyle-Width="235">
                                <ItemTemplate>
                                    <asp:TextBox ID="TxtBayanatTrue" runat="server"
                                        MaxLength="200" Font-Size="Medium"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                        ErrorMessage="أدخل بيانات بعد التعديل" Display="None"
                                        ValidationGroup="talabtadel" ControlToValidate="TxtBayanatTrue"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkDelete" runat="server"
                                        OnClick="LinkDelete_Click">حذف</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    </td>
                </tr>
                                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p class="lead"><b>توقيع / </b><b></b></p>
                        <p class="lead"><b>رقيب  / محمد السيد عبد السلام</b></p>
                        <p class="lead"><b>حكمدار المجلس الطبي</b></p>
                    </td>
                    <td colspan="3">
                        <div class="container-fluid" style="text-align: center;">
                            <p class="lead" style="display: inline-block;"><b>توقيع / </b><b></b></p>
                            <p class="lead"><b>عقيــــد / محمـــد ابراهيم الظايط</b></p>
                            <p class="lead"><b>رئيـــس اركان حرب القومسيــون</b></p>
                        </div>
                    </td>

                </tr>

                <tr>
                    <td colspan="9">
                        <div style="float: left">
                            <p class="lead"><b>توقيع / </b><b></b></p>
                            <p class="lead"><b>عميد / عماد حسين الدهراوى</b></p>

                            <p class="lead"><b>مدير منطقة تعبئة و تجنيد الاسكندرية</b></p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div dir="rtl" style="margin-right: 15%;">
            <asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click"
                CssClass="btn btn-primary" Text="إضافة تعديل"
                OnClientClick="return ValidateEmptyValue();" />
            <asp:Button ID="BtnSave" runat="server" Text="حفظ" OnClick="BtnSave_Click"
                CssClass="btn btn-primary" ValidationGroup="talabtadel"
                CausesValidation="true" />
            <asp:Button ID="ButtonPrint" runat="server" Text="طباعة طلب التعديل" CssClass="btn btn-primary"
                Enabled="false" OnClientClick="if(!PrintPage()) {return false;}" OnClick="ButtonPrint_Click1"
                UseSubmitBehavior="false" />
        </div>
        <div dir="rtl" style="margin-right: 15%;">

            <p>
                <asp:ValidationSummary ID="ValidationSummary" runat="server"
                    ValidationGroup="talabtadel" ForeColor="Red" />
            </p>
                            <asp:SqlDataSource ID="SqlDataSrcTadelatTypes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TadelatDB %>" 
                    SelectCommand="GetAllTypes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </form>
</body>


</html>
