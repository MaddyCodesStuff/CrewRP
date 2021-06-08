const http = require('http');

const config = {
    host:    '127.0.0.1',
    port:    GetConvar('tcrp_launcher_port', 3030),
    enabled: GetConvar('tcrp_launcher_enabled', 'false')
};

let allowedClients = [];

let server = http.createServer(function (req, res) {
    let requestData = [];
    if (req.method === 'POST') {
        if (req.url === '\/gameLaunched') {
            req.on('data', function (chunk) {
                requestData.push(chunk);
            }).on('end', function () {
                let body = JSON.parse(Buffer.concat(requestData).toString());
                if (body['steamId']) {
                    res.writeHead(200);
                    if (config.enabled) {
                        if (allowedClients.indexOf(body['steamId']) === -1) {
                            allowedClients.push(body['steamId']);
                        }
                    }
                    res.end(JSON.stringify({
                                               success: 'Client allowed'
                                           }));
                } else {
                    res.writeHead(400);
                    res.end(JSON.stringify({
                                               error: 'Bad Request'
                                           }));
                }
            });
        } else {
            res.writeHead(404);
            res.end(JSON.stringify({
                                       error: 'Not Found'
                                   }));
        }
    } else {
        res.writeHead(405);
        res.end(JSON.stringify({
                                   error: 'Method Not Allowed'
                               }));
    }
});

server.listen(config.port, config.host, function () {
    console.log(`TheCrewRp-Launcher listening on port ${config.port}`);
});

on('playerConnecting', function (name, setKickReason, deferrals) {
    deferrals.defer();
    let player = global['source'];

    setTimeout(function () {
        deferrals.update(`Hello ${name}. Your connection is being checked.`);
        let steamIdentifier = null;
        for (let i = 0; i < GetNumPlayerIdentifiers(player); i++) {
            let identifier = GetPlayerIdentifier(player, i);
            if (identifier.includes('steam:')) {
                steamIdentifier = identifier;
            }
        }

        setTimeout(() => {
            if (steamIdentifier !== null && config.enabled !== 'false') {
                const indexOfIdentifier = allowedClients.indexOf(steamIdentifier);
                if (indexOfIdentifier === -1) {
                    deferrals.done(
                        'You are required to use the launcher to connect to the server. Please download it at http://thecrewrp.net/launcher');
                } else {
                    allowedClients.splice(indexOfIdentifier, 1);
                    deferrals.done();
                }
            } else {
                deferrals.done();
            }
        }, 0);
    }, 0);
});