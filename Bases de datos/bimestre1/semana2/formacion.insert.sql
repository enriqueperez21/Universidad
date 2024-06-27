INSERT INTO courses (code_course, name, description, duration, cost)
VALUES (1004, 'Data Analysis with Python', 'Learn data manipulation, visualization, and analysis techniques using Python.', 18, 450.00),
       (1005, 'Introduction to Cybersecurity', 'Understand cybersecurity threats and best practices for data protection.', 10, 250.00),
       (1006, 'Project Management Fundamentals', 'Master project planning, execution, and control techniques.', 14, 300.00),
       (1007, 'Machine Learning Fundamentals', 'Explore basic machine learning concepts and algorithms.', 20, 500.00),
       (1008, 'Software Development with Agile Methodology', 'Learn agile software development principles and practices.', 16, 380.00),
       (1009, 'Cloud Computing Fundamentals', 'Gain an understanding of cloud computing concepts, services, and deployment models.', 12, 280.00),
       (1010, 'Communication Skills for Professionals', 'Develop effective communication skills for a professional setting.', 8, 180.00);

-- Prerequisite for course 1003 (Web Development) is course 1001 (Programming Fundamentals) - mandatory
INSERT INTO prerequisitos (pre_course, code_course, type)
VALUES (1001, 1003, 'obligatorio');

-- Prerequisite for course 1002 (Databases) is course 1001 (Programming Fundamentals) - recommended
INSERT INTO prerequisitos (pre_course, code_course, type)
VALUES (1001, 1002, 'recomendable');

INSERT INTO employees (employe_id, first_name, last_name, address, phone_number, nif, birth_date, nationality, gender, signature, salary, instruct_capacity)
VALUES (1, 'John',     'Doe',         '123 Main St.', 1234567890, 12345678, 19800101, 'American', 'Male', 'Xssdsa Signature',  50000.00, 'yes'),
       (2, 'Jane',     'Smith',       '456 Elm St.',  9876543210, 87654321, 19850714, 'British', 'Famale', 'Xssdsa Signature', 45000.00, 'no'),
       (3, 'Juan',     'Cabezas',     '123 Main St.', 1234567890, 12345678, 19800101, 'American', 'Male', 'Xssdsa Signature',  50000.00, 'yes'),
       (4, 'Jose',     'Carpio',      '456 Elm St.',  9876543210, 87654321, 19850714, 'British', 'Male', 'Xssdsa Signature',   45000.00, 'no'),
       (5, 'Julian',   'Viña',        '123 Main St.', 1234567890, 12345678, 19800101, 'American', 'Male', 'Xssdsa Signature',  50000.00, 'yes'),
       (7, 'Patricio', 'Hernandez',   '456 Elm St.',  9876543210, 87654321, 19850714, 'British', 'Male', 'Xssdsa Signature',   45000.00, 'no'),
       (8, 'Gabriel',  'Alvarez',     '123 Main St.', 1234567890, 12345678, 19800101, 'American', 'Male', 'Xssdsa Signature',  50000.00, 'yes'),
       (9, 'Matias',   'Mejia',       '456 Elm St.',  9876543210, 87654321, 19850714, 'British', 'Male', 'Xssdsa Signature',   45000.00, 'no'),
       (10, 'Leonardo', 'Carpio',      '123 Main St.', 1234567890, 12345678, 19800101, 'American', 'Male', 'Xssdsa Signature',  50000.00, 'yes'),
       (11, 'Josue',    'Rivadeneira', '456 Elm St.',  9876543210, 87654321, 19850714, 'British', 'Male', 'Xssdsa Signature',   45000.00, 'no');

-- Course edition for course 1001 (Programming Fundamentals) taught by John Doe (employee_id 1)
INSERT INTO courses_editions (teacher_id, code_course, place, date, schedule)
VALUES (1, 1001, 'Online Classroom', 20240603, 1800);

-- Course edition for course 1002 (Databases) taught by Jane Smith (employee_id 2)
INSERT INTO courses_editions (teacher_id, code_course, place, date, schedule)
VALUES (2, 1002, 'Company Training Room', 20240715, 1900);