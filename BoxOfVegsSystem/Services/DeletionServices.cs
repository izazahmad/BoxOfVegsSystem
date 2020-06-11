using BoxOfVegsSystem.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Hosting;

namespace BoxOfVegsSystem.Services
{
    public class DeletionServices
    {
        public void DeleteCategoryWithProducts(int Id)
        {
            
            using(var context=new boxofvegsDBEntities())
            {
                var category= context.categories.Where(x=>x.categoryID==Id).Include(x=>x.products).FirstOrDefault();
                //delete products which is belong to category
                //foreach (var item in category.products)
                //{
                //    if(category.products.)
                //}
                //context.products.RemoveRange(category.products);
                
                if(category.imageUrl != null)
                {
                   string path = HostingEnvironment.MapPath("~/Content/images/categories/" + category.imageUrl);
                    
                        System.IO.File.Delete(path);
                   
                }
                //Remove products which belong to category
                //context.products.RemoveRange(category.products);
                //remove category
                context.categories.Remove(category);
                context.SaveChanges();
            }
        }
        public void DeleteProducts(int Id)
        {

            using (var context = new boxofvegsDBEntities())
            {
                var product = context.products.Where(x => x.productID == Id).FirstOrDefault();
                context.Configuration.ProxyCreationEnabled = false;

                if (product.imageUrl != null)
                {
                    string path = HostingEnvironment.MapPath("~/Content/images/products/" + product.imageUrl);

                    System.IO.File.Delete(path);

                }
                //remove 
                context.products.Remove(product);
                context.SaveChanges();
            }
        }
        public void DeleteSupplier(int Id)
        {

            using (var context = new boxofvegsDBEntities())
            {
                var supplier = context.suppliers.Where(x => x.supplierID == Id).FirstOrDefault();
                //remove 
                context.suppliers.Remove(supplier);
                context.SaveChanges();
            }
        }
        public int DeletePurchase(int Id)
        {
            int val;
            using (TransactionScope ts= new TransactionScope())
            {
                using (var context = new boxofvegsDBEntities())
                {
                    var purchased = context.purchasedProducts.Where(x => x.purchasedProductID == Id).FirstOrDefault();
                    var product = context.products.Where(x => x.productID == purchased.productID).FirstOrDefault();
                    var purchase = context.purchases.Where(x => x.purchaseID == purchased.purchaseID).FirstOrDefault();
                    if(product.quantity >= purchased.quantity)
                    {
                        int quantity = Convert.ToInt32(product.quantity - purchased.quantity);
                        context.Configuration.ValidateOnSaveEnabled = false;
                        product.quantity = quantity;
                        context.purchases.Remove(purchase);
                        context.purchasedProducts.Remove(purchased);
                        context.SaveChanges();
                        val=1;
                    }
                    else
                    {
                        val=0;
                    }
                    
                }
                ts.Complete();
            }
            return val;
            
        }

    }
}