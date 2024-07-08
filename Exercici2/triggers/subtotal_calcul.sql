CREATE DEFINER = CURRENT_USER TRIGGER `pizzeria`.`orderDetails_BEFORE_INSERT` 
BEFORE INSERT ON `orderDetails` FOR EACH ROW
BEGIN
DECLARE unitPrize DECIMAL(10, 2);
DECLARE subtotal DECIMAL(10, 2);

SELECT unitPrize INTO unitPrize
FROM product
WHERE id = NEW.id;

SET subtotal = NEW.quantity * unitPrize;
SET NEW.subtotal = subtotal;

END
