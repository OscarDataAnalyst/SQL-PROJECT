CREATE TABLE production.categories (
	category_id INT not null generated always as IDENTITY (increment by 1) PRIMARY KEY,
	category_name VARCHAR (255) NOT NULL
);

CREATE TABLE production.brands (
	brand_id INT not null generated always as IDENTITY (increment by 1) PRIMARY KEY,
	brand_name VARCHAR (255) NOT NULL
);

CREATE TABLE production.products (
	product_id INT not null generated always as IDENTITY (increment by 1) PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	model_year SMALLINT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES production.categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES production.brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE production.stocks (
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id),
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);