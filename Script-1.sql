create table usuarios (
    id_usuario int primary key,
    username varchar(50) not null,
    contraseña varchar(100) not null,
    tipo varchar(30)
);

create table empresa (
    id_empresa int primary key,
    nombre varchar(100) not null,
    cuit varchar(20) unique,
    id_usuario int,
    foreign key (id_usuario) references usuarios(id_usuario)
);

create table candidato (
    id_candidato int primary key,
    nombre varchar(100) not null,
    cuil varchar(20) unique,
    cv text,
    foto varchar(255),
    id_usuario int,
    foreign key (id_usuario) references usuarios(id_usuario)
);

create table busqueda (
    id_busqueda int primary key,
    id_empresa int,
    prioridad varchar(20),
    foreign key (id_empresa) references empresa(id_empresa)
);

create table experiencia (
    id_experiencia int primary key,
    id_candidato int,
    empresa_lab varchar(100),
    puesto varchar(100),
    años int,
    foreign key (id_candidato) references candidato(id_candidato)
);

create table candidato_busqueda (
    id_candidato_busqueda int primary key,
    id_candidato int,
    id_busqueda int,
    foreign key (id_candidato) references candidato(id_candidato),
    foreign key (id_busqueda) references busqueda(id_busqueda)
);

create table contacto (
    id_contacto int primary key,
    id_candidato int,
    tipo varchar(50),
    valor varchar(100),
    foreign key (id_candidato) references candidato(id_candidato)
);

create table skills (
    id_skill int primary key,
    id_candidato int,
    nombre varchar(100),
    nivel varchar(50),
    foreign key (id_candidato) references candidato(id_candidato)
);
