using App.Data.Repository.Interfaces;
using App.Entities.Base;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Data.Repository
{
   public class VentaRepository:GenericRepository<Venta>, IVentaRepository
    {
        public VentaRepository(DbContext context):base(context)
        {

        }
    }
}
