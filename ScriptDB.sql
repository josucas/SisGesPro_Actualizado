
CREATE TABLE Permisos (
                id VARCHAR(10) NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                descripcion VARCHAR(100) NOT NULL,
                CONSTRAINT Permisos_pk PRIMARY KEY (id)
);


CREATE TABLE Roles (
                id VARCHAR(10) NOT NULL,
                nombre_rol VARCHAR NOT NULL,
                Descripcion VARCHAR(100) NOT NULL,
                CONSTRAINT Roles_pk PRIMARY KEY (id)
);


CREATE TABLE TiposDeTareas (
                id VARCHAR(7) NOT NULL,
                rol_encargado VARCHAR(10) NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                descripcion VARCHAR(100) NOT NULL,
                CONSTRAINT TiposDeTareas_pk PRIMARY KEY (id)
);


CREATE TABLE Propiedades (
                id_permiso VARCHAR(10) NOT NULL,
                id_rol VARCHAR(10) NOT NULL,
                descripcion VARCHAR(100) NOT NULL,
                CONSTRAINT Propiedades_pk PRIMARY KEY (id_permiso, id_rol)
);


CREATE TABLE Personas (
                cedula VARCHAR(10) NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                apellidos VARCHAR(30) NOT NULL,
                email VARCHAR(40) NOT NULL,
                telefono VARCHAR(10),
                fecha_nacimiento DATE NOT NULL,
                CONSTRAINT Personas_pk PRIMARY KEY (cedula)
);


CREATE TABLE Usuarios (
                id VARCHAR(10) NOT NULL,
                cedula VARCHAR(10) NOT NULL,
                id_rol VARCHAR(10) NOT NULL,
                fecha_alta DATE NOT NULL,
                pass VARCHAR(15) NOT NULL,
                estado VARCHAR(10) NOT NULL,
                CONSTRAINT Usuarios_pk PRIMARY KEY (id)
);


CREATE TABLE Proyectos (
                id VARCHAR(10) NOT NULL,
                nombre_proyecto VARCHAR(30) NOT NULL,
                descripcion_proyecto VARCHAR(100) NOT NULL,
                fecha_inicial DATE NOT NULL,
                CONSTRAINT Proyectos_pk PRIMARY KEY (id)
);


CREATE TABLE UserStory (
                id VARCHAR(10) NOT NULL,
                id_proyecto VARCHAR(10) NOT NULL,
                descripcion_corta VARCHAR(30) NOT NULL,
                enunciado VARCHAR(100) NOT NULL,
                estado VARCHAR(7) NOT NULL,
                prioridad VARCHAR(5) NOT NULL,
                CONSTRAINT UserStory_pk PRIMARY KEY (id)
);


CREATE TABLE Sprint (
                id VARCHAR(10) NOT NULL,
                UserStory_id VARCHAR(10) NOT NULL,
                estado VARCHAR(7) NOT NULL,
                fecha_comienzo DATE NOT NULL,
                fecha_final DATE NOT NULL,
                version VARCHAR(10) NOT NULL,
                CONSTRAINT Sprint_pk PRIMARY KEY (id)
);


CREATE TABLE Tareas (
                id VARCHAR(10) NOT NULL,
                id_tipo VARCHAR(7) NOT NULL,
                id_sprint VARCHAR(10) NOT NULL,
                nombre VARCHAR(30) NOT NULL,
                descripcion VARCHAR(30) NOT NULL,
                horas SMALLINT NOT NULL,
                fecha_final_real DATE NOT NULL,
                nivel_dificultad VARCHAR(7) NOT NULL,
                CONSTRAINT Tareas_pk PRIMARY KEY (id)
);


CREATE TABLE Integrantes (
                id_usuario VARCHAR(10) NOT NULL,
                id_proyecto VARCHAR(10) NOT NULL,
                fecha_integracion DATE NOT NULL,
                observaciones VARCHAR(100) NOT NULL,
                CONSTRAINT Integrantes_pk PRIMARY KEY (id_usuario, id_proyecto)
);


CREATE TABLE Asignaciones (
                id_usuario VARCHAR(10) NOT NULL,
                id_proyecto VARCHAR(10) NOT NULL,
                id_tarea VARCHAR(10) NOT NULL,
                estado VARCHAR(7) NOT NULL,
                fecha_final_estimada DATE NOT NULL,
                fecha_inicio DATE NOT NULL,
                observaciones VARCHAR(100) NOT NULL,
                problemas_encontrados VARCHAR(100) NOT NULL,
                CONSTRAINT Asignaciones_pk PRIMARY KEY (id_usuario, id_proyecto, id_tarea)
);


ALTER TABLE Propiedades ADD CONSTRAINT Permisos_PermisosRoles_fk
FOREIGN KEY (id_permiso)
REFERENCES Permisos (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Usuarios ADD CONSTRAINT Roles_Usuarios_fk
FOREIGN KEY (id_rol)
REFERENCES Roles (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Propiedades ADD CONSTRAINT Roles_PermisosRoles_fk
FOREIGN KEY (id_rol)
REFERENCES Roles (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE TiposDeTareas ADD CONSTRAINT Roles_TiposDeTareas_fk
FOREIGN KEY (rol_encargado)
REFERENCES Roles (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tareas ADD CONSTRAINT TiposDeTareas_Tareas_fk
FOREIGN KEY (id_tipo)
REFERENCES TiposDeTareas (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Usuarios ADD CONSTRAINT Personas_Usuarios_fk
FOREIGN KEY (cedula)
REFERENCES Personas (cedula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Integrantes ADD CONSTRAINT Usuarios_Integrantes_fk
FOREIGN KEY (id_usuario)
REFERENCES Usuarios (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Integrantes ADD CONSTRAINT Proyectos_Integrantes_fk
FOREIGN KEY (id_proyecto)
REFERENCES Proyectos (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE UserStory ADD CONSTRAINT Proyectos_UserStory_fk
FOREIGN KEY (id_proyecto)
REFERENCES Proyectos (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Sprint ADD CONSTRAINT UserStory_Sprint_fk
FOREIGN KEY (UserStory_id)
REFERENCES UserStory (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tareas ADD CONSTRAINT Sprint_Tareas_fk
FOREIGN KEY (id_sprint)
REFERENCES Sprint (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Asignaciones ADD CONSTRAINT Tareas_Asignaciones_fk
FOREIGN KEY (id_tarea)
REFERENCES Tareas (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Asignaciones ADD CONSTRAINT Integrantes_Asignaciones_fk
FOREIGN KEY (id_usuario, id_proyecto)
REFERENCES Integrantes (id_usuario, id_proyecto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
