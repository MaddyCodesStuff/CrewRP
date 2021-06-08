UPDATE `job_grades`
SET `salary` = 100
WHERE `job_name` = 'unemployed';

UPDATE `job_grades`
SET `label` = 'Minimum Wage'
WHERE `job_name` = 'unemployed';

UPDATE `job_grades`
SET `salary` = 15
WHERE `job_name` = 'fisherman'
   OR `job_name` = 'fueler'
   OR `job_name` = 'busdriver';

UPDATE `job_grades`
SET `salary` = 15
WHERE `job_name` = 'busdriver';

UPDATE `job_grades`
SET `salary` = 45
WHERE `job_name` = 'tailor';

UPDATE `job_grades`
SET `salary` = 65
WHERE `job_name` = 'mecano';

UPDATE `job_grades`
SET `salary` = 95
WHERE `job_name` = 'taxi';

UPDATE `job_grades`
SET `salary` = 140
WHERE `job_name` = 'storeclerk';

UPDATE `job_grades`
SET `salary` = 100
WHERE `job_name` = 'unemployed';

UPDATE `job_grades`
SET `salary` = 200
WHERE `name` = 'defender'
   OR `name` = 'prosecutor';

UPDATE `job_grades`
SET `salary` = 300
WHERE `job_name` = 'lawyer'
  AND `name` = 'boss';

UPDATE `job_grades`
SET `salary` = 200
WHERE `name` = 'therapist'
   OR `name` = 'manager';

UPDATE `job_grades`
SET `salary` = 300
WHERE `job_name` = 'services'
  AND `name` = 'boss';
