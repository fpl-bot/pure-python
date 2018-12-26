$(window).on('load', function () {
    var MyTable = $('#demo-foo-addrow2');
    MyTable.footable();
    // Search input


});

$(document).ready(function () {
    var MyTable = $('#demo-foo-addrow2');

    $('#demo-input-search2').on('input', function (e) {
        e.preventDefault();
        MyTable.trigger('footable_filter', {filter: $(this).val()});
    });

    $(".btn-outline-secondary").click(function(e)
    {
        e.preventDefault();
        var parent = $(this).prev();
        MyTable.trigger('footable_filter', {filter: parent.text()});

    });

    $("#showallrows").click(function(e)
    {
        e.preventDefault();
        MyTable.trigger('footable_filter', {filter: null});

    })
});