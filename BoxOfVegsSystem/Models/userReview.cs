//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BoxOfVegsSystem.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class userReview
    {
        public int userReviesID { get; set; }
        public string review { get; set; }
        public Nullable<double> rating { get; set; }
        public System.DateTime reviewDate { get; set; }
        public int productID { get; set; }
        public Nullable<int> userDetailID { get; set; }
    
        public virtual userDetail userDetail { get; set; }
        public virtual product product { get; set; }
    }
}