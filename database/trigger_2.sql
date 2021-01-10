CREATE TRIGGER `before_delete_annonce` BEFORE DELETE ON `T_annonce` FOR EACH ROW 
BEGIN
	DELETE FROM `T_photo` WHERE `P_annonce`=OLD.`A_idannonce`;
    DELETE FROM `T_message` WHERE `M_idannonce`=OLD.`A_idannonce`;
END; 