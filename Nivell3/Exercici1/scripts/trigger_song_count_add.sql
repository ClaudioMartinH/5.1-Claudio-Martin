CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`playlist_AFTER_INSERT` AFTER INSERT ON `playlist` FOR EACH ROW
BEGIN
UPDATE playlist
SET song_count = song_count + 1
WHERE id = NEW.playlist_id;
END