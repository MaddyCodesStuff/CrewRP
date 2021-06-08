-- --------------------------------------------------------
-- Host:                         localhost
-- Server versie:                10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versie:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Structuur van  tabel fivem.owned_vehicles wordt geschreven
ALTER TABLE owned_vehicles
ADD (spawnstate tinyint(1) NOT NULL DEFAULT '0',
	garage varchar(200) DEFAULT 'BUS STATION (PUBLIC)' ,
	lockcheck varchar(50) NOT NULL DEFAULT 'no',
  registered varchar(50) NOT NULL DEFAULT 'no',
  impoundprice smallint(6) NOT NULL DEFAULT '0');
  
UPDATE owned_vehicles o SET o.garage = 'LSIA AIRPORT (PUBLIC)' WHERE o.type = 'aircraft';

UPDATE owned_vehicles o SET o.garage = 'VESPUCCI MARINA DOCK (PUBLIC)' WHERE o.type = 'boat';

<<<<<<< HEAD



UPDATE housing h SET h.garage_out = (case when h.name = '1 Fudge Lane' then '{"x":1284.25,"y":-1587.51,"z":50.82}'
		 when h.name = '2 Fudge Lane' then '{"x":1237.11,"y":-1604.42,"z":51.6}'
		 when h.name = '3 Fudge Lane' then '{"x":1253.22,"y":-1608.71,"z":52.4}'
		 when h.name = '4 Fudge Lane' then '{"x":1215.82,"y":-1617.74,"z":47.85}'
		 when h.name = '5 Fudge Lane' then '{"x":1242.42,"y":-1616.66,"z":51.6}'
		 when h.name = '6 Fudge Lane' then '{"x":1210.63,"y":-1635.15,"z":45.70}'
		 when h.name = '7 Fudge Lane' then '{"x":1191.26,"y":-1633.93,"z":42.3}'
		 when h.name = '8 Fudge Lane' then '{"x":1190.56,"y":-1648.57,"z":40.7}'
		 when h.name = '1 Barbareno Rd' then '{"x":-3179.23,"y":1292.96,"z":13.40}'
		 when h.name = '2 Barbareno Rd' then '{"x":-3186.48,"y":1275.85,"z":11.68}'
		 when h.name = '3 Barbareno Rd' then '{"x":-3187.91,"y":1227.9,"z":9.06}'
		 when h.name = '4 Barbareno Rd' then '{"x":-3189.33,"y":1207.67,"z":8.7}'
		 when h.name = '5 Barbareno Rd' then '{"x":-3191.13,"y":1193.94,"z":8.6}'
		 when h.name = '6 Barbareno Rd' then '{"x":-3193.46,"y":1186.9,"z":8.74}'
		 when h.name = '7 Barbareno Rd' then '{"x":-3200.93,"y":1159.76,"z":8.65}'
		 when h.name = '8 Barbareno Rd' then '{"x":-3203.4,"y":1153.51,"z":8.7}'
		 when h.name = '1 East Mirror Park Drive' then '{"x": 1256.33, "y": -425.74, "z": 68.54}'
		 when h.name = '2 East Mirror Park Drive' then '{"x": 1268.68, "y": -460.10, "z": 68.85}'
		 when h.name = '3 East Mirror Park Drive' then '{"x": 1278.26, "y": -471.62, "z": 68.15}'
		 when h.name = '4 East Mirror Park Drive' then '{"x": 1256.06, "y": -496.84, "z": 68.54}'
		 when h.name = '5 East Mirror Park Drive' then '{"x": 1250.72, "y": -518.28, "z": 68.11}'
		 when h.name = '1 Nikola Place' then '{"x": 1305.24, "y": -531.64, "z": 70.50}'
		 when h.name = '2 Nikola Place' then '{"x":1321.16,"y":-537.25,"z":71.3}'
		 when h.name = '3 Nikola Place' then '{"x":1350.4, "y":-551.79,"z":73.25}'
		 when h.name = '4 Nikola Place' then '{"x":1366.51,"y":-556.02,"z":73.8}'
		 when h.name = '3 Procopio Drive' then '{"x":-9.96,"y":6650.38,"z":30.20}'
		 when h.name = '4 Procopio Drive' then '{"x":-14.94,"y":6600.23,"z":30.47}'
		 when h.name = '5 Procopio Drive' then '{"x":-294.52,"y":6333.91,"z":31.5}'
		 when h.name = '6 Procopio Drive' then '{"x":-400.86,"y":6310.76,"z":27.87}'
		 when h.name = '7 Procopio Drive' then '{"x":-427.07,"y":6267.94,"z":29.4}'
		 when h.name = '8 Procopio Drive' then '{"x":-370.95,"y":6207.98,"z":30.7}'
		 when h.name = '9 Procopio Drive' then '{"x":-373.68,"y":6184.31,"z":30.51}'
		 when h.name = '1 Ineseno Road' then '{"x":-3093.45,"y":749.23,"z":20.3}'
		 when h.name = '2 Ineseno Road' then '{"x":-3104.15,"y":724.52,"z":19.75}'
		 when h.name = '3 Ineseno Road' then '{"x":-3076.26,"y":657.01,"z":10.70}'
		 when h.name = '4 Ineseno Road' then '{"x":-3029.83,"y":570.95,"z":6.91}'
		 when h.name = '5 Ineseno Road' then '{"x":-3034.77,"y":553.61,"z":6.51}'
		 when h.name = '6 Ineseno Road' then '{"x":-3035.85,"y":546.65,"z":6.51}'
		 when h.name = '7 Ineseno Road' then '{"x":-3031.69,"y":527.14,"z":6.4}'
		 when h.name = '8 Ineseno Road' then '{"x":-3035.84,"y":495.23,"z":5.90}'
		 when h.name = '9 Ineseno Road' then '{"x":-3042.14,"y":480.80,"z":5.78}'
		 when h.name = '10 Ineseno Road' then '{"x":-3055.84,"y":449.98,"z":5.36}'
		 when h.name = '11 Ineseno Road' then '{"x":-3061.50,"y":439.68,"z":5.36}'
		 when h.name = '12 Ineseno Road' then '{"x":-3074.56,"y":402.52,"z":5.97}'
		 when h.name = '9 Grove Street' then '{"x":94.92,"y":-1921.09,"z":19.8}'
		 when h.name = '3 Roy Lowenstein Blvd' then '{"x":147.61,"y":-1981.51,"z":17.40}'
		 when h.name = '5 Roy Lowenstein Rd' then '{"x":161.32,"y":-1963.52,"z":17.90}'
		 when h.name = '7 Roy Lowenstein Blvd' then '{"x":166.08,"y":-1952.89,"z":18.45}'
		 when h.name = '9 Roy Lowstein Blvd' then '{"x":166.16,"y":-1921.71,"z":20.15}'
		 when h.name = '2 Covenant Ave' then '{"x":188.09,"y":-1881.56,"z":23.70}'
		 when h.name = '4 Covenant Ave' then '{"x":168.66,"y":-1861.69,"z":23.28}'
		 when h.name = '6 Covenant Ave' then '{"x":144.14,"y":-1872.6,"z":23.16}'
		 when h.name = '7 Covenant Ave' then '{"x":135.83,"y":-1891.6,"z":22.65}'
		 when h.name = '5 Covenant Ave' then '{"x":156.01,"y":-1899.63,"z":22.02}'
		 when h.name = '1 Brouge Ave' then '{"x":141.39,"y":-1827.93,"z":26.30}'
		 when h.name = '1 Grove St' then '{"x":13.88,"y":-1846.81,"z":23.2}'
		 when h.name = '10 Grove St' then '{"x":29.86,"y":-1889.23,"z":21.50}'
		 when h.name = '5 Grove St' then '{"x":50.88,"y":-1848.85,"z":21.84}'
		 when h.name = '8 Grove St' then '{"x":12.25,"y":-1884.52,"z":22.24}'
		 when h.name = '6 Grove St' then '{"x":-0.95,"y":-1876.04,"z":22.9}'
		 when h.name = '4 Grove St' then '{"x":-19.39,"y":-1856.84,"z":24.05}'
		 when h.name = '2 Grove St' then '{"x":-34.06,"y":-1855.72,"z":25.05}'
		 when h.name = '7 Grove St' then '{"x":48.92,"y":-1875.82,"z":21.36}'
		 when h.name = '1 North Sheldon Ave' then '{"x":-852.91,"y":788.7,"z":190.73}'
		 when h.name = '3 North Sheldon Ave' then '{"x":-953.71,"y":803.04,"z":176.84}'
		 when h.name = '5 North Sheldon Ave' then '{"x":-1019.61,"y":816.56,"z":171.36}'
		 when h.name = '4 North Sheldon Ave' then '{"x":-967.23,"y":759.94,"z":174.48}'
		 when h.name = '6 North Sheldon Ave' then '{"x":-1105.39,"y":800.09,"z":164.7}'
		 when h.name = '7 North Sheldon Ave' then '{"x":-1123.93,"y":793.11,"z":162.92}'
		 when h.name = '8 North Sheldon Ave' then '{"x":-1200.02,"y":691.7,"z":146.29}'
		 when h.name = '9 North Sheldon Ave' then '{"x":-1241.76,"y":651.8,"z":140.86}'
		 when h.name = '11 North Sheldon Ave' then '{"x":-1288.91,"y":650.91,"z":138.91}'
		 when h.name = '10 North Sheldon Ave' then '{"x":-1288.43,"y":621.76,"z":138.21}'
		 when h.name = '2 North Sheldon Ave' then '{"x":-907.78,"y":779.2,"z":185.55}' end),
 h.garage_spawn = (case when h.name = '1 Fudge Lane' then '{"x":1281.56,"y":-1585.34,"z":51.2,"h":89.99}'
		 when h.name = '2 Fudge Lane' then '{"x":1241.1,"y":-1605.9,"z":52.17,"h":123.27}'
		 when h.name = '3 Fudge Lane' then '{"x":1252.63,"y":-1606.06,"z":52.48,"h":305.61}'
		 when h.name = '4 Fudge Lane' then '{"x":1218.78,"y":-1619.85,"z":48.34,"h":119.15}'
		 when h.name = '5 Fudge Lane' then '{"x":1238.98,"y":-1615.25,"z":51.65,"h":302.59}'
		 when h.name = '6 Fudge Lane' then '{"x":1207.81,"y":-1634.41,"z":45.51,"h":301.73}'
		 when h.name = '7 Fudge Lane' then '{"x":1194.69,"y":-1635.16,"z":42.91,"h":122.75}'
		 when h.name = '8 Fudge Lane' then '{"x":1187.83,"y":-1648.35,"z":40.4,"h":313.39}'
		 when h.name = '1 Barbareno Rd' then '{"x":-3174.56,"y":1298.82,"z":13.55,"h":246.67}'
		 when h.name = '2 Barbareno Rd' then '{"x":-3182.16,"y":1277.05,"z":11.71,"h":255.44}'
		 when h.name = '3 Barbareno Rd' then '{"x":-3186.0,"y":1226.75,"z":9.07,"h":266.97}'
		 when h.name = '4 Barbareno Rd' then '{"x":-3188.52,"y":1203.73,"z":8.5,"h":262.31}'
		 when h.name = '5 Barbareno Rd' then '{"x":-3188.96,"y":1197.44,"z":8.41,"h":270.94}'
		 when h.name = '6 Barbareno Rd' then '{"x":-3192.41,"y":1182.38,"z":8.44,"h":263.31}'
		 when h.name = '7 Barbareno Rd' then '{"x":-3196.68,"y":1160.37,"z":8.66,"h":247.29}'
		 when h.name = '8 Barbareno Rd' then '{"x":-3200.3,"y":1153.51,"z":8.7,"h":248.87}'
		 when h.name = '1 East Mirror Park Drive' then '{"x": 1260.81, "y": -418.36, "z": 68.51, "h": 300.55}'
		 when h.name = '2 East Mirror Park Drive' then '{"x": 1272.05, "y": -462.85, "z": 68.50, "h": 267.31}'
		 when h.name = '3 East Mirror Park Drive' then '{"x": 1278.10, "y":-478.76, "z": 68.38, "h": 165.56}'
		 when h.name = '4 East Mirror Park Drive' then '{"x": 1260.57, "y": -492.39, "z": 68.42, "h": 257.32}'
		 when h.name = '5 East Mirror Park Drive' then '{"x": 1252.57, "y": -522.18, "z": 68.08, "h": 255.05}'
		 when h.name = '1 Nikola Place' then '{"x": 1313.68, "y": -520.4, "z": 70.20, "h": 158.65}'
		 when h.name = '2 Nikola Place' then '{"x":1320.29,"y":-529.22,"z":71.81,"h":160.15}'
		 when h.name = '3 Nikola Place' then '{"x":1359.3,"y":-540.66,"z":73.46,"h":155.94}'
		 when h.name = '4 Nikola Place' then '{"x":1365.27,"y":-548.24,"z":74.03,"h":157.88}'
		 when h.name = '3 Procopio Drive' then '{"x":-15.25,"y":6643.47,"z":30.08,"h":212.68}'
		 when h.name = '4 Procopio Drive' then '{"x":-17.41,"y":6609.75,"z":29.97,"h":42.06}'
		 when h.name = '5 Procopio Drive' then '{"x":-294.64,"y":6339.09,"z":31.25,"h":46.44}'
		 when h.name = '6 Procopio Drive' then '{"x":-394.94,"y":6310.33,"z":28.4,"h":222.47}'
		 when h.name = '7 Procopio Drive' then '{"x":-431.78,"y":6259.93,"z":29.33,"h":256.36}'
		 when h.name = '8 Procopio Drive' then '{"x":-367.43,"y":6199.58,"z":30.55,"h":224.80}'
		 when h.name = '9 Procopio Drive' then '{"x":-375.76,"y":6181.46,"z":30.51,"h":223.58}'
		 when h.name = '1 Ineseno Road' then '{"x":-3097.12,"y":745.40,"z":20.56,"h":236.75}'
		 when h.name = '2 Ineseno Road' then '{"x":-3102.08,"y":715.89,"z":19.89,"h":284.57}'
		 when h.name = '3 Ineseno Road' then '{"x":-3072.09,"y":657.78,"z":10.42,"h":310.66}'
		 when h.name = '4 Ineseno Road' then '{"x":-3027.18,"y":573.52,"z":7.05,"h":193.84}'
		 when h.name = '5 Ineseno Road' then '{"x":-3031.42,"y":555.61,"z":6.51, "h":271.33}'
		 when h.name = '6 Ineseno Road' then '{"x":-3031.39,"y":548.56,"z":6.51,"h":271.98}'
		 when h.name = '7 Ineseno Road' then '{"x":-3028.29,"y":529.94,"z":6.42,"h":263.18}'
		 when h.name = '8 Ineseno Road' then '{"x":-3031.78,"y":498.36,"z":5.79,"h":260.33}'
		 when h.name = '9 Ineseno Road' then '{"x":-3038.06,"y":477.54,"z":5.78,"h":254.56}'
		 when h.name = '10 Ineseno Road' then '{"x":-3052.78,"y":445.38,"z":5.36,"h":244.04}'
		 when h.name = '11 Ineseno Road' then '{"x":-3055.32,"y":439.95,"z":5.36,"h":242.35}'
		 when h.name = '12 Ineseno Road' then '{"x":-3070.36,"y":397.95,"z":5.97,"h":247.32}'
		 when h.name = '9 Grove Street' then '{"x":87.45,"y":-1918.02,"z":19.66,"h":47.26}'
		 when h.name = '3 Roy Lowenstein Blvd' then '{"x":153.11,"y":-1978.33,"z":17.23,"h":142.88}'
		 when h.name = '5 Roy Lowenstein Rd' then '{"x":157.04,"y":-1967.85,"z":17.64,"h":232.69}'
		 when h.name = '7 Roy Lowenstein Blvd' then '{"x":176.8,"y":-1945.34,"z":19.23,"h":233.47}'
		 when h.name = '9 Roy Lowstein Blvd' then '{"x":169.8,"y":-1930.33,"z":20.01,"h":227.97}'
		 when h.name = '2 Covenant Ave' then '{"x":186.99,"y":-1877.37,"z":23.57,"h":152.19}'
		 when h.name = '4 Covenant Ave' then '{"x":163.23,"y":-1866.80,"z":23.32,"h":155.61}'
		 when h.name = '6 Covenant Ave' then '{"x":138.64,"y":-1869.47,"z":23.12,"h":154.78}'
		 when h.name = '7 Covenant Ave' then '{"x":138.6,"y":-1890.64,"z":22.33,"h":334.38}'
		 when h.name = '5 Covenant Ave' then '{"x":159.89,"y":-1896.4,"z":22.45,"h":332.73}'
		 when h.name = '1 Brouge Ave' then '{"x":137.8,"y":-1827.77,"z":26.04,"h":48.03}'
		 when h.name = '1 Grove St' then '{"x":10.89,"y":-1851.01,"z":23.05,"h":144.17}'
		 when h.name = '10 Grove St' then '{"x":33.77,"y":-1892.22,"z":21.21,"h":321.84}'
		 when h.name = '5 Grove St' then '{"x":34.4,"y":-1860.32,"z":21.88,"h":134.71}'
		 when h.name = '8 Grove St' then '{"x":17.88,"y":-1880.34,"z":22.08,"h":318.25}'
		 when h.name = '6 Grove St' then '{"x":2.89,"y":-1874.15,"z":22.73,"h":316.94}'
		 when h.name = '4 Grove St' then '{"x":-21.52,"y":-1850.45,"z":24.13,"h":320.68}'
		 when h.name = '2 Grove St' then '{"x":-25.81,"y":-1848.31,"z":24.55,"h":318.71}'
		 when h.name = '7 Grove St' then '{"x":48.81,"y":-1880.44,"z":21.11,"h":152.66}'
		 when h.name = '1 North Sheldon Ave' then '{"x":-851.35,"y":793.11,"z":190.94,"h":0.28}'
		 when h.name = '3 North Sheldon Ave' then '{"x":-956.08,"y":799.88,"z":177.36,"h":186.97}'
		 when h.name = '5 North Sheldon Ave' then '{"x":-1021.39,"y":812.57,"z":171.13,"h":192.4}'
		 when h.name = '4 North Sheldon Ave' then '{"x":-973.69,"y":772.44,"z":174.15,"h":44.07}'
		 when h.name = '6 North Sheldon Ave' then '{"x":-1107.61,"y":795.87,"z":164.3,"h":183.01}'
		 when h.name = '7 North Sheldon Ave' then '{"x":-1119.32,"y":785.93,"z":162.16,"h":205.26}'
		 when h.name = '8 North Sheldon Ave' then '{"x":-1202.70,"y":687.78,"z":146.23,"h":67.98}'
		 when h.name = '9 North Sheldon Ave' then '{"x": -1237.42, "y":656.12,"z":141.61,"h":311.96}'
		 when h.name = '11 North Sheldon Ave' then '{"x":-1284.29,"y":648.72,"z":138.74,"h":195.48}'
		 when h.name = '10 North Sheldon Ave' then '{"x":-1289.53,"y":626.24,"z":137.64,"h":35.06}'
		 when h.name = '2 North Sheldon Ave' then '{"x":-904.9,"y":786.31,"z":185.02, "h":10.34}' end)

=======
>>>>>>> origin/impounding-but-please-for-the-love-of-god-stop-conflicting
-- Dumpen data van tabel fivem.owned_vehicles: ~3 rows (ongeveer)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
