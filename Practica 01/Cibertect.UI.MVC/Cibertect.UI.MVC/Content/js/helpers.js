(function (cibertec) {
    cibertec.helpers =
        {            

            BloquearControls: function(){
                $("input,select,button,textarea").attr("disabled", "disabled");
            },

            DesbloquearControls: function () {
                $("input,select,button,textarea").removeAttr("disabled");
            },
            //Serializar y almacenar
            SetObjectLocalStorage: function (valueObject, keyStorage) {
                var json = JSON.stringify(valueObject);
                localStorage.setItem(keyStorage, json);
            },
            //Descerializar y retornar
            GetObjectLocalStorage: function (keyStorage) {
                var json = localStorage.getItem(keyStorage);
                console.log(typeof keyStorage);//object
                console.log(typeof json); //string

                return JSON.parse(json);
            }
        }
})(window.cibertec = window.cibertec || {}); 