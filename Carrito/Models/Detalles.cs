namespace Carrito.Models
{
    public class Detalles
    {
        public int id { get; set; }
        public int id_venta { get; set; }
        public int id_producto { get; set; }
        public int cantidad { get; set; }
        public int precio_u { get; set; }
        public string estado { get; set; }

    }
}