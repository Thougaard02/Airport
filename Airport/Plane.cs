//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Airport
{
    using System;
    using System.Collections.Generic;
    
    public partial class Plane
    {
        public string Serial_Number { get; set; }
        public int Company_CompanyId { get; set; }
        public int Route_RouteId { get; set; }
        public string Airport_IATA { get; set; }
    
        public virtual AirPort AirPort { get; set; }
        public virtual Company Company { get; set; }
        public virtual Route Route { get; set; }
    }
}
