PGDMP     ;    '                t         	   exchanger    9.5.2    9.5.2 J    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    24585 	   exchanger    DATABASE     �   CREATE DATABASE exchanger WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Belarusian_Belarus.1251' LC_CTYPE = 'Belarusian_Belarus.1251';
    DROP DATABASE exchanger;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24666    balance    TABLE     �   CREATE TABLE balance (
    id integer NOT NULL,
    debit integer NOT NULL,
    credit integer NOT NULL,
    registry_operations_id integer NOT NULL
);
    DROP TABLE public.balance;
       public         postgres    false    6            �            1259    24664    balance_id_seq    SEQUENCE     p   CREATE SEQUENCE balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.balance_id_seq;
       public       postgres    false    195    6            �           0    0    balance_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE balance_id_seq OWNED BY balance.id;
            public       postgres    false    194            �            1259    24657    check    TABLE     �   CREATE TABLE "check" (
    id integer NOT NULL,
    date_check timestamp without time zone NOT NULL,
    number_registry_id integer NOT NULL
);
    DROP TABLE public."check";
       public         postgres    false    6            �            1259    24621    course    TABLE     �   CREATE TABLE course (
    id integer NOT NULL,
    buy_course integer NOT NULL,
    sell_course integer NOT NULL,
    date_course timestamp without time zone NOT NULL,
    currency_id integer NOT NULL
);
    DROP TABLE public.course;
       public         postgres    false    6            �            1259    24619    course_id_seq    SEQUENCE     o   CREATE SEQUENCE course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.course_id_seq;
       public       postgres    false    188    6            �           0    0    course_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE course_id_seq OWNED BY course.id;
            public       postgres    false    187            �            1259    24644    currency    TABLE     X   CREATE TABLE currency (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.currency;
       public         postgres    false    6            �            1259    24642    currency_id_seq    SEQUENCE     q   CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.currency_id_seq;
       public       postgres    false    6    192            �           0    0    currency_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE currency_id_seq OWNED BY currency.id;
            public       postgres    false    191            �            1259    24631 	   operation    TABLE     �   CREATE TABLE operation (
    id integer NOT NULL,
    name character varying NOT NULL,
    status_block boolean NOT NULL,
    tax double precision NOT NULL
);
    DROP TABLE public.operation;
       public         postgres    false    6            �            1259    24629    operation_id_seq    SEQUENCE     r   CREATE SEQUENCE operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.operation_id_seq;
       public       postgres    false    6    190            �           0    0    operation_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE operation_id_seq OWNED BY operation.id;
            public       postgres    false    189            �            1259    24611    registry_operations    TABLE     �  CREATE TABLE registry_operations (
    id integer NOT NULL,
    user_id integer NOT NULL,
    number_operation integer NOT NULL,
    operation_id integer NOT NULL,
    course_in_id integer NOT NULL,
    course_out_id integer NOT NULL,
    summ_in integer NOT NULL,
    summ_out integer NOT NULL,
    date_operation timestamp without time zone NOT NULL,
    number_registry integer NOT NULL
);
 '   DROP TABLE public.registry_operations;
       public         postgres    false    6            �            1259    24609    registry_operations_id_seq    SEQUENCE     |   CREATE SEQUENCE registry_operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.registry_operations_id_seq;
       public       postgres    false    186    6            �           0    0    registry_operations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE registry_operations_id_seq OWNED BY registry_operations.id;
            public       postgres    false    185            �            1259    24601    user_credentials    TABLE     �   CREATE TABLE user_credentials (
    id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    role integer NOT NULL
);
 $   DROP TABLE public.user_credentials;
       public         postgres    false    6            �            1259    24599    user_credentials_id_seq    SEQUENCE     y   CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.user_credentials_id_seq;
       public       postgres    false    6    184            �           0    0    user_credentials_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;
            public       postgres    false    183            �            1259    24588    user_profile    TABLE     F  CREATE TABLE user_profile (
    id integer NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    patronymic character varying(20),
    number_passport character varying NOT NULL,
    date_issue timestamp without time zone NOT NULL,
    issued character varying NOT NULL
);
     DROP TABLE public.user_profile;
       public         postgres    false    6            �            1259    24586    user_profile_id_seq    SEQUENCE     u   CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_profile_id_seq;
       public       postgres    false    182    6            �           0    0    user_profile_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;
            public       postgres    false    181            �           2604    24669    id    DEFAULT     Z   ALTER TABLE ONLY balance ALTER COLUMN id SET DEFAULT nextval('balance_id_seq'::regclass);
 9   ALTER TABLE public.balance ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194    195            �           2604    24624    id    DEFAULT     X   ALTER TABLE ONLY course ALTER COLUMN id SET DEFAULT nextval('course_id_seq'::regclass);
 8   ALTER TABLE public.course ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    188    188            �           2604    24647    id    DEFAULT     \   ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);
 :   ALTER TABLE public.currency ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    192    192            �           2604    24634    id    DEFAULT     ^   ALTER TABLE ONLY operation ALTER COLUMN id SET DEFAULT nextval('operation_id_seq'::regclass);
 ;   ALTER TABLE public.operation ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    189    190            �           2604    24614    id    DEFAULT     r   ALTER TABLE ONLY registry_operations ALTER COLUMN id SET DEFAULT nextval('registry_operations_id_seq'::regclass);
 E   ALTER TABLE public.registry_operations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    186    186            �           2604    24604    id    DEFAULT     l   ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);
 B   ALTER TABLE public.user_credentials ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    183    184    184            �           2604    24591    id    DEFAULT     d   ALTER TABLE ONLY user_profile ALTER COLUMN id SET DEFAULT nextval('user_profile_id_seq'::regclass);
 >   ALTER TABLE public.user_profile ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    181    182            �          0    24666    balance 
   TABLE DATA                     public       postgres    false    195   JO       �           0    0    balance_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('balance_id_seq', 1, false);
            public       postgres    false    194            �          0    24657    check 
   TABLE DATA                     public       postgres    false    193   dO       �          0    24621    course 
   TABLE DATA                     public       postgres    false    188   ~O       �           0    0    course_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('course_id_seq', 1, false);
            public       postgres    false    187            �          0    24644    currency 
   TABLE DATA                     public       postgres    false    192   �O       �           0    0    currency_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('currency_id_seq', 1, false);
            public       postgres    false    191            �          0    24631 	   operation 
   TABLE DATA                     public       postgres    false    190   �O       �           0    0    operation_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('operation_id_seq', 1, false);
            public       postgres    false    189            �          0    24611    registry_operations 
   TABLE DATA                     public       postgres    false    186   �O       �           0    0    registry_operations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('registry_operations_id_seq', 1, false);
            public       postgres    false    185            �          0    24601    user_credentials 
   TABLE DATA                     public       postgres    false    184   �O       �           0    0    user_credentials_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('user_credentials_id_seq', 1, false);
            public       postgres    false    183            �          0    24588    user_profile 
   TABLE DATA                     public       postgres    false    182    P       �           0    0    user_profile_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('user_profile_id_seq', 1, false);
            public       postgres    false    181                       2606    24671 
   balance_pk 
   CONSTRAINT     I   ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.balance DROP CONSTRAINT balance_pk;
       public         postgres    false    195    195                       2606    24663    check_number_registry_id_key 
   CONSTRAINT     f   ALTER TABLE ONLY "check"
    ADD CONSTRAINT check_number_registry_id_key UNIQUE (number_registry_id);
 N   ALTER TABLE ONLY public."check" DROP CONSTRAINT check_number_registry_id_key;
       public         postgres    false    193    193            
           2606    24661    check_pk 
   CONSTRAINT     G   ALTER TABLE ONLY "check"
    ADD CONSTRAINT check_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."check" DROP CONSTRAINT check_pk;
       public         postgres    false    193    193            �           2606    24628    course_date_course_key 
   CONSTRAINT     X   ALTER TABLE ONLY course
    ADD CONSTRAINT course_date_course_key UNIQUE (date_course);
 G   ALTER TABLE ONLY public.course DROP CONSTRAINT course_date_course_key;
       public         postgres    false    188    188            �           2606    24626 	   course_pk 
   CONSTRAINT     G   ALTER TABLE ONLY course
    ADD CONSTRAINT course_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pk;
       public         postgres    false    188    188                       2606    24654    currency_name_key 
   CONSTRAINT     N   ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.currency DROP CONSTRAINT currency_name_key;
       public         postgres    false    192    192                       2606    24652    currency_pk 
   CONSTRAINT     K   ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.currency DROP CONSTRAINT currency_pk;
       public         postgres    false    192    192                        2606    24641    operation_name_key 
   CONSTRAINT     P   ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.operation DROP CONSTRAINT operation_name_key;
       public         postgres    false    190    190                       2606    24639    operation_pk 
   CONSTRAINT     M   ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.operation DROP CONSTRAINT operation_pk;
       public         postgres    false    190    190            �           2606    24618 '   registry_operations_number_registry_key 
   CONSTRAINT     z   ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_number_registry_key UNIQUE (number_registry);
 e   ALTER TABLE ONLY public.registry_operations DROP CONSTRAINT registry_operations_number_registry_key;
       public         postgres    false    186    186            �           2606    24616    registry_operations_pk 
   CONSTRAINT     a   ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.registry_operations DROP CONSTRAINT registry_operations_pk;
       public         postgres    false    186    186            �           2606    24608    user_credentials_login_key 
   CONSTRAINT     `   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_login_key UNIQUE (login);
 U   ALTER TABLE ONLY public.user_credentials DROP CONSTRAINT user_credentials_login_key;
       public         postgres    false    184    184            �           2606    24606    user_credentials_pk 
   CONSTRAINT     [   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.user_credentials DROP CONSTRAINT user_credentials_pk;
       public         postgres    false    184    184            �           2606    24598     user_profile_number_passport_key 
   CONSTRAINT     l   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_number_passport_key UNIQUE (number_passport);
 W   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_number_passport_key;
       public         postgres    false    182    182            �           2606    24596    user_profile_pk 
   CONSTRAINT     S   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_pk;
       public         postgres    false    182    182                       2606    24707    balance_fk0    FK CONSTRAINT     �   ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_fk0 FOREIGN KEY (registry_operations_id) REFERENCES registry_operations(id);
 =   ALTER TABLE ONLY public.balance DROP CONSTRAINT balance_fk0;
       public       postgres    false    2042    186    195                       2606    24702 	   check_fk0    FK CONSTRAINT     �   ALTER TABLE ONLY "check"
    ADD CONSTRAINT check_fk0 FOREIGN KEY (number_registry_id) REFERENCES registry_operations(number_registry);
 ;   ALTER TABLE ONLY public."check" DROP CONSTRAINT check_fk0;
       public       postgres    false    193    2040    186                       2606    24697 
   course_fk0    FK CONSTRAINT     i   ALTER TABLE ONLY course
    ADD CONSTRAINT course_fk0 FOREIGN KEY (currency_id) REFERENCES currency(id);
 ;   ALTER TABLE ONLY public.course DROP CONSTRAINT course_fk0;
       public       postgres    false    2054    192    188                       2606    24677    registry_operations_fk0    FK CONSTRAINT     �   ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk0 FOREIGN KEY (user_id) REFERENCES user_credentials(id);
 U   ALTER TABLE ONLY public.registry_operations DROP CONSTRAINT registry_operations_fk0;
       public       postgres    false    186    2038    184                       2606    24682    registry_operations_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk1 FOREIGN KEY (operation_id) REFERENCES operation(id);
 U   ALTER TABLE ONLY public.registry_operations DROP CONSTRAINT registry_operations_fk1;
       public       postgres    false    2050    190    186                       2606    24687    registry_operations_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk2 FOREIGN KEY (course_in_id) REFERENCES course(id);
 U   ALTER TABLE ONLY public.registry_operations DROP CONSTRAINT registry_operations_fk2;
       public       postgres    false    2046    186    188                       2606    24692    registry_operations_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk3 FOREIGN KEY (course_out_id) REFERENCES course(id);
 U   ALTER TABLE ONLY public.registry_operations DROP CONSTRAINT registry_operations_fk3;
       public       postgres    false    186    2046    188                       2606    24672    user_profile_fk0    FK CONSTRAINT     t   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);
 G   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_fk0;
       public       postgres    false    184    2038    182            �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���         