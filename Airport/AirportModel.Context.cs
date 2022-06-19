﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class AirportEntities : DbContext
    {
        public AirportEntities()
            : base("name=AirportEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AirPort> AirPorts { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Plane> Planes { get; set; }
        public virtual DbSet<Route> Routes { get; set; }
    
        public virtual int SP_CreateAirportRoute(string iATA, string company_Name)
        {
            var iATAParameter = iATA != null ?
                new ObjectParameter("IATA", iATA) :
                new ObjectParameter("IATA", typeof(string));
    
            var company_NameParameter = company_Name != null ?
                new ObjectParameter("Company_Name", company_Name) :
                new ObjectParameter("Company_Name", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_CreateAirportRoute", iATAParameter, company_NameParameter);
        }
    
        public virtual int SP_CreateRoute(string company_Name)
        {
            var company_NameParameter = company_Name != null ?
                new ObjectParameter("Company_Name", company_Name) :
                new ObjectParameter("Company_Name", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_CreateRoute", company_NameParameter);
        }
    
        public virtual ObjectResult<string> SP_GetAllAirportIATA()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("SP_GetAllAirportIATA");
        }
    
        public virtual int SP_InsertIntoAirport(string iATA, string airport_Name, string airport_Address)
        {
            var iATAParameter = iATA != null ?
                new ObjectParameter("IATA", iATA) :
                new ObjectParameter("IATA", typeof(string));
    
            var airport_NameParameter = airport_Name != null ?
                new ObjectParameter("Airport_Name", airport_Name) :
                new ObjectParameter("Airport_Name", typeof(string));
    
            var airport_AddressParameter = airport_Address != null ?
                new ObjectParameter("Airport_Address", airport_Address) :
                new ObjectParameter("Airport_Address", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_InsertIntoAirport", iATAParameter, airport_NameParameter, airport_AddressParameter);
        }
    
        public virtual int SP_InsertIntoCompany(string company_Name)
        {
            var company_NameParameter = company_Name != null ?
                new ObjectParameter("Company_Name", company_Name) :
                new ObjectParameter("Company_Name", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_InsertIntoCompany", company_NameParameter);
        }
    }
}