using App.Data.Repository;
using App.Domain.Interfaces;
using App.Entities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Domain.Services
{
   public class SeguridadService: ISeguridadService
    {
       
        public Usuario VerificarUsuario(string login, string password)
        {
            Usuario result;
            using (var unitOfWork = new AppUnitOfWork())
            {
                result = unitOfWork.UsuarioRepository.GetAll(item => item.Login == login && item.Password == password).SingleOrDefault();
            }
            return result;
        }

        public IEnumerable<Usuario> GetAll(string nombre)
        {
            IEnumerable<Usuario> result;
            using (var unitOfWork = new AppUnitOfWork())
            {
                //result = unitOfWork.UsuarioRepository.GetAll(item => item.Nombres.Contains(nombre) || item.Apellidos.Contains(nombre)).ToList();
                result = unitOfWork.UsuarioRepository.GetAll(item => (item.Nombres.Trim() + " " + item.Apellidos.Trim()).Contains(nombre) || (item.Apellidos.Trim() + " " + item.Nombres.Trim()).Contains(nombre)).ToList();

            }
            return result;
        }

    }
}
