using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseExample
{
    public class ProvinciaFakeDatabase : IProvinciaDatabase
    {
        private List<Provincia> provincias;

        public ProvinciaFakeDatabase()
        {
            this.provincias = new List<Provincia>();
        }

        private int generateNewId()
        {
            if (this.provincias.Count == 0)
            {
                return 1;
            }
            Provincia provincia = this.provincias.Last();
            return Convert.ToInt32(provincia.Id()) + 1; 
        }

        public Provincia Insert(Provincia provincia)
        {
            Provincia provinciaInsertada = new Provincia(
                this.generateNewId(),
                provincia.Nombre(),
                provincia.Poblacion()
            );
            this.provincias.Add(provinciaInsertada);
            return provinciaInsertada;
        }

        public List<Provincia> RetrieveAll()
        {
            return this.provincias;
        }
    }
}
