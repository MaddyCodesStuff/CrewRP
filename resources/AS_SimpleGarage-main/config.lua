Config = {}
Config.Locale = 'en'
Config.DrawDistance = 50

Config.LockKey = 57 -- Key used for locking/unlock vehicles, 303 is U

Config.ColorHex 		= "#074dd9" -- Hex color code, used for Mythic Notify
Config.ColorR 			= 7 -- Color for menu
Config.ColorG           = 77 -- Color for menu
Config.ColorB           = 217 -- Color for menu
Config.Type 			= 6 -- Circletype
Config.UsePrivateCarGarages      = true



Config.Garages = {
    ["BUS STATION (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(430.96, -631.46, 28.5)
            },
            ["vehicle"] = {
                ["position"] = vector3(421.83, -637.71, 28.5), 
                ["heading"] = 180.0
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = 414.91, 
            ["y"] = -644.42, 
            ["z"] = 32.04, 
            ["rotationX"] = -30.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -60.40157422423 
        }
    },
    ["LSIA (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1034.87, -2676.14, 13.83)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1037.76, -2667.15, 13.90), 
                ["heading"] = 239.27
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -1038.39, 
            ["y"] = -2676.99, 
            ["z"] = 13.83, 
            ["rotationX"] = 0.0, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 0.0
        }
    },
    ["ALTA (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(275.81, -344.89, 45.17)
            },
            ["vehicle"] = {
                ["position"] = vector3(288.03, -342.09, 44.92), 
                ["heading"] = 160.0
            }
        },
        ["camera"] = {
            ["x"] = 291.06, 
            ["y"] = -349.99, 
            ["z"] = 48.04, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 20.40157422423 
        }
    },
    ["MISSION ROW (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(452.11, -1075.78, 29.21)
            },
            ["vehicle"] = {
                ["position"] = vector3(449.84, -1065.81, 29.21), 
                ["heading"] = 90.0
            }
        },
        ["camera"] = {
            ["x"] = 444.57, 
            ["y"] = -1062.59, 
            ["z"] = 32.32, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -120.40157422423 
        }
    },
    ["MEGA MALL (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(49.93, -1734.65, 29.4)
            },
            ["vehicle"] = {
                ["position"] = vector3(50.15, -1728.19, 29.4), 
                ["heading"] = 322.11
            }
        },
        ["camera"] = {
            ["x"] = 50.38, 
            ["y"] = -1719.5, 
            ["z"] = 33.64, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 180.40157422423 
        }
    },
    ["BAYTREE CANYON (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(287.66, 962.8, 211.32)
            },
            ["vehicle"] = {
                ["position"] = vector3(284.43, 966.42, 211.32), 
                ["heading"] = 356.42
            }
        },
        ["camera"] = { 
            ["x"] = 280.37, 
            ["y"] = 974.43, 
            ["z"] = 215.94, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 210.40157422423 
        }
    },
    ["GRAPESEED (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1691.01, 4785.0, 42)
            },
            ["vehicle"] = {
                ["position"] = vector3(1691.18, 4795.78, 42), 
                ["heading"] = 139.75
            }
        },
        ["camera"] = { 
            ["x"] = 1691.29, 
            ["y"] = 4786.16, 
            ["z"] = 45.88, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0, 
            ["rotationZ"] = 0.40157422423 
        }
    },
    ["SANDY (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1738.16, 3710.76, 34.3)
            },
            ["vehicle"] = {
                ["position"] = vector3(1737.84, 3719.28, 34), 
                ["heading"] = 21.22
            }
        },
        ["camera"] = { 
            ["x"] = 1741.22, 
            ["y"] = 3728.74, 
            ["z"] = 37.41, 
            ["rotationX"] = -10.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 155.0
        }
    },
    ["PALETO MECHANIC (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(105.359, 6613.586, 32.5)
            },
            ["vehicle"] = {
                ["position"] = vector3(114.31, 6613.03, 32), 
                ["heading"] = 226.76
            }
        },
        ["camera"] = { 
            ["x"] = 124.22, 
            ["y"] = 6608.71, 
            ["z"] = 35.93, 
            ["rotationX"] = -5.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 65.40157422423 
        }
    },
    ["VESPUCCI (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1199.43, -1483.47, 4.5)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1177.5, -1480.86, 4.5), 
                ["heading"] = 213.62
            }
        },
        ["camera"] = { 
            ["x"] = -1169.5, 
            ["y"] = -1487.24, 
            ["z"] = 7.1, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.00, 
            ["rotationZ"] = 40.40157422423 
        }
    },
    ["PRISON (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1865.96, 2706.25, 46.00)
            },
            ["vehicle"] = {
                ["position"] = vector3(1861.06, 2704.99, 46.00), 
                ["heading"] = 187.11
            }
        },
        ["camera"] = { 
            ["x"] = 1856.21, 
            ["y"] = 2697.22, 
            ["z"] = 49.13, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 00.00, 
            ["rotationZ"] = -50.40157422423 
        }
    },
    ["PALETO LODGE (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-769.22, 5593.27, 33.50)
            },
            ["vehicle"] = {
                ["position"] = vector3(-778.89, 5578.65, 33.50), 
                ["heading"] = 179.97
            }
        },
        ["camera"] = { 
            ["x"] = -771.71, 
            ["y"] = 5568.22, 
            ["z"] = 35.58, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.00, 
            ["rotationZ"] = 30.40157422423 
        }
    },
    ["PALETO TOWN (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-341.02, 6240.42, 31.5)
            },
            ["vehicle"] = {
                ["position"] = vector3(-339.37, 6248.04, 31.50), 
                ["heading"] = 315.01
            }
        },
        ["camera"] = { 
            ["x"] = -332.7, 
            ["y"] = 6257.21, 
            ["z"] = 34.00, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.00, 
            ["rotationZ"] = 150.40157422423 
        }
    },
    ["CHUMASH (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-3143.81, 1051.23, 21.00)
            },
            ["vehicle"] = {
                ["position"] = vector3(-3149.92, 1059.77, 21.00), 
                ["heading"] = 338.52
            }
        },
        ["camera"] = { 
            ["x"] = -3150.04, 
            ["y"] = 1072.72, 
            ["z"] = 25.03, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 190.40157422423 
        }
    },
    ["TEQUI-LA-LA (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-570.39, 313.67, 84.50)
            },
            ["vehicle"] = {
                ["position"] = vector3(-566.73, 317.34, 84.50), 
                ["heading"] = 353.50
            }
        },
        ["camera"] = { 
            ["x"] = -568.27, 
            ["y"] = 326.57, 
            ["z"] = 86.11, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 25, 
            ["rotationZ"] = 190.40157422423 
        }
    },
    ["RACETRACK (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1212.31, 339.94, 82.3)
            },
            ["vehicle"] = {
                ["position"] = vector3(1199.02, 330.92, 82.3), 
                ["heading"] = 144.86
            }
        },
        ["camera"] = { 
            ["x"] = 1197.72, 
            ["y"] = 322.72, 
            ["z"] = 83.94, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -10.40157422423 
        }
    },
    ["FIRESTATION (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1171.76, -1523.99, 34.80)
            },
            ["vehicle"] = {
                ["position"] = vector3(1178.16, -1525.05, 34.80), 
                ["heading"] = 0.08
            }
        },
        ["camera"] = { 
            ["x"] = 1171.66, 
            ["y"] = -1508.07, 
            ["z"] = 38.07, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -160.40157422423 
        }
    },
    ["WINERY (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1890.28, 2044.38, 140.87)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1903.49, 2055.24, 140.70), 
                ["heading"] = 152.26
            }
        },
        ["camera"] = { 
            ["x"] = -1908.18, 
            ["y"] = 2066.18, 
            ["z"] = 142.85, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -160.40157422423 
        }
    },
    ["PORGINI MANSION (PRIVATE)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1415.97, 1115.66, 113.87)
            },
            ["vehicle"] = {
                ["position"] = vector3(1414.69, 1117.41, 114.13), 
                ["heading"] = 89.88
            }
        },
        ["camera"] = { 
            ["x"] = 1402.05, 
            ["y"] = 1124.72, 
            ["z"] = 120.76, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -130.40157422423 
        }
    },
    ["VIPERS MC (PRIVATE)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(956.03, -122.92, 74.35)
            },
            ["vehicle"] = {
                ["position"] = vector3(955.43, -126.57, 74.35), 
                ["heading"] = 223.06
            }
        },
        ["camera"] = { 
            ["x"] = 953.31, 
            ["y"] = -133.47, 
            ["z"] = 76.25, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -13.40157422423 
        }
    },
    ["GROVE STREET (PRIVATE)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(171.8, -1852.77, 23.7)
            },
            ["vehicle"] = {
                ["position"] = vector3(164.24, -1864.75, 23.5), 
                ["heading"] = 153.75
            }
        },
        ["camera"] = { 
            ["x"] = 162.85, 
            ["y"] = -1871.31, 
            ["z"] = 24.69, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -10.40157422423 
        }
    },
    ["WASTELANDER (PRIVATE)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(2415.35, 5005.29, 45.50)
            },
            ["vehicle"] = {
                ["position"] = vector3(2413.42, 4991.24, 45.40), 
                ["heading"] = 133.03
            }
        },
        ["camera"] = { 
            ["x"] = 2410.87, 
            ["y"] = 4985.46, 
            ["z"] = 47.22, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -25.40157422423 
        }
    },
    ["HANDIES (PRIVATE)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-471.18, -1714.28, 18.00)
            },
            ["vehicle"] = {
                ["position"] = vector3(-465.79, -1719.12, 18.00), 
                ["heading"] = 290.31
            }
        },
        ["camera"] = { 
            ["x"] = -458.63, 
            ["y"] = -1711.75, 
            ["z"] = 21.2, 
            ["rotationX"] = 0.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 130.40157422423 
        }
    },
    ["CASTILLO (PRIVATE)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1805.05, 400.69, 112.01)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1805.27, 398.12, 112.01), 
                ["heading"] = 104.99
            }
        },
        ["camera"] = { 
            ["x"] = -1815.1, 
            ["y"] = 392.26, 
            ["z"] = 116.83, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -60.40157422423 
        }
    },
    ["O'Neil (PRIVATE)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(3804.49, 4447.19, 3.06)
            },
            ["vehicle"] = {
                ["position"] = vector3(3801.03, 4458.12, 4.35), 
                ["heading"] = 79.47
            }
        },
        ["camera"] = { 
            ["x"] = 3777.77,
            ["y"] = 4468.09, 
            ["z"] = 13.0, 
            ["rotationX"] = -30.0, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 270.0
        }
    },
    ["Rockford Hills (PRIVATE)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-673.19, -168.64, 36.68)
            },
            ["vehicle"] = {
                ["position"] = vector3(-669.9, -174.32, 37.26), 
                ["heading"] = 172.43
            }
        },
        ["camera"] = { 
            ["x"] = -670.94, 
            ["y"] = -185.46, 
            ["z"] =  45.00, 
            ["rotationX"] = -45.00, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 360.00
        }
    },
    ["PRIVATE"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-689.43, -881.77, 23.5)
            },
            ["vehicle"] = {
                ["position"] = vector3(-686.6, -878.85, 23.79), 
                ["heading"] = 269.02
            }
        },
        ["camera"] = { 
            ["x"] = -678.41, 
            ["y"] = -888.52, 
            ["z"] = 28.93, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 50.40157422423 
        }
    },
    ["LSIA AIRPORT (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1617.14, -3145.52, 14.0)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1657.99, -3134.38, 14.0), 
                ["heading"] = 330.11
            }
        },
        ["camera"] = { 
            ["x"] = -1665.58, 
            ["y"] = -3115.81, 
            ["z"] = 20.02, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 190.40157422423 
        }
    },
    ["SANDY AIRPORT (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1723.84, 3288.29, 41.20)
            },
            ["vehicle"] = {
                ["position"] = vector3(1710.85, 3259.06, 41.10), 
                ["heading"] = 104.66
            }
        },
        ["camera"] = { 
            ["x"] = 1693.13, 
            ["y"] = 3242.59, 
            ["z"] = 46.01, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -40.40157422423 
        }
    },
    ["GRAPESEED AIRPORT (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(2152.83, 4797.03, 41.3)
            },
            ["vehicle"] = {
                ["position"] = vector3(2122.72, 4804.85, 41.3), 
                ["heading"] = 115.04
            }
        },
        ["camera"] = { 
            ["x"] = 2095.14, 
            ["y"] = 4814.03, 
            ["z"] = 48.91, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 250.000 
        }
    },
    ["VESPUCCI MARINA DOCK (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-805.79, -1496.66, 1.60)
            },
            ["vehicle"] = {
                ["position"] = vector3(-814.15, -1487.77, 1.79), 
                ["heading"] = 100.12
            }
        },
        ["camera"] = { 
            ["x"] = -821.05, 
            ["y"] = -1477.54, 
            ["z"] = 4.00, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 200.40157422423 
        }
    },
    ["ALAMO SEA DOCK (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1338.71, 4225.71, 33.92)
            },
            ["vehicle"] = {
                ["position"] = vector3(1336.43, 4216.05, 33.11), 
                ["heading"] = 268.00
            }
        },
        ["camera"] = { 
            ["x"] = 1340.59, 
            ["y"] = 4196.18, 
            ["z"] = 35.63, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 0.40157422423 
        }
    },
    ["PALETO DOCK (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-275.53, 6638.14, 7.47)
            },
            ["vehicle"] = {
                ["position"] = vector3(-292.24, 6648.27, 2.72), 
                ["heading"] = 136.00
            }
        },
        ["camera"] = { 
            ["x"] = -292.66, 
            ["y"] = 6652.88, 
            ["z"] = 4.32, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -150.000 
        }
    },
    ["SAN CHIANSKI DOCK (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(3852.49, 4462.99, 2.75)
            },
            ["vehicle"] = {
                ["position"] = vector3(3856.19, 4453.94, 1.9), 
                ["heading"] = 274.08
            }
        },
        ["camera"] = { 
            ["x"] = 3870.75, 
            ["y"] = 4447.21, 
            ["z"] = 6.38, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 50.40157422423 
        }
    },
    ["BARBARENO DOCK (PUBLIC)"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-3424.59, 980.97, 8.4)
            },
            ["vehicle"] = {
                ["position"] = vector3(-3418.0, 1009.0, 1.8), 
                ["heading"] = 90.0
            }
        },
        ["camera"] = { 
            ["x"] = -3443.1, 
            ["y"] = 1023.72, 
            ["z"] = 10.351, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -120.40157422423 
        }
    },
    ["TheTahitian"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-28.73, -1514.74, 30.80)
            },
            ["vehicle"] = {
                ["position"] = vector3(-30.72, -1523.47, 30.60), 
                ["heading"] = 227.27
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -22.13, 
            ["y"] = -1528.59, 
            ["z"] = 33.71, 
            ["rotationX"] = -30.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 60.40157422423 
        }
    },
    ["TheCornerSuites"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-573.69, -821.6, 26.60)
            },
            ["vehicle"] = {
                ["position"] = vector3(-579.72, -824.44, 26.50), 
                ["heading"] = 158.77
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -573.65, 
            ["y"] = -831.54, 
            ["z"] = 29.92, 
            ["rotationX"] = -30.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 60.40157422423 
        }
    },
    ["EclipseTowers"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-795.96, 331.83, 85.9)
            },
            ["vehicle"] = {
                ["position"] = vector3(-800.496, 333.468, 85.5), 
                ["heading"] = 180.494
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -798.25, 
            ["y"] = 322.87, 
            ["z"] = 87.81, 
            ["rotationX"] = -30.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 0.40157422423 
        }
    },
    ["TinselTowers"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-567.36, 59.87, 49.42)
            },
            ["vehicle"] = {
                ["position"] = vector3(-564.66, 56.71, 49.42), 
                ["heading"] = 256.6
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -555.19, 
            ["y"] = 47.2, 
            ["z"] = 52.16, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 40.40157422423 
        }
    },
    ["HLMVinewood"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-562.34, 154.53, 64.00)
            },
            ["vehicle"] = {
                ["position"] = vector3(-567.50, 152.52, 62.5), 
                ["heading"] = 266.86
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -557.83, 
            ["y"] = 147.34, 
            ["z"] = 67.89, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 40.40157422423 
        }
    },
    ["HLMLittleSeoul"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-721.46, -733.25, 27.2)
            },
            ["vehicle"] = {
                ["position"] = vector3(-717.47, -738.38, 27.5), 
                ["heading"] = 89.55
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -722.49, 
            ["y"] = -731.72, 
            ["z"] = 28.27, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 220.40157422423 
        }
    },
    ["LeBurton"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-436.03, -101.17, 40.00)
            },
            ["vehicle"] = {
                ["position"] = vector3(-437.65, -106.08, 39.30), 
                ["heading"] = 37.49
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = -455.46, 
            ["y"] = -98.28, 
            ["z"] = 45.99, 
            ["rotationX"] = -20.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 240.40157422423 
        }
    }
    
}


