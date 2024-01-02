CREATE TABLE swiggy(
   restaurant_no   INTEGER  NOT NULL,
   restaurant_name VARCHAR(50) NOT NULL,
   city            VARCHAR(9) NOT NULL,
   address         VARCHAR(204),
   rating          NUMERIC(3,1) NOT NULL,
   cost_per_person INTEGER ,
   cuisine         VARCHAR(49) NOT NULL,
   restaurant_link VARCHAR(136) NOT NULL,
   menu_category   VARCHAR(66),
   item            VARCHAR(188),
   price           VARCHAR(12) NOT NULL,
   veg_or_nonveg   VARCHAR(7)
);