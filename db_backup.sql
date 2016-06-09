--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-06-10 01:45:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 25215)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 193 (class 1259 OID 25159)
-- Name: balance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE balance (
    id integer NOT NULL,
    sum integer NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 25157)
-- Name: balance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 192
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE balance_id_seq OWNED BY balance.id;


--
-- TOC entry 195 (class 1259 OID 25167)
-- Name: currency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE currency (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 25165)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 194
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE currency_id_seq OWNED BY currency.id;


--
-- TOC entry 189 (class 1259 OID 25136)
-- Name: exchange_rate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE exchange_rate (
    id integer NOT NULL,
    date_course timestamp without time zone NOT NULL,
    currency_from_id integer NOT NULL,
    currency_to_id integer NOT NULL,
    conversion double precision NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 25134)
-- Name: exchange_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exchange_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 188
-- Name: exchange_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exchange_rate_id_seq OWNED BY exchange_rate.id;


--
-- TOC entry 191 (class 1259 OID 25146)
-- Name: operation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE operation (
    id integer NOT NULL,
    name character varying NOT NULL,
    status_block boolean NOT NULL,
    tax double precision NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 25144)
-- Name: operation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 190
-- Name: operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operation_id_seq OWNED BY operation.id;


--
-- TOC entry 187 (class 1259 OID 25128)
-- Name: transaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE transaction (
    id integer NOT NULL,
    user_id integer NOT NULL,
    operation_id integer NOT NULL,
    exchange_rate_id integer NOT NULL,
    sum_in integer NOT NULL,
    date_operation timestamp without time zone NOT NULL,
    total_sum integer
);


--
-- TOC entry 186 (class 1259 OID 25126)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 186
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;


--
-- TOC entry 185 (class 1259 OID 25115)
-- Name: user_credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    role character varying NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 25113)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 184
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 183 (class 1259 OID 25102)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_profile (
    id integer NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    patronymic character varying(20),
    number_passport character varying NOT NULL,
    date_issue timestamp without time zone NOT NULL,
    issued character varying NOT NULL,
    created timestamp without time zone NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 25100)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 182
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


SET search_path = test, pg_catalog;

--
-- TOC entry 196 (class 1259 OID 25230)
-- Name: balance; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE balance (
    id integer NOT NULL,
    sum integer NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 25233)
-- Name: balance_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 197
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE balance_id_seq OWNED BY balance.id;


--
-- TOC entry 198 (class 1259 OID 25235)
-- Name: currency; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE currency (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 25241)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 199
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE currency_id_seq OWNED BY currency.id;


--
-- TOC entry 200 (class 1259 OID 25243)
-- Name: exchange_rate; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE exchange_rate (
    id integer NOT NULL,
    date_course timestamp without time zone NOT NULL,
    currency_from_id integer NOT NULL,
    currency_to_id integer NOT NULL,
    conversion double precision NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 25246)
-- Name: exchange_rate_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE exchange_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 201
-- Name: exchange_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE exchange_rate_id_seq OWNED BY exchange_rate.id;


--
-- TOC entry 202 (class 1259 OID 25248)
-- Name: operation; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE operation (
    id integer NOT NULL,
    name character varying NOT NULL,
    status_block boolean NOT NULL,
    tax double precision NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 25254)
-- Name: operation_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 203
-- Name: operation_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE operation_id_seq OWNED BY operation.id;


--
-- TOC entry 204 (class 1259 OID 25256)
-- Name: transaction; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE transaction (
    id integer NOT NULL,
    user_id integer NOT NULL,
    operation_id integer NOT NULL,
    exchange_rate_id integer NOT NULL,
    sum_in integer NOT NULL,
    date_operation timestamp without time zone NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 25259)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 205
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;


