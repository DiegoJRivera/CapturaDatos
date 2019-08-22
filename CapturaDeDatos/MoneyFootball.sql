/* 
Creacion de la base de datos para Actividad Evaluada.
Tema de Estudio: "Money FootBall"
*/

CREATE DATABASE moneyfootball;

use moneyfootball;

drop table if exists monedas;
drop table if exists jugadores;
drop table if exists equipos;

create table if not exists equipos
(
IdEquipo			int				not null auto_increment,
nombre_equipo		varchar(40) 	not null,
titulos				int(3)			not null,
ranking				int(2)			not null,
pais				varchar(40) 	not null,
constraint equipos_pk primary key (IdEquipo)
) engine=InnoDB default charset=utf8;

-- carga valores de la api, valor del dia
create table if not exists monedas
(
IdMoneda			int				not null auto_increment,
valor_euro			float(2)		not null, 
constraint monedas_pk primary key (IdMoneda)
) engine=InnoDB default charset=utf8;

create table if not exists jugadores
(
IdJugador			int				not null auto_increment,
nombre				varchar(40) 	not null,
nacionalidad		varchar(40) 	not null,
valor_mercado   	int(12)			not null,
salario				int(12)			not null,
clausula_contrato	int(12)			not null,
IdEquipo			int				not null,
IdMoneda 			int				not null,
constraint jugadores_pk primary key (IdJugador),
constraint jugadores_equipos_fk foreign key (IdEquipo)
references equipos (IdEquipo),
constraint jugadores_monedas_fk foreign key (IdMoneda)
references monedas (IdMoneda)
) engine=InnoDB default charset=utf8;
