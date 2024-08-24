 
 CREATE TABLE IF NOT EXISTS m_alumnos (
	id_alumnos int8 NOT NULL,
	nombre varchar NOT NULL,
	apellido_paterno varchar NOT NULL,
	apellido_materno varchar NOT NULL,
	correo varchar NOT NULL,
	telefono varchar(10) NOT NULL,
	estatus boolean NOT NULL,
	CONSTRAINT m_alumnos_pk PRIMARY KEY (id_alumnos)
);
 
create sequence seq_m_alumnos increment 1 start 1;
ALTER TABLE public.m_alumnos ALTER COLUMN id_alumnos SET DEFAULT nextval('public.seq_m_alumnos'::regclass);

 CREATE TABLE IF NOT EXISTS c_cursos (
	id_cursos int4 NOT NULL,
	nombre varchar NOT NULL,
	estatus boolean NOT NULL,
	CONSTRAINT c_cursos_pk PRIMARY KEY (id_cursos)
);

 
create sequence seq_c_cursos increment 1 start 1;
ALTER TABLE public.c_cursos ALTER COLUMN id_cursos SET DEFAULT nextval('public.seq_c_cursos'::regclass);

CREATE TABLE IF NOT EXISTS r_inscripciones(
	id_inscripciones int8 NOT NULL,
	id_alumnos int8 NOT NULL,
	id_cursos int4 NOT NULL,
	estatus boolean NOT NULL,
	CONSTRAINT r_inscripciones_pk PRIMARY KEY (id_inscripciones)
);

ALTER TABLE public.r_inscripciones ADD CONSTRAINT r_inscripciones_id_alumnos_foreign FOREIGN KEY (id_alumnos) REFERENCES m_alumnos (id_alumnos);
ALTER TABLE public.r_inscripciones ADD CONSTRAINT r_inscripciones_id_cursos_foreign FOREIGN KEY (id_cursos) REFERENCES c_cursos (id_cursos);
 
create sequence seq_r_inscripciones increment 1 start 1;
ALTER TABLE public.r_inscripciones ALTER COLUMN id_inscripciones SET DEFAULT nextval('public.seq_r_inscripciones'::regclass);


 CREATE TABLE IF NOT EXISTS c_accion (
	id_accion int4 NOT NULL,
	nombre varchar NOT NULL,
	estatus boolean NOT NULL,
	CONSTRAINT c_accion_pk PRIMARY KEY (id_accion)
);

create sequence seq_c_accion increment 1 start 1;
ALTER TABLE public.c_accion ALTER COLUMN id_accion SET DEFAULT nextval('public.seq_c_accion'::regclass);


CREATE TABLE IF NOT EXISTS d_historial(
	id_historial int8 NOT NULL,
	id_accion int4 NOT NULL,
	id_alumno int8 NULL,
	id_curso int4 null,
	id_inscripcion int8 null,
	fecha timestamp NOT NULL,
	CONSTRAINT d_historial_pk PRIMARY KEY (id_historial)
);
create sequence seq_d_historial increment 1 start 1;
ALTER TABLE public.d_historial ALTER COLUMN id_historial SET DEFAULT nextval('public.seq_d_historial'::regclass);
ALTER TABLE public.d_historial ADD CONSTRAINT d_historial_id_accion_foreign FOREIGN KEY (id_accion) REFERENCES c_accion (id_accion);



select *from public.c_cursos where nombre like '%c%';

select *from public.m_alumnos ma where nombre like '%NU%';
select *from public.m_alumnos ma where correo like '%s%';
select *from public.m_alumnos ma where estatus = true;

select *from public.r_inscripciones ma where id_cursos = 3 and estatus = true;


select *from public.m_alumnos ma  
inner join public.r_inscripciones ri on ri.id_alumnos = ma.id_alumnos
where ma.nombre like '%NU%';

and ('se' is null or ma.correo like '%se%');
and (true is null or ri.estatus = true)
and (3 is null or ri.id_cursos = 3);

select *from public.m_alumnos;
select *from public.c_cursos;
select *from public.c_accion;
select *from public.r_inscripciones;
select *from public.d_historial;


insert into c_cursos values(default,'Biología', true);
insert into c_cursos values(default,'Anatomía y fisiología', true);
insert into c_cursos values(default,'Matemáticas', true);
insert into c_cursos values(default,'Química', true);
insert into c_cursos values(default,'Ecología', true);
insert into c_cursos values(default,'Metodología de la investigación', true);
insert into c_cursos values(default,'Ciencias sociales', true);
insert into c_cursos values(default,'Geografía', true);
insert into c_cursos values(default,'Economía', true);
insert into c_cursos values(default,'Medio ambiente', true);
insert into c_cursos values(default,'Biografías', false);
insert into c_cursos values(default,'Arte', false);
insert into c_cursos values(default,'Historia del arte', false);
insert into c_cursos values(default,'Filosofía', false);
insert into c_cursos values(default,'Historia', false);
insert into c_cursos values(default,'Ética y valores', false);
insert into c_cursos values(default,'Literatura', false);
insert into c_cursos values(default,'Lengua española', false);
insert into c_cursos values(default,'Inglés ', false);


insert into c_accion values(default,'Baja de cursos', true);
insert into c_accion values(default,'Alta de cursos', true);
insert into c_accion values(default,'Baja de alumno', true);
insert into c_accion values(default,'Alta de alumno', true);
insert into c_accion values(default,'Cambio de datos curso', true);
insert into c_accion values(default,'Cambio de datos alumno', true);
insert into c_accion values(default,'Alta de inscripcion', true);
insert into c_accion values(default,'baja de inscripcion', true);