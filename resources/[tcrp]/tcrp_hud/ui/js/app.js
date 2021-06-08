window.addEventListener('load',function() {
	$('#health').attr('class','hidden');
	$('#armor').attr('class','hidden')
	$('#stamina').attr('class','hidden');
	$('#hunger').attr('class','hidden');
	$('#thirst').attr('class','hidden');
	$('#voice').attr('class','hidden');
    $('#radio').attr('class','hidden');
	$('#high').attr('class','hidden');
	$('#drunk').attr('class','hidden');
	$('#poison').attr('class','hidden');
});

function removeOld(){
	$( ".done" ).remove();
}

function removeText(){
	$('.messagesdiv').toggleClass('active');
	$('.messagesdiv').addClass('done');
	
}
function removePhone(){
	$('#phonecalls').toggleClass('active');
	$('#phonecalls').addClass('done');
	setTimeout(removeOld, 900);
}
function removeCash(){
	$('#cashwallet').toggleClass('active');
	$('#cashwallet').addClass('done');
	$('#cashbank').toggleClass('active');
	$('#cashbank').addClass('done');
	setTimeout(removeOld, 900);
}
function removeBank(){
	$('#bank').toggleClass('active');
	$('#bank').addClass('done');
	setTimeout(removeOld, 900);
}

function removeGeneral(){
	$('#general').toggleClass('active');
	$('#general').addClass('done');
	setTimeout(removeOld, 900);
}

function waitBank(){
	$('#bank').addClass('active');
}
function waitCash(){
	$('#cashwallet').addClass('active');
	$('#cashbank').addClass('active');
}
function waitPhone(){
	$('#phonecalls').addClass('active');
}
function waitMessage(){
	$('.messagesdiv').addClass('active');
}
function waitGeneral(){
	$('#general').addClass('active');
}

