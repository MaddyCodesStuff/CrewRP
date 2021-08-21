var quicktimebar = document.getElementById('quicktimebar');
var quicktimeprog = document.getElementById('quicktimeprog');
var complete = true;


window.addEventListener('message', (event) =>{
    if (event.data.action == 'showbar') {
        quicktimebar.style.display = "block";
        quicktimeprog.style.display = "block";
        startBar(event.data.difficulty);
    }
});


function startBar(diff) {
    complete = false;
    var prog = 0;
    var test = 0;
    var frame = setInterval(drawBar, diff,diff);
    function drawBar(){
        if(!complete){
            prog++;
            test = test + diff;
            console.log(test);
            quicktimeprog.style.width  = prog + "%";
            if (prog == 100){
                clearInterval(frame)
                quicktimeprog.style.width = '0%';
                complete = true;
                quicktimebar.style.display = "none";
                quicktimeprog.style.display = "none";
            }
    
        }
    }
}
