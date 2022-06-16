using Airport.DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Airport.Business_Logic
{
    public class AirPortController
    {
        private AirportManager _airportManager;
        public AirPortController(AirportManager airportManager)
        {
            _airportManager = airportManager;
        }

        public void CreateAirport(string iATA, string airportName, string airportAddress)
        {
            _airportManager.CreateAirport(iATA, airportName, airportAddress);
        }

        public void CreateCompany(string companyName)
        {
            _airportManager.CreateCompany(companyName);
        }

        public void CreateRoute(string companyName)
        {
            _airportManager.CreateRoute(companyName);
        }

        public void CreateRouteAirPort(string iATA, string companyName)
        {
            _airportManager.CreateRouteAirPort(iATA, companyName);
        }

        public List<string> GetAllAirportIATA()
        {
            List<string> listOfIATA = new List<string>();
            foreach (string iATA in _airportManager.GetAllAirportIATA())
            {
                listOfIATA.Add(iATA);
            }
            return listOfIATA;
        }
    }
}
