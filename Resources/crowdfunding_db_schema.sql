-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/P73aK5
DROP TABLE "Category";
DROP TABLE "Subcategory";
DROP TABLE Campaign;
DROP TABLE "Contacts";

CREATE TABLE Category (
    category_id char(4)   NOT NULL,
    category varchar   NOT NULL,
    	PRIMARY KEY (category_id
     )
);

CREATE TABLE Subcategory (
    subcategory_id varchar(8)   NOT NULL,
    subcategory varchar   NOT NULL,
		PRIMARY KEY (
        subcategory_id
     )
);

CREATE TABLE Campaign (
    cf_id int   NOT NULL,
    contact_id int   NOT NULL,
    company_name varchar   NOT NULL,
    description varchar   NOT NULL,
    goal float   NOT NULL,
    pledged float   NOT NULL,
    outcome varchar   NOT NULL,
    backers_count int   NOT NULL,
    country char(2)   NOT NULL,
    currency char(3)   NOT NULL,
    launch_date date   NOT NULL,
    end_date date   NOT NULL,
    category_id char(4)   NOT NULL,
    subcategory_id varchar(8)   NOT NULL,
    	PRIMARY KEY (cf_id),
		FOREIGN KEY (contact_id) REFERENCES Contacts (contact_ID),
		FOREIGN KEY (category_id) REFERENCES Category (category_id),
        FOREIGN KEY (subcategory_id) REFERENCES Subcategory (subcategory_id)
     );

CREATE TABLE Contacts (
    contact_ID int   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    email varchar   NOT NULL,
    	PRIMARY KEY (
        contact_ID
     )
);

COPY Category FROM  'C:\Users\Allison\Desktop\category.csv' WITH delimiter ','  CSV HEADER;
COPY Campaign FROM  'C:\Users\Allison\Downloads\Crowdfunding_ETL\Resources\campaign.csv' WITH delimiter ','  CSV HEADER;
COPY Contacts FROM  'C:\Users\Allison\Downloads\Crowdfunding_ETL\Resources\contacts.csv' WITH delimiter ','  CSV HEADER;
COPY Subcategory FROM  'C:\Users\Allison\Downloads\Crowdfunding_ETL\Resources\subcategory.csv' WITH delimiter ','  CSV HEADER;
