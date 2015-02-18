//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

var main = function(){
	
	$("#sport").change(function() {

		var el = $(this) ;

		if(el.val() === "--Sport--"){
			$('#league').empty();
			$('#league').append("<option>--League--</option>")
			//$('#league').show();
		}
		else if(el.val() === "Basketball" ) {
			$('#league').empty();
			$('#league').show();
			$("#league").append("<option>NBA</option>");
			$('#league').append("<option>WNBA</option>");
			$("#league").append("<option>D-League</option>");
			$("#league").append("<option>NCAA</option>");
			$("#league").append("<option>Europe</option>");
			$("#league").append("<option>Spain</option>");
			$("#league").append("<option>China</option>");

		}
		else if(el.val() === "Baseball"){
			$('#league').empty();
			$('#league').show();

			$('#league').append("<option>Carribean</option>");
			$('#league').append("<option>Triple A</option>");
			$('#league').append("<option>MLB</option>");
		}
		else if(el.val() === "Soccer"){
			$('#league').empty();
			$('#league').show();
			$('#league').append("<option>Spain</option>");
			$('#league').append("<option>Italy</option>");
			$('#league').append("<option>Greece</option>");
			$('#league').append("<option>France</option>");
			$('#league').append("<option>New England</option>");
			$('#league').append("<option>MLS</option>");
			$('#league').append("<option>Mexico</option>");
			$('#league').append("<option>Brazil</option>");
		}
		else if(el.val() === "Football"){
			$('#league').empty();
			$('#league').show();
			$('#league').append("<option>NFL</option>");
			$('#league').append("<option>NCAA</option>");
			$('#league').append("<option>IFL</option>");
		}
		else if(el.val() === "Bowling"){
			$('#league').empty();
			$('#league').show();
			$('#league').append("<option>MBA</option>");
			//$('#league').append("<option>--</option>");
			//$('#league').append("<option>--</option>");
		}
		else if(el.val() === "Rugby"){
			$('#league').empty();
			$('#league').show();
			$('#league').append("<option>NRFL</option>");
			//$('#league').append("<option>--</option>");
			//$('#league').append("<option>--</option>");
		}
		else if(el.val() === "Tennis"){
			$('#league').empty();
			$('#league').show();
			$('#league').append("<option>ATP</option>");
			//$('#league').append("<option>--</option>");
			//$('#league').append("<option>--</option>");
		}
		else if(el.val() === "Boxing"){
			$('#league').empty();
			$('#league').show();
			$('#league').append("<option>WBO</option>");
			//$('#league').append("<option>--</option>");
			//$('#league').append("<option>--</option>");
		}
		else if(el.val() === "Golf"){
			$('#league').empty();
			$('#league').show();
			$('#league').append("<option>PGA</option>");
			//$('#league').append("<option>--</option>");
			//$('#league').append("<option>--</option>");
		}

		else if(el.val() === "Soccer" ) {
			$('.basketball').remove();
				//$("#league option:last-child").remove() ;
			}
		});

	$('#shiny').click(function() {

		if($('#sport').val() === "Basketball" && $('#league').val() === "NBA"){

		window.location.href = "nba/index";
	}	
	});

};

$(document).ready(main);