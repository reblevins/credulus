// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
if (history && history.pushState) {
  $(function() {
    $("#posts .pagination a, .post_tag_list a, #tag_cloud a").live("click", function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });
    $("#posts_search input").keyup(function() {
      $.get($("#posts_search").attr("action"), $("#posts_search").serialize(), null, "script");
      history.replaceState(null, document.title, $("#posts_search").attr("action") + "?" + $("#posts_search").serialize());
    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
}

$(function() {
  $("#posts .pagination a, .post_tag_list a, #tag_cloud a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#posts_search input").keyup(function() {
    $.get($("#posts_search").attr("action"), $("#posts_search").serialize(), null, "script");
    return false;
  });
});

$(function(){
    $("#search").focus(function() {
        if ($(this).val() == "Search...") {
            $(this).val("");
        }
    });
    $("#search").blur(function() {
        if ($(this).val() == "") {
            $(this).val("Search...");
        }
    });
});