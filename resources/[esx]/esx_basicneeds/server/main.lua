ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Values are out of 1 million for a full bar
-- Conviniance Food items

ESX.RegisterUsableItem('burger', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('burger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bacon Roll')
end)

ESX.RegisterUsableItem('bread', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bread', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 335000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Sandwitch - Just Like Mama Use to Make')
    TriggerClientEvent('esx_status:remove', source, 'drunk', 50000)

end)

ESX.RegisterUsableItem('pastacarbonara', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pastacarbonara', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 450000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bowl of Pasta Carbonara')

end)

ESX.RegisterUsableItem('pizza', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pizza', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_pizza_box_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Whole Pizza - The Cardboard is the Best Part!')

end)

ESX.RegisterUsableItem('noodles', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('noodles', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Cup of Chicken Noodle Soup - Tastes Like The End of an Era')

end)

ESX.RegisterUsableItem('noodles2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('noodles2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Cup of Seafood Noodles - They\'re Better Dry')

end)

ESX.RegisterUsableItem('soup', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('soup', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Cup of Tomato Soup')

end)

ESX.RegisterUsableItem('soup2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('soup2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Cup of Vegetable Soup')

end)

ESX.RegisterUsableItem('cereal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('cereal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Cup of Dry Cereal - Better With Milk')

end)

ESX.RegisterUsableItem('fishstix', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('fishstix', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_food_cb_chips')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Package of Frozen Fishy Stix - Don\'t Tell Diddy')

end)

ESX.RegisterUsableItem('cheesebows', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('cheesebows', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'v_ret_ml_chips4')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bag of Cheese Chips')

end)

ESX.RegisterUsableItem('chips', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('chips', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'v_ret_ml_chips3')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, "A Bag of Chips")

end)

ESX.RegisterUsableItem('chips2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('chips2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'v_ret_ml_chips2')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bag of Habanero Chips')

end)

ESX.RegisterUsableItem('chips3', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('chips3', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'v_ret_ml_chips1p')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bag of Sticky Rib Chips')

end)
-- Sweats
ESX.RegisterUsableItem('candy', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('candy', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a EarthQuakes Candy Bar')
end)

ESX.RegisterUsableItem('candy2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('candy2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Captain\'s Log')

end)

