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
    
    public partial class purchase
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public purchase()
        {
            this.purchasedProducts = new HashSet<purchasedProduct>();
        }
    
        public int purchaseID { get; set; }
        public System.DateTime purchaseDate { get; set; }
        public int supplierID { get; set; }
        public string userID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<purchasedProduct> purchasedProducts { get; set; }
        public virtual supplier supplier { get; set; }
    }
}
