<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterForm.Master" AutoEventWireup="true"
    CodeBehind="UsersForm.aspx.cs" Inherits="TadelatApplication.UsersForm" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="Main" runat="server">
    <table class="ContentTable container-fluid">
        <tr>
            <td colspan="9" style="align-content: center" class="container-fluid">

                <asp:GridView ID="GridViewUsers" runat="server" CellPadding="4" ForeColor="#333333" Height="296px"
                    Width="1042px" CellSpacing="1"
                    EditRowStyle-HorizontalAlign="Center" EditRowStyle-VerticalAlign="Middle" AutoGenerateColumns="False"
                    AlternatingRowStyle-HorizontalAlign="Center" AlternatingRowStyle-VerticalAlign="Middle"
                    HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle"
                    BorderWidth="1px" SortedDescendingCellStyle-BorderWidth="1" ShowFooter="true" OnRowCommand="GridViewUsers_RowCommand">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#F0F0F0" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <Columns>

                        <asp:TemplateField HeaderText="الرقم" InsertVisible="false" FooterStyle-BackColor="White"
                            FooterStyle-HorizontalAlign="Center"
                            ControlStyle-Width="12" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:Label ID="LblID" runat="server" Text='<%# Eval("UserID") %>'
                                    Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="UserID" runat="server" Text='<%# Eval("UserID") %>'
                                    Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LBtnInsert" runat="server" CommandName="InsertRow"
                                    ValidationGroup="InsertValidation">إضافة جديد</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="الاسم" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            FooterStyle-BackColor="White" FooterStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="LblFullName" runat="server" Text='<%# Eval("FullName") %>'
                                    Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtFullName" runat="server" Text='<%# Bind("FullName") %>'
                                    Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="أدخل الاسم" Display="None"
                                    ValidationGroup="EditValidation" ControlToValidate="TxtFullName"></asp:RequiredFieldValidator>
                            </EditItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="InputFullName" runat="server" ForeColor="Black"
                                    Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="أدخل الاسم" Display="None" 
                                    ValidationGroup="InsertValidation" ControlToValidate="InputFullName"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="اسم المستخدم" FooterStyle-BackColor="White" FooterStyle-HorizontalAlign="Center"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:Label ID="LblUserName" runat="server" Text='<%# Eval("UserName") %>'
                                    Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtUserName" runat="server" Text='<%# Bind("UserName") %>'
                                    Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="أدخل اسم المستخدم" Display="None"
                                    ValidationGroup="EditValidation" ControlToValidate="TxtUserName"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InputUserName" runat="server" ForeColor="Black"
                                    Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ErrorMessage="أدخل اسم المستخدم" Display="None"
                                    ValidationGroup="InsertValidation" ControlToValidate="InputUserName"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="كلمة المرور" FooterStyle-BackColor="White" FooterStyle-HorizontalAlign="Center"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:Label ID="LblUserPassword" runat="server" Text='<%# Eval("UserPassword") %>'
                                    ForeColor="Black" TextMode="Password" Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtUserPassword" runat="server" Text='<%# Bind("UserPassword") %>'
                                    ForeColor="Black" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ErrorMessage="أدخل كلمة المرور" Display="None"
                                    ValidationGroup="EditValidation" ControlToValidate="TxtUserPassword"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="InputUserPassword" runat="server" ForeColor="Black"
                                    Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ErrorMessage="أدخل كلمة المرور" Display="None"
                                    ValidationGroup="InsertValidation" ControlToValidate="InputUserPassword"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="نوع المستخدم" FooterStyle-BackColor="White" FooterStyle-HorizontalAlign="Center"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:DropDownList ID="DDLRoleID" runat="server" DataValueField="RoleID"
                                    DataSourceID="SqlDataSrcRoles" DataTextField="RoleName" Enabled="false"
                                    SelectedValue='<%# Eval("RoleID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDLRoleIDEdit" runat="server" DataValueField="RoleID"
                                    DataSourceID="SqlDataSrcRoles" DataTextField="RoleName"
                                    SelectedValue='<%# Bind("RoleID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DDLInputRoleID" runat="server" DataValueField="RoleID"
                                    DataSourceID="SqlDataSrcRoles" DataTextField="RoleName"
                                    ForeColor="Black">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="اسم الفرع" FooterStyle-BackColor="White" FooterStyle-HorizontalAlign="Center"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:DropDownList ID="DDLBranchID" runat="server" DataValueField="BranchID"
                                    DataSourceID="SqlDataSrcBranchs" DataTextField="BranchName" Enabled="false"
                                    SelectedValue='<%# Eval("BranchID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDLBranchIDEdit" runat="server" DataValueField="BranchID"
                                    DataSourceID="SqlDataSrcBranchs" DataTextField="BranchName"
                                    SelectedValue='<%# Bind("BranchID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DDLInputBranchID" runat="server"
                                    DataValueField="BranchID" ForeColor="Black"
                                    DataSourceID="SqlDataSrcBranchs" DataTextField="BranchName">
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="مصرح له" FooterStyle-BackColor="White" FooterStyle-HorizontalAlign="Center"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:CheckBox ID="ChBoxLbl" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="ChBoxEdit" runat="server" Checked='<%# Bind("IsActive") %>' />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:CheckBox ID="InputChBox" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField FooterStyle-BackColor="White">
                            <ItemTemplate>
                                <asp:LinkButton ID="LBtnUpdate" runat="server" CommandName="UpdateRow"
                                    CommandArgument='<%# Eval("UserID") %>'>تعديل</asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LBtnSave" runat="server" CommandName="SaveRow"
                                    CommandArgument='<%# Eval("UserID") %>'
                                    ValidationGroup="EditValidation">حفظ</asp:LinkButton>

                                <asp:LinkButton ID="LBtnCancel" runat="server" CommandName="CancelRow"
                                    CommandArgument='<%# Eval("UserID") %>'>إلغاء</asp:LinkButton>
                            </EditItemTemplate>

                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </td>
        </tr>

        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummaryEdit" runat="server" ForeColor="Red"
                    ValidationGroup="EditValidation" />
            </td>
        </tr>

                <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummaryInsert" runat="server" ForeColor="Red"
                    ValidationGroup="InsertValidation" />
            </td>
        </tr>
    </table>


    <asp:SqlDataSource ID="SqlDataSrcRoles" runat="server"
        ConnectionString="<%$ ConnectionStrings:TadelatDB %>"
        SelectCommand="GetAllRoles" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSrcBranchs" runat="server"
        ConnectionString="<%$ ConnectionStrings:TadelatDB %>"
        SelectCommand="GetAllBranchs" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
