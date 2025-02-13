create database bookalab
go

use bookalab
go

create table dbo.Person
(
    id        int identity
        constraint Person_pk
            primary key,
    name      nvarchar,
    last_name nvarchar
)
go

alter table dbo.Person
    alter column name nvarchar(255) not null
go

alter table dbo.Person
    alter column last_name nvarchar(255) not null
go

create index Person_name_last_name_index
    on dbo.Person (name, last_name)
go



create table dbo.[Group]
(
    id       int identity,
    start    datetime     not null,
    prefix   nvarchar(64) not null,
    sequence nvarchar(20) default '1' not null,
    name as prefix + CAST(YEAR(GETDATE()) - YEAR(start) AS nvarchar(10)) + cast([Group].sequence as nvarchar(10))
)
go
 alter table dbo.[Group]
              add constraint Group_pk
                  primary key (id)
 go


create table dbo.StudentsInGroup
(
    studentId int not null
        constraint StudentsInGroup_Person_id_fk
            references dbo.Person (id),
    groupId   int not null
        constraint StudentsInGroup_Group_id_fk
            references dbo.[Group] (id)
)
go

alter table dbo.StudentsInGroup
    add constraint StudentsInGroup_pk
        primary key (groupId, studentId)
go

