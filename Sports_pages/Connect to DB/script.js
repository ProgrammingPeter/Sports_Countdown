$('.team').on('click', function(e){
	e.preventDefault();
	$('#myTable tr').remove();
	$.ajax({
        type: "GET",
        url: "//localhost:8888/nbaschedule/dbconnection.php?team=" + e.currentTarget.id,
        data: {
        	format: 'json'
        },
        dataType: 'json',
        success: function(data){
            $.each(data, function() {
             $('#myTable > tbody').append(
              '<tr><td>'
              + this.HomeTeam
              + '</td><td>'
              + this.AwayTeam +
              + '</td></tr>'
              );
         });
        }
    }).fail(function() {
       $('#results').html('<p>An error has occurred</p>');
   });
});