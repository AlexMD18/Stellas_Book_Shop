/*
 Alex Drogo
 09/30/2020
 CIS 3342
 Prof. Pascucci
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Utilities;
using BookLibrary;

namespace Book_Store
{
    public partial class Book_Store : System.Web.UI.Page
    {
        ArrayList arrBooks = new ArrayList();
        CalcBookPrice calculateBookPrice = new CalcBookPrice();
        ValidateBookInfo valbook = new ValidateBookInfo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DBConnect objDB = new DBConnect();
                DataSet myDS;
                String strSQL = "SELECT * FROM Books";

                //Perform a SQL query and store the results
                //Display the results in a gridview.
                myDS = objDB.GetDataSet(strSQL);
                gvBookMenu.DataSource = myDS;
                gvBookMenu.DataBind();

                pnlOutputInfo.Visible = false;
            }
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            //Changes visability of the gridviews
            gvBookMenu.Visible = false;
            gvPurchase.Visible = false;
            gvReport.Visible = true;

            //Changes visablility of the buttons
            btnReport.Visible = false;
            btnSubmit.Visible = false;
            btnClear.Visible = false;

            //Changes visability of lables
            lblCheckBoxErrors.Visible = false;
            lblInfoErrors.Visible = false;
            lblInstructions.Visible = false;
            lblReceiptInstructions.Visible = false;
            lblReportInstructions.Visible = true;

            //Changes visability of the panel
            pnlPersonalInfo.Visible = false;

            DBConnect objDB = new DBConnect();
            DataSet myDS;
            String strSQL = "SELECT * FROM Books ORDER BY TotalSales DESC";

            //Perform a SQL query and store the results
            //Display the results in a gridview.
            myDS = objDB.GetDataSet(strSQL);
            gvReport.DataSource = myDS;
            gvReport.DataBind();
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            TextBox quantTBox;
            DropDownList bookType;
            DropDownList rentBuy;
            float totPrice = 0f;
            int totQuantity = 0;
            int rentQuantity = 0;
            int buyQuantity = 0;

            foreach (GridViewRow row in gvBookMenu.Rows)
            {
                
                if (valbook.checkTextBoxes(txtStudentID, txtName, txtAddress, txtPhone1, txtPhone2, txtPhone3, ddlCampusSelect) == true)
                {
                    if (valbook.isChecked(row))
                    {
                        lblCheckBoxErrors.Visible = false;
                        lblInfoErrors.Visible = false;
                        quantTBox = (TextBox)row.FindControl("txtOrderQt");

                        if (quantTBox.Text == "")
                        {
                            lblTextVal.Visible = true;
                            lblTextVal.Text = "Fill in text qunatity.";

                        }
                        else
                        {
                            bookType = (DropDownList)row.FindControl("ddlType");
                            if (bookType.Text == "Choose...")
                            {
                                lblTextVal.Visible = true;
                                lblTextVal.Text = "Choose Book Type";
                            }
                            else
                            {
                                rentBuy = (DropDownList)row.FindControl("ddlBuyRent");
                                if (rentBuy.Text == "Choose...")
                                {
                                    lblTextVal.Visible = true;
                                    lblTextVal.Text = "Choose Format Type";
                                }
                                else
                                {
                                    DropDownList ddlBookType;
                                    DropDownList ddlRentBuy;
                                    TextBox txtQuantity;
                                    Book book = new Book();
                                    CalcBookPrice calculateBookPrice = new CalcBookPrice();
                                    
                                    float totalPrice = 0;

                                    //Changes visability of the gridviews
                                    gvBookMenu.Visible = false;
                                    gvReport.Visible = false;
                                    gvPurchase.Visible = true;

                                    //Changes visablility of the buttons
                                    btnClear.Visible = false;
                                    btnSubmit.Visible = false;
                                    btnReport.Visible = true;

                                    //Changes visablilty of the panels
                                    pnlPersonalInfo.Visible = false;
                                    pnlOutputInfo.Visible = true;

                                    //Changes visablility of the labels
                                    lblInstructions.Visible = false;
                                    lblTextVal.Visible = false;
                                    lblReceiptInstructions.Visible = true;
                                    lblReportInstructions.Visible = false;

                                    txtStudentIDOut.Text = txtStudentID.Text;
                                    txtNameOut.Text = txtName.Text;
                                    txtAddressOut.Text = txtAddress.Text;
                                    txtPhoneOut.Text = txtPhone1.Text + "-" + txtPhone2.Text + "-" + txtPhone3.Text;
                                    txtCampusOut.Text = ddlCampusSelect.Text;

                                    book.Title = row.Cells[1].Text;
                                    book.Author = row.Cells[2].Text;
                                    book.ISBN = row.Cells[3].Text;
                                    book.BookType = bookType.Text;
                                    book.RentBuy = rentBuy.Text;

                                    decimal price = Convert.ToDecimal(row.Cells[4].Text);
                                    book.BasePrice = (float)price;
                                    book.OrderQuantity = Convert.ToInt32(quantTBox.Text);

                                    if (book.RentBuy == "Rent")
                                    {
                                        rentQuantity += book.OrderQuantity;
                                    }
                                    else
                                    {
                                        buyQuantity += book.OrderQuantity;
                                    }

                                    book.BasePrice = calculateBookPrice.newBasePrice(book.BasePrice, book.RentBuy, book.BookType);
                                    totPrice += calculateBookPrice.calcPrice(book.BasePrice, book.OrderQuantity);

                                    book.TotalCost += (book.BasePrice * book.OrderQuantity);
                                    arrBooks.Add(book);

                                    totQuantity += book.OrderQuantity;

                                    gvPurchase.DataSource = arrBooks;
                                    gvPurchase.Columns[0].FooterText = "Purchase Totals: ";
                                    gvPurchase.Columns[5].FooterText = totQuantity.ToString();
                                    gvPurchase.Columns[6].FooterText = "$" + totPrice.ToString("F");

                                    gvPurchase.DataBind();

                                    updateDataBase(totPrice, rentQuantity, buyQuantity, book.ISBN);
                                }
                            }
                        }
                    }
                    else
                    {
                        lblCheckBoxErrors.Visible = true;
                        lblInfoErrors.Visible = false;
                        lblCheckBoxErrors.Text = "*Please select at least one book*";
                    }

                }
                else
                {
                    lblCheckBoxErrors.Visible = false;
                    lblInfoErrors.Visible = true;
                    lblInfoErrors.Text = "*Fill in all Personal Information*";
                }

            }
        }

         public void updateDataBase(float totPrice, int rentQuantity, int buyQuantity, string isbn)
         {
            DBConnect objDB = new DBConnect();
            DataSet myDS;
            String strSQL = "UPDATE Books SET TotalSales = TotalSales + " + totPrice + ", TotalQuantityRented = TotalQuantityRented + "
            + rentQuantity + ", TotalQuantitySold = TotalQuantitySold + " + buyQuantity + "WHERE ISBN = " + isbn;
            objDB.DoUpdate(strSQL);
         }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void imgStella_Click(object sender, ImageClickEventArgs e)
        {
            pnlPersonalInfo.Visible = true;
            pnlOutputInfo.Visible = false;

            gvBookMenu.Visible = true;
            gvPurchase.Visible = false;
            gvReport.Visible = false;

            btnReport.Visible = true;
            btnSubmit.Visible = true;
            btnClear.Visible = true;

            lblCheckBoxErrors.Visible = false;
            lblInfoErrors.Visible = false;
            lblInstructions.Visible = true;
            lblReceiptInstructions.Visible = false;
            lblReportInstructions.Visible = false;

            Response.Redirect(Request.RawUrl);

        }
    }
}