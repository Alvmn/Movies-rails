// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() 
{
    var movies_trigger = new Util.Trigger();
    $("body").bind('click', function(event) {
        if($(event.target).attr('id') == "button"){
            event.preventDefault();
            if(movies_trigger.get()){
                movies_trigger.reset();
                showLoading(true);
                $.get('/show', { id: id_text.value}, 
                    function(data){
                    Util.getId("films").innerHTML = data;
                    showLoading(false);
                });
            }
        }
        else if($(event.target).attr('class') == "poster"){
            var id = $(event.target).attr('id');
            if(window.movies[id].year == window.year)
                atert("Correcto!");
        }
    });

});

var showLoading = function(value){
    if(value){
        document.getElementById("loadImg").style.display = "block";
        //document.getElementById("loadBg").style.backgroundColor = "rgba(0,0,0,0.8)";
    }else{
        document.getElementById("loadImg").style.display = "none";
        //document.getElementById("loadBg").style.backgroundColor = "rgba(0,0,0,0.0)";
    }
}


var Util = {
    createNotification: function (img, title, content){

        if (Notification.permission == "granted") {
            var n = new Notification(title, {icon: img, body: content});
            setTimeout(function(){
                n.close();
            },5000);
        }
        else{
            Notification.requestPermission();

            if(Notification.permission == "granted"){
                var n = new Notification(title, {icon: img, body: content});
                setTimeout(function(){
                    n.close();
                },5000);
            }
        }
    },

    setText: function(name, text){
        localStorage.setItem(name, text);
    },

    getText: function(name){
        var a = localStorage.getItem(name);
        if(a == null)
            return "";
        return a;
    },

    getId: function(id){
        return document.getElementById(id);
    },

    Trigger: function(){
        this.state = true;
        this.get = function(){
            var rstate = this.state;
            this.state = false;
            return rstate;
        }
        this.reset = function(){
            this.state = true;
        }
    }
}