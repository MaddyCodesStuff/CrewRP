# esx_gitrdone
## Description
ESX_GITRDONE is an RP construciton job built based on the latest (as of this build) esx_policejob.
* FEATURES:
	* Vehicle Shop
	* Invoicing
	* Large prop list
	
* EDITS
	* Completely ripped apart the police job.  I didn't go the lazy route like everyone else and leave in a ton of unused code.  Any policejob code that was not needed was taken out to lighten the script.
	* Added proper billing to send invoices to customers (I didn't just edit the fine menu)
	* All vehicles are stock GTA vehilces
	* Added tons of props that spawn properly and are removed properly.
	* Removed helicopters, all citizen interaction, and all vehilce interaction code.
	* Job ranks are true to real world (although greatly reduced)
	
* NOTE
	* Because I use EUP, the outfits in the config are NOT proper to most servers and will need to be edited to your liking.
	* If you do use EUP, you're all set.
	
* BUGS
	* None that I seen.  Let me know by submitting an issue if you find one.
	* NOT KNOWING HOW TO PROPERLY INSTALL A RESOURCE IS NOT A BUG!!!  ISSUES OF THAT TYPE WILL BE CLOSED AND IGNORED!!!

### Requirements
* Auto mode
  * [esx_billing](https://github.com/FXServer-ESX/fxserver-esx_billing)
  * [esx_service](https://github.com/ESX-Org/esx_service)

* Player management (boss actions)
  * [esx_society](https://github.com/FXServer-ESX/fxserver-esx_society)
  * [esx_datastore](https://github.com/FXServer-ESX/fxserver-esx_datastore)


## Download & Installation



## Installation
- Import `esx_gitrdone.sql` in your database
- Add this in your server.cfg :

```
start esx_gitrdone
```
-  * If you want player management you have to set `Config.EnablePlayerManagement` to `true` in `config.lua`

# Legal
### License
Oringial code - [esx_policejob - police script for ESX](https://github.com/ESX-Org/esx_policejob)

Copyright (C) 2019 Chip Wickings

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
