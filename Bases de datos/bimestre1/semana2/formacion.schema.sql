CREATE TABLE IF NOT EXISTS "courses"(
    "code_course" INTEGER,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "cost" NUMERIC NOT NULL,
    PRIMARY KEY ("code_course")
);

CREATE TABLE IF NOT EXISTS "prerequisitos"(
    "id" INTEGER,
    "pre_course" INTEGER NOT NULL,
    "code_course" INTEGER NOT NULL,
    "type" TEXT NOT NULL CHECK ("type" IN ("obligatorio", "recomendable")),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("pre_course") REFERENCES "courses"("code_course"),
    FOREIGN KEY ("code_course") REFERENCES "courses"("code_course")
);

CREATE TABLE IF NOT EXISTS "courses_editions"(
    "id" INTEGER,
    "teacher_id" INTEGER NOT NULL, 
    "code_course" INTEGER NOT NULL,
    "place" TEXT NOT NULL,
    "date" NUMERIC NOT NULL,
    "schedule" NUMERIC NOT NULL,
    FOREIGN KEY ("code_course") REFERENCES "courses"("code_course")
    FOREIGN KEY ("teacher_id") REFERENCES "employees"("employe_id")
);

CREATE TABLE IF NOT EXISTS "courses_attendess"(
    "id" INTEGER,
    "courses_edition_id" INTEGER NOT NULL,
    "employee_id" INTEGER NOT NULL,
    FOREIGN KEY ("employee_id") REFERENCES "employees"("employe_id")
);

CREATE TABLE IF NOT EXISTS "employees"(
    "employe_id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "nif" INTEGER NOT NULL,
    "birth_date" NUMERIC NOT NULL,
    "nationality" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "signature" TEXT NOT NULL,
    "salary" NUMERIC NOT NULL,
    "instruct_capacity" TEXT NOT NULL,
    PRIMARY KEY ("employe_id")
);