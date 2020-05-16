using BoxOfVegsSystem.Models;
using BoxOfVegsSystem.Services;
using BoxOfVegsSystem.ViewModels;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace BoxOfVegsSystem.Controllers
{
    [Authorize(Roles = "admin")]
    public class ProductController : Controller
    {
        InsertionServices insertservice = new InsertionServices();
        RetrievalServices retrieveservice = new RetrievalServices();
        UpdationServices updateservice = new UpdationServices();
        DeletionServices deleteservice = new DeletionServices();
        // GET: Product
        public ActionResult Index()
        {
            ProductListViewModel prolist = new ProductListViewModel();
            prolist.Products = retrieveservice.AllProductsList();
            return View(prolist);
        }
        public ActionResult AddOrEditProduct(int productId)
        {
            AddOrEditProductViewModel pro = new AddOrEditProductViewModel();
            pro.AllCategories = retrieveservice.AllCategoriesList();
            if (productId != 0)
            {
                var product = retrieveservice.GetProduct(productId);
                pro.ProductId = product.productID;
                pro.name = product.productName;
                pro.Description = product.description;
                pro.categoryId = product.categoryID;
                pro.imageUrl = product.imageUrl;
                pro.profit = product.profitPercentage;
                pro.discount = product.discount;
                pro.purchasedPrice = product.purchasedPrice;
                pro.quantity = product.quantity;
                pro.sellPrice = product.sellPrice;
                return View(pro);
            }
            else
            {
                return View(pro);
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddOrEditProduct(AddOrEditProductViewModel product, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                product pro = new product();
                string fileName = null;
                if (image != null)
                {
                    string extension = System.IO.Path.GetExtension(image.FileName);
                    string file_name = Guid.NewGuid().ToString();
                    fileName = file_name + extension;
                    string path = System.IO.Path.Combine(Server.MapPath("~/Content/images/products"), fileName);
                    image.SaveAs(path);
                }
                pro.imageUrl = fileName;
                var prct = retrieveservice.GetProduct(product.ProductId);
                string imageurl = prct.imageUrl;
                if (product.ProductId > 0)
                {
                    if (!string.IsNullOrEmpty(prct.imageUrl) && string.IsNullOrEmpty(fileName))
                    {
                        pro.imageUrl = prct.imageUrl;
                    }
                    pro.productID = product.ProductId;
                    if (product.name != null)
                    {
                        pro.productName = product.name;
                    }
                    else
                    {
                        pro.productName = prct.productName;
                    }
                    if (product.Description != null)
                    {
                        pro.description = product.Description;
                    }
                    else
                    {
                        pro.description = prct.description;
                    }
                    if (product.categoryId > 0)
                    {
                        pro.categoryID = product.categoryId;
                    }
                    else
                    {
                        pro.categoryID = prct.categoryID;
                    }
                    if (product.profit == null && prct.profitPercentage > 0)
                    {
                        pro.profitPercentage = prct.profitPercentage;
                    }
                    else if (product.profit > 0)
                    {
                        pro.profitPercentage = product.profit;
                    }
                    else
                    {
                        pro.profitPercentage = 0;
                    }
                    if (product.discount > 0)
                    {
                        pro.discount = product.discount;
                    }
                    else if (prct.discount != null)
                    {
                        pro.discount = prct.discount;
                    }
                    else
                    {
                        pro.discount = 0;

                    }
                    if (product.purchasedPrice != null)
                    {
                        pro.purchasedPrice = product.purchasedPrice;
                    }
                    else if (prct.purchasedPrice != null)
                    {
                        pro.purchasedPrice = prct.purchasedPrice;
                    }
                    else
                    {
                        pro.purchasedPrice = 0;
                    }
                    if (product.quantity != null)
                    {
                        pro.quantity = product.quantity;
                    }
                    else if (prct.quantity != null)
                    {
                        pro.quantity = prct.quantity;
                    }
                    else
                    {
                        pro.quantity = 0;
                    }
                    if (product.sellPrice != null)
                    {
                        pro.sellPrice = product.sellPrice;
                    }
                    else if (prct.sellPrice != null)
                    {
                        pro.sellPrice = prct.sellPrice;
                    }
                    else
                    {
                        pro.sellPrice = 0;
                    }
                    int result = updateservice.updateProduct(pro);
                    if (result > 0)
                    {
                        if (!string.IsNullOrEmpty(imageurl))
                        {
                            string path = HostingEnvironment.MapPath("~/Content/images/products/" + imageurl);

                            System.IO.File.Delete(path);

                        }
                    }
                }
                else
                {

                    pro.productName = product.name;
                    pro.description = product.Description;
                    pro.categoryID = product.categoryId;
                    pro.purchasedPrice = 0;
                    pro.profitPercentage = 0;
                    pro.discount = 0;
                    pro.sellPrice = 0;
                    pro.quantity = 0;

                    insertservice.insertProduct(pro);

                }

                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "");
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int productID)
        {
            deleteservice.DeleteProducts(productID);
            return Json(new { message = "Deleted Successfully" }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult GetProductById(int proId)
        {
            ProductListViewModel product = new ProductListViewModel();
            var pro = retrieveservice.GetProduct(proId);
            product.ProductId = pro.productID;
            product.purchasedPrice = pro.purchasedPrice;
            product.sellPrice = pro.sellPrice;
            product.profit = pro.profitPercentage;
            product.discount = pro.discount;

            return Json(product, JsonRequestBehavior.AllowGet);

        }
    }
}
        