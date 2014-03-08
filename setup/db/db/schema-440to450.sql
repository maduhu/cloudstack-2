-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--   http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.

--
-- Schema upgrade from 4.4.0 to 4.5.0
--

-- Disable foreign key checking
-- SET foreign_key_checks = 0;

INSERT IGNORE INTO `cloud`.`configuration`(category, instance, component, name, value, description, default_value) VALUES ('NetworkManager', 'DEFAULT', 'management-server', 'network.router.EnableServiceMonitoring', 'true', 'service monitoring in router enable/disable option, default true', 'true') ON DUPLICATE KEY UPDATE category='NetworkManager';

ALTER TABLE `cloud`.`volumes` ADD COLUMN `provisioning_type` VARCHAR(32) NOT NULL DEFAULT 'Off' COMMENT 'pre allocation setting of the volume';

INSERT IGNORE INTO `cloud`.`configuration` VALUES ("Storage", 'DEFAULT', 'management-server', "storage.volume.provisioningtype", "thin", "Provisioning type used to create volumes. Valid values are thin, sparse, fat.", "thin", NULL,NULL,0);
j
ALTER TABLE `cloud`.`disk_offering` ADD COLUMN `provisioning_type` VARCHAR(32) NOT NULL DEFAULT 'Off' COMMENT 'pre allocation setting of the volume';
