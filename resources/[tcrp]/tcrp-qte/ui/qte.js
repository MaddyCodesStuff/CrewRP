var quicktimebar = document.getElementById('quicktimebar.quicktimebar')

window.addEventListener('message', (event) =>{
    if (event.data.type === 'showbar') {
        quicktimebar.style.display = "block";
    }
    if (event.data.type === 'hidebar'){
        quicktimebar.style.display = "none";
    }
});
