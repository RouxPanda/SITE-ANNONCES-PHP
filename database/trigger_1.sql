CREATE TRIGGER `before_delete_user` BEFORE DELETE ON `T_utilisateur` FOR EACH ROW 
BEGIN
	DELETE FROM `T_annonce` WHERE `A_auteur`=OLD.`U_mail`;
END;