//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Szkola.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Budynek
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Budynek()
        {
            this.Sala = new HashSet<Sala>();
        }
    
        public int BudynekID { get; set; }
        public string Ulica { get; set; }
        public string Nr_budynku { get; set; }
        public string Kod_pocztowy { get; set; }
        public string Miejscowosc { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sala> Sala { get; set; }
    }
}
