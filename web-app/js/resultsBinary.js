/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {

   $('#start-over').button();
   $('#start-over').click(function(e) {
       location.assign("/");
   });

});