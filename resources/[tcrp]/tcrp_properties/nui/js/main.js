$(() => {
    const screen                = $('.screen');
    const login                 = $('.login');
    const realEstateAgent       = $('.real-estate-agent');
    const propertyManager       = $('.property-manager');
    const realEstateAgentButton = $('#real-estate-agent');
    const propertyManagerButton = $('#property-manager');

    function showScreen() {
        screen.removeClass('hidden');
        $.post('http://tcrp_properties/show');
    }

    function hideScreen() {
        screen.addClass('hidden');
        $.post('http://tcrp_properties/hide');
    }

    realEstateAgentButton.on('click', () => {
        login.addClass('hidden');
        realEstateAgent.removeClass('hidden');
    });

    propertyManagerButton.on('click', () => {
        login.addClass('hidden');
        propertyManager.removeClass('hidden');
    });

    $('#close').on('click', () => {
        hideScreen();
    });

    $('#close-real-estate-agent').on('click', () => {
        login.removeClass('hidden');
        realEstateAgent.addClass('hidden');
    });

    $('#close-property-manager').on('click', () => {
        login.removeClass('hidden');
        propertyManager.addClass('hidden');
    });

    const forSale = $('.for-sale');
    const sold    = $('.sold');

    $('#for-sale').on('click', () => {
        forSale.removeClass('hidden');
        sold.addClass('hidden');
    });

    $('#sold').on('click', () => {
        sold.removeClass('hidden');
        forSale.addClass('hidden');
    });

    const active   = $('.active');
    const inactive = $('.inactive');

    $('#active').on('click', () => {
        active.removeClass('hidden');
        inactive.addClass('hidden');
    });

    $('#inactive').on('click', () => {
        inactive.removeClass('hidden');
        active.addClass('hidden');
    });

    $('.real-estate-agent .for-sale table').on('click', 'button', (e) => {
        const target     = $(e.target);
        const action     = target.text() === 'Sell' ? 'sell' : 'showhouse';
        const propertyId = parseInt(target.parent().parent().attr('id').replace('property-sale-', ''));
        switch (action) {
            case 'sell':
                $.post('http://tcrp_properties/sell', JSON.stringify({
                                                                         id: propertyId
                                                                     }));
                break;
            case 'showhouse':
                $.post('http://tcrp_properties/showhouse', JSON.stringify({
                                                                              id: propertyId
                                                                          }));
                break;
        }
    });

    // $('.real-estate-agent .sold table').on('click', 'button', (e) => {
    //     const target     = $(e.target);
    //     const action     = target.text() === 'Buy' ? 'buy' : 'return';
    //     const propertyId = parseInt(target.parent().parent().attr('id').replace('property-sold-', ''));
    //     switch (action) {
    //         case 'return':
    //             $.post('http://tcrp_properties/repossess', JSON.stringify({
    //                 id: propertyId
    //             }));
    //             break;
    //         case 'buy':
    //             $.post('http://tcrp_properties/buy', JSON.stringify({
    //                 id: propertyId
    //             }));
    //             break;
    //     }
    // });

    $('.real-estate-agent .sold table').on('click', 'button', (e) => {
        const target     = $(e.target);
        const action     = 'buy';
        const propertyId = parseInt(target.parent().parent().attr('id').replace('property-sold-', ''));
        switch (action) {
            case 'buy':
                $.post('http://tcrp_properties/buy', JSON.stringify({
                                                                        id: propertyId
                                                                    }));
                break;
        }
    });

    let currentlyEditing = null;

    function editTableRow(target) {
        target.text('Save');
        if (currentlyEditing) {
            // TODO: Show warning
            // If they want to save, call setToNotEditing on currentlyEditing with 2nd param as true
            currentlyEditing.text('Edit');
            if (currentlyEditing) {
                setToNotEditing(currentlyEditing);
            } else {
                saveTableRow(target);
            }
        }
        currentlyEditing = target;
        setToEditing(currentlyEditing);
    }

    function saveTableRow(target) {
        target.text('Edit');
        setToNotEditing(currentlyEditing, true, (data) => {
            $.post('http://tcrp_properties/save', JSON.stringify(data));
        });
        currentlyEditing = null;
    }

    $('.property-manager .active table').on('click', 'button', (e) => {
        const target     = $(e.target);
        const targetText = target.text();
        const action     = targetText === 'Deactivate' ? 'deactivate' : targetText === 'Edit' ? 'edit' : 'save';
        const propertyId = parseInt(target.parent().parent().attr('id').replace('property-active-', ''));
        switch (action) {
            case 'deactivate':
                $.post('http://tcrp_properties/deactivate', JSON.stringify({
                                                                               id: propertyId
                                                                           }));
                break;
            case 'edit':
                editTableRow(target);
                break;
            case 'save':
                saveTableRow(target);
                break;
        }
    });

    $('.property-manager .inactive table').on('click', 'button', (e) => {
        const target     = $(e.target);
        const targetText = target.text();
        const action     = targetText === 'Activate' ? 'activate' : targetText === 'Edit' ? 'edit' : 'save';
        const propertyId = parseInt(target.parent().parent().attr('id').replace('property-inactive-', ''));
        switch (action) {
            case 'activate':
                $.post('http://tcrp_properties/activate', JSON.stringify({
                                                                             id: propertyId
                                                                         }));
                break;
            case 'edit':
                editTableRow(target);
                break;
            case 'save':
                saveTableRow(target);
                break;
        }
    });

    function fill(tableName, data) {
        let table = $(`.real-estate-agent .${tableName} table, .property-manager .${tableName} table`);
        switch (tableName) {
            case 'for-sale':
            case 'active':
            case 'inactive':
                table.html('<tr><th>Address</th><th>Zone</th><th>Price</th><th>Actions</th></tr>');
                break;
            case 'sold':
                table.html('<tr><th>Address</th><th>Zone</th><th>Price</th><th>Actions</th><th>Owner</th></tr>');
                break;
        }
        let propertyPrefix = null;
        let actions        = null;
        let owner          = null;
        for (let i = 0; i < data.length; i++) {
            const object = data[i];
            switch (tableName) {
                case 'for-sale':
                    propertyPrefix   = 'property-sale-';
                    actions          = $('<td>');
                    const buttonSell = $('<button>');
                    buttonSell.text('Sell');
                    const buttonShow = $('<button>');
                    buttonShow.text('Show');
                    actions.append(buttonSell);
                    actions.append(buttonShow);
                    break;
                case 'sold':
                    propertyPrefix  = 'property-sold-';
                    actions         = $('<td>');
                    const buttonBuy = $('<button>');
                    buttonBuy.text('Buy');
                    // const buttonReturn = $('<button>');
                    // buttonReturn.text('Repossess');
                    // actions.append(buttonReturn);
                    actions.append(buttonBuy);
                    owner = $('<td>');
                    owner.text(object.owner);
                    break;
                case 'active':
                    propertyPrefix         = 'property-active-';
                    actions                = $('<td>');
                    const buttonDeactivate = $('<button>');
                    buttonDeactivate.text('Deactivate');
                    const buttonEditActive = $('<button>');
                    buttonEditActive.text('Edit');
                    actions.append(buttonDeactivate);
                    actions.append(buttonEditActive);
                    break;
                case 'inactive':
                    propertyPrefix       = 'property-inactive-';
                    actions              = $('<td>');
                    const buttonActivate = $('<button>');
                    buttonActivate.text('Activate');
                    const buttonEditInactive = $('<button>');
                    buttonEditInactive.text('Edit');
                    actions.append(buttonActivate);
                    actions.append(buttonEditInactive);
                    break;
            }
            table.append(objectToTableEntry(object, propertyPrefix, actions, owner));
        }
    }

    function objectToTableEntry(object, propertyPrefix, actions, owner) {
        const tr = $('<tr>');
        tr.attr('id', propertyPrefix + object.id);
        const address = $('<td>');
        address.text(object.address);
        const zone = $('<td>');
        zone.text(object.zone);
        const price = $('<td>');
        price.text(formatPurchaseAmount(object.price));
        tr.append(address);
        tr.append(zone);
        tr.append(price);
        tr.append(actions);
        if (owner) {
            const ownerColumn = $('<td>');
            ownerColumn.text(owner);
            tr.append(owner);
        }
        return tr;
    }

    function setToEditing(target) {
        const children = currentlyEditing.parent().parent().children();
        for (let i = 0; i < children.length - 1; i++) {
            const child = $(children[i]);
            if (i !== 2) {
                child.html(`<input type='text' value='${child.text()}' />`);
            } else {
                child.html(`<input type='number' value='${parseInt(child.text().replace(/[$\s]/gm, ''))}' />`);
            }
        }
    }

    function setToNotEditing(target, save, callback) {
        const children   = currentlyEditing.parent().parent().children();
        const tableRow   = currentlyEditing.parent().parent();
        const tableRowId = tableRow.attr('id');
        const propertyId = parseInt(tableRowId.replace(/property-[^-]+-/gm, ''));
        const data       = {
            id:      propertyId,
            address: null,
            zone:    null,
            price:   null
        };
        for (let i = 0; i < children.length - 1; i++) {
            const child = $(children[i]);
            if (i === 0) {
                data.address = child.find('input').val();
                child.text(data.address);
            } else if (i === 1) {
                data.zone = child.find('input').val();
                child.text(data.zone);
            } else {
                data.price = parseInt(child.find('input').val());
                child.text(formatPurchaseAmount(data.price));
            }
        }

        if (save && callback) {
            callback(data);
        } else {
            const table      = tableRow.parent().parent();
            const tableNames = ['forSale', 'sold', 'active', 'inactive'];
            let tableName;
            for (let i = 0; i < tableNames.length; i++) {
                if (table.hasClass(tableNames[i])) {
                    tableName = tableNames[i];
                    break;
                }
            }
            const object         = getIdFromTable(propertyId, tableName);
            const propertyPrefix = tableRowId.replace(/\d*$/gm, '');
            const lastTableData  = tableRow.find(':last-child')[0];
            const tableEntry     = objectToTableEntry(object, propertyPrefix, lastTableData);
            tableEntry.insertAfter(tableRow);
            tableEntry.attr('id', tableRowId);
            tableRow.remove();
        }
    }

    function formatPurchaseAmount(number) {
        const string       = number.toString();
        let purchaseAmount = '';
        for (let i = string.length - 1; i >= 0; i--) {
            purchaseAmount = string[i] + purchaseAmount;
            if ((string.length - i) % 3 === 0 && i !== 0) {
                purchaseAmount = ' ' + purchaseAmount;
            }
        }
        return `$ ${purchaseAmount}`;
    }

    let latestData = null;

    function getIdFromTable(id, tableName) {
        const table = latestData[tableName];
        for (let i = 0; i < table.length; i++) {
            if (table[i].id === id) {
                return table[i];
            }
        }
        return null;
    }

    window.addEventListener('message', (e) => {
        const data = e.data;

        switch (data.action) {
            case 'show':
                updateUI(data);
                showScreen();
                break;
            case 'update':
                updateUI(data);
                break;
            case 'hide':
                hideScreen();
                break;
        }

        function updateUI(data) {
            latestData = data;

            switch (data.role) {
                case 'property-manager':
                    propertyManagerButton.show();
                    realEstateAgentButton.show();
                    break;
                default:
                    realEstateAgentButton.show();
                    propertyManagerButton.hide();
            }
            fill('for-sale', data.forSale);
            fill('sold', data.sold);
            fill('active', data.active);
            fill('inactive', data.inactive);
        }
    });
});