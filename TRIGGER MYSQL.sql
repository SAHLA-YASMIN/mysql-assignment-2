create database teachersfield;
use teachersfield;
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL);
    
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice Johnson', 'Mathematics', 5, 5000),
('Bob Smith', 'Physics', 12, 7000),
('Charlie Brown', 'Chemistry', 8, 6000),
('Diana Green', 'Biology', 10, 6500),
('Evan White', 'History', 15, 8000),
('Fiona Black', 'Geography', 4, 4800),
('George Adams', 'English', 9, 6200),
('Hannah Scott', 'Computer Science', 6, 5500);

CREATE TABLE teacher_log (
    log_id SERIAL PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO teachers (name, subject, experience, salary)
VALUES ('John Doe', 'Math', 5, 60000);

Delimiter // 
create trigger before_trigger_teacher
before insert on Teachers
for each row
begin 
if new.Salary < 0 then
signal sqlstate '45000'
set message_text = 'Salary Cannot be Negative';
end if;
end //
delimiter ;

CREATE TABLE Teacher_Log (
    Teacher_ID INT,
    Action VARCHAR(50),
    TimeStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Delimiter //
create trigger After_Insert_Teacher
after insert on Teachers
for each row
begin
insert into Teacher_Log (Teacher_ID, Action, TimeStamp)
values (New.ID,'INSERT',now());
end //
delimiter ;

Delimiter //
create trigger Before_Delete_Teacher
before delete on teachers 
for each row 
begin
if old.Experience > 10 then
signal sqlstate '45000'
set message_text = ' Cannot delete Teacher with experience greater than 10 Years';
end if;
end //
delimiter ;

delimiter //
create trigger Deleting_from_Teachers
after delete on teachers 
for each row
begin
insert into Teacher_Log ( Teacher_ID, Action, Timestamp)
values (old.ID, 'DELETED', now());
end //
delimiter ;