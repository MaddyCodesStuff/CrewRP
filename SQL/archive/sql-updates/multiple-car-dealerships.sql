INSERT INTO `jobs` (`name`, `label`, `whitelisted`)
VALUES ('cardealer2', 'Car Dealer (Paleto)', 1),
       ('cardealer3', 'Car Dealer (Sandy)', 1);
UPDATE `jobs`
SET `label` = 'Car Dealer (PDM)'
WHERE `name` = 'cardealer';
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('cardealer2', 0, 'recruit', 'Recruit', 75, '{}', '{}'),
       ('cardealer2', 1, 'novice', 'Novice', 125, '{}', '{}'),
       ('cardealer2', 2, 'experienced', 'Expert', 175, '{}', '{}'),
       ('cardealer2', 3, 'boss', 'Boss', 200, '{}', '{}'),
       ('cardealer3', 0, 'recruit', 'Recruit', 75, '{}', '{}'),
       ('cardealer3', 1, 'novice', 'Novice', 125, '{}', '{}'),
       ('cardealer3', 2, 'experienced', 'Expert', 175, '{}', '{}'),
       ('cardealer3', 3, 'boss', 'Boss', 200, '{}', '{}');
ALTER TABLE `cardealer_vehicles`
    ADD COLUMN `society` varchar(255) NOT NULL;
INSERT INTO `addon_account` (`name`, `label`, `shared`)
VALUES ('society_cardealer2', 'Car Dealer (Paleto)', 1),
       ('society_cardealer3', 'Car Dealer (Sandy)', 1);
ALTER TABLE `vehicles`
    ADD COLUMN `shops` varchar(255) NOT NULL;
UPDATE `vehicles`
SET `shops` = 'cardealer'
WHERE `model` IN (
                  'brioso',
                  'jackal',
                  'cogcabrio',
                  'windsor',
                  'windsor2',
                  'exemplar',
                  'hotknife',
                  'chino2',
                  'coquette3',
                  'faction2',
                  'blazer3',
                  'caddy',
                  'brawler',
                  'blazer5',
                  'bifta',
                  'freecrawler',
                  'stafford',
                  'surge',
                  'superd',
                  'cog55',
                  'ruston',
                  'rapidgt2',
                  'rapidgt',
                  'schlagen',
                  'raiden',
                  'sentinel3',
                  'schafter3',
                  'alpha',
                  'tropos',
                  'elegy2',
                  'feltzer2',
                  'flashgt',
                  'furoregt',
                  'dominator3',
                  'coquette',
                  'verlierer2',
                  'banshee',
                  'bestiagts',
                  'buffalo2',
                  'carbonizzare',
                  'comet2',
                  'comet3',
                  'comet5',
                  'gb200',
                  'tampa2',
                  'seven70',
                  'lynx',
                  'mamba',
                  'massacro',
                  'ninef',
                  'specter',
                  'massacro2',
                  'streiter',
                  'neon',
                  'pariah',
                  'jester',
                  'jester2',
                  'khamelion',
                  'ninef2',
                  'specter2',
                  'stinger',
                  'stingergt',
                  'turismo2',
                  'ztype',
                  'torero',
                  'jester3',
                  'btype3',
                  'btype2',
                  'feltzer3',
                  'btype',
                  'monroe',
                  'gt500',
                  'casco',
                  'cheetah2',
                  'coquette2',
                  'infernus',
                  'visione',
                  't20',
                  'reaper',
                  'cheetah',
                  'adder',
                  'autarch',
                  'osiris',
                  'sc1',
                  'cyclone',
                  'prototipo',
                  'vacca',
                  'pfister811',
                  'tyrus',
                  'zentorno',
                  'turismor',
                  'sheava',
                  'nero2',
                  'fmj',
                  'entityxf',
                  'voltic',
                  'banshee2',
                  'dubsta2',
                  'hakuchou2',
                  'vindicator',
                  'bati2',
                  'bati',
                  'cruiser',
                  'fixter',
                  'tribike3',
                  'bmx',
                  'pdoracle',
                  'polsadrt',
                  'pddetcrownvic',
                  'policecart',
                  'pdtransport',
                  'pdtaurus',
                  'pdtahoe',
                  'pddetchevy',
                  'pdchargerb',
                  'pdchargerc',
                  'pdchargera',
                  'pdchargerd',
                  'pdchargere',
                  'pdchargerf',
                  'pdchallenger',
                  'emsexplorer',
                  'fdlcrumpo'
    );

