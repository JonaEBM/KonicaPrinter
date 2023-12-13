/*
La tabla menú establece los datos con los que el menú será abierto, así como los datos que contendrá el mismo

La tabla rol establece el tipo de rol

La tabla menuRol establece una conexión entre el rol y el menú, para determinar qué roles abren qué menú

La tabla usuarios establece los datos del usuario, a su vez, establece una conexión con la tabla rol, para determinar qué rol tendrá el usuario

La tabla localizacion hace referencia al número de planta y área donde está designado el usuario

La tabla usuario establece la persona determinada a utilizar el sistema de control de inventario de equipos de cómputo

La tabla usuarioEquipo establece la persona que utiliza un equipo de cómputo
*/

drop database if exists itinventory;

create database itinventory;

use itinventory;

create table menu(
	idMenu int primary key not null,
	
	nombre varchar(50) not null,
	url varchar(50)
	)



create table rol(
	idRol int primary key not null,
	
	nombre varchar(50) not null,
	
	idMenu int references menu(idMenu) not null
	)


create table localizacion(
	idLocalizacion int primary key not null,

	noPlanta int not null,
	area varchar(150)
	)


create table administrativo(
	idAdministrativo varchar(20) primary key not null,

	nombre varchar(100) not null,
	correo varchar(50) not null,
	contrasena varchar(20) not null,

	idRol int references rol(idRol) not null,
	idLocalizacion int references localizacion(idLocalizacion) not null
	)


create table dockstation(
	snDockstation varchar(20) primary key not null,

	fabricante varchar(50) not null,
	modelo varchar(30) not null,
	asignado bit not null,
	estatus bit not null,
	tipo varchar(50) not null,
	cargadorEstatus varchar(150)
)


create table computadora(
	snComputadora varchar(20) primary key not null,

	fabricante varchar(50) not null,
	modelo varchar(30) not null,
	mac varchar(50) not null,
	asignado bit not null,
	estatus bit not null,
	tipo varchar(50) not null,
	hostname varchar(50) not null,
	codigoQR varchar(20),
	anexo varchar(50),
	cargadorEstatus varchar(150)
)


create table monitor(
	snMonitor varchar(20) primary key not null,

	fabricante varchar(50) not null,
	modelo varchar(30) not null,
	asignado bit not null,
	estatus bit not null
)


create table celular(
	snCelular varchar(20) primary key not null,
	
	noTelefono varchar(30) not null,
	asignado bit not null,
	estatus bit not null,
	cargadorEstatus varchar(150)
)


create table usuario(
	idUsuario varchar(20) primary key not null,

	nombre varchar(100) not null,
	correo varchar(50) not null,
	estatus bit not null,
	fechaRegistro date not null,

	idLocalizacion int references localizacion(idLocalizacion)  not null
	)


create table kit(
	idKit int primary key identity(1,1) not null ,

	teclado bit,
	mouse bit,
	mochila bit,
	fechaAsignacion date not null,
	fechaRetiro date,
	asignador varchar(100) not null,
	documentosPendientes varchar(50),
	comentarios varchar(250),

	snComputadora varchar(20) references computadora(snComputadora),
	snCelular varchar(20) references celular(snCelular),
	snDockstation varchar(20) references dockstation(snDockstation),
	snMonitor varchar(20) references monitor(snMonitor),
	idUsuario varchar(20) references usuario(idUsuario) not null
	)