--
-- TOC entry 206 (class 1259 OID 25261)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    role character varying NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 25267)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 208 (class 1259 OID 25269)
-- Name: user_profile; Type: TABLE; Schema: test; Owner: -
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
-- TOC entry 209 (class 1259 OID 25275)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 2073 (class 2604 OID 25162)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance ALTER COLUMN id SET DEFAULT nextval('balance_id_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 25170)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);


--
-- TOC entry 2071 (class 2604 OID 25139)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate ALTER COLUMN id SET DEFAULT nextval('exchange_rate_id_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 25149)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation ALTER COLUMN id SET DEFAULT nextval('operation_id_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 25131)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction ALTER COLUMN id SET DEFAULT nextval('transaction_id_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 25118)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 25105)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile ALTER COLUMN id SET DEFAULT nextval('user_profile_id_seq'::regclass);


SET search_path = test, pg_catalog;

--
-- TOC entry 2075 (class 2604 OID 25277)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY balance ALTER COLUMN id SET DEFAULT nextval('balance_id_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 25278)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 25279)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate ALTER COLUMN id SET DEFAULT nextval('exchange_rate_id_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 25280)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY operation ALTER COLUMN id SET DEFAULT nextval('operation_id_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 25281)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction ALTER COLUMN id SET DEFAULT nextval('transaction_id_seq'::regclass);


--
-- TOC entry 2080 (class 2604 OID 25282)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2081 (class 2604 OID 25283)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile ALTER COLUMN id SET DEFAULT nextval('user_profile_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2271 (class 0 OID 25159)
-- Dependencies: 193
-- Data for Name: balance; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO balance (id, sum) VALUES (1, 1000);
INSERT INTO balance (id, sum) VALUES (2, 2000);
INSERT INTO balance (id, sum) VALUES (3, 5000);
INSERT INTO balance (id, sum) VALUES (4, 6000);
INSERT INTO balance (id, sum) VALUES (5, 7000);


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 192
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('balance_id_seq', 5, true);


--
-- TOC entry 2273 (class 0 OID 25167)
-- Dependencies: 195
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO currency (id, name) VALUES (1, 'USD');
INSERT INTO currency (id, name) VALUES (2, 'EUR');
INSERT INTO currency (id, name) VALUES (3, 'PLZ');
INSERT INTO currency (id, name) VALUES (4, 'BRB');
INSERT INTO currency (id, name) VALUES (5, 'RUB');


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 194
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currency_id_seq', 5, true);


--
-- TOC entry 2267 (class 0 OID 25136)
-- Dependencies: 189
-- Data for Name: exchange_rate; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (1, '2016-05-01 00:00:00', 5, 3, 9);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (3, '2016-05-29 00:00:00', 1, 4, 19000);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (7, '2016-05-30 00:00:00', 1, 4, 19200);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (9, '2016-05-31 00:00:00', 1, 4, 19800);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (21, '2016-06-07 00:00:00', 1, 4, 19200);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (22, '2016-06-08 00:00:00', 1, 4, 19800);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (23, '2016-06-08 00:00:00', 4, 1, 5.0251256281407036e-005);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (24, '2016-06-08 00:00:00', 4, 2, 4.9504950495049508e-005);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (25, '2016-06-08 00:00:00', 2, 4, 20000);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (26, '2016-06-09 00:00:00', 1, 4, 19350);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (27, '2016-06-09 00:00:00', 4, 1, 5.1020408163265308e-005);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (28, '2016-06-09 00:00:00', 2, 4, 22000);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (30, '2016-06-09 00:00:00', 4, 2, 4.5248868778280542e-005);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (20, '2016-06-04 00:00:00', 4, 3, 0.00020000000000000001);


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 188
-- Name: exchange_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('exchange_rate_id_seq', 32, true);


--
-- TOC entry 2269 (class 0 OID 25146)
-- Dependencies: 191
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO operation (id, name, status_block, tax) VALUES (1, 'sell', false, 7);
INSERT INTO operation (id, name, status_block, tax) VALUES (3, 'convertation', false, 2);
INSERT INTO operation (id, name, status_block, tax) VALUES (2, 'buy', false, 9);


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 190
-- Name: operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('operation_id_seq', 6, true);


--
-- TOC entry 2265 (class 0 OID 25128)
-- Dependencies: 187
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (92, 2, 2, 22, 100, '2016-06-08 03:11:37.029', 1801800);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (93, 2, 2, 22, 1000, '2016-06-08 03:11:59.362', 19602000);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (94, 2, 1, 24, 19602000, '2016-06-08 03:11:59.434', 961);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (95, 2, 2, 22, 100, '2016-06-08 03:14:44.956', 1940400);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (96, 2, 1, 24, 1940400, '2016-06-08 03:14:45.024', 94);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (97, 2, 2, 22, 100, '2016-06-08 03:22:13.124', 1940400);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (98, 2, 1, 24, 1940400, '2016-06-08 03:22:13.197', 94);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (99, 2, 2, 22, 100, '2016-06-08 03:24:02.916', 1801800);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (100, 2, 1, 23, 100000, '2016-06-08 03:24:26.946', 5);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (101, 2, 2, 26, 100, '2016-06-09 00:32:58.012', 1760850);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (102, 2, 2, 26, 100, '2016-06-09 00:39:28.834', 1896300);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (103, 2, 1, 30, 1896300, '2016-06-09 00:39:28.861', 84);
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation, total_sum) VALUES (104, 2, 2, 26, 100, '2016-06-09 00:50:01.352', 1760850);


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 186
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('transaction_id_seq', 104, true);


--
-- TOC entry 2263 (class 0 OID 25115)
-- Dependencies: 185
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_credentials (id, login, password, role) VALUES (1, 'admin@gmail.com', 'pass', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (2, 'client@gmail.com', 'pass', 'Client');
INSERT INTO user_credentials (id, login, password, role) VALUES (3, 'olegtr87@gmail.com', 'pass', 'Client');


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 184
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 5, true);


--
-- TOC entry 2261 (class 0 OID 25102)
-- Dependencies: 183
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (1, 'oleg', 'vas', 'iv', '123', '2015-04-04 00:00:00', 'asd', '2015-04-04 00:00:00');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (2, 'Vasya', 'Rogov', 'Ivanovich', '1233', '2014-05-05 00:00:00', 'sd', '2015-04-04 00:00:00');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (3, 'Vasilevskii', 'Oleg', 'Ivanovich', 'KH124123123', '2016-06-06 00:00:00', 'Grodno', '2016-06-06 23:33:50.557');


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 182
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


SET search_path = test, pg_catalog;

--
-- TOC entry 2274 (class 0 OID 25230)
-- Dependencies: 196
-- Data for Name: balance; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO balance (id, sum) VALUES (1, 1000);


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 197
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('balance_id_seq', 1, false);


--
-- TOC entry 2276 (class 0 OID 25235)
-- Dependencies: 198
-- Data for Name: currency; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO currency (id, name) VALUES (1, 'USD');


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 199
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('currency_id_seq', 1, true);


--
-- TOC entry 2278 (class 0 OID 25243)
-- Dependencies: 200
-- Data for Name: exchange_rate; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (1, '2016-04-04 00:00:00', 1, 1, 2);


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 201
-- Name: exchange_rate_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('exchange_rate_id_seq', 1, true);


--
-- TOC entry 2280 (class 0 OID 25248)
-- Dependencies: 202
-- Data for Name: operation; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO operation (id, name, status_block, tax) VALUES (1, 'sell', false, 7);


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 203
-- Name: operation_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('operation_id_seq', 1, true);


--
-- TOC entry 2282 (class 0 OID 25256)
-- Dependencies: 204
-- Data for Name: transaction; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation) VALUES (1, 1, 1, 1, 2, '2016-05-05 00:00:00');
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation) VALUES (2, 2, 1, 1, 3, '2016-06-06 00:00:00');
INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation) VALUES (3, 1, 1, 1, 6, '2016-06-06 00:00:00');


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 205
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('transaction_id_seq', 3, true);