ESX.RegisterUsableItem('candy3', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('candy3', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bag of Meteorite Candy')

end)

ESX.RegisterUsableItem('candy4', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('candy4', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Zebrabar')

end)

ESX.RegisterUsableItem('candy5', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('candy5', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Ego Chaser')

end)

ESX.RegisterUsableItem('popsicle', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('popsicle', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Orange-O-Tang Popsicle')

end)

ESX.RegisterUsableItem('popsicle2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('popsicle2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Creamy Chufty')

end)

ESX.RegisterUsableItem('popsicle3', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('popsicle3', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Chocolate Starfish')

end)

ESX.RegisterUsableItem('popsicle4', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('popsicle4', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, ' A Chilldo')

end)

ESX.RegisterUsableItem('popsicle5', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('popsicle5', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Chocolate Chufty')

end)

ESX.RegisterUsableItem('donut', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('donut', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 175000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_donut_02')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Donut')

end)

ESX.RegisterUsableItem('donut2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('donut2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 175000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_donut_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Birthday Donut - Happy Birthday!')

end)
-- Fruit
ESX.RegisterUsableItem('apple', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('apple', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_aple2a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Golden Delicious Apple')

end)

ESX.RegisterUsableItem('redapple', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('redapple', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_aple2a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Red Apple of Unknown Variety')

end)

ESX.RegisterUsableItem('greenapple', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('greenapple', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_aple2a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Green Apple of Unknown Variety')

end)

ESX.RegisterUsableItem('orange', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('orange', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_ornge1a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Juicy Orange')

end)

ESX.RegisterUsableItem('banana', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('banana', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 175000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_nana1a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Banana - Better With The Shell')

end)

ESX.RegisterUsableItem('pineapple', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pineapple', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 125000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_pineapple')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Pineapple - The Snack That Eats You Back')

end)

ESX.RegisterUsableItem('pear', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pear', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_aple2a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Pear')

end)

-- Drinks

ESX.RegisterUsableItem('water', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('water', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of Water')
    TriggerClientEvent('esx_status:remove', source, 'drunk', 125000)

end)

ESX.RegisterUsableItem('cocacola', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('cocacola', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 335000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'ng_proc_sodabot_01a')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of E-cola')

end)

ESX.RegisterUsableItem('fanta', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('fanta', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 335000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'ng_proc_sodabot_01a')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of Orange-O-Tang')

end)

ESX.RegisterUsableItem('sprite', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('sprite', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 335000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'ng_proc_sodabot_01a')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of Sprunk')

end)

ESX.RegisterUsableItem('sprite2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('sprite2', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 335000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'ng_proc_sodabot_01a')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of Sprunk Lite')

end)

ESX.RegisterUsableItem('milk', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('milk', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_cs_milk_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Carton of Milk - What did that stickynote say?')

end)

ESX.RegisterUsableItem('slushy', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('slushy', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_cs_paper_cup')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Sludgie Blue Slushy')

end)

ESX.RegisterUsableItem('slushy2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('slushy2', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_plastic_cup_02')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Sludgie Green Slushy')

end)

ESX.RegisterUsableItem('coffee', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('coffee', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Basic Coffee - Karen Would be Displeased')

end)

ESX.RegisterUsableItem('decafcoffee', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('decafcoffee', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Decaf Coffee')

end)

ESX.RegisterUsableItem('mocha', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('mocha', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Mocha')

end)

ESX.RegisterUsableItem('latte', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('latte', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Latte')

end)

ESX.RegisterUsableItem('frapuccino', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('frapuccino', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Frapuccino')

end)

-- Burgershot

ESX.RegisterUsableItem('drink', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('drink', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_cs_bs_cup')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Large Fountain Drink - It\'s Already Wattered Down')

end)

ESX.RegisterUsableItem('bleederburger', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bleederburger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bleeder Burger - Burgerman Approves')

end)

ESX.RegisterUsableItem('moneyshotburger', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('moneyshotburger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Moneyshot Burger - What, Were you Expecting a Joke Here?')

end)

ESX.RegisterUsableItem('torpedoburger', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('torpedoburger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Torpedo Burger')

end)

ESX.RegisterUsableItem('meatfreeburger', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('meatfreeburger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Meat Free Burger - Or so They Claim')

end)

ESX.RegisterUsableItem('heartstopperburger', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('heartstopperburger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a 6Lb Heartstopper Burger - You Feel Your Arteries Clogging')

end)

ESX.RegisterUsableItem('crappyburger', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('crappyburger', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Crappy Burger - Tasted Better Than it Sounds')

end)

ESX.RegisterUsableItem('largefries', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('largefries', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_food_bs_chips')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Large Fry - No Supersize Options Here')

end)

-- Burgershot Meals

ESX.RegisterUsableItem('moneyshotmeal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('moneyshotmeal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Moneyshot Meal - A Burger, Fry and Drink, All in one!')

end)

ESX.RegisterUsableItem('bleedermeal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bleedermeal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bleeder Meal - A Burger, Fry and Drink, All in one!')

end)

ESX.RegisterUsableItem('crappymeal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('crappymeal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Crappy Meal - A Burger, Fry and Drink, All in one!')

end)

ESX.RegisterUsableItem('meatfreemeal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('meatfreemeal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Meat Free Meal - A Burger, Fry and Drink, All in one!')

end)

ESX.RegisterUsableItem('torpedomeal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('torpedomeal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Torpedo Meal - A Burger, Fry and Drink, All in one!')

end)

ESX.RegisterUsableItem('heartstoppermeal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('heartstoppermeal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 700000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Heartstopper Meal - The Burger Was More Than Enough, You Couldn\t Eat it All')

end)

-- Taco Farmer

ESX.RegisterUsableItem('tacoalpastor', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tacoalpastor', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Al Pastor Taco')

end)

ESX.RegisterUsableItem('tacobarbacacoa', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tacobarbacacoa', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Barbacacoa Taco')

end)

ESX.RegisterUsableItem('tacocarnitas', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tacocarnitas', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Carnitas Taco')

end)

ESX.RegisterUsableItem('tacovegetal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tacovegetal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Vegetal Taco')

end)

-- Hot Dogs

ESX.RegisterUsableItem('hotdog1', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hotdog1', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hotdog_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Plain Hotdog - The "meat" is made of something called a "water sausage."')

end)

ESX.RegisterUsableItem('hotdog2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hotdog2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hotdog_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Cheese Dog')

end)

ESX.RegisterUsableItem('hotdog3', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hotdog3', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hotdog_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Chilli Dog')

end)

ESX.RegisterUsableItem('hotdog4', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hotdog4', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hotdog_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a VeggieDog')

end)

ESX.RegisterUsableItem('hotdog5', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hotdog5', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hotdog_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Hotdog with Onion')

end)

ESX.RegisterUsableItem('hotdogmeal1', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hotdogmeal1', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hotdog_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Hotdog with the Works Meal - Small Fries and Drink Included')

end)

ESX.RegisterUsableItem('hotdogmeal2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hotdogmeal2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hotdog_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Hotdog with Small Fry - The Drink Is On The House')

end)

ESX.RegisterUsableItem('veggiedogmeal', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('veggiedogmeal', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_hotdog_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a VeggieDog Meal - Small Fries and Drink Included')

end)

-- Ice Cream
ESX.RegisterUsableItem('icecream', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('icecream', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Vanilla Ice Cream Cone')

end)

ESX.RegisterUsableItem('icecream2', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('icecream2', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Mint Ice Cream Cone')

end)

ESX.RegisterUsableItem('icecream3', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('icecream3', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Bowl of Chocolate Ice Cream')

end)

ESX.RegisterUsableItem('icecream4', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('icecream4', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Just a Cone -- It had so much Potential, All ruined now')

end)

ESX.RegisterUsableItem('milkshake', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('milkshake', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_cs_bs_cup')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Milk Shake')

end)

-- Misilanious/Event Items

ESX.RegisterUsableItem('birthdaycake', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('birthdaycake', 1)
    xPlayer.addInventoryItem('birthdaycake_slice', 10)

    TriggerClientEvent('esx:showNotification', source, "You have received 10x ~g~Slice of Birthday Cake")
end)

ESX.RegisterUsableItem('birthdaycake_slice', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('birthdaycake_slice', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Slice of Birthday Cake')

end)

ESX.RegisterUsableItem('egg', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('egg', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_alien_egg_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a REALLY Large Egg')

end)

-- Spawn In Only Items

ESX.RegisterUsableItem('cheesecake_slice', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('cheesecake_slice', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Slice of Delicious Cheesecake - It Tasts a Little Smoky')

end)

ESX.RegisterUsableItem('cookie', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('cookie', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 125000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_donut_02')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Cookie - It Just Crumbled That Way')

end)

ESX.RegisterUsableItem('fries', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('fries', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_food_bs_chips')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some Frenchie\'s Fries')

end)

ESX.RegisterUsableItem('grapes', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('grapes', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 10000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 10000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_aple2a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Few Grapes')

end)

ESX.RegisterUsableItem('gum', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('gum', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 10000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_aple2a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Stick of Gum - Very Rich in Flavor')

end)

ESX.RegisterUsableItem('honey', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('honey', 1)
    
    TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some Honey - Oh Bother')

end)

ESX.RegisterUsableItem('lunch', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('lunch', 1)
    
    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'hei_prop_hei_paper_bag')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Wimley\'s Bagged Lunch - Just Blame it on Cheetoh')

end)

ESX.RegisterUsableItem('marabou', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('marabou', 1)
    
    TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Foreign Chocolate Bar')

end)

ESX.RegisterUsableItem('olives', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('olives', 1)
    
    TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_aple2a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Handful of Olives')

end)

ESX.RegisterUsableItem('peach', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('peach', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'ng_proc_food_aple2a')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Juicy Peach')

end)

ESX.RegisterUsableItem('boxchocolate', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('boxchocolate', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_candy_pqs')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Box of Chocolates - So Romantic')

end)

ESX.RegisterUsableItem('gen_fries', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('gen_fries', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_food_bs_chips')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Large Fry - No Supersize Options Here')

end)

ESX.RegisterUsableItem('muffin', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('muffin', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 125000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Chocolate Chip Muffin - It\'s Muffin Time')

end)

ESX.RegisterUsableItem('ricebowl', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('ricebowl', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a Ricebowl - The Rice Was Bland, The Rest Was Good')

end)

ESX.RegisterUsableItem('iced_tea', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('iced_tea', 1)
    
    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_plastic_cup_02')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Cup of Iced Tea - Strangely, Not Very Icey')

end)

ESX.RegisterUsableItem('sweet_tea', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('sweet_tea', 1)
    
    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_plastic_cup_02')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Cup of Sweet Tea - Strangely, Not Very Sweet')
end)

ESX.RegisterUsableItem('largecola', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('largecola', 1)
    
    TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'ng_proc_sodabot_01a')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Large Bottle of E-Cola - 3 Bottles, All in One')

end)

ESX.RegisterUsableItem('largesprunk', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('largesprunk', 1)
    
    TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'ng_proc_sodabot_01a')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Large Bottle of Sprunk - 3 Bottles, All in One')

end)

ESX.RegisterUsableItem('loka', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('loka', 1)
    
    TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_can_01b')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Can of Loka Crush')

end)

ESX.RegisterUsableItem('specialcoffee', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('specialcoffee', 1)
    
    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'You Drank Karen\'s special custom Mocha Frapuccino with 2 pumps espresso, 1 pump nutella, two exasperated coughs, and one human breath.')

end)

ESX.RegisterUsableItem('jus_raisin', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('jus_raisin', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_plastic_cup_02')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Cup of Refreshing Grape Juice')

end)

ESX.RegisterUsableItem('juice', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('juice', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_plastic_cup_02')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Cup of Big O Signature Juice - How big was your O?')

end)

ESX.RegisterUsableItem('applecider', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('applecider', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_plastic_cup_02')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Bottle of Apple Cider')

end)

ESX.RegisterUsableItem('gen_drink', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('gen_drink', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_cs_bs_cup')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a Large Fountain Drink - It\'s Already Watered Down')

end)

ESX.RegisterUsableItem('apple_pie', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('apple_pie', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a slice of apple pie')

end)

ESX.RegisterUsableItem('Bananacreampie', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('Bananacreampie', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a slice of banana cream pie')

end)

ESX.RegisterUsableItem('bangersandmash', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bangersandmash', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some bangers and mash mate')

end)

ESX.RegisterUsableItem('burrito', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('burrito', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a delicious burrito')

end)

ESX.RegisterUsableItem('chimichangas', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('chimichangas', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some chimichangas')

end)

ESX.RegisterUsableItem('chocolatecheesecake', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('chocolatecheesecake', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a slice of chocolate cheesecake')

end)

ESX.RegisterUsableItem('cinnamon_bun', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('cinnamon_bun', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_donut_02')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a cinnamon bun')

end)

ESX.RegisterUsableItem('drypetfood', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('drypetfood', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some pet food')

end)

ESX.RegisterUsableItem('enchilada', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('enchilada', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'An enchilada')

end)

ESX.RegisterUsableItem('flan', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('flan', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some flan. Jiggly')

end)

ESX.RegisterUsableItem('hotcoco', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('hotcoco', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'Some hot cocoa')

end)

ESX.RegisterUsableItem('irishstew', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('irishstew', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some hearty Irish stew')

end)

ESX.RegisterUsableItem('pancakes', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pancakes', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some pancakes')

end)

ESX.RegisterUsableItem('petcoffee', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('petcoffee', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'a fancy latte')

end)

ESX.RegisterUsableItem('petcupcake', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('petcupcake', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a pet-safe cupcake. Tastes sorta like dog food')

end)

ESX.RegisterUsableItem('pettreats', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pettreats', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'a pet treat')

end)

ESX.RegisterUsableItem('shepherdspie', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('shepherdspie', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Delicious shepherds pie')

end)

ESX.RegisterUsableItem('strawberry_shortcake', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('strawberry_shortcake', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'bkr_prop_coke_spoon_01')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some strawberry shortcake')

end)

ESX.RegisterUsableItem('tea', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tea', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 600000)
    TriggerClientEvent('esx_basicneeds:onDrink', source, 'p_amb_coffeecup_01')
    TriggerClientEvent('mythic_notify:client:SendDrinkAlert', source, 'Some hot tea')

end)

ESX.RegisterUsableItem('waffles', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('waffles', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
    TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_fork')
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some syrupy waffles')

end)

ESX.RegisterUsableItem('wetpetfood', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('wetpetfood', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
    TriggerClientEvent('mythic_notify:client:SendEatAlert', source, 'Some canned pet food')

end)