using Microsoft.AspNetCore.Mvc;
using MvcCartCacheRedis.Models;
using MvcCartCacheRedis.Repositories;
using MvcCartCacheRedis.Services;
using System.Diagnostics;

namespace MvcCartCacheRedis.Controllers
{
    public class HomeController : Controller
    {
        private RepositoryCart repo;
        private ServiceCart service;

        public HomeController(RepositoryCart repo, ServiceCart service)
        {
            this.repo = repo;
            this.service = service;
        }

        public async Task<IActionResult> Index()
        {
            ViewData["SERVICECART"] = service;
            List<Libro> libros = await this.repo.GetLibrosAsync();
            return View(libros);
        }

        public async Task<IActionResult> AddCart(int? idlibro)
        {
            if (idlibro != null)
            {
                string cacheKey = $"cart_{User.Identity.Name}";
                List<int> cart = await this.service.GetCartAsync(cacheKey);

                if (cart == null)
                {
                    cart = new List<int>();
                }

                cart.Add(idlibro.Value);

                await this.service.SetCartAsync(cacheKey, cart);
            }

            string previousUrl = Request.Headers["Referer"].ToString();
            return Redirect(previousUrl);
        }

        public async Task<IActionResult> Cart(int? idlibro)
        {
            string cacheKey = $"cart_{User.Identity.Name}";
            List<int> cart = await this.service.GetCartAsync(cacheKey);

            if (cart == null)
            {
                ViewData["MESSAGE"] = "Actualmente no tienes ningún producto en el carrito";
                return View();
            }
            else
            {
                if (idlibro != null)
                {
                    cart.Remove(idlibro.Value);

                    if (cart.Count == 0)
                    {
                        await this.service.RemoveCartAsync(cacheKey);
                        ViewData["MESSAGE"] = "Actualmente no tienes ningún producto en el carrito";
                    }
                    else
                    {
                        await this.service.SetCartAsync(cacheKey, cart);
                    }
                }

                List<Libro> libros = await this.repo.GetLibrosCartAsync(cart);
                return View(libros);
            }
        }

        public async Task<IActionResult> Checkout()
        {
            string cacheKey = $"cart_{User.Identity.Name}";
            await this.service.RemoveCartAsync(cacheKey);
            return RedirectToAction("Success");
        }

        public async Task<IActionResult> Success()
        {
            return View();
        }
    }
}