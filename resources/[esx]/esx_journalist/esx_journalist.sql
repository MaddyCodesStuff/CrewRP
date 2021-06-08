SET @job_name = 'journalist';
SET @society_name = 'society_journalist';
SET @job_Name_Caps = 'journalist';

INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1);

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1);

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1);

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 0);

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'trainee', 'Trainee', 175, '{}', '{}'),
  (@job_name, 1, 'reporter', 'Reporter', 175, '{}', '{}'),
  (@job_name, 2, 'investigator', 'Investigator', 175, '{}', '{}'),
  (@job_name, 3, 'boss', 'Editorial Staff', 175, '{}', '{}');