<!--
 Alex Drogo
 09/30/2020
 CIS 3342
 Prof. Pascucci
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book_Store.aspx.cs" Inherits="Book_Store.Book_Store" %>

<!DOCTYPE html>
<link href="BookStoreStyle.css" type="text/css" rel="stylesheet"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     
<title>Stella's Book Shop</title>
    </head>

<body>

    <form id="frmBookstoreInfo" runat="server" visible="True">
        <asp:ImageButton ID="imgStella" runat="server" ImageUrl="~/Bookstore_Images/Stella.jpg" OnClick="imgStella_Click" />

        <h2>Stella's Book Shop</h2>
        <asp:Panel ID="pnlPersonalInfo" runat="server">
            <asp:Label ID="lblStudentID" runat="server" Text="Student ID: "></asp:Label>
            <asp:TextBox ID="txtStudentID" runat="server"></asp:TextBox>
            <!--<asp:RequiredFieldValidator ID="StudentIDValidator" runat="server" ErrorMessage="*Required Field" ControlToValidate="txtStudentID" ForeColor="Red"></asp:RequiredFieldValidator>-->
            <br />
            <asp:Label ID="lblName" runat="server" Text="Name: "></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <!--<asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="*Required Field" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>-->
            <br />
            <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            <!--<asp:RequiredFieldValidator ID="AddressValidator" runat="server" ErrorMessage="*Required Field" ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator>-->
            <br />
            <asp:Label ID="lblPhoneNum" runat="server" Text="Phone Number: "></asp:Label>
            <asp:TextBox ID="txtPhone1" runat="server" MinLength="3" MaxLength="3" Width="35px"></asp:TextBox>
            <asp:Label ID="lblPhoneDash1" runat="server" Text=" - "></asp:Label>
            <asp:TextBox ID="txtPhone2" runat="server" MinLength="3" MaxLength="3" Width="35px"></asp:TextBox>
            <asp:Label ID="lblPhoneDash2" runat="server" Text=" - "></asp:Label>
            <asp:TextBox ID="txtPhone3" runat="server" MinLength="4" MaxLength="4" Width="55px"></asp:TextBox>
            <!--<asp:RequiredFieldValidator ID="PhoneNumberValidator" runat="server" ErrorMessage="*Required Field" ControlToValidate="txtPhone1" ForeColor="Red"></asp:RequiredFieldValidator>-->
            <br />
            <asp:Label ID="lblCampusLoc" runat="server" Text="Select Campus: " style="z-index: 1;"></asp:Label>
            <asp:DropDownList ID="ddlCampusSelect" runat="server" AutoPostBack="True">
                <asp:ListItem>None Selected</asp:ListItem>
                <asp:ListItem>Main</asp:ListItem>
                <asp:ListItem>Center City</asp:ListItem>
                <asp:ListItem>Ambler</asp:ListItem>
                <asp:ListItem>Japan</asp:ListItem>
                <asp:ListItem>Rome</asp:ListItem>
                <asp:ListItem>Zoom</asp:ListItem>
            </asp:DropDownList>
            <!--<asp:RequiredFieldValidator ID="CampusValidator" runat="server" ErrorMessage="*Required Field" ControlToValidate="ddlCampusSelect" InitialValue="None Selected" ForeColor="Red"></asp:RequiredFieldValidator>-->
        </asp:Panel>
        <br />
        <!--Panel for outputting information when purchasing-->
        <asp:Panel ID="pnlOutputInfo" runat="server">
            <asp:Label ID="lblStudentIDOut" runat="server" Text="StudentID: " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="txtStudentIDOut" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
            <br />
            <asp:Label ID="lblNameOut" runat="server" Text="Name: " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="txtNameOut" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
            <br />
            <asp:Label ID="lblAddressOut" runat="server" Text="Address: " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="txtAddressOut" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
            <br />
            <asp:Label ID="lblPhoneOut" runat="server" Text="Phone Number: " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="txtPhoneOut" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
            <br />
            <asp:Label ID="lblCampusOut" runat="server" Text="Campus: " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="txtCampusOut" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
            <br />
            <br />
        </asp:Panel>
        <!--Instruction labels for each form-->
        <asp:Label ID="lblInstructions" runat="server" Text="Please fill out all of the personal information above. Then you may select a 
            book by checking the checkbox next to the title,<br> then enter a format, whether you would like to rent or buy, and the
            quantity of books you would like to buy. To start over or return<br /> to the homescreen, simply click on the picture of Stella the Owl.
            To see a table of all the books in the database click on the report button.<br /> If you choose to rent a book the price will be half
            of the base price listed. There is a 50% extra charge for a hardcover copy <br />and a 50% reduced price for an e-book. When you press
            submit you will be directed to a screen showing your order receipt." Font-Bold="True"></asp:Label>
        <asp:Label ID="lblReceiptInstructions" runat="server" Text="Thank you for your purchase! <br>To go back to the Home Page click on Stella the Owl.
            <br />To see a managment report of all the books, click on the Report button." Visible="False" Font-Bold="True"></asp:Label>
        <asp:Label ID="lblReportInstructions" runat="server" Text="This is a report of all the books in the database. It is organized by Total Sale amount.
            <br>To go back to the home page, click on Stella the Owl." Font-Bold="True" Visible="False"></asp:Label>
        <!--End of instruction labels-->
        <br />
        <br />
        <asp:Button ID="btnReport" runat="server" Text="Report" BackColor="Maroon" ForeColor="White" Height="40px" Width="90px" OnClick="btnReport_Click"/>
        <br />
        <asp:Label ID="lblInfoErrors" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="lblCheckBoxErrors" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="lblTextVal" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="gvBookMenu" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
            AutoGenerateColumns="False">
            
            <Columns>
                <asp:TemplateField HeaderText="Select Product">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Authors" HeaderText="Author(s)" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                <asp:BoundField DataField="BasePrice" HeaderText="Base Price" />
                <asp:TemplateField HeaderText="Book Type">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlType" runat="server">
                            <asp:ListItem>Choose...</asp:ListItem>
                            <asp:ListItem>Hardcover</asp:ListItem>
                            <asp:ListItem>Paper-Back</asp:ListItem>
                            <asp:ListItem>E-Book</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rent/Buy">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlBuyRent" runat="server">
                            <asp:ListItem>Choose...</asp:ListItem>
                            <asp:ListItem>Rent</asp:ListItem>
                            <asp:ListItem>Buy</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Order Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="txtOrderQt" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="Lightgrey" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />

        </asp:GridView>
            
        <br />

        <asp:Button ID="btnSubmit" runat="server" Text="Submit Order" BackColor="Black" ForeColor="White" Height="40px" Width="100px" OnclientClick="validateTextBox()" OnClick="btnSubmit_Click"/>
        <asp:Button ID="btnClear" runat="server" Text="Clear" BackColor="Black" ForeColor="White" Height="40px" Width="100px" OnClientClick="this.form.reset();return false;btnClear_Click"/>

        <asp:GridView ID="gvPurchase" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" AutoGenerateColumns="False" Visible="False" BorderColor="Black" BorderWidth="0px" ShowFooter="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                <asp:BoundField HeaderText="Type" DataField="BookType" />
                <asp:BoundField HeaderText="Buy/Rent" DataField="RentBuy" />
                <asp:BoundField HeaderText="Price" DataFormatString="{0:c}" DataField="BasePrice" />
                <asp:BoundField HeaderText="Quantity" DataField="OrderQuantity" />
                <asp:BoundField HeaderText="Total Cost" DataFormatString="{0:c}" DataField="TotalCost" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" BorderColor="Black" BorderWidth="2px" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" BorderColor="Black" BorderWidth="0px" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="Lightgrey" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

        <asp:GridView ID="gvReport" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
            Visible="False" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Authors" HeaderText="Author(s)" />
                <asp:BoundField DataField="BasePrice" HeaderText="Base Price" DataFormatString="{0:c}" />
                <asp:BoundField DataField="TotalSales" HeaderText="Total Sales" DataFormatString="{0:c}" />
                <asp:BoundField DataField="TotalQuantitySold" HeaderText="Total Quantity Sold" />
                <asp:BoundField DataField="TotalQuantityRented" HeaderText="Total Quantity Rented" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="Lightgrey" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
    </form>


</body>

</html>
