namespace Carrito.Models
{
    public class Productos
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public int stock { get; set; }
        public int id_proveedor { get; set; }
        public string estado { get; set; }
        public int precio { get; set; }
        public string imagen { get; set; }

    }
}