var persistentNotifs = {};

window.addEventListener('message', function (event) {
    ShowNotif(event.data);
});

function CreateNotification(data) {
    var $notification = $(document.createElement('div'));
    $notification.addClass('notification').addClass(data.type);
    if (data.type === 'cop') {
        if (data.title === undefined) {
            data.title = '911 Alert';
        }
        data.text = '<div class="left"><div class="coptitle"> ' + data.title + '</div>' + data.text + '</div><div class="right"><i class="fas fa-shield-alt large"></i></div>';
    } else if (data.type === 'ems') {
        if (data.title === undefined) {
            data.title = '911 Alert';
        }
        data.text = '<div class="left"><div class="emstitle"> ' + data.title + '</div>' + data.text + '</div><div class="right"><i class="fas fa-heartbeat large"></i></div>';
    } else if (data.type === 'fire') {
        if (data.title === undefined) {
            data.title = '911 Alert';
        }
        data.text = '<div class="left"><div class="firetitle"> ' + data.title + '</div>' + data.text + '</div><div class="right"><i class="fas fa-fir large"></i></div>';
    } else if (data.type === 'error') {
        if (data.title === undefined) {
            data.title = '&nbsp;';
        }
        data.text = '<div class="left"><div class="title"> ' + data.title + '</div>' + data.text + '</div><div class="right"><i class="fas fa-times large"></i></div>';
    } else if (data.type === 'inform') {
        if (data.title === undefined) {
            data.title = '&nbsp;';
        }
        data.text = '<div class="left"><div class="title"> ' + data.title + '</div>' + data.text + '</div><div class="right"><i class="fas fa-info-circle large"></i></div>';
    } else if (data.type === 'success') {
        if (data.title === undefined) {
            data.title = '&nbsp;';
        }
        data.text = '<div class="left"><div class="title"> ' + data.title + '</div>' + data.text + '</div><div class="right"><i class="fas fa-check-circle large"></i></div>';
    }
    $notification.html(data.text);
    $notification.fadeIn();
    if (data.style !== undefined) {
        Object.keys(data.style).forEach(function (css) {
            $notification.css(css, data.style[css]);
        });
    }

    return $notification;
}

function ShowNotif(data) {
    if (data.persist === undefined) {
        var $notification = CreateNotification(data);
        $('.notif-container').append($notification);
        setTimeout(function () {
            $.when($notification.fadeOut()).done(function () {
                $notification.remove();
            });
        }, data.length != null ? data.length : 2500);
    } else {
        if (data.persist.toUpperCase() == 'START') {
            if (persistentNotifs[data.id] === undefined) {
                var $notification = CreateNotification(data);
                $('.notif-container').append($notification);
                persistentNotifs[data.id] = $notification;
            } else {
                let $notification = $(persistentNotifs[data.id]);
                $notification.addClass('notification').addClass(data.type);
                $notification.html(data.text);

                if (data.style !== undefined) {
                    Object.keys(data.style).forEach(function (css) {
                        $notification.css(css, data.style[css]);
                    });
                }
            }
        } else if (data.persist.toUpperCase() == 'END') {
            let $notification = $(persistentNotifs[data.id]);
            $.when($notification.fadeOut()).done(function () {
                $notification.remove();
                delete persistentNotifs[data.id];
            });
        }
    }
}