window.addEventListener('message', function(event) {
	switch (event.data.action) {
		case 'update':
            //Health, Armor, & Stamina
			$('#health').removeAttr('class');
			$('#health').attr('class','c100 p' + event.data.value.health + ' small red');
			$('#armor').removeAttr('class');
			$('#armor').attr('class','c100 p' + event.data.value.armor + ' small blue');

			if (event.data.value.armor == 0) {
				$('#armor').fadeOut();
			} else {
				$('#armor').fadeIn();
			}

			$('#stamina').removeAttr('class');
			$('#stamina').attr('class','c100 p' + event.data.value.stamina + ' small blue');

			$('.direction').text(event.data.value.direction);
			if (event.data.value.street2 !== '') {
				$('.streets').text(event.data.value.street1 + ' and ' + event.data.value.street2);
            } else {
                $('.streets').text(event.data.value.street1);
            }
            // Voice
            $('#radio').removeAttr('class');
            $('#voice').attr('class','c100 p' + event.data.value.voice + ' small yellow');

            if (event.data.value.radio > 0) {
                $('#radio').attr('class', 'c100 p' + event.data.value.radioVolume + ' small burnt');
            } else {
                $('#radio').attr('class', 'hidden');
            }

            //Statuses
			$('#hunger').removeAttr('class');
			$('#hunger').attr('class','c100 p' + event.data.value.hunger + ' small orange');
			$('#thirst').removeAttr('class');
			$('#thirst').attr('class','c100 p' + event.data.value.thirst + ' small aqua');
			$('#poison').removeAttr('class');
			$('#high').removeAttr('class');
			$('#drunk').removeAttr('class');
			$('#poison').removeAttr('class');

			if (!event.data.value.high) {
				$('#high').attr('class', 'hidden');
			} else {
				$('#high').attr('class','c100 p' + event.data.value.high + ' small lime');
			}

			if (!event.data.value.drunk) {
				$('#drunk').attr('class', 'hidden');
			} else {
				$('#drunk').attr('class', 'c100 p' + event.data.value.drunk + ' small orange');
			}

			if (!event.data.value.poison) {
				$('#poison').attr('class', 'hidden');
			} else {	
				$('#poison').attr('class','c100 p' + event.data.value.poison + ' small orange');
			}

			if (event.data.value.talking) {
                if (event.data.value.radioTalking) {
                    $('#radio .bar,#radio .fill').css('border-color', 'lime');
					$('#voice .bar,#voice .fill').css('border-color', '');
                } else {
                    $('#voice .bar,#voice .fill').css('border-color', 'lime');
					$('#radio .bar,#radio .fill').css('border-color', '');
                }
			} else {
				$('#voice .bar,#voice .fill').css('border-color', '');
                $('#radio .bar,#radio .fill').css('border-color', '');
			}
			break;
		case 'showui':
            $('body').fadeIn();
            break;
        case 'hideui':
            $('body').fadeOut();
            break;
		case 'mmap':
			if (event.data.value.toggle == false) {
				$('.hud-left').removeClass('active');
				$('.hud2-left').removeClass('active');
				$('#streetview').removeClass('active');
			} else {
				$('.hud-left').addClass('active');
				$('.hud2-left').addClass('active');
				$('#streetview').addClass('active');
			}
			break;
		case 'showcar':
			$('.carview').fadeIn();
			$('.speedprim').text(event.data.primary);
			$('.labelprim').text(event.data.primarylabel);
			break;
		case 'hidecar':
			$('.carview').fadeOut();
			break;
		case 'toggle-cruise':
			if (event.data.value == true) {
				$('#cruise').css('background-color', 'green');
			} else {
				$('#cruise').css('background-color', 'rgba(0,0,0,.65)');
			}
			break;
		case 'toggle-seatbelt': 
			if (event.data.value == true) {
				$('#seatbelt').css('background-color', 'green');
				$('#seatbelt').text("Seatbelt on");
			} else {
				$('#seatbelt').css('background-color', 'rgba(0,0,0,.65)');
				$('#seatbelt').text("Seatbelt off");
			}
			break;
		case 'update-fuel':
			$('.fuel').html(event.data.fuel);
			break;
		case 'notificationmessage':
			var x = Math.floor((Math.random() * 10000) + 1);
			$( ".parent-noti" ).append( "<div class='messagesdiv' id='" + x + "'><i class='fas fa-comment-dots' style='font-size:1em;color:orange'>  </i>  <span class='message'>New message from: </span><span class='sender' id='" + x + "'></span> </div>" );
			setTimeout(function(){
				$("#" + x + "").addClass('active');
				$("#" + x + ".sender").html(event.data.sender);
				setTimeout(function(){
					$("#" + x + "").toggleClass('active');
					$("#" + x + "").addClass('done');
					setTimeout(function(){
						$("#" + x + "").remove();
					},900);
				},5000);
				
			},200);
			break;
		case 'notificationphone':
			$( ".parent-noti" ).append("<div id='phonecalls'><i class='fa fa-phone' style='font-size:1em;color:orange'>  </i>  <span class='callmessage'>Incoming phone call from: </span><span class='caller' id='" + x + "'></span></div>");
			setTimeout(waitPhone, 200);
			$('.caller').html(event.data.sender);
			setTimeout(removePhone, 5000);
			break;
		case 'notificationbank':
			$( ".parent-noti" ).append("<div id='bank'><i class='fa fa-bank' style='font-size:1em;color:red'>  </i>  <span class='bank'>You received your salary: </span><span class='cash'></span></div>");
			setTimeout(waitBank, 200);
			$('.cash').html("$" + event.data.cash);
			setTimeout(removeBank, 5000);
			break;
		case 'notificationgeneral':
			var x = Math.floor((Math.random() * 10000) + 1);
			$( ".parent-noti" ).append( "<div class='generaldiv' id='" + x + "'><i class='fa fa-info-circle' style='font-size:1.2em;color:cyan'>  </i>  <span class='general' id='" + x + "'>This is a general message</span></div>");
			setTimeout(function(){
				$("#" + x + ".generaldiv").addClass('active');
				$("#" + x + ".general").html(event.data.message);
				setTimeout(function(){
					$("#" + x + "").toggleClass('active');
					$("#" + x + "").addClass('done');
					setTimeout(function(){
						$("#" + x + "").remove();
					},900);
				},5000);
				
			},200);
			break;
		case 'notificationcash':
			$( ".parent-noti" ).append("<div class='generaldiv' id='cashwallet'><i class='fas fa-hand-holding-usd' style='font-size:1em;color:green'>  </i>  <span>Wallet: </span><span class='cash' style='color:green'></span></div>");
			$( ".parent-noti" ).append("<div class='generaldiv' id='cashbank'><i class='fas fa-piggy-bank' style='font-size:1em;color:red'>  </i>  <span class='bank'>Bank: </span><span class='cash'></span></div>");
			setTimeout(waitCash, 200);
			$('#cashwallet > .cash').html(event.data.cash);
			$('#cashbank > .cash').html(event.data.bank);
			setTimeout(removeCash, 10000);
			break;
		// End switch
	}
});