!function(a){a.fn.rating=function(){function b(b,c){var d=a(b).find("[data-value="+c+"]");d.removeClass("glyphicon-star-empty").addClass("glyphicon-star"),d.prevAll("[data-value]").removeClass("glyphicon-star-empty").addClass("glyphicon-star"),d.nextAll("[data-value]").removeClass("glyphicon-star").addClass("glyphicon-star-empty")}function c(b){var c=a(b);c.find("[data-value]").removeClass("glyphicon-star").addClass("glyphicon-star-empty"),c.find(".rating-clear").hide(),c.find("input").val("").trigger("change")}var d;for(d=this.length-1;d>=0;d--){var e,f,g=a(this[d]),h=g.data("max")||5,i=g.data("min")||0,j=g.data("clearable")||null,k="";for(f=i;h>=f;f++)k+=['<span class="glyphicon glyphicon-star-empty" data-value="',f,'"></span>'].join("");j&&(k+=[' <a class="rating-clear" style="display:none;" href="javascript:void">','<span class="glyphicon glyphicon-remove"></span> ',j,"</a>"].join("")),e=['<div class="rating-input">',k,'<input type="hidden" name="',g.attr("name"),'" value="',g.val(),'" id="',g.attr("id"),'" />',"</div>"].join(""),g.replaceWith(e)}a(".rating-input").on("mouseenter","[data-value]",function(){var c=a(this);b(c.closest(".rating-input"),c.data("value"))}).on("mouseleave","[data-value]",function(){var d=a(this),e=d.siblings("input").val();e?b(d.closest(".rating-input"),e):c(d.closest(".rating-input"))}).on("click","[data-value]",function(b){var c=a(this),d=c.data("value");c.siblings("input").val(d).trigger("change"),c.siblings(".rating-clear").show(),b.preventDefault()}).on("click",".rating-clear",function(b){c(a(this).closest(".rating-input")),b.preventDefault()}).each(function(){var c=a(this).find("input").val();c&&(b(this,c),a(this).find(".rating-clear").show())})},a(function(){a("input.rating[type=number]").length>0&&a("input.rating[type=number]").rating()})}(jQuery);