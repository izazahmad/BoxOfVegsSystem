using BoxOfVegsSystem.Services;
using BoxOfVegsSystem.Models;
using BoxOfVegsSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Rotativa;

namespace BoxOfVegsSystem.Controllers
{
    public class ShopController : Controller
    {
        InsertionServices insertservice = new InsertionServices();
        RetrievalServices retrieveservice = new RetrievalServices();
        UpdationServices updateservice = new UpdationServices();
        // GET: Shop
        public ActionResult Index(string search, int? minPrice, int? maxPrice, int? categoryID, int? sortBy)
        {
            ShopViewModels model = new ShopViewModels
            {
                ShopSearching = search,
                ShopCategories = retrieveservice.AllCategoriesList(),
                MaximumPrice = retrieveservice.GetMaxPrice()
            };

            model.SortBy = sortBy;
            model.CategoryID = categoryID;

            model.ShopProducts = retrieveservice.GetProductsListForShop(search, minPrice, maxPrice, categoryID, sortBy);


            return View(model);
        }
        public ActionResult ProductDetails(int productId)
        {
            ProductDetailViewModels model = new ProductDetailViewModels();
            model.Product = retrieveservice.GetProduct(productId);
            model.Product.imageUrl = model.Product.imageUrl;
            model.ReviewsList = retrieveservice.GetProductReview(productId);            
            model.AverageRating = Convert.ToSingle( retrieveservice.GetAverageRating(productId));           
            model.UserCount = retrieveservice.GetCountUserReview(productId);
            return View(model);            
        }
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddReview(ProductDetailViewModels model, float rating)
        {
            if (ModelState.IsValid)
            {
                userReview review = new userReview();
                review.userDetailID = retrieveservice.GetUserDetailId(User.Identity.GetUserId());
                review.productID = model.Product.productID;
                review.reviewDate = DateTime.Now;
                review.review = model.Review;
                review.rating = rating;
                insertservice.AddReview(review);

                return RedirectToAction("ProductDetails", "Shop", new { productId = model.Product.productID });
            }
            else
            {
                ModelState.AddModelError("", "");
            }
            return View();
        }
        public ActionResult AddInCart(int productId, int qty)
        {
            List<CartViewModel> list = new List<CartViewModel>();
            var product = retrieveservice.GetProduct(productId);
            CartViewModel crt = new CartViewModel
            {
                ProductID = product.productID,
                Price = product.sellPrice,
                discount=product.discount,
                Quanity = qty,
                TotalQuantity = product.quantity,
                ProductURL = product.imageUrl
            };
            crt.Subtotal = crt.Price * crt.Quanity;
            crt.ProductName = product.productName;
            if (Session["cart"] == null)
            {
                list.Add(crt);
                Session["cart"] = list;

            }
            else
            {
                List<CartViewModel> newlist = (List<CartViewModel>)Session["cart"];
                int change = 0;
                foreach (var item in newlist)
                {
                    if (item.ProductID == crt.ProductID)
                    {
                        item.Quanity += crt.Quanity;
                        item.Subtotal += crt.Subtotal;
                        change = 1;

                    }
                }
                if (change == 0)
                {
                    newlist.Add(crt);
                }
                Session["cart"] = newlist;
            }

            if (Session["cart"] != null)
            {
                Nullable<Decimal> x = 0;
                List<CartViewModel> newlist = (List<CartViewModel>)Session["cart"];
                foreach (var item in newlist)
                {
                    x += item.Subtotal;

                }

                Session["total"] = x;
            }

            return RedirectToAction("Cart");
        }

