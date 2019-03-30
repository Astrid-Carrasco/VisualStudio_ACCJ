using App.Entities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Domain.Interfaces
{
    public interface IVentaDetalleService
    {
        IEnumerable<VentaDetalle> GetAll(string nombre);

        bool Save(VentaDetalle entity);

        VentaDetalle GetById(int id);
    }
}
