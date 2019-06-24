PGDMP                         w         	   SisGesPro    10.7    10.7 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    26624 	   SisGesPro    DATABASE     �   CREATE DATABASE "SisGesPro" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Paraguay.1252' LC_CTYPE = 'Spanish_Paraguay.1252';
    DROP DATABASE "SisGesPro";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    26721    Equipos    TABLE     L   CREATE TABLE public."Equipos" (
    codigo character varying(4) NOT NULL
);
    DROP TABLE public."Equipos";
       public         postgres    false    3            �            1259    26728    Equipos_integrantes    TABLE     �   CREATE TABLE public."Equipos_integrantes" (
    id integer NOT NULL,
    equipo_id character varying(4) NOT NULL,
    usuario_id character varying(8) NOT NULL
);
 )   DROP TABLE public."Equipos_integrantes";
       public         postgres    false    3            �            1259    26726    Equipos_integrantes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Equipos_integrantes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Equipos_integrantes_id_seq";
       public       postgres    false    213    3            �           0    0    Equipos_integrantes_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Equipos_integrantes_id_seq" OWNED BY public."Equipos_integrantes".id;
            public       postgres    false    212            �            1259    26742 	   Proyectos    TABLE     &  CREATE TABLE public."Proyectos" (
    codigo character varying(4) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    fecha_inicio date,
    fecha_estimada date,
    estado character varying(1) NOT NULL,
    fecha_creado timestamp with time zone NOT NULL
);
    DROP TABLE public."Proyectos";
       public         postgres    false    3            �            1259    26752    Proyectos_equipos    TABLE     �   CREATE TABLE public."Proyectos_equipos" (
    id integer NOT NULL,
    proyecto_id character varying(4) NOT NULL,
    equipo_id character varying(4) NOT NULL
);
 '   DROP TABLE public."Proyectos_equipos";
       public         postgres    false    3            �            1259    26750    Proyectos_equipos_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Proyectos_equipos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Proyectos_equipos_id_seq";
       public       postgres    false    3    217            �           0    0    Proyectos_equipos_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Proyectos_equipos_id_seq" OWNED BY public."Proyectos_equipos".id;
            public       postgres    false    216            �            1259    26734 
   Requisitos    TABLE     �   CREATE TABLE public."Requisitos" (
    nombre character varying(30) NOT NULL,
    descripcion text NOT NULL,
    prioridad character varying(1) NOT NULL
);
     DROP TABLE public."Requisitos";
       public         postgres    false    3            �            1259    26698    Usuarios    TABLE     c  CREATE TABLE public."Usuarios" (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    ci character varying(8) NOT NULL,
    correo character varying(100) NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    telefono character varying(12) NOT NULL,
    fecha_nacimiento date,
    sexo character varying(1) NOT NULL,
    fecha_creado timestamp with time zone NOT NULL,
    fecha_actualizado timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL
);
    DROP TABLE public."Usuarios";
       public         postgres    false    3            �            1259    26707    Usuarios_groups    TABLE     �   CREATE TABLE public."Usuarios_groups" (
    id integer NOT NULL,
    usuario_id character varying(8) NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE public."Usuarios_groups";
       public         postgres    false    3            �            1259    26705    Usuarios_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Usuarios_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Usuarios_groups_id_seq";
       public       postgres    false    208    3            �           0    0    Usuarios_groups_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Usuarios_groups_id_seq" OWNED BY public."Usuarios_groups".id;
            public       postgres    false    207            �            1259    26715    Usuarios_user_permissions    TABLE     �   CREATE TABLE public."Usuarios_user_permissions" (
    id integer NOT NULL,
    usuario_id character varying(8) NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE public."Usuarios_user_permissions";
       public         postgres    false    3            �            1259    26713     Usuarios_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Usuarios_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."Usuarios_user_permissions_id_seq";
       public       postgres    false    210    3            �           0    0     Usuarios_user_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."Usuarios_user_permissions_id_seq" OWNED BY public."Usuarios_user_permissions".id;
            public       postgres    false    209            �            1259    26656 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    26654    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    203    3            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    202            �            1259    26666    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    26664    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    205    3            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    204            �            1259    26648    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    26646    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    201    3            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    200            �            1259    26827    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id character varying(8) NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    3            �            1259    26825    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    3    219            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    218            �            1259    26638    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    26636    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    3    199            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    198            �            1259    26627    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    26625    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    197    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    196            �            1259    26850    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �
           2604    26731    Equipos_integrantes id    DEFAULT     �   ALTER TABLE ONLY public."Equipos_integrantes" ALTER COLUMN id SET DEFAULT nextval('public."Equipos_integrantes_id_seq"'::regclass);
 G   ALTER TABLE public."Equipos_integrantes" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    213    213            �
           2604    26755    Proyectos_equipos id    DEFAULT     �   ALTER TABLE ONLY public."Proyectos_equipos" ALTER COLUMN id SET DEFAULT nextval('public."Proyectos_equipos_id_seq"'::regclass);
 E   ALTER TABLE public."Proyectos_equipos" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    217    217            �
           2604    26710    Usuarios_groups id    DEFAULT     |   ALTER TABLE ONLY public."Usuarios_groups" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_groups_id_seq"'::regclass);
 C   ALTER TABLE public."Usuarios_groups" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    208    208            �
           2604    26718    Usuarios_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public."Usuarios_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_user_permissions_id_seq"'::regclass);
 M   ALTER TABLE public."Usuarios_user_permissions" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    209    210            �
           2604    26659    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �
           2604    26669    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    26651    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    26830    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    218    219    219            �
           2604    26641    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    26630    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �          0    26721    Equipos 
   TABLE DATA               +   COPY public."Equipos" (codigo) FROM stdin;
    public       postgres    false    211   ��       �          0    26728    Equipos_integrantes 
   TABLE DATA               J   COPY public."Equipos_integrantes" (id, equipo_id, usuario_id) FROM stdin;
    public       postgres    false    213   �       �          0    26742 	   Proyectos 
   TABLE DATA               v   COPY public."Proyectos" (codigo, nombre, descripcion, fecha_inicio, fecha_estimada, estado, fecha_creado) FROM stdin;
    public       postgres    false    215   J�       �          0    26752    Proyectos_equipos 
   TABLE DATA               I   COPY public."Proyectos_equipos" (id, proyecto_id, equipo_id) FROM stdin;
    public       postgres    false    217   ͽ       �          0    26734 
   Requisitos 
   TABLE DATA               F   COPY public."Requisitos" (nombre, descripcion, prioridad) FROM stdin;
    public       postgres    false    214   �       �          0    26698    Usuarios 
   TABLE DATA               �   COPY public."Usuarios" (password, last_login, is_superuser, ci, correo, nombre, apellido, telefono, fecha_nacimiento, sexo, fecha_creado, fecha_actualizado, is_active, is_staff) FROM stdin;
    public       postgres    false    206   �       �          0    26707    Usuarios_groups 
   TABLE DATA               E   COPY public."Usuarios_groups" (id, usuario_id, group_id) FROM stdin;
    public       postgres    false    208   N�       �          0    26715    Usuarios_user_permissions 
   TABLE DATA               T   COPY public."Usuarios_user_permissions" (id, usuario_id, permission_id) FROM stdin;
    public       postgres    false    210   w�       �          0    26656 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    203   ��       �          0    26666    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    205   �       �          0    26648    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    201   �       �          0    26827    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    219   ��       �          0    26638    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    199   ��       �          0    26627    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    197   ��       �          0    26850    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    220   D�       �           0    0    Equipos_integrantes_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Equipos_integrantes_id_seq"', 1, true);
            public       postgres    false    212            �           0    0    Proyectos_equipos_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Proyectos_equipos_id_seq"', 1, true);
            public       postgres    false    216            �           0    0    Usuarios_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Usuarios_groups_id_seq"', 1, true);
            public       postgres    false    207            �           0    0     Usuarios_user_permissions_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Usuarios_user_permissions_id_seq"', 1, false);
            public       postgres    false    209            �           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 5, true);
            public       postgres    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);
            public       postgres    false    200            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 10, true);
            public       postgres    false    218            �           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);
            public       postgres    false    198            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);
            public       postgres    false    196            �
           2606    26802 J   Equipos_integrantes Equipos_integrantes_equipo_id_usuario_id_126cb425_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Equipos_integrantes"
    ADD CONSTRAINT "Equipos_integrantes_equipo_id_usuario_id_126cb425_uniq" UNIQUE (equipo_id, usuario_id);
 x   ALTER TABLE ONLY public."Equipos_integrantes" DROP CONSTRAINT "Equipos_integrantes_equipo_id_usuario_id_126cb425_uniq";
       public         postgres    false    213    213            �
           2606    26733 ,   Equipos_integrantes Equipos_integrantes_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Equipos_integrantes"
    ADD CONSTRAINT "Equipos_integrantes_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Equipos_integrantes" DROP CONSTRAINT "Equipos_integrantes_pkey";
       public         postgres    false    213            �
           2606    26725    Equipos Equipos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Equipos"
    ADD CONSTRAINT "Equipos_pkey" PRIMARY KEY (codigo);
 B   ALTER TABLE ONLY public."Equipos" DROP CONSTRAINT "Equipos_pkey";
       public         postgres    false    211                       2606    26757 (   Proyectos_equipos Proyectos_equipos_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Proyectos_equipos"
    ADD CONSTRAINT "Proyectos_equipos_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Proyectos_equipos" DROP CONSTRAINT "Proyectos_equipos_pkey";
       public         postgres    false    217            
           2606    26820 G   Proyectos_equipos Proyectos_equipos_proyecto_id_equipo_id_7c2d80ce_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Proyectos_equipos"
    ADD CONSTRAINT "Proyectos_equipos_proyecto_id_equipo_id_7c2d80ce_uniq" UNIQUE (proyecto_id, equipo_id);
 u   ALTER TABLE ONLY public."Proyectos_equipos" DROP CONSTRAINT "Proyectos_equipos_proyecto_id_equipo_id_7c2d80ce_uniq";
       public         postgres    false    217    217                       2606    26749    Proyectos Proyectos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Proyectos"
    ADD CONSTRAINT "Proyectos_pkey" PRIMARY KEY (codigo);
 F   ALTER TABLE ONLY public."Proyectos" DROP CONSTRAINT "Proyectos_pkey";
       public         postgres    false    215            �
           2606    26741    Requisitos Requisitos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Requisitos"
    ADD CONSTRAINT "Requisitos_pkey" PRIMARY KEY (nombre);
 H   ALTER TABLE ONLY public."Requisitos" DROP CONSTRAINT "Requisitos_pkey";
       public         postgres    false    214            �
           2606    26704    Usuarios Usuarios_correo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_correo_key" UNIQUE (correo);
 J   ALTER TABLE ONLY public."Usuarios" DROP CONSTRAINT "Usuarios_correo_key";
       public         postgres    false    206            �
           2606    26712 $   Usuarios_groups Usuarios_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Usuarios_groups"
    ADD CONSTRAINT "Usuarios_groups_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."Usuarios_groups" DROP CONSTRAINT "Usuarios_groups_pkey";
       public         postgres    false    208            �
           2606    26771 A   Usuarios_groups Usuarios_groups_usuario_id_group_id_e88b744a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Usuarios_groups"
    ADD CONSTRAINT "Usuarios_groups_usuario_id_group_id_e88b744a_uniq" UNIQUE (usuario_id, group_id);
 o   ALTER TABLE ONLY public."Usuarios_groups" DROP CONSTRAINT "Usuarios_groups_usuario_id_group_id_e88b744a_uniq";
       public         postgres    false    208    208            �
           2606    26702    Usuarios Usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY (ci);
 D   ALTER TABLE ONLY public."Usuarios" DROP CONSTRAINT "Usuarios_pkey";
       public         postgres    false    206            �
           2606    26786 Y   Usuarios_user_permissions Usuarios_user_permission_usuario_id_permission_id_82ba4004_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."Usuarios_user_permissions"
    ADD CONSTRAINT "Usuarios_user_permission_usuario_id_permission_id_82ba4004_uniq" UNIQUE (usuario_id, permission_id);
 �   ALTER TABLE ONLY public."Usuarios_user_permissions" DROP CONSTRAINT "Usuarios_user_permission_usuario_id_permission_id_82ba4004_uniq";
       public         postgres    false    210    210            �
           2606    26720 8   Usuarios_user_permissions Usuarios_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."Usuarios_user_permissions"
    ADD CONSTRAINT "Usuarios_user_permissions_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY public."Usuarios_user_permissions" DROP CONSTRAINT "Usuarios_user_permissions_pkey";
       public         postgres    false    210            �
           2606    26696    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    203            �
           2606    26692 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    205    205            �
           2606    26671 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    205            �
           2606    26661    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    203            �
           2606    26678 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    201    201            �
           2606    26653 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    201                       2606    26836 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    219            �
           2606    26645 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    199    199            �
           2606    26643 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    199            �
           2606    26635 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    197                       2606    26857 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    220            �
           1259    26790    Equipos_codigo_ae58f2a3_like    INDEX     j   CREATE INDEX "Equipos_codigo_ae58f2a3_like" ON public."Equipos" USING btree (codigo varchar_pattern_ops);
 2   DROP INDEX public."Equipos_codigo_ae58f2a3_like";
       public         postgres    false    211            �
           1259    26803 &   Equipos_integrantes_equipo_id_6edaf4e5    INDEX     o   CREATE INDEX "Equipos_integrantes_equipo_id_6edaf4e5" ON public."Equipos_integrantes" USING btree (equipo_id);
 <   DROP INDEX public."Equipos_integrantes_equipo_id_6edaf4e5";
       public         postgres    false    213            �
           1259    26804 +   Equipos_integrantes_equipo_id_6edaf4e5_like    INDEX     �   CREATE INDEX "Equipos_integrantes_equipo_id_6edaf4e5_like" ON public."Equipos_integrantes" USING btree (equipo_id varchar_pattern_ops);
 A   DROP INDEX public."Equipos_integrantes_equipo_id_6edaf4e5_like";
       public         postgres    false    213            �
           1259    26805 '   Equipos_integrantes_usuario_id_9757185e    INDEX     q   CREATE INDEX "Equipos_integrantes_usuario_id_9757185e" ON public."Equipos_integrantes" USING btree (usuario_id);
 =   DROP INDEX public."Equipos_integrantes_usuario_id_9757185e";
       public         postgres    false    213            �
           1259    26806 ,   Equipos_integrantes_usuario_id_9757185e_like    INDEX     �   CREATE INDEX "Equipos_integrantes_usuario_id_9757185e_like" ON public."Equipos_integrantes" USING btree (usuario_id varchar_pattern_ops);
 B   DROP INDEX public."Equipos_integrantes_usuario_id_9757185e_like";
       public         postgres    false    213                        1259    26808    Proyectos_codigo_279c8d6c_like    INDEX     n   CREATE INDEX "Proyectos_codigo_279c8d6c_like" ON public."Proyectos" USING btree (codigo varchar_pattern_ops);
 4   DROP INDEX public."Proyectos_codigo_279c8d6c_like";
       public         postgres    false    215                       1259    26823 $   Proyectos_equipos_equipo_id_9c13a4b1    INDEX     k   CREATE INDEX "Proyectos_equipos_equipo_id_9c13a4b1" ON public."Proyectos_equipos" USING btree (equipo_id);
 :   DROP INDEX public."Proyectos_equipos_equipo_id_9c13a4b1";
       public         postgres    false    217                       1259    26824 )   Proyectos_equipos_equipo_id_9c13a4b1_like    INDEX     �   CREATE INDEX "Proyectos_equipos_equipo_id_9c13a4b1_like" ON public."Proyectos_equipos" USING btree (equipo_id varchar_pattern_ops);
 ?   DROP INDEX public."Proyectos_equipos_equipo_id_9c13a4b1_like";
       public         postgres    false    217                       1259    26821 &   Proyectos_equipos_proyecto_id_85d52408    INDEX     o   CREATE INDEX "Proyectos_equipos_proyecto_id_85d52408" ON public."Proyectos_equipos" USING btree (proyecto_id);
 <   DROP INDEX public."Proyectos_equipos_proyecto_id_85d52408";
       public         postgres    false    217                       1259    26822 +   Proyectos_equipos_proyecto_id_85d52408_like    INDEX     �   CREATE INDEX "Proyectos_equipos_proyecto_id_85d52408_like" ON public."Proyectos_equipos" USING btree (proyecto_id varchar_pattern_ops);
 A   DROP INDEX public."Proyectos_equipos_proyecto_id_85d52408_like";
       public         postgres    false    217            �
           1259    26807    Requisitos_nombre_7dd34da1_like    INDEX     p   CREATE INDEX "Requisitos_nombre_7dd34da1_like" ON public."Requisitos" USING btree (nombre varchar_pattern_ops);
 5   DROP INDEX public."Requisitos_nombre_7dd34da1_like";
       public         postgres    false    214            �
           1259    26758    Usuarios_ci_a8ebf6e4_like    INDEX     d   CREATE INDEX "Usuarios_ci_a8ebf6e4_like" ON public."Usuarios" USING btree (ci varchar_pattern_ops);
 /   DROP INDEX public."Usuarios_ci_a8ebf6e4_like";
       public         postgres    false    206            �
           1259    26759    Usuarios_correo_34be9a76_like    INDEX     l   CREATE INDEX "Usuarios_correo_34be9a76_like" ON public."Usuarios" USING btree (correo varchar_pattern_ops);
 3   DROP INDEX public."Usuarios_correo_34be9a76_like";
       public         postgres    false    206            �
           1259    26774 !   Usuarios_groups_group_id_890f65b0    INDEX     e   CREATE INDEX "Usuarios_groups_group_id_890f65b0" ON public."Usuarios_groups" USING btree (group_id);
 7   DROP INDEX public."Usuarios_groups_group_id_890f65b0";
       public         postgres    false    208            �
           1259    26772 #   Usuarios_groups_usuario_id_88bd6b34    INDEX     i   CREATE INDEX "Usuarios_groups_usuario_id_88bd6b34" ON public."Usuarios_groups" USING btree (usuario_id);
 9   DROP INDEX public."Usuarios_groups_usuario_id_88bd6b34";
       public         postgres    false    208            �
           1259    26773 (   Usuarios_groups_usuario_id_88bd6b34_like    INDEX     �   CREATE INDEX "Usuarios_groups_usuario_id_88bd6b34_like" ON public."Usuarios_groups" USING btree (usuario_id varchar_pattern_ops);
 >   DROP INDEX public."Usuarios_groups_usuario_id_88bd6b34_like";
       public         postgres    false    208            �
           1259    26789 0   Usuarios_user_permissions_permission_id_dd067c85    INDEX     �   CREATE INDEX "Usuarios_user_permissions_permission_id_dd067c85" ON public."Usuarios_user_permissions" USING btree (permission_id);
 F   DROP INDEX public."Usuarios_user_permissions_permission_id_dd067c85";
       public         postgres    false    210            �
           1259    26787 -   Usuarios_user_permissions_usuario_id_d81d2a07    INDEX     }   CREATE INDEX "Usuarios_user_permissions_usuario_id_d81d2a07" ON public."Usuarios_user_permissions" USING btree (usuario_id);
 C   DROP INDEX public."Usuarios_user_permissions_usuario_id_d81d2a07";
       public         postgres    false    210            �
           1259    26788 2   Usuarios_user_permissions_usuario_id_d81d2a07_like    INDEX     �   CREATE INDEX "Usuarios_user_permissions_usuario_id_d81d2a07_like" ON public."Usuarios_user_permissions" USING btree (usuario_id varchar_pattern_ops);
 H   DROP INDEX public."Usuarios_user_permissions_usuario_id_d81d2a07_like";
       public         postgres    false    210            �
           1259    26697    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    203            �
           1259    26693 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    205            �
           1259    26694 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    205            �
           1259    26679 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    201                       1259    26847 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    219                       1259    26848 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    219                       1259    26849 &   django_admin_log_user_id_c564eba6_like    INDEX     z   CREATE INDEX django_admin_log_user_id_c564eba6_like ON public.django_admin_log USING btree (user_id varchar_pattern_ops);
 :   DROP INDEX public.django_admin_log_user_id_c564eba6_like;
       public         postgres    false    219                       1259    26859 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    220                       1259    26858 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    220                       2606    26791 L   Equipos_integrantes Equipos_integrantes_equipo_id_6edaf4e5_fk_Equipos_codigo    FK CONSTRAINT     �   ALTER TABLE ONLY public."Equipos_integrantes"
    ADD CONSTRAINT "Equipos_integrantes_equipo_id_6edaf4e5_fk_Equipos_codigo" FOREIGN KEY (equipo_id) REFERENCES public."Equipos"(codigo) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public."Equipos_integrantes" DROP CONSTRAINT "Equipos_integrantes_equipo_id_6edaf4e5_fk_Equipos_codigo";
       public       postgres    false    211    213    2804                       2606    26796 J   Equipos_integrantes Equipos_integrantes_usuario_id_9757185e_fk_Usuarios_ci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Equipos_integrantes"
    ADD CONSTRAINT "Equipos_integrantes_usuario_id_9757185e_fk_Usuarios_ci" FOREIGN KEY (usuario_id) REFERENCES public."Usuarios"(ci) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public."Equipos_integrantes" DROP CONSTRAINT "Equipos_integrantes_usuario_id_9757185e_fk_Usuarios_ci";
       public       postgres    false    206    213    2787                       2606    26814 H   Proyectos_equipos Proyectos_equipos_equipo_id_9c13a4b1_fk_Equipos_codigo    FK CONSTRAINT     �   ALTER TABLE ONLY public."Proyectos_equipos"
    ADD CONSTRAINT "Proyectos_equipos_equipo_id_9c13a4b1_fk_Equipos_codigo" FOREIGN KEY (equipo_id) REFERENCES public."Equipos"(codigo) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public."Proyectos_equipos" DROP CONSTRAINT "Proyectos_equipos_equipo_id_9c13a4b1_fk_Equipos_codigo";
       public       postgres    false    217    211    2804                       2606    26809 L   Proyectos_equipos Proyectos_equipos_proyecto_id_85d52408_fk_Proyectos_codigo    FK CONSTRAINT     �   ALTER TABLE ONLY public."Proyectos_equipos"
    ADD CONSTRAINT "Proyectos_equipos_proyecto_id_85d52408_fk_Proyectos_codigo" FOREIGN KEY (proyecto_id) REFERENCES public."Proyectos"(codigo) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public."Proyectos_equipos" DROP CONSTRAINT "Proyectos_equipos_proyecto_id_85d52408_fk_Proyectos_codigo";
       public       postgres    false    215    217    2818                       2606    26765 B   Usuarios_groups Usuarios_groups_group_id_890f65b0_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuarios_groups"
    ADD CONSTRAINT "Usuarios_groups_group_id_890f65b0_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public."Usuarios_groups" DROP CONSTRAINT "Usuarios_groups_group_id_890f65b0_fk_auth_group_id";
       public       postgres    false    208    203    2775                       2606    26760 B   Usuarios_groups Usuarios_groups_usuario_id_88bd6b34_fk_Usuarios_ci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuarios_groups"
    ADD CONSTRAINT "Usuarios_groups_usuario_id_88bd6b34_fk_Usuarios_ci" FOREIGN KEY (usuario_id) REFERENCES public."Usuarios"(ci) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public."Usuarios_groups" DROP CONSTRAINT "Usuarios_groups_usuario_id_88bd6b34_fk_Usuarios_ci";
       public       postgres    false    2787    206    208                       2606    26780 R   Usuarios_user_permissions Usuarios_user_permis_permission_id_dd067c85_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuarios_user_permissions"
    ADD CONSTRAINT "Usuarios_user_permis_permission_id_dd067c85_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Usuarios_user_permissions" DROP CONSTRAINT "Usuarios_user_permis_permission_id_dd067c85_fk_auth_perm";
       public       postgres    false    2770    201    210                       2606    26775 V   Usuarios_user_permissions Usuarios_user_permissions_usuario_id_d81d2a07_fk_Usuarios_ci    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuarios_user_permissions"
    ADD CONSTRAINT "Usuarios_user_permissions_usuario_id_d81d2a07_fk_Usuarios_ci" FOREIGN KEY (usuario_id) REFERENCES public."Usuarios"(ci) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public."Usuarios_user_permissions" DROP CONSTRAINT "Usuarios_user_permissions_usuario_id_d81d2a07_fk_Usuarios_ci";
       public       postgres    false    206    210    2787                       2606    26686 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    2770    201    205                       2606    26681 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    205    203    2775                       2606    26672 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    2765    201    199                       2606    26837 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    199    219    2765                        2606    26842 A   django_admin_log django_admin_log_user_id_c564eba6_fk_Usuarios_ci    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Usuarios_ci" FOREIGN KEY (user_id) REFERENCES public."Usuarios"(ci) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT "django_admin_log_user_id_c564eba6_fk_Usuarios_ci";
       public       postgres    false    2787    219    206            �      x�3000����� 	mt      �      x�3�4000�410�073����� "�%      �   s   x�5�=�0��99�wG�I��Ί8 KTyA�$�=E����2��k��M�q���_:�n�����_��z-�Ԃ�g�����AYN��aKe��y&�PUG�4�1�~�xK1�Դ"      �      x�3�4000\1z\\\ �x      �      x������ � �      �   /  x�u��N�0�����bwd��v�%@����.$�l