UPDATE `vehicles`
SET `shops` = 'cardealer2'
WHERE `model` IN (
                  'dilettante',
                  'prairie',
                  'issi2',
                  'panto',
                  'issi3',
                  'blista',
                  'oracle',
                  'felon',
                  'zion2',
                  'zion',
                  'sentinel',
                  'felon2',
                  'oracle2',
                  'sentinel2',
                  'lurcher',
                  'slamvan',
                  'hermes',
                  'slamvan3',
                  'nightshade',
                  'picador',
                  'gauntlet',
                  'faction3',
                  'buccaneer',
                  'buccaneer2',
                  'ellie',
                  'dominator',
                  'virgo',
                  'sabregt2',
                  'virgo2',
                  'faction',
                  'ruiner',
                  'yosemite',
                  'sabregt',
                  'blade',
                  'chino',
                  'virgo3',
                  'riata',
                  'kalahari',
                  'washington',
                  'fagaloa',
                  'primo',
                  'intruder',
                  'premier',
                  'fugitive',
                  'asterope',
                  'asea',
                  'tailgater',
                  'stanier',
                  'cognoscenti',
                  'stretch',
                  'emperor',
                  'schafter2',
                  'primo2',
                  'ingot',
                  'penumbra',
                  'fusilade',
                  'buffalo',
                  'sultan',
                  'kuruma',
                  'omnis',
                  'surano',
                  'viseris',
                  'z190',
                  'savestra',
                  'tornado',
                  'tornado2',
                  'tornado5',
                  'peyote',
                  'michelli',
                  'infernus2',
                  'rapidgt3',
                  'sultanrs',
                  'bullet',
                  'contender',
                  'dubsta',
                  'cavalcade',
                  'cavalcade2',
                  'toros',
                  'fq2',
                  'granger',
                  'rocoto',
                  'baller2',
                  'radi',
                  'seminole',
                  'baller',
                  'patriot2',
                  'patriot',
                  'baller3',
                  'xls',
                  'landstalker',
                  'gresley',
                  'huntley',
                  'thrust',
                  'hakuchou',
                  'double',
                  'vortex',
                  'carbonrs',
                  'pdhwychevy',
                  'pdhwybike',
                  '2015polstang'
    );

UPDATE `vehicles`
SET `shops` = 'cardealer3'
WHERE `model` IN (
                  'rhapsody',
                  'stalion',
                  'phoenix',
                  'tampa',
                  'hustler',
                  'voodoo',
                  '­voodoo2',
                  'dukes',
                  'tulip',
                  'vigero',
                  'vamos',
                  'caddy2',
                  'trophytruck',
                  'blazer4',
                  'blazer',
                  'bfinjection',
                  'tractor',
                  'dune',
                  'tractor2',
                  'trophytruck2',
                  'warrener',
                  'glendale',
                  'regina',
                  'emperor2',
                  'stratum',
                  'futo',
                  'elegy',
                  'tornado3',
                  'tornado4',
                  'tornado5',
                  'manana',
                  'pigalle',
                  'cheburek',
                  'retinue',
                  'mesa3',
                  'mesa',
                  'bobcatxl',
                  'bison',
                  'towtruck',
                  'rancherxl',
                  'taco',
                  'sandking',
                  'guardian',
                  'kamacho',
                  'rebel2',
                  'rebel',
                  'towtruck2',
                  'flatbed',
                  'sadler',
                  'mule',
                  'dubsta3',
                  'gburrito2',
                  'paradise',
                  'youga2',
                  'youga',
                  'rumpo3',
                  'moonbeam2',
                  'moonbeam',
                  'minivan',
                  'journey',
                  'surfer',
                  'burrito3',
                  'gburrito',
                  'camper',
                  'rumpo',
                  'avarus',
                  'zombieb',
                  'sovereign',
                  'AKUMA',
                  'pcj',
                  'gargoyle',
                  'zombiea',
                  'bagger',
                  'enduro',
                  'ruffian',
                  'fcr2',
                  'faggio2',
                  'faggio',
                  'esskey',
                  'wolfsbane',
                  'sanctus',
                  'sanchez2',
                  'sanchez',
                  'manchez',
                  'nightblade',
                  'cliffhanger',
                  'nemesis',
                  'chimera',
                  'vader',
                  'daemon',
                  'daemon2',
                  'hexer',
                  'bf400',
                  'innovation',
                  'diablous',
                  'defiler',
                  'pddodge440',
                  'pdrancher',
                  'pdraptor',
                  'pbus',
                  'pdchevytruck',
                  'pdcrownvic',
                  'riot',
                  'emsbox1',
                  'emsbox2',
                  'emsbox3',
                  'emsbox4',
                  'emsbox5',
                  'emsgranger',
                  'fdlcsand',
                  'emsvapid',
                  'firehazmat'
    );