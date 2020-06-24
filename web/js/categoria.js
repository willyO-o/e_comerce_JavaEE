$(function(){
    'use strict';
    
    listarCategoria();
    
    
    function listarCategoria(){
        $.ajax({

            type: "POST",
            data: "accion=listar",
            url: "ControladorCategoria",
            dataType: 'json',
            success: function (data) {
                let re = data;
                console.log(re);

            }
        });
    }
});
