/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {
    function wait() {
        setTimeout(function() {
            $.getJSON('/results/status', function(data) {
                if(data.ready) {
                    location.assign("/results/"+data.result);
                } else {
                    wait();
                }
            });
        }, 30000);
    }
    wait();
});