--
-- TOC entry 2284 (class 0 OID 25261)
-- Dependencies: 206
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_credentials (id, login, password, role) VALUES (1, 'admin', 'pass', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (2, 'client', 'pass', 'Client');


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 2, true);


--
-- TOC entry 2286 (class 0 OID 25269)
-- Dependencies: 208
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued) VALUES (1, 'oleg', 'vas', 'iv', '123', '2015-04-04 00:00:00', 'asd');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued) VALUES (2, 'vasya', 'rogov', 'tf', '1233', '2014-05-05 00:00:00', 'sd');


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 2101 (class 2606 OID 25164)
-- Name: balance_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pk PRIMARY KEY (id);


--
-- TOC entry 2103 (class 2606 OID 25177)
-- Name: currency_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_name_key UNIQUE (name);


--
-- TOC entry 2105 (class 2606 OID 25175)
-- Name: currency_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- TOC entry 2093 (class 2606 OID 25214)
-- Name: exchange_rate_date_course_currency_from_id_currency_to_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_date_course_currency_from_id_currency_to_id_key UNIQUE (date_course, currency_from_id, currency_to_id);


--
-- TOC entry 2095 (class 2606 OID 25141)
-- Name: exchange_rate_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_pk PRIMARY KEY (id);


--
-- TOC entry 2097 (class 2606 OID 25156)
-- Name: operation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_name_key UNIQUE (name);


