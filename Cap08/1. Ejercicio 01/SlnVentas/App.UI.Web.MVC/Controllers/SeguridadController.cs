using App.Domain.Interfaces;
using App.UI.Web.MVC.Common;
using App.UI.Web.MVC.Controllers.Mantenimientos;
using App.UI.Web.MVC.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace App.UI.Web.MVC.Controllers
{
    public class SeguridadController : BaseController
    {
        private readonly ISeguridadService seguridadService;

        public SeguridadController(ISeguridadService pSeguridadService)
        {
            seguridadService = pSeguridadService;
        }

        //Es la unica accion con acceso publico sin seguridad
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        //Sin seguridad
        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            //Verificar a nivel del cliente
            if (!ModelState.IsValid) return View(model);

            //Verificar en la base de datos
            var usuario = seguridadService.VerificarUsuario(model.Login, model.Password);
            if (usuario != null)
            {
                var claims = SecurityHelpers.CreateCleamsUsuario(usuario);
                var identity = new ClaimsIdentity(claims, "ApplicationCookie");//igual al nombre del Startup
                var context = Request.GetOwinContext();
                var authManager = context.Authentication;
                authManager.SignIn(identity);

                return Redirect(model.ReturnUrl??"~/");//Redireccionaria al Home//if lineal aplica cuando es null unicamente
            }
            else
            {
                model.MensajeValidacion = "Usuario no registrado en el sistema.";
                return View(model);
            }
             
        }


        public ActionResult Salir()
        {
            Request.GetOwinContext().Authentication.SignOut();

            return RedirectToAction("Login");
        }



    }
}