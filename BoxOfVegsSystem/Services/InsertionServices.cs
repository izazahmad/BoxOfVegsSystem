using BoxOfVegsSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;

namespace BoxOfVegsSystem.Services
{
    public class InsertionServices
    {
        public void insertCategory(category category)
        {
            using(var context= new boxofvegsDBEntities())
            {
                context.categories.Add(category);
                context.SaveChanges();
            }
        }
        public void insertProduct(product product)
        {
            using (var context = new boxofvegsDBEntities())
            {
                context.products.Add(product);
                context.SaveChanges();
            }
        }
        public void insertSupplier(supplier supplier)
        {
            using (var context = new boxofvegsDBEntities())
            {
                context.suppliers.Add(supplier);
                context.SaveChanges();
            }
        }
        public int insertPurchase(purchase Purchase)
        {
            int purid = 0;
            try
            {
                  using (var context = new boxofvegsDBEntities())
                  {
                      context.purchases.Add(Purchase);
                      context.SaveChanges();
                      purid = Purchase.purchaseID;
                  }
                  
            }
            catch (Exception ex)
            {

                 Console.WriteLine(ex.Message);
            }
            return purid;
        }
        public int insertPurchasedProducts(purchasedProduct Purchase)
        {
            int id = 0;
            try
            {

                using (var context = new boxofvegsDBEntities())
                {
                    context.purchasedProducts.Add(Purchase);
                    context.SaveChanges();
                    id = Purchase.purchasedProductID;
                }

            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
            }
            return id;
        }
        public void insertUserDetails(userDetail user)
        {
            using (var context = new boxofvegsDBEntities())
            {
                context.userDetails.Add(user);
                context.SaveChanges();
            }
        }
        public void AddReview(userReview review)
        {
            using (var context = new boxofvegsDBEntities())
            {
                context.userReviews.Add(review);
                context.SaveChanges();
            }
        }
        public void AddOrder(order order)
        {
            using (var context = new boxofvegsDBEntities())
            {
                context.orders.Add(order);
                context.SaveChanges();
            }
        }
        public void AddInvoice(invoice invoice)
        {
            using (var context = new boxofvegsDBEntities())
            {
                context.invoices.Add(invoice);
                context.SaveChanges();
            }
        }
    }
}