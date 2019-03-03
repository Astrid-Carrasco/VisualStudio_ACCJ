using App.Domain.Interfaces;
using App.UI.Web.MVC.Controllers.Mantenimientos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace App.UI.Web.MVC.Areas.AdminSeguridad.Controllers
{
    public class HomeController : BaseController
    {
        private readonly ISeguridadService seguridadService;
        private readonly IProductoService productoService;


        //Se inyecta si esta configurado en DIConfig
        public HomeController(ISeguridadService pSeguridadService, IProductoService pProductoService)
        {
            seguridadService = pSeguridadService;
            productoService = pProductoService;
        }

        

        // GET: AdminSeguridad/Home
        public ActionResult Index()
        {
            //var model = seguridadService.GetAll("");
            //return View(model);
            return View();
        }

        public ActionResult Buscar(string filtroPorNombre)
        {
            filtroPorNombre = (filtroPorNombre != null ? filtroPorNombre : "");
            var model = seguridadService.GetAll(filtroPorNombre);
            return PartialView("_IndexListado", model);
        }
    }
}