        public ActionResult DeleteFromCart(int productId)
        {
            List<CartViewModel> cart = (List<CartViewModel>)Session["cart"];
            foreach (var item in cart)
            {
                if (item.ProductID == productId)
                {
                    cart.Remove(item);
                    break;
                }
            }
            Session["cart"] = cart;
            if (Session["cart"] != null)
            {
                Nullable<Decimal> x = 0;
                List<CartViewModel> newlist = (List<CartViewModel>)Session["cart"];
                foreach (var item in newlist)
                {
                    x += item.Subtotal;

                }

                Session["total"] = x;
            }
            return RedirectToAction("Cart");
        }
        public ActionResult UpdateCart(FormCollection formData)
        {
            string[] quantities = formData.GetValues("qty");
            List<CartViewModel> newlist = (List<CartViewModel>)Session["cart"];
            Nullable<decimal> x = 0;
            for (int i = 0; i < newlist.Count; i++)
            {
                newlist[i].Quanity = Convert.ToInt32(quantities[i]);
                newlist[i].Subtotal = newlist[i].Price * newlist[i].Quanity;
                Session["cart"] = newlist;
                x += newlist[i].Subtotal;

            }



            Session["total"] = x;
            return View("Cart");
        }
        [Authorize]
        public ActionResult Cart()
        {
            
           if (Session["cart"] != null)
           {
               Nullable<Decimal> x = 0;
               List<CartViewModel> newlist = (List<CartViewModel>)Session["cart"];
               foreach (var item in newlist)
               {
                   x += item.Subtotal;

               }

               Session["total"] = x;
           }
           return View();
          
        }
        [Authorize]
        public ActionResult Checkout()
        {
            if (Session["cart"] != null)
            {
                Nullable<Decimal> x = 0;
                List<CartViewModel> newlist = (List<CartViewModel>)Session["cart"];
                foreach (var item in newlist)
                {
                    x += item.Subtotal;

                }

                Session["total"] = x;
            }

            return View();
        }
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Checkout(FormCollection formData)
        {
            if (ModelState.IsValid)
            {
                if (Session["cart"] != null && ((List<CartViewModel>)Session["cart"]).Count > 0)
                {

                    List<CartViewModel> newlist = (List<CartViewModel>)Session["cart"];
                    int userDetailId = retrieveservice.GetUserDetailId(User.Identity.GetUserId());
                    invoice invoice = new invoice
                    {
                        userDetailID = userDetailId,
                        date = DateTime.Now,
                        address = Convert.ToString(formData["street"]),
                        city = "Leicester",
                        postCode = Convert.ToString(formData["postCode"]),
                        PhoneNo = Convert.ToString(formData["phone"])
                    };
                    insertservice.AddInvoice(invoice);
                    foreach (var item in newlist)
                    {
                        order orders = new order
                        {
                            productID = item.ProductID,
                            invoiceID = invoice.invoiceID,
                            quantity = item.Quanity.Value,
                            soldUnitPrice = item.Price.Value,
                            soldUnitDiscount = item.discount

                        };
                        insertservice.AddOrder(orders);
                        int newQuantity = (item.TotalQuantity - item.Quanity).Value;
                        updateservice.updateQuantityPrice(item.ProductID, newQuantity);
                    }
                    Session.Remove("total");
                    Session.Remove("cart");
                    return RedirectToAction("Invoice", new { userId = userDetailId });

                }
                else
                {
                    return RedirectToAction("Cart");
                }
            }
            else
            {
                ModelState.AddModelError("", "");
            }
            return View();
        }
        public ActionResult Invoice()
        {
            userDetail user = new userDetail();
            user.userDetailID= retrieveservice.GetUserDetailId(User.Identity.GetUserId());
            return View(user);
        }
        public ActionResult CreateInvoice(int userId)
        {

            var invoiceDetails = retrieveservice.GetInvoiceDetail(userId);
            var userDetails = retrieveservice.GetUserDetails(userId);
            int invoiceId = invoiceDetails.invoiceID;
            InvoiceDetailViewModel model = new InvoiceDetailViewModel
            {
                Orders = retrieveservice.GetOrders(invoiceId),
                UserID = userId,
                InvoiceDate = invoiceDetails.date,
                InvoiceID = invoiceId,
                PhoneNumber = invoiceDetails.PhoneNo,
                PostCode = invoiceDetails.postCode,
                Address = invoiceDetails.address,
                City = invoiceDetails.city,
                FirstName = userDetails.firstName,
                LastName = userDetails.lastName
            };

            return PartialView("CreateInvoice", model);
        }
        public ActionResult PrintInvoice(int userid)
        {
            
            return new ActionAsPdf("CreateInvoice", new { userid });

        }
    }
}