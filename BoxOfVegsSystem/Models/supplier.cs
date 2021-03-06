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
    using System.ComponentModel.DataAnnotations;

    public partial class supplier
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public supplier()
        {
            this.purchases = new HashSet<purchase>();
        }
    
        public int supplierID { get; set; }
        [Required(ErrorMessage = "Company name is required")]
        [MinLength(3), MaxLength(50)]
        public string companyName { get; set; }
        [Required(ErrorMessage = "Contactperson name is required")]
        [MinLength(3), MaxLength(50)]
        public string contactPerson { get; set; }
        [Required(ErrorMessage = " Address is required")]
        public string address { get; set; }
        [Required(ErrorMessage = " city is required")]
        public string city { get; set; }
        [Required(ErrorMessage = " PostCode is required")]
        public string postCode { get; set; }
        [Required(ErrorMessage = " Phone No. is required")]
        public string PhoneNo { get; set; }
        [Required(ErrorMessage = "Email address is reqired")]
        [RegularExpression(@"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$", ErrorMessage = "Enter Valid Email address")]
        public string email { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<purchase> purchases { get; set; }
    }
}
