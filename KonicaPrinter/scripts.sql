use itinventory

drop database if exists itinventory;
drop table if exists localizacion;
drop table if exists usuario;
drop table if exists administrador;
drop table if exists rol;
drop table if exists menu;
drop table if exists kit;
drop table if exists dockstation;
drop table if exists computadora;
drop table if exists monitor;
drop table if exists celular;

select * from administrativo
select * from celular
select * from computadora
select * from dockstation
select * from kit
select * from localizacion
select * from menu
select * from monitor
select * from rol
select * from usuario

insert into menu values(1, 'Menú I.T.', 'https://IT');
insert into menu values(2, 'Menú R.H.', 'https://RH');
insert into rol values(1, 'Administrador', 1);
insert into rol values(2, 'Visualizador', 2);

insert into localizacion values(1, 1, 'Recursos humanos')
insert into localizacion values(2, 1, 'I.T.')
insert into localizacion values(3, 1, 'O.T.')
insert into localizacion values(4, 1, 'Recursos humanos')
insert into localizacion values(5, 3, 'Producción')

insert into administrativo values('M0212394', 'Jonathan Berumen', 'jonathan.esau.berumen@mahle.com', 'Hol@mundo1221', 1, 1)
insert into administrativo values('M0010223', 'Maria Maria', 'maria.maria@mahle.com', 'Hol@s', 2, 4)

insert into usuario values('M0000000', 'Ricardo Rios', 'ricardo.rios@mahle.com', 1, '11/12/2023', 3)
insert into usuario values('SADSDA', 'ASASA Rios', 'ricardo.rios@mahle.com', 1, '11/12/2023', 3)
insert into usuario values('M1111111', 'Jesus Gamez', 'jg@mahle.com', 1, '11/12/2023', 5)

insert into dockstation values('JY2MHJ3', 'Dell', 'K20A', 0, 1, 'Común', 'Funcionando correctamente')
insert into dockstation values('555555', 'Dell', 'K20A', 0, 1, 'Común', 'Funcionando')

insert into computadora values('36ZLGX3', 'Dell', 'Latitude 5540', 'E8:D8:D1:A5:21:45', 0, 1, 'Laptop común', 'MXJCS70911', '3537', 'Pending', 'Funcionando')
insert into computadora values('MMMMM', 'Dell', 'Latitude 5540', 'E8:D8:D1:A5:21:45', 0, 1, 'Laptop común', 'MXJCS70911', '3537', 'Pending', 'Funcionando')
insert into computadora values('OOOO', 'Dell', 'Latitude 5540', 'E8:D8:D1:A5:21:45', 0, 1, 'Laptop común', 'MXJCS70911', '3537', 'Pending', 'Funcionando')

insert into monitor values('3SJ3NSDM2', 'Hewllet Peckard', 'Z250', 0, 1)
insert into monitor values('33333333', 'Hewllet Peckard', 'Z250', 0, 1)

insert into celular values('KKDME3SD', '6564453466', 0, 1,'Funcionando')
insert into celular values('KKKKKK', '6564453466', 0, 1,'Funcionando')

insert into kit(teclado, mouse, mochila, fechaAsignacion, asignador, documentosPendientes,comentarios, snComputadora, snCelular, snDockstation, snMonitor, idUsuario) 
values(1, 1, 1, '2023/12/12', 'Jonathan Berumen', 'N/A','Sin comentarios', '36ZLGX3', 'KKDME3SD', 'JY2MHJ3', '3SJ3NSDM2', 'M0000000')

insert into kit(teclado, mouse, mochila, fechaAsignacion, asignador, documentosPendientes,comentarios, snComputadora, snCelular, snDockstation, snMonitor, idUsuario) 
values(1, 1, 1, '2024/10/13', 'Jesus Gamez', 'N/A','Sin comentarios', 'MMMMM', 'KKDME3SD', 'JY2MHJ3', '3SJ3NSDM2', 'M0000000')

insert into kit(teclado, mouse, mochila, fechaAsignacion, asignador, documentosPendientes,comentarios, snComputadora, snCelular, snDockstation, snMonitor, idUsuario) 
values(1, 1, 1, '2024/10/13', 'Jonathan Berumen', 'N/A', 'Sin comentarios', 'MMMMM', 'KKDME3SD', 'JY2MHJ3', '3SJ3NSDM2', 'SADSDA')

insert into kit(teclado, mouse, mochila, fechaAsignacion, asignador, documentosPendientes,comentarios, snComputadora, snCelular, snDockstation, snMonitor, idUsuario) 
values(1, 1, 1, '2024/10/13', 'Jonathan Berumen', 'N/A', 'Sin comentarios', 'OOOO', 'KKDME3SD', 'JY2MHJ3', '3SJ3NSDM2', 'SADSDA')

update kit set fechaRetiro = '2024/10/14' where idKit = 4

select u.nombre, k.fechaAsignacion as Asignacion, k.fechaRetiro as Retiro, k.snComputadora from usuario as u inner join kit as k on u.idUsuario = k.idUsuario where k.snComputadora = '36ZLGX3'



