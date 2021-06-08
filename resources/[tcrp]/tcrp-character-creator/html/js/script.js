$(document).ready(function () {
    const buttonShowDelay = 5000;

    function openSelector() {
        $('.character-selection').removeClass('hidden');
        $('.character-selection .characters').html('');
        $('.character-selection').show();
        $('.exit-button').show();
    }

    function closeSelector() {
        $('.character-selection').hide();
    }

    function openCreator() {
        $('.character-creation').removeClass('hidden');
        $('.exit-button').show();
    }

    function closeCreator() {
        $('.character-creation').hide();
    }

    function closeAll() {
        $('.character-selection').hide();
        $('.character-creation').hide();
        $('.exit-button').hide();
    }

    const bodyElement = $('body');
    const logoUrl     = bodyElement.css('backgroundImage');
    let logoActivated = true;

    function toggleLogo() {
        if (logoActivated) {
            bodyElement.css('backgroundImage', 'none');
        } else {
            bodyElement.css('backgroundImage', logoUrl);
        }
        logoActivated = !logoActivated;
    }

    function loadCharacters(characters) {
        const characterElement = $('.character-selection .characters');
        characterElement.html('');
        // if (Characters) {
        //     $.each(Characters, function (index, char) {
        //         characterElement.append(`<div id="character-${char.cid}" class="character-wrapper"><div
        // class="character"><h2>${char.firstname} ${char.lastname}</h2><span class="gender">${char.gender === 'm' ?
        // 'Male' : 'Female'}</span><span class="dob">${char.dob}</span></div></div>`); }); }

        characters.sort((a, b) => {
            return parseInt(a.identifier.split(':')[0].substr(4)) - parseInt(b.identifier.split(':')[0].substr(4));
        });

        let highestCharId = 1;
        for (let i = 0; i < characters.length; i++) {
            const character = characters[i];
            const charId    = parseInt(character.identifier.split(':')[0].substr(4));
            if (charId > highestCharId) {
                highestCharId = charId;
            }
            characterElement.append(`<div id="character-${charId}" data-skin="${encodeURIComponent(
                character.skin)}" data-ped="${encodeURIComponent(
                character.ped)}" class="character-wrapper"><div class="character"><h2>${character.firstname} ${character.lastname}</h2><span class="gender">${character.sex ==
                                                                                                                                                              'm' ?
                'Male' : 'Female'}<br>${character.job[0].toUpperCase() + character.job.substr(1)
                                                                                  .toLowerCase()}</span><span class="dob">${character.dateofbirth}</span><span class="job"></span></div></div>`);
        }
        characterElement.prepend(`<div id="character-${highestCharId +
                                                       1}" class="character-create-wrapper"><div class="create"><h2>+ Create New Character</h2></div></div>`);

        //characterElement.append(`<div id="character-${i}" class="character-create-wrapper"><div class="create"><h2>+
        // Create New Character</h2></div></div>`); if (Characters !== null) { $.each(Characters, function (index,char)
        // { if (char.charid !== 0) { if (char.identifier.charAt(5) == ':') { var charid = char.identifier.charAt(4) }
        // else { var charid = char.identifier.charAt(4) + char.identifier.charAt(5); } characterElement.append(`<div
        // data-charid=${charid} data-ischar="true" id="character-${charid}" class="character-wrapper"><div
        // class="character"><h2>${char.firstname} ${char.lastname}</h2><span class="gender">${char.sex}</span><span
        // class="dob">${char.dateofbirth}</span></div></div>`); } }); } characterElement.append(`<div
        // class="character-create-wrapper"><div class="create"><h2>+ Create New Character</h2></div></div>`);

        $('.character-selection .character-wrapper').on('click', (e) => {
            let target = $(e.target);
            // Select parent if current target is child of .character-wrapper
            while (!target.hasClass('character-wrapper')) {
                target = target.parent();
            }

            if (!target.hasClass('selected')) {
                $('.character-selection .characters .character-wrapper.selected').removeClass('selected');
                $('.character-selection .characters .character-create-wrapper.selected').removeClass('selected');
                $(`.character-selection .characters .character-wrapper#${target.attr('id')}`).addClass('selected');
                $('.character-selection .buttons button.play').addClass('hidden');
                $('.character-selection .buttons button.delete').addClass('hidden');
                $('.character-selection .buttons button.create').addClass('hidden');
                const characterId = /character-(\d+)/.exec(target.attr('id'))[1];
                const skin        = decodeURIComponent(target.data('skin'));
                const charped     = decodeURIComponent(target.data('ped'));
                $.post('http://tcrp-character-creator/selectCharacter', JSON.stringify({
                                                                                           id:      characterId,
                                                                                           charped: charped,
                                                                                           skin:    skin
                                                                                       }));
                let thisExecution = getExecutionNumber();
                setTimeout(() => {
                    if (thisExecution === getExecutionNumber(false)) {
                        $('.character-selection .buttons button.play').removeClass('hidden');
                        $('.character-selection .buttons button.delete').removeClass('hidden');
                    }
                }, buttonShowDelay);
            }
            // TODO: Callback for 'selected character'
        });

        $('.character-selection .character-create-wrapper').on('click', (e) => {
            let target = $(e.target);
            // Select parent if current target is child of .character-wrapper
            while (!target.hasClass('character-create-wrapper')) {
                target = target.parent();
            }

            if (!target.hasClass('selected')) {
                $('.character-wrapper.selected').removeClass('selected');
                $('.character-create-wrapper.selected').removeClass('selected');
                $('.character-create-wrapper').addClass('selected');
                $('.buttons button.play').addClass('hidden');
                $('.buttons button.delete').addClass('hidden');
                $('.buttons button.create').addClass('hidden');
                const characterId = /character-(\d+)/.exec(target.attr('id'))[1];
                $.post('http://tcrp-character-creator/selectCreateCharacter', JSON.stringify({
                                                                                                 id: characterId
                                                                                             }));
                let thisExecution = getExecutionNumber();
                setTimeout(() => {
                    if (thisExecution === getExecutionNumber(false)) {
                        $('.buttons button.create').removeClass('hidden');
                    }
                }, buttonShowDelay);
            }
        });
    }

    $('.exit-button .exit').on('click', (e) => {
        alert('Exit Game', `Are you sure you want to exit the game?`, (verify) => {
            if (verify) {
                closeSelector();
                $(e.target).hide();
                $.post('http://tcrp-character-creator/exitGame', JSON.stringify({}));
            }
        });
    });
    /* The code here to handle changing of the 'selected' character when you click on one */

    $('.character-selection .buttons button.create').on('click', () => {
        const characterId = /character-(\d+)/.exec($('.character-create-wrapper').attr('id'))[1];
        $.post('http://tcrp-character-creator/playCharacter', JSON.stringify({
                                                                                 id:     characterId,
                                                                                 isChar: false
                                                                             }));
    });

    $('.character-selection .buttons button.play').on('click', () => {
        const characterId = /character-(\d+)/.exec(
            $('.character-selection .characters .character-wrapper.selected').attr('id'))[1];
        $.post('http://tcrp-character-creator/playCharacter', JSON.stringify({
                                                                                 id:     characterId,
                                                                                 isChar: true
                                                                             }));
    });

    $('.character-selection .buttons button.delete').on('click', () => {
        const selectedCharacter = $('.character-selection .characters .character-wrapper.selected');
        const characterId       = /character-(\d+)/.exec(selectedCharacter.attr('id'))[1];
        const characterName     = selectedCharacter.find('h2').text();
        alert('Delete Character', `Are you sure you want to delete "${characterName}"?`, (verify) => {
            if (verify) {
                selectedCharacter.remove();
                $.post('http://tcrp-character-creator/deleteCharacter', JSON.stringify({
                                                                                           id: characterId
                                                                                       }));
            }
        });
    });

    window.addEventListener('message', function (event) {
        var item = event.data;

        if (item.action == 'openui') {
            if (item.window == 'selector') {
                closeCreator();
                openSelector();
                loadCharacters(item.characters);
            } else {
                closeSelector();
                openCreator();
            }
        } else if (item.action == 'closegui') {
            closeAll();
        }
        if (item.action === 'reload') {
            loadCharacters(item.characters);
        }
        if (item.action === 'toggle-watermark') {
            toggleLogo();
        }

    });

    function alert(title, text, callback) {
        const theAlert = $(
            '<div class="alert"><h2></h2><p></p><div class="buttons"><button class="yes">Yes</button><button class="no">No</button></div></div>');
        theAlert.find('h2').text(title);
        theAlert.find('p').text(text);
        bodyElement.append(theAlert);

        theAlert.find('.buttons .yes').on('click', () => {
            callback(true);
            theAlert.remove();
        });

        theAlert.find('.buttons .no').on('click', () => {
            callback(false);
            theAlert.remove();
        });
    }

    let executionNumber = 0;

    function getExecutionNumber(update = true) {
        if (update) {
            return ++executionNumber;
        }
        return executionNumber;
    }
});