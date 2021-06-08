window.addEventListener('message', function (event) {
    var action = event.data.action;
    var isPolice = event.data.isPolice;
    var curCar;

    function addLocal() {
        if (isPolice == false) {
            $('#carlist').append(`
                <div class="car">
                    <div class="plate">UNKNOWN</div>
                    <div class="model">UNKNOWN</div>
                    <div class="owner">LOCAL</div>
                </div>
            `);
        }
    }

    if (action == "displayComputer") {
        addLocal();
        event.data.vehicles.forEach(function (vehicle, i) {
            $('#carlist').append(`
                <div class="car">
                    <div class="plate">` + vehicle.plate + `</div>
                    <div class="model">` + vehicle.model + `</div>
                    <div class="owner">` + vehicle.previous_owner + `</div>
                </div>
            `);
            addLocal();
        });
        $('#container').fadeIn();
    }

    function hideComputer() {
        $('#container').fadeOut();
        setTimeout(function () {
            $('#carlist').html('');
        }, 1000);
        $.post(`https://${GetParentResourceName()}/hideComputer`, {});
    }

    $('.car').click(function (event){
        if (curCar != null) {
            curCar.attr('id', '');
        }
        $(this).attr('id', 'selected');
        curCar = $(this);
    });

    $('#select').click(function (event){
        if (curCar != null) {
            var plate = $('#selected > .plate').text();
            $.post(`https://${GetParentResourceName()}/spawnCar`, JSON.stringify({
                plate: plate
            }));
            hideComputer();
        }
    });

    $('#exit').click(function (event){
        hideComputer();
    });
});