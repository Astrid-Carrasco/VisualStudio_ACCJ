(function (app) {
  
  var me =
        {
            DetalleVenta: [],
            productoSeleccionado: {},
            Init: function () {
                $("#registrarVenta .btn-buscar-producto").on("click", me.MostrarPopupProductos);
                $("#registrarVenta .btn-agregar-producto").on("click", me.AgregarLista);
                $("#registrarVenta .btn-guardar").on("click", me.Guardar);
            },
            MostrarPopupProductos: function () {     
               
                app.helpers.showModal('BusquedaProductoPopupID', '/Producto/ConsultaProductosStock', me.MostrarProducto);
            },
            MostrarProducto: function () {               
                me.productoSeleccionado = app.helpers.stateModal;

                $("#registrarVenta .nombre-producto").val(me.productoSeleccionado.Nombre);
                $("#registrarVenta .precio-producto").val(me.productoSeleccionado.PrecioMenor);
                },
            AgregarLista: function () {               
                me.productoSeleccionado.Precio = me.productoSeleccionado.PrecioMenor; //colocamos la propiedad Precio porque asi lo llamamos en la entidad VentaDetalle
                me.productoSeleccionado.Cantidad = $("#registrarVenta .cantidad-producto").val();
                me.productoSeleccionado.SubTotal = me.productoSeleccionado.Cantidad * me.productoSeleccionado.PrecioMenor;
                me.DetalleVenta.push(me.productoSeleccionado);

                var templateDetalle = $("#RegistrarVentaDetalle").html();
                Mustache.parse(templateDetalle);
                var htmlDetalle = Mustache.render(templateDetalle,
                    {
                        Detalle: me.DetalleVenta
                    }
                );


                $("#registrarVenta .detalle-venta").html(htmlDetalle);
          },

          Guardar: function () {
              //Haciendo una llamada AJAX para registrar la venta
              //creando propiedades igualitos a la entidad venta
             
              var venta = {
                  ClienteID: $("#registrarVenta #Cliente").val(), //1,//recuperar de combito a implementar
                  VentaDetalle: me.DetalleVenta
              }
              $.post("Venta/Guardar"
                  , { model: venta }
                  , function (response) {
                      if (response) {
                          app.helpers.ShowMessageSuccess("Se registró la venta correctamente");
                      }
                      
                  }
              )
          }
    };

      app.RegistrarVentaView = me;
    
})(window.app = window.app || {});