create database Quiz
go

use Quiz
go

create table School
(
SchoolId int primary key identity,
SchoolName varchar(50) not null,
Descripcion varchar(1000) null,
Direccion varchar(50) null,
Phone varchar(50) null,
PostCode varchar(50) null,
PostAdress varchar(50) null
)


create table Class
(
ClassId int primary key identity, 
SchoolId int foreign key references School(SchoolId),
ClassName varchar(50) not null,
Descripcion varchar(1000) null
)

create procedure consultarSchool
@SchoolId int
as 
	begin 
		select * from School where SchoolId = @SchoolId
	end

	exec consultarSchool 1

create procedure ingresarSchool
@SchooldName varchar(50),
@Descripcion varchar(1000),
@Direccion varchar(50),
@Phone varchar(50),
@PostCode varchar(50),
@PostAdress varchar(50)

as 
	begin 
		insert into School values (@SchooldName,@Descripcion,@Direccion,@Phone,@PostCode,@PostAdress)
	end

	exec ingresarSchool 'Hispanoamericana','Universidad', 'Puntarenas','60561585','8014','1205'

create procedure borrarSchool
@SchoolId int 
as 

begin 

delete School where SchoolId = @SchoolId 

end

exec borrarSchool 1

create procedure modificarSchool
@SchoolId int,
@SchoolName varchar(50),
@Descripcion varchar(1000),
@Direccion varchar(50),
@Phone varchar(50),
@PostCode varchar(50),
@PostAdress varchar(50)
as 
	begin 

	update School set SchoolName = @SchoolName,Descripcion = @Descripcion,Direccion = @Direccion,Phone = @Phone,PostCode = @PostCode, PostAdress = @PostAdress where SchoolId = @SchoolId
	
	end
exec modificarSchool 2,'HispanoAmerica','Universidad', 'San Lorenso','701584230','2647','7894'

exec consultarSchool 2