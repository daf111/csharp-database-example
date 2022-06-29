using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseExample
{
    public class ProvinciaDatabase : IProvinciaDatabase
    {
        private string connectionString = @"Server=MIPC\SQLEXPRESS;Database=NombreBaseDatosTest;User Id=sa;Password=sa";
        private SqlConnection connection;

        public ProvinciaDatabase()
        {
            this.connection = new SqlConnection(this.connectionString);
        }

        public Provincia Insert(Provincia provincia)
        {
            SqlCommand command = new SqlCommand("sp_InsertarProvincia", this.connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = provincia.Nombre();
            command.Parameters.Add("@poblacion", SqlDbType.Int).Value = provincia.Poblacion();
            command.Parameters.Add("@new_id", SqlDbType.Int);
            command.Parameters["@new_id"].Direction = ParameterDirection.Output;

            this.connection.Open();
            command.ExecuteNonQuery();
            int newId = Convert.ToInt32(command.Parameters["@new_id"].Value);
            this.connection.Close();

            Provincia provinciaInsertada = new Provincia(
                newId,
                provincia.Nombre(),
                provincia.Poblacion()
            );
            return provinciaInsertada;
        }

        public List<Provincia> RetrieveAll()
        {
            SqlCommand command = new SqlCommand("SELECT id,nombre,poblacion FROM provincia ORDER BY nombre ASC", this.connection);
            
            this.connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<Provincia> provincias = new List<Provincia>();
            Provincia provincia;
            while(reader.Read())
            {
                provincia = new Provincia(
                    int.Parse(reader["id"].ToString()),
                    reader["nombre"].ToString(),
                    int.Parse(reader["poblacion"].ToString())
                );
                provincias.Add(provincia);
            }
            this.connection.Close();

            return provincias;
        }
    }
}
