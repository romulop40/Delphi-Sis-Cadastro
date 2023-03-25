/*criar tabela de contato*/
create table contato(
id_contato integer not null,
nome varchar(100) not null,
telefone varchar(15) not null,
celular varchar(15) not null,
email varchar(100) not null, 
constraint pk_id_contato primary key(id_contato));