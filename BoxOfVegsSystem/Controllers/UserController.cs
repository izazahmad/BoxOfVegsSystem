using BoxOfVegsSystem.Models;
using BoxOfVegsSystem.Services;
using BoxOfVegsSystem.ViewModels;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace BoxOfVegsSystem.Controllers
{
    public class UserController : Controller
    {
        InsertionServices insertservice = new InsertionServices();
        RetrievalServices retrieveservice = new RetrievalServices();
        UpdationServices updateservice = new UpdationServices();
        [Authorize]
        public ActionResult UserProfile()
        {
           
            string userId = User.Identity.GetUserId();
            var user = retrieveservice.GetUserDetail(userId);
            if(user == null)
            {
                userDetail usr = new userDetail();
                usr.userID = userId;
                insertservice.insertUserDetails(usr);
                user = retrieveservice.GetUserDetail(userId);
            }
            if(string.IsNullOrEmpty(user.firstName))
            {
                user.firstName = "Set Your Name";
            }
            if (string.IsNullOrEmpty(user.lastName))
            {
                user.lastName = "Set Your Last Name";
            }
            return View(user);
        }
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UserProfile(userDetail user)
        {
            if (ModelState.IsValid)
            {
                user.userID = User.Identity.GetUserId();
                updateservice.UpdateProfile(user);
                return View(user);
            }
            else
            {
                ModelState.AddModelError("", "");
            }
            return View();
        }
        [Authorize]
        public ActionResult YourOrder()
        {
            List<OrdersVeiwModel> order = new List<OrdersVeiwModel>();
            int userId = retrieveservice.GetUserDetailId(User.Identity.GetUserId());
            if (userId == 0)
            {
                userDetail usr = new userDetail();
                usr.userID = User.Identity.GetUserId();
                insertservice.insertUserDetails(usr);
                userId = retrieveservice.GetUserDetailId(User.Identity.GetUserId());
            }
            order = retrieveservice.GetOrdersList(userId);
            return View(order.ToList());
           
        }

    }
}