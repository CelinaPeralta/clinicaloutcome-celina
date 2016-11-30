/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {

    $("#back-btn").button();
    $("#back-btn").click(function(e) {
        window.history.back();
    });

    $("#next-btn").button({disabled: true});
    $("#next-btn").click(function(e) {
        if($("#file").val()!="") {
            $("#sigFile").submit();
        } else {
            $("#sigText").submit();
        }
    });

    $("#file").change(function(e) {
        if($('#file').val()!="") {
            $("#next-btn").button("option", "disabled", false);
        } else {
            $("#next-btn").button("option", "disabled", true);
        }
    });

    $("#class1, #class2").keyup(function(e) {
        if($('#class1').val() && $('#class2').val()) {
            $("#next-btn").button("option", "disabled", false);
        } else {
            $("#next-btn").button("option", "disabled", true);
        }
    });
    
    $("#class2").focus(function(e) {
        $("#next-btn").button("option", "disabled", false);
    });

    $('#back-btn').removeClass('ui-state-disabled');

});
