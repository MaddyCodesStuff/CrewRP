var quicktimebar = document.getElementById('quicktimebar');
var quicktimeprog = document.getElementById('quicktimeprog');
var quicktimegoal = document.getElementById('quicktimegoal');
var active = false;
var keyHit = '';
var objKey = '';
const keyOptions = ['q','w','e','r','t','y'];
var minSuccess = 0;
var maxSuccess = 100;

window.addEventListener('message', (event) =>{
    if (event.data.action == 'showbar') {
        keyHit = '';
        minSuccess = event.min;
        maxSuccess = event.max;
        startBar(event.data.difficulty);
    }
});

window.addEventListener('keydown', (event) =>{
    if(active){

        keyHit = event.key;

    }
});

function startBar(diff) {
    eventSetup();
    var prog = 0;
    var frame = setInterval(drawBar, diff,diff);
    function drawBar(){
        if(active){
            console.log(keyHit === objKey && prog <= maxSuccess)
            if(keyHit === objKey && prog < maxSuccess && prog > minSuccess){
                clearInterval(frame)
                active = false;
                $.post('https://tcrp-qte/finish',  JSON.stringify({
                        'success':true,
                    }), 200);
                setTimeout(cleanBar, 2000)
            }else{
                prog++;
                quicktimeprog.style.width  = prog + "%";
                if (prog == 100){
                    clearInterval(frame)
                    active = false;
                    cleanBar();
                    $.post('https://tcrp-qte/finish',  JSON.stringify({
                        'success':false,
                    }), 200);
                }

            }
                
        }
    }
}

function eventSetup(){

    objKey = keyOptions[Math.floor(Math.random() * keyOptions.length)];
    keyHit = '';
    active = true;
    quicktimegoal.innerHTML = objKey;
    quicktimegoal.style.left = minSuccess;
    quicktimebar.style.display = "block";
    quicktimeprog.style.display = "block";
    quicktimegoal.style.display = "block";
}
function cleanBar(){
    quicktimeprog.style.width = '0%';
    quicktimebar.style.display = "none";
    quicktimeprog.style.display = "none";
    quicktimegoal.style.display = "none";

}