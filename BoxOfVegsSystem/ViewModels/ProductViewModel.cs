using BoxOfVegsSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BoxOfVegsSystem.ViewModels
{
    public class ProductListViewModel
    {
        public List<product> Products { get; set; }
        public int ProductId { get; set; }
        public Nullable<int> profit { get; set; }
        public Nullable<int> discount { get; set; }
        public Nullable<decimal> purchasedPrice { get; set; }
        public Nullable<decimal> sellPrice { get; set; }





    }
    public class AddOrEditProductViewModel
    {
        public int ProductId { get; set; }
        public string name { get; set; }
        public string Description { get; set; }
        public int categoryId { get; set; }
        public string imageUrl { get; set; }
        public Nullable<decimal> purchasedPrice { get; set; }
        public Nullable<int> profit { get; set; }
        public Nullable<int> discount { get; set; }
        public Nullable<decimal> sellPrice { get; set; }
        public Nullable<int> quantity { get; set; }
        public List<category> AllCategories { get; set; }
    }
}