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
   public class VentaDetalleService : IVentaDetalleService
    {
        public IEnumerable<VentaDetalle> GetAll(string nombre)
        {
            List<VentaDetalle> results;
           

            using (var unitOfWork = new AppUnitOfWork())
            {
                results =   unitOfWork.VentaDetalleRepository.GetAll().ToList();
            }
            return results;
        }

        public VentaDetalle GetById(int id)
        {
            VentaDetalle results;
            using (var unitOfWork = new AppUnitOfWork())
            {
                results = unitOfWork.VentaDetalleRepository.GetBydId(id);
            }
            return results;
        }

        public bool Save(VentaDetalle entity)
        {
            bool result = false;
            try
            {               
                using (var unitOfWork = new AppUnitOfWork())
                {
                    if (entity.VentaID == 0)//Cuando es nuevo regiatro
                    {
                        unitOfWork.VentaDetalleRepository.Add(entity);

                    }
                    else
                    {
                        unitOfWork.VentaDetalleRepository.Update(entity);
                
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
