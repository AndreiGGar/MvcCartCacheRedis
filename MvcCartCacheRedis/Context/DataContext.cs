using Microsoft.EntityFrameworkCore;
using MvcCartCacheRedis.Models;
using System.Collections.Generic;

namespace MvcCartCacheRedis.Context
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }
        public DbSet<Libro> Libros { get; set; }
    }
}
