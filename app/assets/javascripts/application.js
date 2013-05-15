// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_directory .
//= require highcharts
(function() {
  window.App = {
    completeProjectLine: function(data) {
      var html, watchs;

      html = "";
      watchs = "";
      if (data[3] !== "") {
        watchs = "<abbr>(" + data[3] + " Watchers)</abbr>";
      }
      html += "<div class='info' id ='solr_result'><a href=/promotions/" + data[1] + ">" + data[0] + "</a>" + watchs + "<br />" + data[4] + "</div>";
      
      return html;
    },
    completeProjects: function(el) {
      var hash;

      hash = {
        minChars: 1,
        delay: 50,
        width: 350,
        scroll: false,
        formatItem: function(data, i, total) {
          return App.completeProjectLine(data);
        }
        
      };
      //console.log(hash);
      return $(el).autocomplete("/promotions/search", hash).result(function(e, data, formatted) {
        location.href = "/promotions/" + data[1];
        return false;
      });
    }
  };

  $(document).ready(function() {
  	alert('1');
    return App.completeProjects(".searchbox input.query");
  });

}).call(this);