��1y���&&�<'_r�b�H&�u3��q>F��Eqģ��3��E��$�2���'��������}&�`�K���h �A�@k\p\
&c6�U#�,��z��*3�|���?'15��w��������H߾M�����b������'Q�v��w�UZ���Pv{�Z=��������QL���]	B�?��*��vS�4C�4��8�����,� &�p��:�`��S��cR a]�$�e`ң�~=G��i_�Tqz      �      x�3�410�073�4����� ��      �      x������ � �      �   D   x�3�tL����,.)JL�/�2�N.*�U�M,.I-�2�(�O)M.�/�rM9]R�Rs���=... �~<      �      x������ � �      �   m  x�]�In�0@ѵ}
N��{�kD�X��	C"n(�5��2o��*ۙ�fL��K^�O��λq�?�F�i����J]G3���U��a�w����
*���=,�F�B�R�)�u�V�OY��D%�Q�'U�s�&�A ���!��w�B�dS$��$��?gTІq=��d�'or���ĺ\��0V)_ȶ��D�K�i�U����_�m�8YW�X6�I�)�a^d��AGE۲5�L	E8�T�6XDL�fXDL�FPD�o��ن)�
����j�I`NDj�	aLDbى@J���y�k05��l3���a��j�%�0A��Ky��-����@����fj���A���W��Xx��'"��7k�?���-      �   i  x����J�0��٧=�!3��MO
^����mv-����W|�������.^�0��~�0�P��K�q�l�A�V]F��� �)��~JW�W}}n^Vnï�c�Z����5��:++����}���pE�����{f���4O'�0򤔰=�|��j�GL�Z�����~h~��ck���RڕR�Zh�dơ�]�aU��\�#Q�DO%d�"2�O��H�)��@K�)d'E]6eۅ�����]�N%�)14X�_�L%�@���U`�����xmJ�T�($��z�hv�֮�� �
��6F�o%q̟�f���=Z�}y-�_=���:W��o�P/\����.]����g���l6���Ӊ      �   �   x�u�K
B1E��b�:tN�3Ԁ��I*t��)���n�9�!�f.�L%��R�;(���,��&�T�LR��є���=8}>�� �<z�,#�a)���zMƂ��ge<�-�9�CMM]����S      �   �  x���A�� E��)�mQ`�pv}��J76n�Q���C"�-���ԯP����mQ�"��гZ���H��
'�tMO	��5}QR��d�Jl"��YNj��S�*�����9���h��
i�rbQn��k;��$��Q�w���� C�f뮠؆Z}�$�9���}��ϐ4���%�}����g��>cG�Z͞-}$2 Ax�����v��K"��o��0p��U}��:/��"�s։Iy/G�_@�р�u��a��$(��šߡ�E�( jtv]~�a���2(��-Rbq�����iٝ�V��w�_��}��*�C�p ���'��S̚���)`1"�v��,�z��������$�D�SM⟑�8X}�M
6A��' ��j�����8���oS���IV      �      x������ � �     