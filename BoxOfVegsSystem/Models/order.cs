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
    
    public partial class order
    {
        public int orderID { get; set; }
        public int invoiceID { get; set; }
        public int productID { get; set; }
        public int quantity { get; set; }
        public decimal soldUnitPrice { get; set; }
        public Nullable<int> soldUnitDiscount { get; set; }
    
        public virtual invoice invoice { get; set; }
        public virtual product product { get; set; }
    }
}
