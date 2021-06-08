Config = {}

Config.RestrictedChannels = 7 -- channels that are encrypted (EMS, Fire and police can be included there) if we give eg 10, channels from 1 - 10 will be encrypted
Config.enableCmd = true --  /radio command should be active or not (if not you have to carry the item "radio") true / false

Config.messages = {
  
  ['not_on_radio'] = 'You are not on a radio',
  ['on_radio'] = 'You are on radio: <b>',
  ['joined_to_radio'] = 'Joined Channel: <b>',
  ['restricted_channel_error'] = 'Error! Restricted Channel',
  ['you_on_radio'] = 'You are already on this channel: <b>',
  ['you_leave'] = 'Channel left <b>'

}

Config.ServicesJobs = {
    'police',
    'ambulance',
    'fireman',
    'corrections',
    'parkranger',
}