module.exports = {
    //-- [REQUIRED] IPv4 Address of your teamspeak 3 server
    TSServer: GetConvar('ws_ts_server_ip', "147.135.104.6"),

    //-- [REQUIRED] Port of the ws_server
    //-- Make sure you open the port you specify below
    //-- Please use a port above 30k as some networks block those below it
    WSServerPort: GetConvar('ws_server_port', 33250),

    //-- [OPTIONAL] IPv4 Address of the ws_server
    //-- Set by autoconfig
    WSServerIP: GetConvar('ws_ts_server_ip', "147.135.104.6"),

    //-- [OPTIONAL] Enable connection/disconnection logs
    enableLogs: false
};
