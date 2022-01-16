if (!$) {
    // Need this line because Django also provided jQuery and namespaced as django.jQuery
    $ = django.jQuery;
}

// mirar luego para periodo entre dosis
$(document).ready(function() {
    $("select[name='vacuna']").change(function() {
        console.log("Estado activo", $("input[name='estado']"))
        $("input[name='estado']").prop( "checked", true );
        /*$("label:contains('obtenerperiodo')").append('30');*/
        $(".field-obtenerperiodo").find("label:contains('obtenerperiodo')").text("30");
    });
});