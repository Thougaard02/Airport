using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Airport;

namespace Airport.DAL
{
    public class AirportManager
    {
        public void CreateAirport(string iATA, string airportName, string airportAddress)
        {
            using (AirportEntities con = new AirportEntities())
            {
                con.SP_InsertIntoAirport(iATA, airportName, airportAddress);
            }
        }

        public void CreateCompany(string companyName)
        {
            using (AirportEntities con = new AirportEntities())
            {
                con.SP_InsertIntoCompany(companyName);
            }
        }

        public void CreateRoute(string companyName)
        {
            using (AirportEntities con = new AirportEntities())
            {
                con.SP_CreateRoute(companyName);
            }
        }

        public void CreateRouteAirPort(string iATA, string companyName)
        {
            using (AirportEntities con = new AirportEntities())
            {
                con.SP_CreateAirportRoute(iATA, companyName);
            }
        }

        public List<string> GetAllAirportIATA()
        {
            using (AirportEntities con = new AirportEntities())
            {
               return con.SP_GetAllAirportIATA().ToList();
            }
        }  
    }
}
