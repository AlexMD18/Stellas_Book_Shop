/*
Alex Drogo
09/30/2020
CIS 3342
Prof. Pascucci
 */

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Utilities;

namespace BookLibrary
{
    public class Book
    {
        //Private Objects
        private string hiddenISBN;
        private string hiddenTitle;
        private string hiddenAuthor;
        private float hiddenBasePrice;
        private float hiddenTotalSales;
        private int hiddenTotQuantityRented;
        private int hiddenTotQuantitySold;
        private string hiddenBookType;
        private string hiddenRentBuy;
        private int hiddenOrderQuantity;
        private float hiddenTotalCost;

        //Parameterless Constructor
        public Book()
        {
            this.hiddenISBN = "";
            this.hiddenTitle = "";
            this.hiddenAuthor = "";
            this.hiddenBasePrice = 0;
            this.hiddenTotalSales = 0;
            this.hiddenTotQuantityRented = 0;
            this.hiddenTotQuantitySold = 0;
            this.hiddenBookType = "";
            this.hiddenRentBuy = "";
            this.hiddenOrderQuantity = 0;
            this.hiddenTotalCost = 0;
        }

        //Paramaterized Constructor
        public Book(string isbn, string title, string author, float basePrice, float totalSales, int totQuantityRented, 
            int totQuantitySold, string bookType, string rentBuy, int orderQuantity, float totalCost)
        {
            hiddenISBN = isbn;
            hiddenTitle = title;
            hiddenAuthor = author;
            hiddenBasePrice = basePrice;
            hiddenTotalSales = totalSales;
            hiddenTotQuantityRented = TotalQuantityRented;
            hiddenTotQuantitySold = totQuantitySold;
            hiddenBookType = bookType;
            hiddenRentBuy = rentBuy;
            hiddenOrderQuantity = orderQuantity;
            hiddenTotalCost = totalCost;
        }

        //Getters and setters
        public string ISBN
        {
            get { return hiddenISBN; }
            set { hiddenISBN = value; }
        }

        public string Title
        {
            get { return hiddenTitle; }
            set { hiddenTitle = value; }
        }

        public string Author
        {
            get { return hiddenAuthor; }
            set { hiddenAuthor = value; }
        }

        public float BasePrice
        {
            get { return hiddenBasePrice; }
            set { hiddenBasePrice = value; }
        }

        public float TotalSales
        {
            get { return hiddenTotalSales; }
            set { hiddenTotalSales = value; }
        }

        public int TotalQuantityRented
        {
            get { return hiddenTotQuantityRented; }
            set { hiddenTotQuantityRented = value; }
        }
        
        public int TotalQuantitySold
        {
            get { return hiddenTotQuantitySold; }
            set { hiddenTotQuantitySold = value; }
        }

        public string BookType
        {
            get { return hiddenBookType; }
            set { hiddenBookType = value; }
        }

        public string RentBuy
        {
            get { return hiddenRentBuy; }
            set { hiddenRentBuy = value; }
        }

        public int OrderQuantity
        {
            get { return hiddenOrderQuantity; }
            set { hiddenOrderQuantity = value; }
        }

        public float TotalCost
        {
            get { return hiddenTotalCost; }
            set { hiddenTotalCost = value; }
        }
        //End of getters and setters

    }
}