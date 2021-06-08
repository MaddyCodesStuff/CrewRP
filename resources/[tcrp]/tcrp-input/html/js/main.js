$(document).ready(function () {
    window.addEventListener('message', function (event) {
        let item = event.data;

        if (item.action === 'open') {
            const inputBlock = $('.input');
            inputBlock.removeClass('hidden');
            const label  = $('<label>').text(item.label);
            const button = $('<button>').text('Submit');
            let input;
            switch (item.type) {
                case 'password':
                case 'text':
                case 'number':
                    inputBlock.html('');
                    input = $('<input>').attr('type', item.type).attr('maxlength', item.limit);
                    inputBlock.append(label).append(input).append(button);
                    input.keydown((e) => {
                        if (e.which === 13) {
                            submitMessage(input, inputBlock);
                        }
                    });
                    button.click(() => {
                        submitMessage(input, inputBlock);
                    });
                    input.focus();
                    break;
                case 'longtext':
                    inputBlock.html('');
                    input = $('<textarea>').attr('maxlength', item.limit);
                    inputBlock.append(label).append(input).append(button);
                    button.click(() => {
                        submitMessage(input, inputBlock);
                    });
                    input.focus();
                    break;
            }
        }

        function submitMessage(input, inputBlock) {
            inputBlock.addClass('hidden');
            $.post('http://tcrp-input/submit', JSON.stringify({
                                                                  value: input.val()
                                                              }));
        }
    });
});