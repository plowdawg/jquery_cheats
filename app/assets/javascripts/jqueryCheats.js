$(document).ready(function(){
	//make select boxes ajax-compatible by adding two params data-onchange=true and data-url="/path/to"
	$('select[data-onchange]').live("change",function(){
	   $.ajax({type: "post",
	         url: $(this).attr("data-url"),
	         data: $(this).serialize(),
	         success: function(data){eval(data);},
	         dataType: "script"});
	});
	//make radio buttons onchange compatible
	$('input[type="radio"][data-onchange]').live("change",function()
	{
		var data = $(this).serialize();
		if($(this).attr("data-params"))
		{
			data += $(this).attr("data-params");
		}
		$.ajax({type: "post",
		url: $(this).attr("data-onclick"),
		data: data,
		success: function(data){eval(data);},
		dataType: "script"})
	});
});

///some helpter functions here

//####THIS ONE HELPS PROCESS XML


function BarChart(name)
{
	//this is the BarChart Method
	$.jqplot(name);
}

function getTicks(url)
{
	//this function should get the ticks from the XML
}

function XML2Bars(url)
{
	//this function aims at translating the data into a 2d array for rendering
}
