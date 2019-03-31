using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using App.Domain.Interfaces;
using App.Entities.Base;

namespace App.Services.WebApi.Controllers.Mantenimientos
{
    public class CategoriaController : ApiController
    {
        private readonly ICategoriaService categoriaService; 
        public CategoriaController(ICategoriaService pCategoriaService)
        {
            this.categoriaService = pCategoriaService;
        }

        public IEnumerable<Categoria> Get()
        {
            return this.Get("");
        }

      public IEnumerable<Categoria> Get(string nombre)
      {
            nombre = nombre ?? "";
            return this.categoriaService.GetAll(nombre);
      }

        public Categoria Get(int id)
        {            
            return this.categoriaService.GetById(id);
        }


        public bool Post(Categoria model)
        {
            var result = this.categoriaService.Save(model);
            return result;
        }

        public bool Put(Categoria model)
        {
            var result = this.categoriaService.Save(model);
            return result;
        }

        public bool Delete(int id)
        {
            //Implementar delete
            Categoria model = new Categoria();
            model.CategoriaID = id;

            var result = this.categoriaService.Delete(model);
            return result;
        }
    }
}