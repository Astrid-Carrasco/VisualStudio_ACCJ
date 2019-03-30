using App.Entities.Base;
using App.UI.Web.MVC.Controllers.Mantenimientos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using App.Domain.Interfaces;

namespace App.UI.Web.MVC.Controllers.Movimientos
{
    public class VentaController : BaseController
    {
        private readonly IProductoService productoServices;
        private readonly IClienteService clienteServices;
        private readonly IVentaService ventaServices;

        public VentaController(IProductoService pProductoService, IClienteService pClienteService, IVentaService pVentaService)
        {
            productoServices = pProductoService;
            clienteServices = pClienteService;
            ventaServices = pVentaService;
        }
        // GET: Venta
        public ActionResult Index()
        {
            ViewBag.Clientes = clienteServices.GetAll("");
            return View();
        }

        [HttpPost]
        public JsonResult Guardar(Venta model )
        {
            var result = true;
            model.Fecha = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            var result2 = ventaServices.Save(model);
            //Acceder a la capa de negocio y la capa de datos para registrar la venta
            return Json(result);
        }
    }
}