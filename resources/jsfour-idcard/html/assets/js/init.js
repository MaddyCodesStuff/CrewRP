$(document).ready(function () {
    // LUA listener
    window.addEventListener('message', function (event) {
        if (event.data.action == 'open') {
            var type        = event.data.type;
            var userData    = event.data.array['user'][0];
            var licenseData = event.data.array['licenses'];
            var suspended   = event.data.array['suspended'];
            var sex         = userData.sex;

            $('img').show();
            $('#name').css('color', '#282828');
            $('#licenses').html('');

            if (sex.toLowerCase() == 'm') {
                $('img').attr('src', 'assets/images/male.png');
                $('#sex').text('male');
            } else {
                $('img').attr('src', 'assets/images/female.png');
                $('#sex').text('female');
            }

            $('#name').text(userData.firstname + ' ' + userData.lastname);
            $('#dob').text(userData.dateofbirth);
            $('#height').text(userData.height);
            $('#signature').text(userData.firstname + ' ' + userData.lastname);

            if (type == 'drive' || type == 'aircraft') {
                if (licenseData != null) {
                    Object.keys(licenseData).forEach(function (key) {
                        var type = licenseData[key].type;

                        if (type == 'drive_bike') {
                            type = 'bike';
                        } else if (type == 'drive_truck') {
                            type = 'truck';
                        } else if (type == 'drive') {
                            type = 'car';
                        }

                        if (type == 'bike' || type == 'truck' || type == 'car' || type == 'aircraft') {
                            $('#licenses').append('<p>' + type + '</p>');
                        }
                    });
                }

                $('#id-card').css('background', 'url(assets/images/license.png)');
            } else if (type == "weapon"){
                $('img').hide();
                $('#name').css('color', '#d9d9d9');
                $('#name').text(userData.firstname + ' ' + userData.lastname);
                $('#dob').text(userData.dateofbirth);
                $('#signature').text(userData.firstname + ' ' + userData.lastname);

                $('#id-card').css('background', 'url(assets/images/firearm.png)');
            } else {
                if (type != null) {
                    $('#licenses').append('<p>' + type + '</p>')
                }
                $('#id-card').css('background', 'url(assets/images/idcard.png)');
            }

            if (suspended == true) {
                $('#suspended').css('background-image', 'url(assets/images/suspended.png)');
            } else {
                $('#suspended').css('background-image', '');
            }

            $('#id-card').show();
        } else if (event.data.action == 'close') {
            $('#name').text('');
            $('#dob').text('');
            $('#height').text('');
            $('#signature').text('');
            $('#sex').text('');
            $('#id-card').hide();
            $('#licenses').html('');
        }
    });
});
