using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseExample
{
    public interface IProvinciaDatabase
    {
        public Provincia Insert(Provincia provincia);
        public List<Provincia> RetrieveAll();
    }
}
