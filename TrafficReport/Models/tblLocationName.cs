//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TrafficReport.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblLocationName
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblLocationName()
        {
            this.tblRainfalls = new HashSet<tblRainfall>();
            this.tblRoadNames = new HashSet<tblRoadName>();
        }
    
        public int lnID { get; set; }
        public string lnLocationName { get; set; }
        public string lnRegion { get; set; }
        public Nullable<double> lnLat { get; set; }
        public Nullable<double> lnLng { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblRainfall> tblRainfalls { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblRoadName> tblRoadNames { get; set; }
    }
}
