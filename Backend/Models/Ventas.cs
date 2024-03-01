using System;

namespace Carrito.Models
{
    public class Ventas
    {
        public int id { get; set; }
        public DateTime fecha { get; set; }
        public int id_usuario { get; set; }
        public string estado { get; set; }
    }
}