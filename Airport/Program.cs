using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Airport;
using Airport.Business_Logic;
using Airport.DAL;

namespace Airport
{
    class Program
    {
        static void Main(string[] args)
        {
            AirportManager airportMananger = new AirportManager();
            AirPortController airPortController = new AirPortController(airportMananger);

            string IATA = "CPH";
            string airport_name = "Copenhagen";
            string airport_address = "Humlebivej";
            string company_name = "SAS";

            airPortController.CreateAirport(IATA, airport_name, airport_address);
            Console.WriteLine("Airport has been created\n");

            airPortController.CreateCompany(company_name);
            Console.WriteLine("Company has been created\n");

            airPortController.CreateRoute(company_name);
            Console.WriteLine("Route has been created\n");

            airPortController.CreateRouteAirPort(IATA, company_name);
            Console.WriteLine("Route for airport has been created\n");

            Console.WriteLine("Prints IATA");
            foreach (string iATA in airPortController.GetAllAirportIATA())
            {
                Console.WriteLine(iATA);
            }
            Console.Read();
        }
    }
}
