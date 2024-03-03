DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	primary key (project_id)
	);
	
CREATE TABLE material (
	material_id INT NOT NULL,
	project_id INT NOT NULL,
	material_name varchar(128) NOT NULL,
	num_required INT,
	cost decimal (7,2),
	primary key (material_id),
	foreign key (project_id) references project (project_id) ON DELETE CASCADE
	);
	
CREATE TABLE step (
	step_id INT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	primary key (step_id),
	foreign key (project_id) references project (project_id) ON DELETE CASCADE
	);
	
CREATE TABLE category (
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	primary key (category_id)
	);
	
CREATE TABLE project_category (
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
	);