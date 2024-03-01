using Microsoft.EntityFrameworkCore;

namespace Carrito.Models
{
    public class ConexionSQLServer : DbContext
    {
        public ConexionSQLServer(DbContextOptions<ConexionSQLServer> options)
            : base(options)
        {
        }

        public DbSet<Roles> Roles { get; set; }
        public DbSet<Usuarios> Usuarios { get; set; }
        public DbSet<Ventas> Ventas { get; set; }
        public DbSet<Proveedores> Proveedores { get; set; }
        public DbSet<Productos> Productos { get; set; }
        public DbSet<Detalles> Detalles { get; set; }
    }
}