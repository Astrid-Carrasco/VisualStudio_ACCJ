(function (app) {
    app.helpers =
    {
        replaceAll : function (string, find, replace) {
            var result = string.replace(
                new RegExpr(find, 'g'), replace
            );

            return result;
        },
        getAniosArray: function(anioInicio) {
                var hoy = new Date();
                var anios = [];
                for (i = anioInicio; i <= hoy.getFullYear(); i++) {
                    anios.push(i);
                }

                return anios;
        },
        BloquearControls : function()
        {
            $("input,select,button,textarea").attr("disabled", "disabled");
        },
        DesbloquearControls: function() {
            $("input,select,button,textarea").removeAttr("disabled");
        },
        SetObjectLocalStorage: function (jsObject, keyStorage) {
            var json = JSON.stringify(jsObject);
            localStorage.setItem(keyStorage, json);

        },
        GetObjectLocalStorage: function (keyStorage) {
            var json = localStorage.getItem(keyStorage);
            return JSON.parse(json);
        },
        showModal: function (containerId, url, closeFunction) {
            $("#" + containerId).modal("show");
            //Invocando a la vista utilizando AJAX
            //url -> Categoria/Create
            $.get(url, function (html) {
                $("#" + containerId + " .modal-body").html(html);
                $("#" + containerId).modal("show"); 
                if (closeFunction !== undefined) {
                    //asociarle a nuestro contenedor el evento cuando se ciere
                    $("#" + containerId).on("hidden.bs.modal",  closeFunction );
                }             

            });
        },
        closeModal: function (modalId, state) {
            //$("button[data-dismiss='modal']").click()

            //$("#" + modalId).modal("hide");
            if (state !== undefined)//no tiene valor ni nulo ni vacio
            {        
                debugger;
                this.stateModal = state;
            }
            $("#" + modalId).modal("hide");
        },
        stateModal: {},

        ShowMessageSuccess: function (message) {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": true,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };

            toastr["success"](message);

        }
    }
})(window.app = window.app || {});