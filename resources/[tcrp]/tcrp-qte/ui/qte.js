var quicktimebar = document.getElementById('quicktimebar');
var quicktimeprog = document.getElementById('quicktimeprog');
var quicktimegoal = document.getElementById('quicktimegoal');
var complete = true;


window.addEventListener('message', (event) =>{
    if (event.data.action == 'showbar') {
        quicktimebar.style.display = "block";
        quicktimeprog.style.display = "block";
        quicktimegoal.style.display = "block";
        startBar(event.data.difficulty);
    }
});


function startBar(diff) {
    complete = false;
    var prog = 0;
    var frame = setInterval(drawBar, diff,diff);
    function drawBar(){
        if(!complete){
            prog++;
            quicktimeprog.style.width  = prog + "%";
            if (prog == 100){
                clearInterval(frame)
                quicktimeprog.style.width = '0%';
                complete = true;
                quicktimebar.style.display = "none";
                quicktimeprog.style.display = "none";
                quicktimegoal.style.display = "none";
                $.post('https://tcrp-qte/finish',  JSON.stringify({
                    'success':true,
                }), 200);
            }
    
        }
    }
}
