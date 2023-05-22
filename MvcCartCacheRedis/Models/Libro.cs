using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MvcCartCacheRedis.Models
{
    [Table("Libros")]
    public class Libro
    {
        [Key]
        [Column("ID")]
        public int Id { get; set; }
        [Column("Titulo")]
        public string Titulo { get; set; }
        [Column("Autor")]
        public string Autor { get; set; }
        [Column("Precio")]
        public decimal Precio { get; set; }
        [Column("Descripcion")]
        public string Descripcion { get; set; }
        [Column("Imagen")]
        public string Imagen { get; set; }
    }
}
