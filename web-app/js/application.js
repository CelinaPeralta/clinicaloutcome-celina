var opts = {
    lines: 13, // The number of lines to draw
    length: 7, // The length of each line
    width: 4, // The line thickness
    radius: 10, // The radius of the inner circle
    corners: 1, // Corner roundness (0..1)
    rotate: 0, // The rotation offset
    color: '#000', // #rgb or #rrggbb
    speed: 1, // Rounds per second
    trail: 60, // Afterglow percentage
    shadow: false, // Whether to render a shadow
    hwaccel: false, // Whether to use hardware acceleration
    className: 'spinner', // The CSS class to assign to the spinner
    zIndex: 2e9, // The z-index (defaults to 2000000000)
    top: 'auto', // Top position relative to parent in px
    left: 'auto' // Left position relative to parent in px
};

if (typeof jQuery !== 'undefined') {
    (function($) {
        $('#layout-body').ajaxStart(function(e) {
            $(this).spin(opts)
        }).ajaxStop(function(e) {
            $(this).spin(false)
        });
    })(jQuery);
}

$.fn.spin = function(opts) {
    this.each(function() {
        var $this = $(this),
        data = $this.data();

        if (data.spinner) {
            data.spinner.stop();
            delete data.spinner;
        }
        if (opts !== false) {
            data.spinner = new Spinner($.extend({
                color: $this.css('color')
            }, opts)).spin(this);
        }
    });
    return this;
};

$(function() {
    
    $('a.lightbox').lightBox();

    $('#system-list li:gt(1)').hide();
    $('#show-btn').click(function(e) {
        e.preventDefault();
        $('#system-list li:gt(1)').toggle("slow");
        if($(this).text()=="Show More") {
            $(this).text("Show Less");
        } else {
            $(this).text("Show More");
        }
    });

});