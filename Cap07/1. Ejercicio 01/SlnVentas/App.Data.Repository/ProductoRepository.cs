using App.Data.Repository.Interfaces;
using App.Entities.Base;
using App.Entities.Queries;
using App.Entities.Queries.Filtros;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Data.Repository
{
   public class ProductoRepository:GenericRepository<Producto>, IProductoRepository
    {
        public ProductoRepository(DbContext context):base(context)
        {
            
        }

        public ListaPaginada<ProductoSearch> BuscarProductosStock(ProductoSearchFiltros filtros)
        {
            var result = new ListaPaginada<ProductoSearch>();

            filtros.Nombre = filtros.Nombre ?? "";

            //Para la paginacion es necesario que se indique el ordenamiento con orderby
            var query = from cat in context.Set<Categoria>()
                        join pro in context.Set<Producto>()
                        on cat.CategoriaID equals pro.CategoriaID
                        join mar in context.Set<Marca>()
                        on pro.MarcaID equals mar.MarcaID
                        where pro.Nombre.Contains(filtros.Nombre) && pro.StockActual > filtros.Stock
                        orderby pro.Nombre
                        select new ProductoSearch()
                        {
                            ProductoID = pro.ProductoID,
                            Nombre = pro.Nombre,
                            CategoriaName = cat.Nombre,
                            PrecioMayor = pro.PrecioMayor,
                            PrecioMenor = pro.PrecioMenor,
                            ProductoCode = pro.ProductoCode,
                            StockActual = pro.StockActual,
                            MarcaName = mar.Nombre
                        };

            //Primero: se obtiene la cantidad total de registros
            result.TotalRows = query.Count();

            //Segundo: Finalmente se pagina en el servidores
            //Se toman el primer registro de la pagina seleccionada
            query = query.Skip(filtros.PageSize * (filtros.CurrentPage - 1));
            //Tercero: Se toman los registros restantes segun el tamaño de pagina
            query = query.Take(filtros.PageSize);

            result.Listado = query.ToList();

            return result;
        }
    }
}
