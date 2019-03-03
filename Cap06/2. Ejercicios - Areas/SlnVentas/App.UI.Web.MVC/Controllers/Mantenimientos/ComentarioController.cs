using App.Domain.Interfaces;
using App.Entities.Base;
using App.UI.Web.MVC.Models.ViewModels;
using AutoMapper;
using Microsoft.Security.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace App.UI.Web.MVC.Controllers.Mantenimientos
{
    public class ComentarioController : BaseController
    {
        private readonly IComentarioService comentarioService;

        public ComentarioController(IComentarioService pComentarioService)
        {
            comentarioService = pComentarioService;
        }

        // GET: Comentario
        [AllowAnonymous]
        public ActionResult Index()
        {
            var model = comentarioService.GetAll();
            //Lo convierto a una lista de comentario view model (pero recibo una entidad)
            var viewmodel = Mapper.Map<List<ComentarioViewModel>>(model);
            return View(viewmodel);
        }

        [AllowAnonymous]
        public ActionResult Registrar()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Registrar(ComentarioViewModel model)
        {
            //Lo convierto a un comentario entidad(pero recibo un view model)
            var comentario = Mapper.Map<Comentario>(model);

            comentario.Opinion = Sanitizer.GetSafeHtmlFragment(comentario.Opinion);
            comentarioService.Guardar(comentario);
            return View();
        }
    }
}