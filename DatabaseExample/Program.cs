using System;
using System.Collections.Generic;

namespace DatabaseExample
{
    class Program
    {
        static void Main(string[] args)
        {
            IProvinciaDatabase database = new ProvinciaDatabase();

            //Dar de alta a la provincia de Corrientes con 155000 habitantes
            Provincia nuevaProvincia = new Provincia(null, "Corrientes", 155000);
            Provincia provincia = database.Insert(nuevaProvincia);
            Console.WriteLine("Se creó la provincia " + provincia.ToString());

            nuevaProvincia = new Provincia(null, "Tucumán", 333000);
            provincia = database.Insert(nuevaProvincia);
            Console.WriteLine("Se creó la provincia " + provincia.ToString());

            //Mostrar por pantalla todas las provincias
            Console.WriteLine("\nLISTA DE PROVINCIAS");
            List<Provincia> provincias = database.RetrieveAll();
            foreach (Provincia provinciaActual in provincias)
            {
                Console.WriteLine(provinciaActual.ToString());
            }
        }
    }
}
