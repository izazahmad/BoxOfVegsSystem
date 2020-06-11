using BoxOfVegsSystem.Models;
using BoxOfVegsSystem.Services;
using BoxOfVegsSystem.ViewModels;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;

namespace BoxOfVegsSystem.Controllers
{
    [Authorize(Roles = "admin")]
    public class PurchaseController : Controller
    {
        InsertionServices insertservice = new InsertionServices();
        RetrievalServices retrieveservice = new RetrievalServices();
        UpdationServices updateservice = new UpdationServices();
        DeletionServices deleteservice = new DeletionServices();
        // GET: Purchase
        public ActionResult Index()
        {
            PurchaseListViewModel purchase = new PurchaseListViewModel();
            purchase.purchases = retrieveservice.AllPurchaseList();
            return View(purchase);
        }
        public ActionResult PurchaseProducts()
        {
            PurchaseProductViewModel purchase = new PurchaseProductViewModel();
            purchase.Suppliers = retrieveservice.AllSupplierList();
            purchase.Products = retrieveservice.AllProductsList();
            return View(purchase);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PurchaseProducts(PurchaseProductViewModel purchase)
        {
            if (ModelState.IsValid)
            {
                purchase pur = new purchase
                {
                    supplierID = purchase.SupplierID,
                    purchaseDate = DateTime.Now,
                    userID = User.Identity.GetUserId()
                };


                int purId = insertservice.insertPurchase(pur);
                int purproId = 0;
                if (purId > 0)
                {
                    purchasedProduct purpro = new purchasedProduct
                    {
                        purchaseID = purId,
                        productID = purchase.ProductId,
                        quantity = purchase.Quantity,
                        purchasedPrice = purchase.PurchasePrice
                    };
                    purproId = insertservice.insertPurchasedProducts(purpro);
                }
                if (purproId > 0)
                {
                    var product = retrieveservice.GetProduct(purchase.ProductId);
                    int quantity;
                    if (product.quantity == null || product.quantity == 0)
                    {
                        quantity = purchase.Quantity;
                    }
                    else
                    {
                        quantity = Convert.ToInt32(product.quantity + purchase.Quantity);
                    }
                    updateservice.updateQuantityPrice(purchase.ProductId, quantity, purchase.PurchasePrice);

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
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int purchasedID)
        {
            int val = deleteservice.DeletePurchase(purchasedID);
            if(val==1)
            {
                return Json(new { message = "yes" }, JsonRequestBehavior.AllowGet);

            }
            else
            {
                return Json(new { message = "no" }, JsonRequestBehavior.AllowGet);

            }

        }
    }
}