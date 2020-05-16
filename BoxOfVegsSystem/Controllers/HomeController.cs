using BoxOfVegsSystem.Services;
using BoxOfVegsSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BoxOfVegsSystem.Controllers
{
    public class HomeController : Controller
    {
        RetrievalServices retrieveservice = new RetrievalServices();
        public ActionResult Index(string categoryName=null)
        {
            HomeViewModels model = new HomeViewModels();
            model.CategoriesList = retrieveservice.AllCategoriesList();
            model.ProductsDiscountList = retrieveservice.GetDiscountProductsList();
            model.BoxProductsList = retrieveservice.GetProductsListByCatName("box");
            return View(model);
        }
    }
}