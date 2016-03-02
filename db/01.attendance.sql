
CREATE TABLE developers (
	developer_id		serial primary key,
	developer_name		varchar(50),
	user_name			varchar(64),
	user_password		varchar(32),
	joining_date		date,
	details				text
);

CREATE TABLE attendance (
	attendance_id		serial primary key,
	developer_id		integer references developers,
	location_name		varchar(50),
	attendance_date		date,
	attendance_time		time,
	getting_in			boolean default true,
	narrative			varchar(320)
);
CREATE INDEX attendance_developer_id ON attendance(developer_id);


CREATE VIEW tomcat_users AS
	SELECT user_name, user_password, 'user'::varchar(16) as user_role
	FROM developers;

CREATE VIEW vw_attendance AS
SELECT developers.developer_id, developers.developer_name, developers.user_name,
developers.joining_date,
attendance.attendance_id, attendance.location_name, 
attendance.attendance_date, attendance.attendance_time, attendance.getting_in,
attendance.narrative
FROM developers INNER JOIN attendance ON developers.developer_id = attendance.developer_id;


