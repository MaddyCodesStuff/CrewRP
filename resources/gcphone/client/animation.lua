--====================================================================================
-- #Author: Jonathan D @ Gannon
--====================================================================================

-- JUST TESTING THAT IT ACTUALLY WORKS


local doingCall = false
local lastEmote = nil

function isDoingCall()
	return doingCall
end

function PhonePlayOut ()
	doingCall = false
	TriggerEvent('emote:cancel', true)
	if lastEmote ~= nil then
		TriggerEvent('emote:do', lastEmote)
	end
end

function PhonePlayText ()
	doingCall = false
	TriggerEvent('emote:do', 'phone')
end

function PhonePlayCall (freeze)
	doingCall = true
	TriggerEvent('emote:do', 'phonecall')
end

function PhonePlayIn ()
	lastEmote = exports['krz_personalmenu']:getCurrentEmote()
	PhonePlayText()
end