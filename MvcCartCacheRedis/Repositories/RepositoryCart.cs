using Microsoft.EntityFrameworkCore;
using MvcCartCacheRedis.Context;
using MvcCartCacheRedis.Models;

namespace MvcCartCacheRedis.Repositories
{
    public class RepositoryCart
    {

        private DataContext context;

        public RepositoryCart(DataContext context)
        {
            this.context = context;
        }

        public async Task<List<Libro>> GetLibrosAsync()
        {
            return await this.context.Libros.ToListAsync();
        }

        public async Task<Libro> GetLibroByIdAsync(int id)
        {
            return await this.context.Libros.FirstOrDefaultAsync(x => x.Id == id);
        }

        public async Task<List<Libro>> GetLibrosCartAsync(List<int> ids)
        {
            var query = from products in this.context.Libros
                        where ids.Contains(products.Id)
                        select products;
            return await query.ToListAsync();
        }
    }
}
