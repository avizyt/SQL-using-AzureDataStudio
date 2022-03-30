alter procedure Person.spPerson_fullname
as
begin
	set nocount on;

	select CONCAT(firstname,' ',middlename,' ', Lastname) as 'Full Name'
	from person.Person;
end