Config.Labels = {
    ["menu"] = "Press ~INPUT_CONTEXT~ to view garage %s",
    ["vehicle"] = "Press ~INPUT_CONTEXT~ to store '%s' in garage"
}

Config.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

Config.AllowedImpoundJob =  'mecano' -- Select what job can impound vehicles

Config.Impound = {
	RetrieveLocation = { x = 409.6, y = -1623.4, z = 28.30 },
	StoreLocation = { x = 402.49, y = -1634.40, z = 28.30 },
    SpawnLocation = vector3(402.49, -1634.40, 28.86),
    RetrieveLocation2 = { x = 545.58, y = -58.54, z = 70.1 },
	StoreLocation2 = { x = 545.5, y = -51.08, z = 70.1 },
    SpawnLocation2 = vector3(553.15, -60.81, 70.1),
    RetrieveLocation3 = { x = -234.89, y = 6198.73, z = 31.0 },
	StoreLocation3 = { x = -221.65, y = 6207.75, z = 30.5 },
	SpawnLocation3 = vector3(-231.22, 6197.63, 31.0)
}

Config.PlaneImpound = {
    RetrieveLocation1 = { x = -1253.53, y = -3405.7, z = 13.00 },
    SpawnLocation1 = vector3(-1272.27, -3382.46, 12.94),
    RetrieveLocation2 = vector3(1747.43, 3296.16, 40.14),
    SpawnLocation2 = { x = 1710.85, y = 3259.06, z = 40.69 }
}

Config.BoatImpound = {
    RetrieveLocation1 = { x = -738.67, y = -1400.43, z = 4.0 },
    SpawnLocation1 = vector3(-738.33, -1381.51, 0.12),
    RetrieveLocation2 = vector3(1299.36, 4217.93, 32.91),
    SpawnLocation2 = { x = 1294.35, y = 4226.31, z = 29.86 },
    RetrieveLocation3 = vector3(-270.2, 6642.43, 6.36),
    SpawnLocation3 = { x = -290.38, y = 6638.54, z = -0.47477427124977 }
}