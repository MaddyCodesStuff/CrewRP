// When the document is ready
$(document).ready(function () {
    var $tabContainer = $('#tab-container');
    var fadeTime = 500;
    var police = 0;

    // Show or hide the page
    function SHOW_HIDE(bool) {
        if (bool) {
            $tabContainer.fadeIn();
            $.post('http://tab/tablet-bus', JSON.stringify({
                showState: true
            })); // tell lua to unfocus
        } else {
            $tabContainer.fadeOut();
            window.blur(); // unfocus the window
            $.post('http://tab/tablet-bus', JSON.stringify({
                showState: false
            })); // tell lua to unfocus
        }
    }

    // Toggle embed
    function toggleEmbed(status) {
        if (status) {
            $('.tab-content').fadeOut(fadeTime);
            setTimeout(function () {
                $('#embed').fadeIn(fadeTime);
            }, fadeTime);
        } else {
            $('#embed').fadeOut(fadeTime);
            setTimeout(function () {
                $('.tab-content').fadeIn();
                $('#embed').html('');
            }, fadeTime);
        }
    }

    SHOW_HIDE(false); // hide the tablet initial

    // Listens for NUI messages from Lua
    window.addEventListener('message', function (event) {
        var item = event.data;

        if (item.tabState) {
            SHOW_HIDE(item.showTab);
        } // lua requested show / hide
        else if (item.police_check) {
            police = item.check;
            if (police > 0) {
                $('#unpaidfines').show();
            } else {
                $('#unpaidfines').hide();
            }
        } // show unpaid fines if player is PD
        else if (item.bills) {
            $('#unpaidfinelist').html('<div id="unpaidfinelisttitle" class="unpaidfineitem">' +
                '<div class="unpaidfineitem_name">Name</div>' + 
                '<div class="unpaidfineitem_amount">Amount</div>' + 
                '<div class="unpaidfineitem_duedate">Due Date</div>' +
                '<div class="unpaidfineitem_paid"></div>' +
            '</div>');
            item.bills.forEach(bill => {
                $('#unpaidfinelist').append(
                    '<div class="unpaidfineitem">' +
                        '<div class="unpaidfineitem_name">'+ bill.name + '</div>' + 
                        '<div class="unpaidfineitem_amount">' + bill.amount + '</div>' + 
                        '<div class="unpaidfineitem_duedate">' + bill.due + '</div>' +
                        '<div class="unpaidfineitem_paid" data-id="' + bill.id + '">Mark as Paid</div>' +
                    '</div>');
            });

            if (police >= 8) {
                $('.unpaidfineitem_paid').show();
            } else {
                $('.unpaidfineitem_paid').hide();
            }

            $('.unpaidfineitem_paid').click(function (){
                $.post('http://tab/mark-bill-paid', JSON.stringify({
                    id: $(this).data('id')
                }));
                $(this).parent('.unpaidfineitem').hide();
            })
        }
    });

    // When clicked the dot
    $('.tab-wrap .dot').click(function () {
        if ($('#embed').html() == '') {
            SHOW_HIDE(); // hide ui
        } else {
            toggleEmbed(false);
        }
    });

    // Handle icon click (embed)
    $('a.nav-embed').click(function (event){
        event.preventDefault();
        event.stopPropagation();
        var self = this;
        var icon = $(self).find('img, .myicon');
        icon.addClass('jump');
        setTimeout(function () {
            $('#embed').load(self.href);
            toggleEmbed(true);
            icon.removeClass('jump');
        }, 600);
    });

    // Tell lua the nui loaded
    $.post('http://tab/tablet-initialized', {})
});