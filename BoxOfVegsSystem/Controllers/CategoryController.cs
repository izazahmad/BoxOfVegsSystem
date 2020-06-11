using BoxOfVegsSystem.Models;
using BoxOfVegsSystem.Services;
using BoxOfVegsSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace BoxOfVegsSystem.Controllers
{
    [Authorize(Roles ="admin")]
    public class CategoryController : Controller
    {
        InsertionServices insertservice = new InsertionServices();
        RetrievalServices retrieveservice = new RetrievalServices();
        UpdationServices updateservice = new UpdationServices();
        DeletionServices deleteservice = new DeletionServices();
        // GET: Category
        public ActionResult Index()
        {
            CategoryListViewModel catlist = new CategoryListViewModel();
            catlist.categories = retrieveservice.AllCategoriesList();
            return View(catlist);
        }
        public ActionResult AddOrEditCategory(int categoryID)
        {
            category cat = new category();
            if (categoryID != 0)
            {
                var category = retrieveservice.GetCategory(categoryID);
                return View(category);
            }
            else
            {
                return View(cat);
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddOrEditCategory(category category, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                string fileName = null;
                if (image != null)
                {
                    string extension = System.IO.Path.GetExtension(image.FileName);
                    string file_name = Guid.NewGuid().ToString();
                    fileName = file_name + extension;
                    string path = System.IO.Path.Combine(Server.MapPath("~/Content/images/categories"), fileName);
                    image.SaveAs(path);
                }
                category.imageUrl = fileName;

                if (category.categoryID > 0)
                {
                    var categoryimage = retrieveservice.GetCategory(category.categoryID);
                    string imageurl = categoryimage.imageUrl;
                    if (!string.IsNullOrEmpty(categoryimage.imageUrl) && string.IsNullOrEmpty(fileName))
                    {
                        category.imageUrl = categoryimage.imageUrl;
                    }
                    int result = updateservice.updateCategory(category);
                    if (result > 0)
                    {
                        if (!string.IsNullOrEmpty(imageurl))
                        {
                            string path = HostingEnvironment.MapPath("~/Content/images/categories/" + imageurl);

                            System.IO.File.Delete(path);

                        }
                    }


                }
                else
                {
                    insertservice.insertCategory(category);

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
        public ActionResult Delete(int categoryId)
        {
            deleteservice.DeleteCategoryWithProducts(categoryId);
            return Json(new { message = "Deleted Successfully" }, JsonRequestBehavior.AllowGet);

        }
    }
}