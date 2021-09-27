var quicktimebar = document.getElementById('quicktimebar');
var quicktimeprog = document.getElementById('quicktimeprog');
var quicktimegoal = document.getElementById('quicktimegoal');
var active = false;
var keyHit = '';
var objKey = '';
const keyOptions = ['q','w','e','r','t'];
var minSuccess = 0;
var maxSuccess = 100;
var callbackFunc = '';
var prog = 0;

window.addEventListener('message', (event) =>{
    if (event.data.action == 'showbar') {
        keyHit = '';
        minSuccess = event.data.min;
        maxSuccess = event.data.max;
        callbackFunc = event.data.func;
        quicktimegoal.style.left = minSuccess + '%';
        quicktimegoal.style.width = event.data.width + '%';
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
    
    var frame = setInterval(drawBar, diff,diff);
    function drawBar(){ 
        if(active){
            if(keyHit !== ''){
                if(keyHit === objKey && prog <= (maxSuccess + 2) && prog >= (minSuccess - 2)){
                    active = false;
                    clearInterval(frame)
                    cleanBar();
                    $.post('https://tcrp-qte/finish',  JSON.stringify({
                            'success':true,
                            'callbackfunc': callbackFunc
                        }), 200);
                    
                }else{
                    active = false;
                    prog++;
                    quicktimeprog.style.width  = prog + "%";
                        clearInterval(frame)
                        cleanBar();
                        $.post('https://tcrp-qte/finish',  JSON.stringify({
                            'success':false,
                            'callbackfunc': callbackFunc
                        }), 200);
                        
                }
            }else{
                
                prog++;
                quicktimeprog.style.width  = prog + "%";
                    if (prog == 99){
                        active = false;
                        clearInterval(frame)
                        
                        cleanBar();
                        $.post('https://tcrp-qte/finish',  JSON.stringify({
                            'success':false,
                            'callbackfunc': callbackFunc
                        }), 200);
                    }
            }
        }
        
    }
}

function eventSetup(){
    prog = 0;
    objKey = keyOptions[Math.floor(Math.random() * keyOptions.length)];
    keyHit = '';
    active = true;
    quicktimegoal.innerHTML = objKey.toUpperCase();
    quicktimegoal.style.left = minSuccess;
    quicktimegoal.style.width = 
    quicktimebar.style.display = "block";
    quicktimeprog.style.display = "block";
    quicktimegoal.style.display = "block";
    quicktimebar.style.borderWidth = '0px';
}
function cleanBar(){
    keyHit = '';
    quicktimeprog.style.width = '0%';
    quicktimebar.style.display = "none";
    quicktimeprog.style.display = "none";
    quicktimegoal.style.display = "none";
    quicktimebar.style.borderWidth = "medium"
}