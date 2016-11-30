/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {

    $('#criteriaTree').jstree({

        "json_data" : {
            "ajax" : {
                "url" : "/dataset/treeData",
                "data" : function(n) {
                    return {
                        selection : n.attr ? n.attr("selection") : 0,
                        item : n.attr ? n.attr("item") : 0,
                        organ : n.attr ? n.attr("organ") : 0,
                        disease : n.attr ? n.attr("disease") : 0,
                        outcome : n.attr ? n.attr("outcome") : 0,
                        id : n.attr ? n.attr("id") : 0
                    };
                }
            }
        },

//        "cookies" : {
//            "save_opened": "jstree_open",
//            "save_selected": "jstree_select",
//            "auto_save": true
//        },

        "themes" : {
            "theme" : "classic",
            "dots" : false
        },

        "core" : {
            "animation" : 300,
            "html_titles" : true,
            "strings": { loading : "Loading dataset tree ..." }
        },

        "types" : {
            "type_attr" : "item",
            "use_data" : true,
            "valid_children" : [ "disease", "organ", "outcome", "dataset" ],
            "types": {

                "organ": {

                    "valid_children" : [ "disease", "outcome", "dataset" ],

                    "select_node" : function(node) {
                        var item = node.attr('item');
                        var selection = node.attr('selection');
                        $("tr.outcome td:last span").text("");
                        $("tr.dataset td:last span").text("");
                        $("tr.disease td:last span").text("");
                        $("tr.organ td:last span").hide().text(selection).stop(true, true).slideDown('slow');
                    },
                    "open_node"   : function(node) {

                    },
                    "close_node"  : function(node) {

                    }
                },

                "disease": {

                    "valid_children" : [ "outcome", "dataset" ],

                    "select_node" : function(node) {
                        var item = node.attr('item');
                        var selection = node.attr('selection');
                        var organ = node.attr('organ');
                        $("tr.outcome td:last span").text("");
                        $("tr.dataset td:last span").text("");
                        $("tr.disease td:last span").text(selection);
                        $("tr.organ td:last span").text(organ);
                    },
                    "open_node"   : function(node) {

                    },
                    "close_node"  : function(node) {

                    }
                },

                "outcome": {

                    "valid_children" : [ "dataset" ],

                    "select_node" : function(node) {
                        var item = node.attr('item');
                        var selection = node.attr('selection');
                        var organ = node.attr('organ');
                        var disease = node.attr('disease');
                        $("tr.dataset td:last span").text("");
                        $("tr.outcome td:last span").text(selection);
                        $("tr.organ td:last span").text(organ);
                        $("tr.disease td:last span").text(disease);
                        
                    },
                    "open_node"   : function(node) {

                    },
                    "close_node"  : function(node) {

                    }
                },

                "dataset": {
                    "valid_children": ["none"],

                    "icon" : {
                        "image" : '/images/file.gif'
                    },
                    "select_node" : function(node) {
                        var item = node.attr('item');
                        var selection = node.attr('selection');
                        var organ = node.attr('organ');
                        var disease = node.attr('disease');
                        var outcome = node.attr('outcome');
                        $("tr.dataset td:last span").text(selection);
                        $("tr.organ td:last span").text(organ);
                        $("tr.disease td:last span").text(disease);
                        $("tr.outcome td:last span").text(outcome);
                    },
                    "open_node"   : function(node) {

                    },
                    "close_node"  : function(node) {

                    }
                },

                "default" : {
                    "max_children": -1,
                    "max_depth": -1,
                    "valid_children": ["disease", "organ", "outcome", "dataset"],
                    "use_data": true,
                    "type_attr": "item"
                }
            }
        },

        "ui" : {
            "select_limit" : -1
        },

        "plugins" : [ "themes", "json_data", "cookies", "ui", "types" ]
    })
    .bind("select_node.jstree", function (event, data) {
        // `data.rslt.obj` is the jquery extended node that was clicked
        var selection = data.rslt.obj.attr("selection");
        var item = data.rslt.obj.attr("item");

        $.jstree._focused().open_node(data.rslt.obj);

        if((data.inst._get_parent(data.rslt.obj)).length) {
            data.inst.open_node(data.inst._get_parent(data.rslt.obj), false,true);
        }

        if(item==="dataset") {
            $('#details').hide().load('/dataset/select?name='+selection).slideDown('slow');
            $("#select").button( "option", "disabled", false );
            $("#dataset").val(selection);
        }
    })
    .bind("open_node.jstree", function (event, data) {
        // `data.rslt.obj` is the jquery extended node that was clicked
        var selection = data.rslt.obj.attr("selection");
        var item = data.rslt.obj.attr("item");
        $("tr."+item+" td:last span").text(selection);
        $("#"+item).val(selection);
    });


    $("#next-btn").button();
    $("#select").button({disabled: true});

    $("#reset").button();
    $("#reset").click(function(e) {
        if(confirm("Are you sure you want to reset the form?")) {
            $("table.selection tr td:last-child span").text("");
            $("#dataset-form input").val("");
            $('#criteriaTree').jstree('close_all');
            $('#details').html("");
            $("#select").button( "option", "disabled", true);
        }
    });



});