using BoxOfVegsSystem.Models;
using BoxOfVegsSystem.Services;
using BoxOfVegsSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BoxOfVegsSystem.Controllers
{
    [Authorize(Roles = "admin")]
    public class SupplierController : Controller
    {
        InsertionServices insertservice = new InsertionServices();
        RetrievalServices retrieveservice = new RetrievalServices();
        UpdationServices updateservice = new UpdationServices();
        DeletionServices deleteservice = new DeletionServices();
        // GET: Supplier
        public ActionResult Index()
        {
            SupplierListViewModel suplist = new SupplierListViewModel();
            suplist.Suppliers = retrieveservice.AllSupplierList();
            return View(suplist);
        }
        public ActionResult AddOrEditSupplier(int SupplierId)
        {
            supplier sup = new supplier();
            if (SupplierId != 0)
            {
                var supplier = retrieveservice.GetSupplier(SupplierId);
                return View(supplier);
            }
            else
            {
                return View(sup);
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddOrEditSupplier(supplier supplier)
        {
            if (ModelState.IsValid)
            {
                if (supplier.supplierID > 0)
                {

                    updateservice.updateSupplier(supplier);
                }
                else
                {
                    insertservice.insertSupplier(supplier);

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
        public ActionResult Delete(int supplierId)
        {
            deleteservice.DeleteSupplier(supplierId);
            return Json(new { message = "Deleted Successfully" }, JsonRequestBehavior.AllowGet);

        }
    }
}