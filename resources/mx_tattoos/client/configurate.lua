-- Tattoos available at the store
tattoos_list = {
    -- Tattoo Groups
    {title = "Head", dlc = "head", price = 150, qty = 51, acquired = 0, has = false, current = 0},
    {title = "Neck", dlc = "neck", price = 150, qty = 49, acquired = 0, has = false, current = 0},
    {title = "Back", dlc = "back", price = 500, qty = 267, acquired = 0, has = false, current = 0},
    {title = "Torso", dlc = "torso", price = 500, qty = 248, acquired = 0, has = false, current = 0},
    {title = "Left Arm", dlc = "left_arm", price = 300, qty = 156, acquired = 0, has = false, current = 0},
    {title = "Right Arm", dlc = "right_arm", price = 300, qty = 173, acquired = 0, has = false, current = 0},
    {title = "Left Hand", dlc = "left_hand", price = 100, qty = 14, acquired = 0, has = false, current = 0},
    {title = "Right Hand", dlc = "right_hand", price = 100, qty = 14, acquired = 0, has = false, current = 0},
    {title = "Left Leg", dlc = "left_leg", price = 300, qty = 92, acquired = 0, has = false, current = 0},
    {title = "Right Leg", dlc = "right_leg", price = 300, qty = 72, acquired = 0, has = false, current = 0},
    {title = "Hair Degrade", dlc = "hair_degrade", price = 50, qty = 65, acquired = 0, has = false, current = 0},
}

-- Extra settings
scale = '1.0'
pos_x = '75%'
pos_y = '25%'
AutoHideClothes = true
freetattoos = false

-- Notify lua
Texts = {
    Open_Store = "Welcome to our Shop",                                  
    Close_Store = "Come back Again",                                                  
    Without_money = "You don't have the money for these tattoos",          
    Spent1 = "You spent",                                
    Spent2 = "on tattoos", 
    Money_Symbol = "$",
    KeyNotifyOpenStore = "~h~Press ~INPUT_PICKUP~ to open the store",                                    
}

-- Text VUEJS (NUI)
Texts_Nui = {
    Title = "Tattoos Shop",                                                    
    Info1 = "Use the arrow keys on your keyboard to select the tattoos",
    Info2 = "To buy a tattoo,",
    Info3 = "PRESS ENTER",
    Info4 = "To remove a tattoo,",
    Info5 = "PRESS DELETE",                                
    Money_Symbol = "$",                                                            
    QtyTattoos = "Qty:",                                                         
    TattoosAcquired = "Acquired Tattoo",                                        
    TattoosRemoved = "Tattoo Removed",                                         
    AlreadyHaveTattoo = "Already have",                                                   
}