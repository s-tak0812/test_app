$(function () {
    $('.tooltip').hide();
    $('td').hover(
    function () {
        $(this).children('.tooltip').fadeIn('fast');
    },
    function () {
        $(this).children('.tooltip').fadeOut('fast');
    });
});