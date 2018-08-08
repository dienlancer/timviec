DROP TABLE IF EXISTS `profile_saved`;
CREATE TABLE `profile_saved` (
  `id` BIGINT(20) NOT NULL,
  `employer_id` INT(11) DEFAULT NULL,
  `profile_id` INT(11) DEFAULT NULL,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `profile_saved`
  ADD PRIMARY KEY (`id`);
  ALTER TABLE `profile_saved`
  MODIFY `id` BIGINT(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
  
  
  
  DROP TABLE IF EXISTS `recruitment_profile`;
DROP TABLE IF EXISTS `profile_applied`;
CREATE TABLE `profile_applied` (
  `id` BIGINT(20) NOT NULL,
  `recruitment_id` INT(11) DEFAULT NULL,
  `profile_id` INT(11) DEFAULT NULL,
  `candidate_id` INT(11) DEFAULT NULL,
  `file_attached` VARCHAR(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` INT(1) DEFAULT NULL,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `profile_applied`
  ADD PRIMARY KEY (`id`);
  
  ALTER TABLE `profile_applied`
  MODIFY `id` BIGINT(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
  
  
  
  DROP TABLE IF EXISTS `candidate_recruitment`;
DROP TABLE IF EXISTS `recruitment_saved`;
CREATE TABLE `recruitment_saved` (
  `id` BIGINT(20) NOT NULL,
  `candidate_id` INT(11) DEFAULT NULL,
  `recruitment_id` INT(11) DEFAULT NULL,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `recruitment_saved`
  ADD PRIMARY KEY (`id`);
  
  ALTER TABLE `recruitment_saved`
  MODIFY `id` BIGINT(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;