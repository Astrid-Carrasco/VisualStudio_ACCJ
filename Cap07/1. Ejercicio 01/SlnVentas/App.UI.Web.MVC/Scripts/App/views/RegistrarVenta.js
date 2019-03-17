(function (app) {
  
        var me =
            {
            productoSeleccionado = {},
            Init: function () {
                $("#registrarVenta .btn-buscar-producto").on("click", this.MostrarPopupProductos);
            },
            MostrarPopupProductos: function () {     
               
                app.helpers.showModal('BusquedaProductoPopupID', '/Producto/ConsultaProductosStock', me.MostrarProducto);
            },
            MostrarProducto: function () {               
                me.productoSeleccionado = app.helpers.stateModal;

                $("#registrarVenta .nombre-producto").val(me.productoSeleccionado.Nombre);
                $("#registrarVenta .precio-producto").val(me.productoSeleccionado.PrecioMenor);
            }
         };

      app.RegistrarVentaView = me;
    
})(window.app = window.app || {});