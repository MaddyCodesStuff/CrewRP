-- Paleto Yacht Heist
-- by av8rgeek
-- August 2020

Locales['en'] = {
    -- General notifications--
    -- This is the name that appears in the map
    ['blipname']          = 'Yacht Heist',
    -- Tell the player how to start the heist
    ['start_heist']       = 'Press ~INPUT_CONTEXT~ to start the heist.',

    -- Crim Notifications
    -- Search yacht
    ['hack_computer']     = 'Press ~INPUT_CONTEXT~ to hack this computer.',
    -- Tell the player the heist has started    
    ['heist_started']     = 'The heist has been started.  Hack all of the computers to have the money transferred to your account.',
    -- Tell the player there are not enough police on duty
    ['not_enough_pd']     = 'There are not enough police officers available, but your hacking attempt was reported to the police.',
    -- Recently robbed
    ['cooldown']          = 'The computers were hacked recently. Your attempted hacking has been reported to the police.',
    -- Computer Hacking failed
    ['too_far_away']      = 'You failed to hack the yacht\'s computers!  Maybe you should try harder next time?',
    -- Computer Hacking failed
    ['player_died']       = 'Incapacitated criminals can\'t hack computers.  Heist failed.  Don\'t worry, the police know all about your adventures!',
    -- Computer Hacked
    ['computer_hacked']   = 'This computer has been successfully hacked.',
    -- Computer Hacked
    ['progress1']         = 'you have successfully hacked ',
    -- Computer Hacked
    ['progress2']         = ' of ',
    -- Hack Progress 3
    ['progress3']         = ' computers.',
    -- Computer Hacking failed
    ['failed_hack']       = 'You failed to hack this computer.',
    -- Tell the player there are not enough police on duty
    ['not_enough_pi']     = 'You don\'t have enough supplies to continue the heist.  Go get more stuff and come back!',
    -- Tell the player to try again
    ['try_again']         = 'You failed to hack this computer.  Try again!',
    -- Tell the player they succeeded in the heist
    ['heist_successful']  = 'All computers have been hacked!',

    -- Police Notifcations
    -- Notify PD there is a heist at the yacht
    ['pd_hack_started']   = 'Someone is hacking the Paleto yacht\'s computers!  Don\'t let the hackers steal the money.',
    -- Attempted Hacking
    ['attempt_to_hack']   = 'Someone tried to hack the yacht\'s computers and failed.  There could be evidence!  Go investigate!',
    -- Heist Completed
    ['pd_heist_complete'] = 'The yacht\'s computers were successfully hacked!  The criminals are escaping!',
    -- Attempt to gather a clue from the ship's computers
    ['pd_gather_clues']   = 'Press ~INPUT_CONTEXT~ to search the computer\'s logs for clues.',
    
    -- PD Note stuff
    -- Default value if things go wrong:
    ['syslogd_not_running'] = 'paletoyacht.network.ls kernel: syslogd not running',
    -- Cleartext "hostname" (only when fingerprints match)
    ['cleartext_hostname'] = 'paletoyacht.network.ls transferd/auditlog:',
    -- Successful heist and successful fingerprint matches
    ['successful_heist_and_fingerprints-payout'] = 'completed a funds transfer of $',
    ['successful_heist_and_fingerprints-terminal'] = 'to their bank account from the terminal located at',
    -- Successful heist and unsuccessful fingerprint matches
    ['successful_heist_and_no_fingerprints-payout'] = 'palfgd;lm;565j3yac =-0sb$7i6w0rk.ls tran@!#$GNFM^&itlog: sl;kfdbnlk;34pleted@FBae90j#@f346sferspom_fj',
    ['successful_heist_and_no_fingerprints-terminal'] = 'to;lknw;gnk acco$#ton42qaESQRerminal45 qKLBNJE!#$',
    -- Unsuccessful heist and unsuccessful fingerprint matches
    ['unsuccessful_heist_and_fingerprints'] = 'attempted a transfer of funds to their bank account from the terminal located at',
    ['unsuccessful_heist_and_no_fingerprints']= 'palfgd;lm;565j3yac =-0sb$7i6w0rk.ls tran@!#$GNFM^&itlog: dSB$&*ttemptfhtj;lkmxferspom_w;gnk acco$#ton42qaESQRerminal45 qKLBNJE!#$',
}
