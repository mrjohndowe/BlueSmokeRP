
ALTER TABLE `players` ADD `ownedskills` LONGTEXT NOT NULL;

ALTER TABLE `players` ADD `skillsinfo` LONGTEXT NOT NULL;

UPDATE `players` SET `skillsinfo`='{"skillpoints":0, "skillxp":0, "nextlevel":100, "currentlevel":0}';



CREATE TABLE `core_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(15) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `value1` varchar(50) NOT NULL,
  `value2` varchar(50) NOT NULL,
  `value3` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


