create index on person(person_type_cde);

alter table person
add constraint fk_person_person_type_cde foreign key(person_type_cde) references person_type_val(person_type_cde);
