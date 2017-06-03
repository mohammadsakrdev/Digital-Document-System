<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterForm.Master" AutoEventWireup="true" CodeBehind="TypesForm.aspx.cs" Inherits="TadelatApplication.TypesForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
        <table class="ContentTable container-fluid">
        <tr>
            <td colspan="9" style="align-content: center" class="container-fluid">

                <asp:GridView ID="GridViewTypes" runat="server" CellPadding="4" ForeColor="#333333" Height="296px" 
                    Width="1042px" CellSpacing="1"
                    EditRowStyle-HorizontalAlign="Center" EditRowStyle-VerticalAlign="Middle" AutoGenerateColumns="False"
                    AlternatingRowStyle-HorizontalAlign="Center" AlternatingRowStyle-VerticalAlign="Middle"
                    HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle"
                    BorderWidth="1px" SortedDescendingCellStyle-BorderWidth="1" ShowFooter="true" OnRowCommand="GridViewTypes_RowCommand" >
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
                                <asp:Label ID="LblID" runat="server" Text='<%# Eval("TypeID") %>' 
                                    Font-Bold="true" Font-Size="Large"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="TypeID" runat="server" Text='<%# Eval("TypeID") %>'
                                    Font-Bold="true" Font-Size="Large"></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LBtnInsert" runat="server" CommandName="InsertRow"
                                    ValidationGroup="InsertTypeValidation">إضافة جديد</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="نوع التعديل" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            FooterStyle-BackColor="White" FooterStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="LblTypeName" runat="server" Text='<%# Eval("TypeName") %>'
                                    Font-Bold="true" Font-Size="Large"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtTypeName" runat="server" Text='<%# Bind("TypeName") %>'
                                    Font-Bold="true" Font-Size="Large"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" Text="*"
                                    ErrorMessage="يجب ادخال قيمة" ControlToValidate="TxtTypeName" ForeColor="Red"
                                    ValidationGroup="EditTypeValidation"></asp:RequiredFieldValidator>
                            </EditItemTemplate>

                            <FooterTemplate>
                                <asp:TextBox ID="InputTypeName" runat="server" ForeColor="Black"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" Text="*"
                                    ErrorMessage="يجب ادخال قيمة" ControlToValidate="InputTypeName" ForeColor="Red"
                                    ValidationGroup="InsertTypeValidation"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField FooterStyle-BackColor="White" >
                            <ItemTemplate>
                                <asp:LinkButton ID="LBtnUpdate" runat="server" CommandName="UpdateRow"
                                    CommandArgument='<%# Eval("TypeID") %>'>تعديل</asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LBtnSave" runat="server" CommandName="SaveRow"
                                    CommandArgument='<%# Eval("TypeID") %>' ValidationGroup="EditTypeValidation" >حفظ</asp:LinkButton>

                                <asp:LinkButton ID="LBtnCancel" runat="server" CommandName="CancelRow"
                                    CommandArgument='<%# Eval("TypeID") %>'>إلغاء</asp:LinkButton>
                            </EditItemTemplate>

                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </td>
        </tr>

            <tr>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                        ValidationGroup="EditTypeValidation"/>
                </td>
            </tr>

                        <tr>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" 
                        ValidationGroup="InsertTypeValidation"/>
                </td>
            </tr>
    </table>
</asp:Content>
