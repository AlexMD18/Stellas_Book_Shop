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


namespace BookLibrary
{
    public class CalcBookPrice
    {
        Book book = new Book();

        //Find the final price of the order
        public float calcPrice(float basePrice, int orderQuant)
        {

            float totCost = 0;

            totCost = basePrice * orderQuant;

            return totCost;
        }

        //Find new price of item after addons or deductions have taken place
        public float newBasePrice(float basePrice, string rentBuy, string bookType)
        {
            float newBP = 0;

            if (rentBuy == "Rent")
            {
                basePrice *= 0.5f;
            }
            else
            {
                basePrice *= 1f;
            }

            if (bookType == "Hardcover")
            {
                basePrice *= 1.5f;
            }
            else if (bookType == "E-Book")
            {
                basePrice *= 0.5f;
            }
            else
            {
                basePrice *= 1f;
            }

            newBP = basePrice;
            return newBP;
        }
    }
}





/*if (book.RentBuy == "Rent")
{
    rentQuantity += book.OrderQuantity;
    book.BasePrice *= 0.5f;
}
else
{
    buyQuantity += book.OrderQuantity;
}

    if (book.BookType == "Hardcover")
{
    book.BasePrice *= 1.5f;
}
    else if (book.BookType == "E-Book")
{
    book.BasePrice *= 0.5f;
}
    else               
{
    book.BasePrice *= 1f;
}
    book.TotalCost += (book.BasePrice * book.OrderQuantity);*/