--
-- TOC entry 2099 (class 2606 OID 25154)
-- Name: operation_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_pk PRIMARY KEY (id);


--
-- TOC entry 2091 (class 2606 OID 25133)
-- Name: transaction_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);


--
-- TOC entry 2087 (class 2606 OID 25125)
-- Name: user_credentials_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_login_key UNIQUE (login);


--
-- TOC entry 2089 (class 2606 OID 25123)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2083 (class 2606 OID 25112)
-- Name: user_profile_number_passport_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_number_passport_key UNIQUE (number_passport);


--
-- TOC entry 2085 (class 2606 OID 25110)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


SET search_path = test, pg_catalog;

--
-- TOC entry 2107 (class 2606 OID 25285)
-- Name: balance_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pk PRIMARY KEY (id);


--
-- TOC entry 2109 (class 2606 OID 25287)
-- Name: currency_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_name_key UNIQUE (name);


--
-- TOC entry 2111 (class 2606 OID 25289)
-- Name: currency_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- TOC entry 2113 (class 2606 OID 25291)
-- Name: exchange_rate_date_course_currency_from_id_currency_to_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_date_course_currency_from_id_currency_to_id_key UNIQUE (date_course, currency_from_id, currency_to_id);


--
-- TOC entry 2115 (class 2606 OID 25293)
-- Name: exchange_rate_date_course_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_date_course_key UNIQUE (date_course);


--
-- TOC entry 2117 (class 2606 OID 25295)
-- Name: exchange_rate_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_pk PRIMARY KEY (id);


--
-- TOC entry 2119 (class 2606 OID 25297)
-- Name: operation_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_name_key UNIQUE (name);


--
-- TOC entry 2121 (class 2606 OID 25299)
-- Name: operation_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_pk PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 25301)
-- Name: transaction_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);


--
-- TOC entry 2125 (class 2606 OID 25303)
-- Name: user_credentials_login_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_login_key UNIQUE (login);


--
-- TOC entry 2127 (class 2606 OID 25305)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2129 (class 2606 OID 25307)
-- Name: user_profile_number_passport_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_number_passport_key UNIQUE (number_passport);


--
-- TOC entry 2131 (class 2606 OID 25309)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2138 (class 2606 OID 25208)
-- Name: balance_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_fk0 FOREIGN KEY (id) REFERENCES currency(id);


--
-- TOC entry 2136 (class 2606 OID 25198)
-- Name: exchange_rate_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk0 FOREIGN KEY (currency_from_id) REFERENCES currency(id);


--
-- TOC entry 2137 (class 2606 OID 25203)
-- Name: exchange_rate_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk1 FOREIGN KEY (currency_to_id) REFERENCES currency(id);


--
-- TOC entry 2133 (class 2606 OID 25183)
-- Name: transaction_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk0 FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- TOC entry 2134 (class 2606 OID 25188)
-- Name: transaction_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk1 FOREIGN KEY (operation_id) REFERENCES operation(id);


--
-- TOC entry 2135 (class 2606 OID 25193)
-- Name: transaction_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk2 FOREIGN KEY (exchange_rate_id) REFERENCES exchange_rate(id);


--
-- TOC entry 2132 (class 2606 OID 25178)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


SET search_path = test, pg_catalog;

--
-- TOC entry 2139 (class 2606 OID 25310)
-- Name: balance_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_fk0 FOREIGN KEY (id) REFERENCES currency(id);


--
-- TOC entry 2140 (class 2606 OID 25315)
-- Name: exchange_rate_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk0 FOREIGN KEY (currency_from_id) REFERENCES currency(id);


--
-- TOC entry 2141 (class 2606 OID 25320)
-- Name: exchange_rate_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk1 FOREIGN KEY (currency_to_id) REFERENCES currency(id);


--
-- TOC entry 2142 (class 2606 OID 25325)
-- Name: transaction_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk0 FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- TOC entry 2143 (class 2606 OID 25330)
-- Name: transaction_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk1 FOREIGN KEY (operation_id) REFERENCES operation(id);


--
-- TOC entry 2144 (class 2606 OID 25335)
-- Name: transaction_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk2 FOREIGN KEY (exchange_rate_id) REFERENCES exchange_rate(id);


--
-- TOC entry 2145 (class 2606 OID 25340)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-06-10 01:45:57

--
-- PostgreSQL database dump complete
--

