$(function () {
    $('.uitooltip').hide();
    $('td').hover(
    function () {
        $(this).children('.uitooltip').fadeIn('fast');
    },
    function () {
        $(this).children('.uitooltip').fadeOut('fast');
    });
});