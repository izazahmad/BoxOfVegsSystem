using BoxOfVegsSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BoxOfVegsSystem.ViewModels
{
    public class HomeViewModels
    {
        public List<product> BoxProductsList { get; set; }
        public List<product> ProductsDiscountList { get; set; }
        public List<category> CategoriesList { get; set; }
       
    }
}