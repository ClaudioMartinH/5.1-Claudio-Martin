CREATE DEFINER = CURRENT_USER TRIGGER `youtube`.`video_AFTER_INSERT` AFTER INSERT ON `video` FOR EACH ROW
BEGIN
update videos set timesReproduced = timesReproduced + 1 
WHERE id = NEW.video_id;
END