window.onload = function (e) {
    window.addEventListener('message', function (event) {
        let data = event.data;

        if (data.action == 'showui') {
            $('#container').fadeIn();
        } else if (data.action == 'hideui') {
            $('#container').fadeOut();
        } else if (data.action == 'update') {
            for (const job in data.counts) {
                if (data.counts[job] !== null && data.counts[job] !== 0) {
                    $('#' + job + ' .count').html(data.counts[job])
                    $('#' + job).show()
                } else {
                    $('#' + job).hide()
                }
            }

            data.counts = null;
        }
    });
};