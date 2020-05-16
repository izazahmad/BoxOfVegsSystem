using BoxOfVegsSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BoxOfVegsSystem.ViewModels
{
    public class PurchaseListViewModel
    {
        public List<purchasedProduct> purchases { get; set; }
    }
    public class PurchaseProductViewModel
    {
        public List<supplier> Suppliers { get; set; }
        public List<product> Products { get; set; }
        //public List<purchase> Purchases { get; set; }
        //public int PurchaseId { get; set; }
        public int ProductId { get; set; }
        //public string UserId { get; set; }
        public int SupplierID { get; set; }
        //public DateTime Date { get; set; }
        public int Quantity { get; set; }
        public decimal PurchasePrice { get; set; }
    }
}