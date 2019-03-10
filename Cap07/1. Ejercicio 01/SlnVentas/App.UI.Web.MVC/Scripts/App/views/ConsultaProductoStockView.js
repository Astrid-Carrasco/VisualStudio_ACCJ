(function (app) {
    app.ConsultaProductoStockView =
        {
        Init: function () {
            $(".ConsultaProductosStock .Buscar").on("click", this.Buscar);

                $("#ListaProductos").jsGrid(
                    {
                        width: "100%",
                        height: "400px",
                        paging: true,
                        pageSize: 25,
                        pageIndex: 1,
                        autoload: true,
                        pageLoading: true,
                        fields:
                            [
                                
                                { name: "ProductoID", type: "text", width: 150   },
                                { name: "ProductoCode", type: "text", width: 150 },
                                { name: "Nombre", type: "text", width: 150   },
                                { name: "CategoriaName", type: "text", width: 150, title: "Categoria" },
                                { name: "MarcaName", type: "text", width: 150, title: "Marca" },
                                { name: "StockActual", type: "text", width: 150},
                                { name: "PrecioMayor", type: "number", width: 150, title: "Precio Mayor" },
                                { name: "PrecioMenor", type: "number", width: 150, title: "Precio Menor" },
                               
                            ],
                        controller:
                            {
                                loadData: function (filter) {
                                 
                                    var d = $.Deferred();//Resultado diferido //promesa de entrega de datos
                                    
                                    $.ajax(
                                        {
                                            url: "/Producto/BuscarProductosStock",
                                            data: filter,
                                            datatype: "json"
                                        }
                                        //Cuando este hecha la llamada
                                    ).done(
                                        function (response) {
                                            var data = {
                                                data: response.Listado,itemsCount: response.TotalRows
                                            }

                                            d.resolve(data);
                                        }
                                    );

                                    //Retorna el resultado diferido
                                    return d.promise();
                                }
                            }
                    }
                );  
        },

        Buscar: function () {
            
            var filtros =
                {
                Nombre: $(".ConsultaProductosStock .Nombre").val(),
                Stock:  $(".ConsultaProductosStock .Stock").val()
            };

            var grid = $("#ListaProductos").jsGrid("search", filtros);
         
        }

        }
})(window.app = window.app || {});