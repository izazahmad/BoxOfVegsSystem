using BoxOfVegsSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BoxOfVegsSystem.ViewModels
{
    public class ShopViewModels
    {
        public int MaximumPrice { get; set; }
        public List<category> ShopCategories { get; set; }
        public List<product> ShopProducts { get; set; }
        public int? SortBy { get; set; }
        public int? CategoryID { get; set; }
        public string ShopSearching { get; set; }
    }
    public class ProductDetailViewModels
    {
        public List<userReview> ReviewsList { get; set; }
        public product Product { get; set; }
        public float? AverageRating { get; set; }
        public int? UserCount { get; set; }
        public string Review { get; set; }
    }
    public class CartViewModel
    {

        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string ProductURL { get; set; }
        public Nullable<int> TotalQuantity { get; set; }
        public Nullable<Decimal> Price { get; set; }
        public Nullable<int> discount { get; set; }
        public Nullable<int> Quanity { get; set; }
        public Nullable<Decimal> Subtotal { get; set; }

    }
    public class InvoiceDetailViewModel
    {
        public List<order> Orders { get; set; }
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int InvoiceID { get; set; }
        public string Address { get; set; }

        public string PostCode { get; set; }

        public string City { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime InvoiceDate { get; set; }
        //public decimal TotalAmount { get; set; }

    }
    public class OrdersVeiwModel
    {
        public int invoiceID { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public Decimal Subtotal { get; set; }
        public Decimal UnitPrice { get; set; }
        public int discount { get; set; }
        public DateTime InvoiceDate { get; set; }
        public int OrderID { get; set; }
        public string image { get; set; }

    }
}