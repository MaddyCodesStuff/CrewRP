$(document).ready(function () {
    function closeMain() {
        $('#home').css('display', 'none');
    }

    function openMain() {
        $('#home').css('display', 'block');
    }

    function closeAll() {
        $('#hc-container').css('display', 'none');
        $('#deposit').css('display', 'none');
        $('#withdraw').css('display', 'none');
        $('#transfer').css('display', 'none');
        $('#quickcash').css('display', 'none');
        $('.message').html('');
    }

    function openWithdraw() {
        $('#withdraw').css('display', 'block');
        $('#withdraw-form #amount').focus();
    }

    function openDeposit() {
        $('#deposit').css('display', 'block');
        $('#deposit-form #amount').focus();
    }

    function openTransfer() {
        $('#transfer').css('display', 'block');
        $('#transfer-form #amount').focus();
    }

    function openContainer() {
        $('#hc-container').css('display', 'block');
    }

    function closeContainer() {
        $('#hc-container').css('display', 'none');
    }

    // If 'Esc' is pressed, close all the menus
    document.onkeyup == function (data) {
        if (data.which == 27) {
            $.post('http://vrp_banking/close', JSON.stringify({}));
        }
    };

    // // Button click functionality
    $('.btnWithdraw').click(function () {
        $.post('http://esx_banking/withdraw', JSON.stringify({}));
    });
    $('.btnHome').click(function () {
        $.post('http://esx_banking/home', JSON.stringify({}));
    });
    $('.btnDeposit').click(function () {
        $.post('http://esx_banking/deposit', JSON.stringify({}));
    });
    $('.btnTransfer').click(function () {
        $.post('http://esx_banking/transfer', JSON.stringify({}));
    });
    $('.btnQuickcash').click($.throttle(2000, true, function (e) {
        $.post('http://esx_banking/quickwithdraw', JSON.stringify({}));
        $('.btnQuickcash').prop('disabled', true);
        setTimeout(function () {
            $('.btnQuickcash').prop('disabled', false);
        }, 2000);
    }));
    $('.btnClose').click($.throttle(2000, true, function (e) {
        $.post('http://esx_banking/close', JSON.stringify({}));
    }));
    // Handle Form Submits
    $('.btnWithdrawSubmit').click($.throttle(2000, true, function (e) {
        $.post('http://esx_banking/withdrawSubmit', JSON.stringify({
                                                                       amount: $('#withdraw-form #amount').val()
                                                                   }));
        $('#withdraw-form #amount').prop('disabled', true);
        $('#withdraw-form .btnWithdrawSubmit').prop('disabled', true);
        setTimeout(function () {
            $('#withdraw-form #amount').prop('disabled', false);
            $('#withdraw-form .btnWithdrawSubmit').prop('disabled', false);
        }, 2000);

        $('#withdraw-form #amount').val('');
    }));
    $('.btnDepositSubmit').click($.throttle(2000, true, function (e) {
        $.post('http://esx_banking/depositSubmit', JSON.stringify({
                                                                      amount: $('#deposit-form #amount').val()
                                                                  }));
        $('#deposit-form #amount').prop('disabled', true);
        $('#deposit-form .btnDepositSubmit').css('disabled', true);
        setTimeout(function () {
            $('#deposit-form #amount').prop('disabled', false);
            $('#deposit-form .btnDepositSubmit').prop('disabled', false);
        }, 2000);

        $('#deposit-form #amount').val('');
    }));
    $('.btnTransferSubmit').click($.throttle(2000, true, function (e) {
        $.post('http://esx_banking/transferSubmit', JSON.stringify({
                                                                       amount: $('#transfer-form #amount').val(),
                                                                       target: $('#transfer-form #target').val()
                                                                   }));
        $('#transfer-form #amount').prop('disabled', true);
        $('#transfer-form #target').prop('disabled', true);
        $('#transfer-form .btnTransferSubmit').prop('disabled', true);
        setTimeout(function () {
            $('#transfer-form #amount').prop('disabled', false);
            $('#transfer-form #target').prop('disabled', false);
            $('#transfer-form .btnTransferSubmit').prop('disabled', false);
        }, 2000);

        $('#transfer-form #amount').val('');
        $('#transfer-form #target').val('');
    }));

    window.addEventListener('message', function (event) {
        var item = event.data;

        if (item.showmessage == true) {
            $('.message').html(event.data.message);
            setTimeout(function () {
                $('.message').html('');
            }, 2000);
        }
        if (item.updateBalance == true) {
            var bal    = '$'.concat(event.data.balance.toLocaleString(undefined, {maximumFractionDigits: 0}));
            var wallet = '$'.concat(event.data.wallet.toLocaleString(undefined, {maximumFractionDigits: 0}));
            $('.balance').html(bal);
            $('.name').html(event.data.playerName);
            $('.wallet').html(wallet);
        }
        if (item.openBank == true) {
            openContainer();
            openMain();
        }
        if (item.openBank == false) {
            closeContainer();
            closeMain();
            closeAll();
        }
        if (item.openSection == 'withdraw') {
            closeAll();
            closeMain();
            openContainer();
            openWithdraw();
        }
        if (item.openSection == 'home') {
            closeAll();
            openContainer();
            openMain();
        }
        if (item.openSection == 'deposit') {
            closeAll();
            closeMain();
            openContainer();
            openDeposit();
        }
        if (item.openSection == 'transfer') {
            closeAll();
            closeMain();
            openContainer();
            openTransfer();
        }

    });
});