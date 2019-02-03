using App.Domain.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using App.Entities.Base;

namespace App.UI.Web.MVC.Controllers.Mantenimientos
{
    public class ProductoController : Controller
    {
        private readonly ProductoService productoServices;

        public ProductoController()
        {
            productoServices = new ProductoService();
        }

        // GET: Producto
        public ActionResult Index(string filterByName)
        {
            filterByName = string.IsNullOrWhiteSpace(filterByName) ? "" : filterByName.Trim();
            ViewBag.filterByName = filterByName;
            var modelo = productoServices.GetAll(filterByName);
            return View(modelo);
        }
    }
}