-- Hard Level Problem


-- Create table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    class INT
);

-- Insert multiple students in one transaction
DO $$
BEGIN
    BEGIN
        INSERT INTO students(name, age, class) VALUES ('Sarthak',20,12);
        INSERT INTO students(name, age, class) VALUES ('Reyansh',21,12);
        INSERT INTO students(name, age, class) VALUES ('Tushar',16,10);

        RAISE NOTICE 'Transaction Successfully Done';
    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'Transaction Failed..! Rolling back all changes.';
            RAISE;
    END;
END;
$$;

SELECT * FROM students;

-- Transaction with Savepoints

BEGIN;  -- Start transaction

-- Savepoint 1: ABC
SAVEPOINT sp1;
INSERT INTO students(name, age, class) VALUES ('ABC',19,12);
DO $$ BEGIN RAISE NOTICE 'Inserted ABC successfully'; END $$;

-- Savepoint 2: ASD (invalid insert)
SAVEPOINT sp2;
DO $$
BEGIN
    BEGIN
        INSERT INTO students(name, age, class) VALUES ('ASD','wrong',12);
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'Failed to insert ASD, rolling back to savepoint sp2';
    END;
END;
$$;
-- Rollback the failed insert in SQL
ROLLBACK TO SAVEPOINT sp2;

-- Savepoint 3: QWE
SAVEPOINT sp3;
INSERT INTO students(name, age, class) VALUES ('QWE',17,10);
DO $$ BEGIN RAISE NOTICE 'Inserted QWE successfully'; END $$;

-- Commit all successful inserts
COMMIT;

SELECT * FROM students;
