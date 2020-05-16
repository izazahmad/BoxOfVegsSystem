using BoxOfVegsSystem.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace BoxOfVegsSystem.Services
{
    public class UpdationServices
    {
        public int updateCategory(category category)
        {
            int val = 0;
            using(var context = new boxofvegsDBEntities())
            {
                context.Entry(category).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
                val = category.categoryID;
            }
            return val;
        }
        public int updateProduct(product product)
        {
            int val = 0;
            using (var context = new boxofvegsDBEntities())
            {
                context.Entry(product).State = System.Data.Entity.EntityState.Modified;
                context.Configuration.ValidateOnSaveEnabled = false;
                context.SaveChanges();
                val = product.productID;
            }
            return val;
        }
        public void updateSupplier(supplier supplier)
        {
            using (var context = new boxofvegsDBEntities())
            {
                context.Entry(supplier).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }
        public void updateQuantityPrice(int proId, int quantity, decimal? Price=null)
        {
            try
            {
                using (var context = new boxofvegsDBEntities())
                {
                    product pro = context.products.FirstOrDefault(x => x.productID == proId);
                    context.Configuration.ValidateOnSaveEnabled = false;
                    if (Price == null)
                    {
                        pro.quantity = quantity;
                    }
                    else
                    {
                        pro.quantity = quantity;
                        pro.purchasedPrice = Price;
                        
                    }
                    context.SaveChanges();

                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public void UpdateProfile(userDetail user)
        {
            using (var context = new boxofvegsDBEntities())
            {
                context.Configuration.ValidateOnSaveEnabled = false;
                context.Entry(user).State = EntityState.Modified;
                context.SaveChanges();
            }
        }
    }
}