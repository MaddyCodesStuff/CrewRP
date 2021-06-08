# FiveM - heli by mraes
-- Modified by rjross2013 (2017-06-23)
-- Further modified by Loque (2017-08-15) with credits to the following for tips gleaned from their scripts: Guadmaz's Simple Police Searchlight, devilkkw's Speed Camera, nynjardin's Simple Outlaw Alert and IllidanS4's FiveM Entity Iterators.
-- Even further modified by Nelana (2021-03-02) For use on TheCrewRP Server

Version 1.3 - 2017/06/09

Instructions:
 * Press the the G key to switch to the HeliCam in either the Maverick and the Highway Buzzard
 * Whilst in Helicam: move mouse to rotate cam, scroll to zoom and use the RIGHT MOUSE BUTTON to switch between normal and nightvision
 * Whilst in Helicam: when hovering over a vehicle and close enough to it, you can see vehicle info. If you can see this, press SPACE to lock camera onto the vehicle, SPACE again to unlock camera, there is a 10 second cooldown before you can lock on again.
 * Press and hold X key for 1 second to rappel from the Maverick
 
 Changelog:
 * 2017/06/08: Added smoothing to camera movement.
 * 2017/06/08: Added Nightvision and Thermal Vision.
 * 2017/06/09: Made camera movement smoother when zoomed in.
 * 2017/06/12: Added rappel, spotlight and showing of vehicle information + lock onto vehicle. Changed some keys. Added screen effect overlay to make it look like cam feed.
 * 2021/03/02: Removed the Spotlight script from the script, Removed the now useless heli_server.lua, Edited the vehicle info display to display more info, removed Thermals, fixed the 26 bug, added a timer to Rappel so you don't accidently toggle it and yeet yourself from a moving helicopter, fixed a ragdool bug with the rappel, disabled ability to switch weapons and fire while in helicam, also prevented the zoom from clicking
 * 2021/11/3: Fixed a couple of bugs, and removed a no longer needed cooldown timer now that a bug was fixed