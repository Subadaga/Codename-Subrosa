/* -- datapicker calendario --*/
function abrirCalendario(){
    $(document).ready(function(){
    $.fn.datepicker.defaults.language = 'es';
});
}

$(function(){
    $('.datepicker').datepicker({
        startView: 3,
        format: "dd/mm/yyyy",
        startDate: '-130y',
        endDate: '-1d',
        autoclose: true,
        orientation: "bottom auto",
        defaultViewDate: { year: 1910, month: 01, day: 01 }
    });
});


/* -- fin: data-picker calendario --*/

