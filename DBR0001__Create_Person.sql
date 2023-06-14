create table person
(
	person_id bigint  generated always as identity,
	name_txt varchar(125) not null,
	person_type_cde smallint not null,

	primary key(person_id)
);
