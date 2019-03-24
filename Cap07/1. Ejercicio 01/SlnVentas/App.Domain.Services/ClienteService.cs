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
   public class ClienteService : IClienteService
    {
        public IEnumerable<Cliente> GetAll(string nombresApellidos)
        {
            List<Cliente> results;
           

            using (var unitOfWork = new AppUnitOfWork())
            {
                results =   unitOfWork.ClienteRepository.GetAll(
                    item=> item.NombresApellidos.Contains(nombresApellidos)
                    ).ToList();
            }
            return results;
        }

        public Cliente GetById(int id)
        {
            Cliente results;
            using (var unitOfWork = new AppUnitOfWork())
            {
                results = unitOfWork.ClienteRepository.GetBydId(id);
            }
            return results;
        }

        public bool Save(Cliente entity)
        {
            bool result = false;
            try
            {               
                using (var unitOfWork = new AppUnitOfWork())
                {
                    if (entity.ClienteID == 0)//Cuando es nuevo regiatro
                    {
                        unitOfWork.ClienteRepository.Add(entity);

                    }
                    else
                    {
                        unitOfWork.ClienteRepository.Update(entity);
                
                    }
                    unitOfWork.Complete();
                }
                
                result = true;
            }
            catch (Exception ex)
            {

                result = false;
            }

            return result;
        }

       


    }
}
