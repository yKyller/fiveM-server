$(document).ready(function(){
	window.addEventListener("message",function(event){
		if (event.data.hud == true){
			$("#hudDisplay").css("display","block");
			$("#imgserver").css("display","block");
		}

		if (event.data.hud == false){
			$("#hudDisplay").css("display","none");
			$("#imgserver").css("display","none");
		}

		if (event.data.movie == true){
			$("#movieTop").css("display","block");
			$("#movieBottom").css("display","block");
		}

		if (event.data.movie == false){
			$("#movieTop").css("display","none");
			$("#movieBottom").css("display","none");
		}

		$(".infosBack").html(event.data.day +"</b>, <b>"+ event.data.month +"</b>  :  "+ event.data.street);


		if (event.data.health == 1){
			$(".healthDisplay").css("width","0");
			$(".healthText").text("0%");

		} else {
			$(".healthDisplay").css("width",event.data.health +"%");

		}




		$(".staminaDisplay").css("width",100-event.data.stamina +"%");

		$(".clockBack .hudDisplayText").html(event.data.hour +":"+ event.data.minute);

		if (event.data.car == true){
			var mph = event.data.seatbelt == true ? "<div class='cintodeseguranca'><img src='https://cdn.discordapp.com/attachments/670449977407045643/744998319431876627/cinto.png' style='width: 70px'></div>":"<div class='cintodesegurancabotado'><img src='https://cdn.discordapp.com/attachments/670449977407045643/744997966737178694/cinto.png' style='width: 70px'></div>"
			var kmh = "<b>KMH</b>"

			$("#carDisplay").css("display","block");
			$("#carro").css("display","block");
			$(".carroBack").css("display","block");

			$("#carDisplay").html( "<b>F</b>"+ event.data.fuel +"  "+  kmh + event.data.speed+ mph);
			$(".carroDisplay").css("width",event.data.vidadocarro/10 +"%");

		} else {
			$("#carDisplay").css("display","none");
			$("#carro").css("display","none");
			$(".carroBack").css("display","none");

		}

	})
});