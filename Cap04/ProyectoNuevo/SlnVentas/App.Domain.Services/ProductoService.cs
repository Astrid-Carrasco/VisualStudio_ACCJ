﻿using App.Data.Repository;
using App.Domain.Interfaces;
using App.Entities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Domain.Services
{
   public class ProductoService : IProductoService //impkenebtacion : interfaz
    {
        public IEnumerable<Producto> GetAll(string nombre, int? categoriaID, int? marcaID)
        {
            List<Producto> results;
            //var includes = new List<string>();
            //includes.Add("Categoria");
            //includes.Add("Marca");

            using (var unitOfWork = new AppUnitOfWork())
            {
                results =   unitOfWork.ProductoRepository.GetAll(
                    item=> item.Nombre.Contains(nombre) && (categoriaID == null || item.CategoriaID == categoriaID) && (marcaID == null || item.MarcaID == marcaID), "Categoria,Marca"
                    ).ToList();
            }
            return results;
        }

        

       


    }
}
