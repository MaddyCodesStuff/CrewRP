-- Update all properties
RegisterServerEvent("updateSkin")
AddEventHandler("updateSkin",
                function(dad, mum, dadmumpercent, skin, eyecolor, acne, skinproblem, freckle, wrinkle, wrinkleopacity,
                         eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, torso, torsotext,
                         leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2,
                         torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings,
                         prop_earrings_text, prop_watches, prop_watches_text)
                    TriggerEvent('es:getPlayerFromId', source, function(user)
                        local player = user.getIdentifier()

                        MySQL.Async.execute("UPDATE outfits SET dad=@dad, mum=@mum, dadmumpercent=@dadmumpercent, skinton=@skin, eyecolor=@eyecolor, acne=@acne, skinproblem=@skinproblem, freckle=@freckle, wrinkle=@wrinkle, wrinkleopacity=@wrinkleopacity, eyebrow=@eyebrow, eyebrowopacity=@eyebrowopacity, beard=@beard, beardopacity=@beardopacity, beardcolor=@beardcolor, hair=@hair, hairtext=@hairtext, torso=@torso, torsotext=@torsotext, leg=@leg, legtext=@legtext, shoes=@shoes, shoestext=@shoestext, accessory=@accessory, accessorytext=@accessorytext, undershirt=@undershirt, undershirttext=@undershirttext, torso2=@torso2, torso2text=@torso2text, prop_hat=@prop_hat, prop_hat_text=@prop_hat_text, prop_glasses=@prop_glasses, prop_glasses_text=@prop_glasses_text, prop_earrings=@prop_earrings, prop_earrings_text=@prop_earrings_text, prop_watches=@prop_watches, prop_watches_text=@prop_watches_text WHERE idSteam=@idSteam",
                                            { ['@idSteam'] = player, ['@dad'] = dad, ['@mum'] = mum, ['@dadmumpercent'] = dadmumpercent, ['@skin'] = skin, ['@eyecolor'] = eyecolor, ['@acne'] = acne, ['@skinproblem'] = skinproblem, ['@freckle'] = freckle, ['@wrinkle'] = wrinkle, ['@wrinkleopacity'] = wrinkleopacity, ['@eyebrow'] = eyebrow, ['@eyebrowopacity'] = eyebrowopacity, ['@beard'] = beard, ['@beardopacity'] = beardopacity, ['@beardcolor'] = beardcolor, ['@hair'] = hair, ['@hairtext'] = haircolor, ['@torso'] = torso, ['@torsotext'] = torsotext, ['@leg'] = leg, ['@legtext'] = legtext, ['@shoes'] = shoes, ['@shoestext'] = shoestext, ['@accessory'] = accessory, ['@accessorytext'] = accessorytext, ['@undershirt'] = undershirt, ['@undershirttext'] = undershirttext, ['@torso2'] = torso2, ['@torso2text'] = torso2text, ['@prop_hat'] = prop_hat, ['@prop_hat_text'] = prop_hat_text, ['@prop_glasses'] = prop_glasses, ['@prop_glasses_text'] = prop_glasses_text, ['@prop_earrings'] = prop_earrings, ['@prop_earrings_text'] = prop_earrings_text, ['@prop_watches'] = prop_watches, ['@prop_watches_text'] = prop_watches_text })

                        print("Outfits successfully updated !")
                    end)
                end)
