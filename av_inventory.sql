CREATE TABLE `av_inventory` (
  `owner` varchar(255) NOT NULL,
  `type` varchar(128) NOT NULL,
  `inventorydata` longtext NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `av_inventory`
  ADD PRIMARY KEY (`owner`);
COMMIT;


ALTER TABLE `items`
	ADD COLUMN `price` int(11) NOT NULL DEFAULT 0
;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`, `price`) VALUES 
('WEAPON_FLASHLIGHT', 'Lanterna', 1, 0, 1, 0),
('WEAPON_STUNGUN', 'Taser', 100, 1, 1, 0),
('WEAPON_KNIFE', 'Knife', 100, 1, 1, 0),
('WEAPON_BAT', 'Baseball Bat', 1, 0, 1, 0),
('WEAPON_PISTOL', 'Pistola', 100, 1, 1, 0),
('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, 0, 1, 0),
('9mm_rounds', '9mm Rounds', 20, 0, 1, 0),
('shotgun_shells', 'Shotgun Shells', 20, 0, 1, 0)
;

CREATE TABLE `user_fastItems` (
  `id` int(11) NOT NULL,
  `identifier` varchar(250) NOT NULL,
  `weapon` varchar(250) NOT NULL,
  `slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `user_fastItems`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `user_fastItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;