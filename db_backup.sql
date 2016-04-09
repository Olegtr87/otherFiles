--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-04-09 22:54:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 195 (class 1259 OID 16874)
-- Name: balance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE balance (
    id integer NOT NULL,
    debit integer NOT NULL,
    credit integer NOT NULL,
    currency_id integer NOT NULL,
    registry_operations_id integer NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 16872)
-- Name: balance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 194
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE balance_id_seq OWNED BY balance.id;


--
-- TOC entry 193 (class 1259 OID 16867)
-- Name: check; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "check" (
    id integer NOT NULL,
    date_check timestamp without time zone NOT NULL,
    sum integer NOT NULL,
    id_user integer NOT NULL,
    registry_operations_id integer NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 16831)
-- Name: course; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE course (
    id integer NOT NULL,
    buy_course integer NOT NULL,
    sell_course integer NOT NULL,
    date_course timestamp without time zone NOT NULL,
    currency_id integer NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 16829)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 187
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE course_id_seq OWNED BY course.id;


--
-- TOC entry 192 (class 1259 OID 16854)
-- Name: currency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE currency (
    id integer NOT NULL,
    name character varying NOT NULL,
    short_name character varying(5) NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 16852)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 191
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE currency_id_seq OWNED BY currency.id;


--
-- TOC entry 190 (class 1259 OID 16841)
-- Name: operation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE operation (
    id integer NOT NULL,
    name character varying NOT NULL,
    status_block boolean NOT NULL,
    tax double precision NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 16839)
-- Name: operation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 189
-- Name: operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operation_id_seq OWNED BY operation.id;


--
-- TOC entry 186 (class 1259 OID 16823)
-- Name: registry_operations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE registry_operations (
    id integer NOT NULL,
    user_id integer NOT NULL,
    total_operations integer NOT NULL,
    operation_id integer NOT NULL,
    course_id integer NOT NULL,
    summ_in integer NOT NULL,
    summ_out integer NOT NULL,
    currency_in_id integer NOT NULL,
    currency_out_id integer NOT NULL,
    date_operation timestamp without time zone NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 16821)
-- Name: registry_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE registry_operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 185
-- Name: registry_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE registry_operations_id_seq OWNED BY registry_operations.id;


--
-- TOC entry 184 (class 1259 OID 16813)
-- Name: user_credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    role integer NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 16811)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 183
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 182 (class 1259 OID 16800)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_profile (
    id integer NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    patronymic character varying(20),
    number_passport character varying NOT NULL,
    date_issue timestamp without time zone NOT NULL,
    issued character varying NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 16798)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2030 (class 2604 OID 16877)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance ALTER COLUMN id SET DEFAULT nextval('balance_id_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 16834)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY course ALTER COLUMN id SET DEFAULT nextval('course_id_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 16857)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 16844)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation ALTER COLUMN id SET DEFAULT nextval('operation_id_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 16826)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY registry_operations ALTER COLUMN id SET DEFAULT nextval('registry_operations_id_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 16816)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 16803)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile ALTER COLUMN id SET DEFAULT nextval('user_profile_id_seq'::regclass);


--
-- TOC entry 2198 (class 0 OID 16874)
-- Dependencies: 195
-- Data for Name: balance; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 194
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('balance_id_seq', 1, false);


--
-- TOC entry 2196 (class 0 OID 16867)
-- Dependencies: 193
-- Data for Name: check; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2191 (class 0 OID 16831)
-- Dependencies: 188
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 187
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('course_id_seq', 1, false);


--
-- TOC entry 2195 (class 0 OID 16854)
-- Dependencies: 192
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 191
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currency_id_seq', 1, false);


--
-- TOC entry 2193 (class 0 OID 16841)
-- Dependencies: 190
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 189
-- Name: operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('operation_id_seq', 1, false);


--
-- TOC entry 2189 (class 0 OID 16823)
-- Dependencies: 186
-- Data for Name: registry_operations; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 185
-- Name: registry_operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('registry_operations_id_seq', 1, false);


--
-- TOC entry 2187 (class 0 OID 16813)
-- Dependencies: 184
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 183
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1, false);


--
-- TOC entry 2185 (class 0 OID 16800)
-- Dependencies: 182
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2058 (class 2606 OID 16879)
-- Name: balance_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pk PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 16871)
-- Name: check_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "check"
    ADD CONSTRAINT check_pk PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 16838)
-- Name: course_date_course_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_date_course_key UNIQUE (date_course);


--
-- TOC entry 2044 (class 2606 OID 16836)
-- Name: course_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_pk PRIMARY KEY (id);


--
-- TOC entry 2050 (class 2606 OID 16864)
-- Name: currency_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_name_key UNIQUE (name);


--
-- TOC entry 2052 (class 2606 OID 16862)
-- Name: currency_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- TOC entry 2054 (class 2606 OID 16866)
-- Name: currency_short_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_short_name_key UNIQUE (short_name);


--
-- TOC entry 2046 (class 2606 OID 16851)
-- Name: operation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_name_key UNIQUE (name);


--
-- TOC entry 2048 (class 2606 OID 16849)
-- Name: operation_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_pk PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 16828)
-- Name: registry_operations_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_pk PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 16820)
-- Name: user_credentials_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_login_key UNIQUE (login);


--
-- TOC entry 2038 (class 2606 OID 16818)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 16810)
-- Name: user_profile_number_passport_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_number_passport_key UNIQUE (number_passport);


--
-- TOC entry 2034 (class 2606 OID 16808)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 16925)
-- Name: balance_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_fk0 FOREIGN KEY (currency_id) REFERENCES currency(id);


--
-- TOC entry 2069 (class 2606 OID 16930)
-- Name: balance_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_fk1 FOREIGN KEY (registry_operations_id) REFERENCES registry_operations(id);


--
-- TOC entry 2066 (class 2606 OID 16915)
-- Name: check_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "check"
    ADD CONSTRAINT check_fk0 FOREIGN KEY (id_user) REFERENCES user_credentials(id);


--
-- TOC entry 2067 (class 2606 OID 16920)
-- Name: check_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "check"
    ADD CONSTRAINT check_fk1 FOREIGN KEY (registry_operations_id) REFERENCES registry_operations(id);


--
-- TOC entry 2065 (class 2606 OID 16910)
-- Name: course_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_fk0 FOREIGN KEY (currency_id) REFERENCES currency(id);


--
-- TOC entry 2060 (class 2606 OID 16885)
-- Name: registry_operations_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk0 FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- TOC entry 2061 (class 2606 OID 16890)
-- Name: registry_operations_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk1 FOREIGN KEY (operation_id) REFERENCES operation(id);


--
-- TOC entry 2062 (class 2606 OID 16895)
-- Name: registry_operations_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk2 FOREIGN KEY (course_id) REFERENCES course(id);


--
-- TOC entry 2063 (class 2606 OID 16900)
-- Name: registry_operations_fk3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk3 FOREIGN KEY (currency_in_id) REFERENCES currency(id);


--
-- TOC entry 2064 (class 2606 OID 16905)
-- Name: registry_operations_fk4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registry_operations
    ADD CONSTRAINT registry_operations_fk4 FOREIGN KEY (currency_out_id) REFERENCES currency(id);


--
-- TOC entry 2059 (class 2606 OID 16880)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-04-09 22:54:12

--
-- PostgreSQL database dump complete
--

