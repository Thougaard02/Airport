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

            //string IATA = "HEJ";
            //string airport_name = "HEJ";
            //string airport_address = "HEJ";

            //airPortController.CreateAirport(IATA,airport_name, airport_address);
            //Console.WriteLine("hello");
            //string company_name = "Ryanair";

            foreach (string iATA in airPortController.GetAllAirportIATA())
            {
                Console.WriteLine(iATA);
            }
            Console.Read();

        }
    }
}
