-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/NHJaUX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS order_details;

CREATE TABLE "orders" (
    "id" SERIAL   NOT NULL,
    "restaurant_id" int   NOT NULL,
    "user_id" int   NOT NULL,
    CONSTRAINT "pk_orders" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "restaurants" (
    "id" SERIAL   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "address_id" int   NOT NULL,
    CONSTRAINT "pk_restaurants" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "menu_items" (
    "id" SERIAL   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "price" varchar(255)   NOT NULL,
    "restaurant_id" int   NOT NULL,
    CONSTRAINT "pk_menu_items" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "users" (
    "id" SERIAL   NOT NULL,
    "username" varchar(255)   NOT NULL,
    "password" varchar(255)   NOT NULL,
    "address_id" int   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "addresses" (
    "id" SERIAL   NOT NULL,
    "line_1" varchar(255)   NOT NULL,
    "city" varchar(255)   NOT NULL,
    "state" varchar(255)   NOT NULL,
    "zipcode" varchar(255)   NOT NULL,
    CONSTRAINT "pk_addresses" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "order_details" (
    "id" SERIAL   NOT NULL,
    "order_id" int  NOT NULL,
    "menu_item_id" int   NOT NULL,
    "quantity" int   NOT NULL,
    CONSTRAINT "pk_order_details" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_restaurant_id" FOREIGN KEY("restaurant_id")
REFERENCES "restaurants" ("id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "restaurants" ADD CONSTRAINT "fk_restaurants_address_id" FOREIGN KEY("address_id")
REFERENCES "addresses" ("id");

ALTER TABLE "menu_items" ADD CONSTRAINT "fk_menu_items_restaurant_id" FOREIGN KEY("restaurant_id")
REFERENCES "restaurants" ("id");

ALTER TABLE "users" ADD CONSTRAINT "fk_users_address_id" FOREIGN KEY("address_id")
REFERENCES "addresses" ("id");

ALTER TABLE "order_details" ADD CONSTRAINT "fk_order_details_order_id" FOREIGN KEY("order_id")
REFERENCES "orders" ("id");

ALTER TABLE "order_details" ADD CONSTRAINT "fk_order_details_menu_item_id" FOREIGN KEY("menu_item_id")
REFERENCES "menu_items" ("id");

