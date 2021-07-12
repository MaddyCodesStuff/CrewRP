var quicktimebar = document.getElementById('quicktimebar');
var quicktimeprog = document.getElementById('quicktimeprog');
var complete = true;


window.addEventListener('message', (event) =>{
    if (event.data.action == 'showbar') {
        quicktimebar.style.display = "block";
        quicktimeprog.style.display = "block";
        //startBar();
    }
    if (event.data.action == 'hidebar'){
        quicktimebar.style.display = "none";
        quicktimeprog.style.display = "none";
        complete = true;
        quicktimeprog.style.width  = "0%";

    }
});


function startBar() {
    complete = false;
    var frame = setInterval(drawBar, 100);
    function drawBar(){
        var prog = 0;
        if(!complete){
            prog++;
            quicktimeprog.style.width  = prog + "%";
            if (prog === 100){
                complete = true
            }
    
        }else{
    

    
        }
    }
}
