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
   public class VentaService : IVentaService
    {
        public IEnumerable<Venta> GetAll(string nombre)
        {
            List<Venta> results;
           

            using (var unitOfWork = new AppUnitOfWork())
            {
                results =   unitOfWork.VentaRepository.GetAll().ToList();
            }
            return results;
        }

        public Venta GetById(int id)
        {
            Venta results;
            using (var unitOfWork = new AppUnitOfWork())
            {
                results = unitOfWork.VentaRepository.GetBydId(id);
            }
            return results;
        }

        public bool Save(Venta entity)
        {
            bool result = false;
            try
            {               
                using (var unitOfWork = new AppUnitOfWork())
                {
                    if (entity.VentaID == 0)//Cuando es nuevo regiatro
                    {
                        unitOfWork.VentaRepository.Add(entity);

                    }
                    else
                    {
                        unitOfWork.VentaRepository.Update(entity);
                
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
