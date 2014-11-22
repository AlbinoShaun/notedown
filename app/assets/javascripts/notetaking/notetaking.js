(function($) {

	var markupLanguage = "markdown";

	function pasteIntoInput(el, text) {
        el.focus();
        if (typeof el.selectionStart == "number") {
            var val = el.value;
            var selStart = el.selectionStart;
            el.value = val.slice(0, selStart) + text + val.slice(el.selectionEnd);
            el.selectionEnd = el.selectionStart = selStart + text.length;
        } else if (typeof document.selection != "undefined") {
            var textRange = document.selection.createRange();
            textRange.text = text;
            textRange.collapse(false);
            textRange.select();
        }
    }

    function outputHtml($input, $output) {
    	var htmlOut = "";

    	if (markupLanguage === "markdown")
    		htmlOut = marked($input.val(), {
    			highlight: function(code, lang) {
    				return hljs.highlight(lang, code, true).value;
    			}
    		});
    	else
    		htmlOut = textile($input.val());

    	$output.html(htmlOut);
	}

	function ready() {

		var $input = $('#note_content');
		var $output = $('#note_output');
		var $btnMarkdown = $('#rendering_markdown');
		var $btnTextile = $('#rendering_textile');
		
		$btnMarkdown.click(function(e) {
			markupLanguage = "markdown";
			outputHtml($input, $output);
		});

		$btnTextile.click(function(e) {
			markupLanguage = "textile";
			outputHtml($input, $output);
		});

		if ($input != null && $output != null) {
			outputHtml($input, $output);

			$input.bind('input propertychange', function() {
				outputHtml($(this), $output);
				$('.alert').alert('close');
			});

			$input.keydown(function(e) {
				if (e.keyCode === 9) { // tab key
					pasteIntoInput(this, '\t');
					return false;
				}
			});

			$input.keypress(function(e) {
				if (e.keyCode === 9) {
					return false;
				}
			});
		}
	}
	
	$(document).ready(ready);
	$(document).on('page:load', ready);
})(jQuery);