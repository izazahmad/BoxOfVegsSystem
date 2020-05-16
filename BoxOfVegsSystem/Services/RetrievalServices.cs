using BoxOfVegsSystem.Models;
using BoxOfVegsSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace BoxOfVegsSystem.Services
{
    public class RetrievalServices
    {
        // get all categories
        public List<category> AllCategoriesList()
        {
            using(var context=new boxofvegsDBEntities())
            {
                return context.categories.Include(x=>x.products).ToList();
            }
        }
        // get category by id
        public category GetCategory(int categoryID)
        {
            using (var context=new boxofvegsDBEntities())
            {
                return context.categories.Find(categoryID);
            }
        }
        public product GetProduct(int proId)
        {
            using(var context=new boxofvegsDBEntities())
            {
                return context.products.Where(x => x.productID == proId).Include(x => x.category).Include(x=>x.userReviews).FirstOrDefault();
            }
        }
        public List<product> AllProductsList()
        {
            using(var context=new boxofvegsDBEntities())
            {
                return context.products.Include(x=>x.category).ToList();
            }
        }
        public List<product> GetProductsListByCatName(string categoryName)
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.products.Where(x => x.productName.ToLower().Contains(categoryName.ToLower())).Include(x => x.category).ToList();

            }
        }
        public List<product> GetProductsListByCatID(int categoryId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.products.Where(x => x.categoryID == categoryId).Include(x => x.category).ToList();

            }
        }
        public List<product> GetDiscountProductsList()
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.products.Where(x => x.discount!=null).Where( y=>y.discount!=0).Include(x => x.category).ToList();

            }
        }
        public List<supplier> AllSupplierList()
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.suppliers.ToList();
            }
        }
        // get by id
        public supplier GetSupplier(int supplierID)
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.suppliers.Find(supplierID);
            }
        }
        public List<purchasedProduct> AllPurchaseList()
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.purchasedProducts.Include(x=>x.purchase).Include(x=>x.product).ToList();
            }
        }
        public List<product> GetProductsListForShop(string search,int? minPrice, int? maxPrice, int? categoryID, int? sortBy)
        {
            using (var context = new boxofvegsDBEntities())
            {
                var products = context.products.Include(x => x.category).ToList();

                if (categoryID.HasValue)
                {
                    products = products.Where(x => x.category.categoryID == categoryID.Value).ToList();
                }

                if (!string.IsNullOrEmpty(search))
                {
                    products = products.Where(x => x.productName.ToLower().Contains(search.ToLower())).ToList();

                }

                if (minPrice.HasValue)
                {
                    products = products.Where(x => x.sellPrice >= minPrice.Value).ToList();
                }

                if (maxPrice.HasValue)
                {
                    products = products.Where(x => x.sellPrice <= maxPrice.Value).ToList();
                }

                if (sortBy.HasValue)
                {

                    if (sortBy.Value == 1)
                    {
                        products = products.OrderByDescending(x => x.productID).ToList();
                    }
                    else if (sortBy.Value == 2)
                    {
                        products = products.OrderBy(x => x.productName).ToList();
                    }
                    else if (sortBy.Value == 3)
                    {
                        products = products.OrderByDescending(x => x.productName).ToList();
                    }
                    else if (sortBy.Value == 4)
                    {
                        products = products.OrderBy(x => x.sellPrice).ToList();
                    }
                    else
                    {
                        products = products.OrderByDescending(x => x.sellPrice).ToList();

                    }
                }

                return products.ToList();
            }
        }
        public int GetMaxPrice()
        {
            using (var context = new boxofvegsDBEntities())
            {
                return (int)(context.products.Max(x => x.sellPrice));
            }
        }
        public List<userReview> GetProductReview(int productId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                var review = context.userReviews.Where(x => x.productID == productId).Include(x=>x.userDetail).ToList();
                return review;
            }

        }
        public Nullable<double> GetAverageRating(int? productId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                if (context.userReviews.Any(u => u.productID == productId))
                {
                    return context.userReviews.Where(x => x.productID == productId).Average(x => x.rating);

                }
                else
                {
                    return 0;
                }

            }
        }
        public int GetCountUserReview(int productId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.userReviews.Where(x => x.productID == productId).Count();
            }
        }
        public int GetUserDetailId(string userId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.userDetails.Where(x => x.userID == userId).Select(x=>x.userDetailID).Single();
            }
        }
        public invoice GetInvoiceDetail(int userId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.invoices.OrderByDescending(d => d.date).Where(u => u.userDetailID == userId).FirstOrDefault();
            }
        }
        public userDetail GetUserDetails(int userId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.userDetails.Where(x => x.userDetailID == userId).FirstOrDefault();
            }
        }
        public List<order> GetOrders(int invoiceId)
        {
            using (var context = new boxofvegsDBEntities())
            {

                return context.orders.Where(i => i.invoiceID == invoiceId).Include(x=>x.product).ToList();
            }
        }
        public userDetail GetUserDetail(string userId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                return context.userDetails.Where(x => x.userID == userId).FirstOrDefault();
            }
        }
        public List<OrdersVeiwModel> GetOrdersList(int userId)
        {
            using (var context = new boxofvegsDBEntities())
            {
                var orderRecords = context.orders.Join(context.invoices, o => o.invoiceID, i => i.invoiceID, (o, i) => new { o, i })
                                    .Where(u => u.i.userDetailID == userId).OrderByDescending(o => o.o.orderID)
                                    .Select(u => new OrdersVeiwModel
                                    {
                                        OrderID = u.o.orderID,
                                        ProductName = u.o.product.productName,
                                        Quantity = u.o.quantity,
                                        image = u.o.product.imageUrl,
                                        UnitPrice = u.o.soldUnitPrice,
                                        InvoiceDate = u.i.date,
                                        invoiceID = u.i.invoiceID,
                                        Subtotal = u.o.soldUnitPrice * u.o.quantity,
                                        discount=u.o.soldUnitDiscount.Value
                                    });

                return orderRecords.ToList();
            }
        }
    }
}