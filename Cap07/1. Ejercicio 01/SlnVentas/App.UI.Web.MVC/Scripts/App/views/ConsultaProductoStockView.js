(function (app) {
    app.ConsultaProductoStockView =
        {
        Init: function () {
            $(".ConsultaProductosStock .Buscar").on("click", this.Buscar);

            jsGrid.locale("es");

                $("#ListaProductos").jsGrid(
                    {
                        width: "100%",
                        height: "400px",
                        paging: true,
                        pageSize: 10,
                        pageIndex: 1,
                        autoload: true,
                        pageLoading: true,
                        fields:
                            [
                                {
                                    itemTemplate: function (_, item) {
                                        return $("<input>").attr("type", "radio")
                                            .attr("name", "productos")
                                            .on("change", function () {
                                                //alert(JSON.stringify(item));
                                                app.helpers.closeModal("BusquedaProductoPopupID", item);
                                            });
                                    }
                                },
                               
                                { name: "Nombre", type: "text", width: 150  , title:"Nombre" },                              
                                { name: "PrecioMenor", type: "number", width: 150, title: "Precio Menor" },
                                { name: "StockActual", type: "text", width: 150, title: "Stock" }


                                //{ name: "PrecioMayor", type: "number", width: 150, title: "Precio Mayor" },
                                //{ name: "PrecioMenor", type: "number", width: 150, title: "Precio Menor" }
                                //{ name: "CategoriaName", type: "text", width: 150, title: "Categoria" },
                                //{ name: "MarcaName", type: "text", width: 150, title: "Marca" },
                                //{ name: "ProductoID", type: "text", width: 150   },
                                //{ name: "ProductoCode", type: "text", width: 150 },
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