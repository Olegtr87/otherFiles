--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-04-25 02:03:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 24950)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 193 (class 1259 OID 24769)
-- Name: balance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE balance (
    id integer NOT NULL,
    sum integer NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 24767)
-- Name: balance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 192
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE balance_id_seq OWNED BY balance.id;


--
-- TOC entry 195 (class 1259 OID 24777)
-- Name: currency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE currency (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 24775)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 194
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE currency_id_seq OWNED BY currency.id;


--
-- TOC entry 189 (class 1259 OID 24746)
-- Name: exchange_rate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE exchange_rate (
    id integer NOT NULL,
    date_course timestamp without time zone NOT NULL,
    currency_id_from integer NOT NULL,
    currency_id_to integer NOT NULL,
    conversion double precision NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 24744)
-- Name: exchange_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exchange_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 188
-- Name: exchange_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exchange_rate_id_seq OWNED BY exchange_rate.id;


--
-- TOC entry 191 (class 1259 OID 24756)
-- Name: operation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE operation (
    id integer NOT NULL,
    name character varying NOT NULL,
    status_block boolean NOT NULL,
    tax double precision NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 24754)
-- Name: operation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 190
-- Name: operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operation_id_seq OWNED BY operation.id;


--
-- TOC entry 187 (class 1259 OID 24738)
-- Name: transaction; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 186 (class 1259 OID 24736)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 186
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;


--
-- TOC entry 185 (class 1259 OID 24728)
-- Name: user_credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    role character varying NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 24726)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 184
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 183 (class 1259 OID 24715)
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
-- TOC entry 182 (class 1259 OID 24713)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 182
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


SET search_path = test, pg_catalog;

--
-- TOC entry 196 (class 1259 OID 24951)
-- Name: balance; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE balance (
    id integer NOT NULL,
    sum integer NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 24954)
-- Name: balance_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 197
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE balance_id_seq OWNED BY balance.id;


--
-- TOC entry 198 (class 1259 OID 24956)
-- Name: currency; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE currency (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 24962)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 199
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE currency_id_seq OWNED BY currency.id;


--
-- TOC entry 200 (class 1259 OID 24964)
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
-- TOC entry 201 (class 1259 OID 24967)
-- Name: exchange_rate_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE exchange_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 201
-- Name: exchange_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE exchange_rate_id_seq OWNED BY exchange_rate.id;


--
-- TOC entry 202 (class 1259 OID 24969)
-- Name: operation; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE operation (
    id integer NOT NULL,
    name character varying NOT NULL,
    status_block boolean NOT NULL,
    tax double precision NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 24975)
-- Name: operation_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 203
-- Name: operation_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE operation_id_seq OWNED BY operation.id;


--
-- TOC entry 204 (class 1259 OID 24977)
-- Name: transaction; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE transaction (
    id integer NOT NULL,
    user_id integer NOT NULL,
    operation_id integer,
    exchange_rate_id integer,
    sum_in integer,
    date_operation timestamp without time zone
);


--
-- TOC entry 205 (class 1259 OID 24980)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 205
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;


--
-- TOC entry 206 (class 1259 OID 24982)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    role character varying NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 24988)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 208 (class 1259 OID 24990)
-- Name: user_profile; Type: TABLE; Schema: test; Owner: -
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
-- TOC entry 209 (class 1259 OID 24996)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 2072 (class 2604 OID 24780)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 24749)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate ALTER COLUMN id SET DEFAULT nextval('exchange_rate_id_seq'::regclass);


--
-- TOC entry 2071 (class 2604 OID 24759)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation ALTER COLUMN id SET DEFAULT nextval('operation_id_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 24741)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction ALTER COLUMN id SET DEFAULT nextval('transaction_id_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 24731)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


SET search_path = test, pg_catalog;

--
-- TOC entry 2073 (class 2604 OID 24998)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 24999)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate ALTER COLUMN id SET DEFAULT nextval('exchange_rate_id_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 25000)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY operation ALTER COLUMN id SET DEFAULT nextval('operation_id_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 25001)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction ALTER COLUMN id SET DEFAULT nextval('transaction_id_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 25002)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2265 (class 0 OID 24769)
-- Dependencies: 193
-- Data for Name: balance; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 192
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('balance_id_seq', 1, false);


--
-- TOC entry 2267 (class 0 OID 24777)
-- Dependencies: 195
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 194
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currency_id_seq', 1, false);


--
-- TOC entry 2261 (class 0 OID 24746)
-- Dependencies: 189
-- Data for Name: exchange_rate; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 188
-- Name: exchange_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('exchange_rate_id_seq', 1, false);


--
-- TOC entry 2263 (class 0 OID 24756)
-- Dependencies: 191
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 190
-- Name: operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('operation_id_seq', 1, false);


--
-- TOC entry 2259 (class 0 OID 24738)
-- Dependencies: 187
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 186
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('transaction_id_seq', 1, false);


--
-- TOC entry 2257 (class 0 OID 24728)
-- Dependencies: 185
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_credentials (id, login, password, role) VALUES (1, 'login', 'password', 'admin');


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 184
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1, true);


--
-- TOC entry 2255 (class 0 OID 24715)
-- Dependencies: 183
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (1, 'lname', 'fname', 'otch', 'KH1213', '2012-12-12 00:00:00', 'sdf', '2012-12-12 00:00:00');


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 182
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


SET search_path = test, pg_catalog;

--
-- TOC entry 2268 (class 0 OID 24951)
-- Dependencies: 196
-- Data for Name: balance; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO balance (id, sum) VALUES (1, 100);
INSERT INTO balance (id, sum) VALUES (7, 1000);
INSERT INTO balance (id, sum) VALUES (8, 1000);


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 197
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('balance_id_seq', 1, false);


--
-- TOC entry 2270 (class 0 OID 24956)
-- Dependencies: 198
-- Data for Name: currency; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO currency (id, name) VALUES (1, 'usd');
INSERT INTO currency (id, name) VALUES (7, 'EUR');
INSERT INTO currency (id, name) VALUES (8, 'USD');


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 199
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('currency_id_seq', 8, true);


--
-- TOC entry 2272 (class 0 OID 24964)
-- Dependencies: 200
-- Data for Name: exchange_rate; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (1, '2015-05-10 00:00:00', 1, 1, 1);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (2, '2105-05-23 00:00:00', 1, 1, 1);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (3, '2016-04-24 23:55:14.871', 8, 7, 1.5);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (4, '2016-04-25 00:18:20.536', 8, 7, 1.5);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (5, '2016-04-25 00:21:32.621', 8, 7, 1.9999999900000001);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (6, '2016-04-25 00:21:33.024', 8, 7, 1.5);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (7, '2016-04-25 00:24:46.502', 8, 7, 1.9999999900000001);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (8, '2016-04-25 00:24:46.9', 8, 7, 1.5);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (10, '2016-04-25 00:25:06.366', 8, 7, 1.9999999900000001);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (11, '2016-04-25 00:25:06.743', 8, 7, 1.5);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (13, '2016-04-25 00:29:41.64', 8, 7, 1.9999999900000001);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (14, '2016-04-25 00:29:41.989', 8, 7, 1.5);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (16, '2016-04-25 00:31:32.267', 8, 7, 1.9999999900000001);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (17, '2016-04-25 00:31:32.641', 8, 7, 1.5);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (19, '2016-04-25 00:33:02.438', 8, 7, 1.9999999900000001);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (20, '2016-04-25 00:33:02.833', 8, 7, 1.5);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (22, '2016-04-25 00:34:25.743', 8, 7, 1.9999999900000001);
INSERT INTO exchange_rate (id, date_course, currency_from_id, currency_to_id, conversion) VALUES (23, '2016-04-25 00:34:26.158', 8, 7, 1.5);


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 201
-- Name: exchange_rate_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('exchange_rate_id_seq', 24, true);


--
-- TOC entry 2274 (class 0 OID 24969)
-- Dependencies: 202
-- Data for Name: operation; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO operation (id, name, status_block, tax) VALUES (3, 'buy', false, 1);
INSERT INTO operation (id, name, status_block, tax) VALUES (4, 'sell', false, 3);
INSERT INTO operation (id, name, status_block, tax) VALUES (6, 'convert', false, 1.5);
INSERT INTO operation (id, name, status_block, tax) VALUES (7, '1461538525896convert', false, 1.5);
INSERT INTO operation (id, name, status_block, tax) VALUES (8, '1461538526321convert', false, 2);
INSERT INTO operation (id, name, status_block, tax) VALUES (10, '1461538688278convert', false, 1.5);
INSERT INTO operation (id, name, status_block, tax) VALUES (11, '1461538688307convert', false, 2);


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 203
-- Name: operation_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('operation_id_seq', 11, true);


--
-- TOC entry 2276 (class 0 OID 24977)
-- Dependencies: 204
-- Data for Name: transaction; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO transaction (id, user_id, operation_id, exchange_rate_id, sum_in, date_operation) VALUES (1, 1, NULL, NULL, NULL, NULL);


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 205
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('transaction_id_seq', 1, true);


--
-- TOC entry 2278 (class 0 OID 24982)
-- Dependencies: 206
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_credentials (id, login, password, role) VALUES (1, 'login', 'password', 'admin');
INSERT INTO user_credentials (id, login, password, role) VALUES (3, 'mail@test.by', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (5, 'mail1@test.by', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (6, '1461416926805m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (8, '1461417064059m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (9, '1461417211169m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (10, '1461417670165m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (11, '1461417723418m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (12, '1461417797736m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (13, '1461417841630m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (14, '1461417980623m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (15, '1461418808228m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (16, '1461419093036m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (17, '1461441718662m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (19, '1461442285647m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (20, '1461442286890m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (22, '1461442557353m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (23, '1461442557713m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (25, '1461442853185m', 'updated', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (26, '1461442853616m', 'pswd', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (28, '1461527597814m', 'updated', 'Administrator');
INSERT INTO user_credentials (id, login, password, role) VALUES (29, '1461527599330m', 'pswd', 'Administrator');


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 30, true);


--
-- TOC entry 2280 (class 0 OID 24990)
-- Dependencies: 208
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (1, 'lname', 'fname', 'otch', 'KH1213', '2012-12-12 00:00:00', 'sdf', '2012-12-12 00:00:00');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (3, 'testLName', 'testFName', 'otch', 'numberPassport', '2016-04-23 14:59:23.425', 'issued', '2016-04-23 14:59:23.628');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (5, 'testLName', 'testFName', 'otch', 'numberPassport1', '2016-04-23 15:02:00.776', 'issued', '2016-04-23 15:02:00.996');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (6, 'testLName', 'testFName', 'otch', '1461416926805n', '2016-04-23 15:08:46.805', 'issued', '2016-04-23 15:08:47.008');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (8, 'testLName', 'testFName', 'otch', '1461417064059n', '2016-04-23 15:11:04.059', 'issued', '2016-04-23 15:11:04.293');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (9, 'testLName', 'testFName', 'otch', '1461417211169n', '2016-04-23 15:13:31.169', 'issued', '2016-04-23 15:13:31.388');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (10, 'testLName', 'testFName', 'otch', '1461417670165n', '2016-04-23 15:21:10.165', 'issued', '2016-04-23 15:21:10.368');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (11, 'testLName', 'testFName', 'otch', '1461417723418n', '2016-04-23 15:22:03.418', 'issued', '2016-04-23 15:22:03.636');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (12, 'testLName', 'testFName', 'otch', '1461417797736n', '2016-04-23 15:23:17.736', 'issued', '2016-04-23 15:23:17.939');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (13, 'testLName', 'testFName', 'otch', '1461417841630n', '2016-04-23 15:24:01.63', 'issued', '2016-04-23 15:24:01.833');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (14, 'testLName', 'testFName', 'otch', '1461417980623n', '2016-04-23 15:26:20.623', 'issued', '2016-04-23 15:26:20.841');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (15, 'testLName', 'testFName', 'otch', '1461418808228n', '2016-04-23 15:40:08.228', 'issued', '2016-04-23 15:40:08.431');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (16, 'testLName', 'testFName', 'otch', '1461419093036n', '2016-04-23 15:44:53.036', 'issued', '2016-04-23 15:44:53.254');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (17, 'testLName', 'testFName', 'otch', '1461441718662n', '2016-04-23 22:01:58.662', 'issued', '2016-04-23 22:01:59.494');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (19, 'testLName111', 'updatedName', 'otch', '1461442285647n', '2016-04-23 22:11:25.647', 'issued', '2016-04-23 22:11:26.444');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (20, 'testLName', 'testFName', 'otch', '1461442286890n', '2016-04-23 22:11:26.89', 'issued', '2016-04-23 22:11:26.893');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (22, 'testLName111', 'updatedName', 'otch', '1461442557353n', '2016-04-23 22:15:57.353', 'issued', '2016-04-23 22:15:57.565');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (23, 'testLName', 'testFName', 'otch', '1461442557713n', '2016-04-23 22:15:57.713', 'issued', '2016-04-23 22:15:57.715');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (25, 'testLName111', 'updatedName', 'otch', '1461442853185n', '2016-04-23 22:20:53.185', 'issued', '2016-04-23 22:20:53.403');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (26, 'testLName', 'testFName', 'otch', '1461442853616n', '2016-04-23 22:20:53.616', 'issued', '2016-04-23 22:20:53.619');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (28, 'testLName111', 'updatedName', 'otch', '1461527597814n', '2016-04-24 21:53:17.814', 'issued', '2016-04-24 21:53:18.81');
INSERT INTO user_profile (id, last_name, first_name, patronymic, number_passport, date_issue, issued, created) VALUES (29, 'testLName', 'testFName', 'otch', '1461527599330n', '2016-04-24 21:53:19.33', 'issued', '2016-04-24 21:53:19.332');


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 2097 (class 2606 OID 24774)
-- Name: balance_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pk PRIMARY KEY (id);


--
-- TOC entry 2099 (class 2606 OID 24787)
-- Name: currency_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_name_key UNIQUE (name);


--
-- TOC entry 2101 (class 2606 OID 24785)
-- Name: currency_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- TOC entry 2089 (class 2606 OID 24753)
-- Name: exchange_rate_date_course_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_date_course_key UNIQUE (date_course);


--
-- TOC entry 2091 (class 2606 OID 24751)
-- Name: exchange_rate_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_pk PRIMARY KEY (id);


--
-- TOC entry 2093 (class 2606 OID 24766)
-- Name: operation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_name_key UNIQUE (name);


--
-- TOC entry 2095 (class 2606 OID 24764)
-- Name: operation_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_pk PRIMARY KEY (id);


--
-- TOC entry 2087 (class 2606 OID 24743)
-- Name: transaction_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);


--
-- TOC entry 2083 (class 2606 OID 24735)
-- Name: user_credentials_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_login_key UNIQUE (login);


--
-- TOC entry 2085 (class 2606 OID 24733)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 24725)
-- Name: user_profile_number_passport_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_number_passport_key UNIQUE (number_passport);


--
-- TOC entry 2081 (class 2606 OID 24723)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


SET search_path = test, pg_catalog;

--
-- TOC entry 2103 (class 2606 OID 25004)
-- Name: balance_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pk PRIMARY KEY (id);


--
-- TOC entry 2105 (class 2606 OID 25006)
-- Name: currency_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_name_key UNIQUE (name);


--
-- TOC entry 2107 (class 2606 OID 25008)
-- Name: currency_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- TOC entry 2109 (class 2606 OID 25010)
-- Name: exchange_rate_date_course_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_date_course_key UNIQUE (date_course);


--
-- TOC entry 2111 (class 2606 OID 25012)
-- Name: exchange_rate_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_pk PRIMARY KEY (id);


--
-- TOC entry 2113 (class 2606 OID 25014)
-- Name: operation_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_name_key UNIQUE (name);


--
-- TOC entry 2115 (class 2606 OID 25016)
-- Name: operation_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_pk PRIMARY KEY (id);


--
-- TOC entry 2117 (class 2606 OID 25018)
-- Name: transaction_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);


--
-- TOC entry 2119 (class 2606 OID 25020)
-- Name: user_credentials_login_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_login_key UNIQUE (login);


--
-- TOC entry 2121 (class 2606 OID 25022)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 25024)
-- Name: user_profile_number_passport_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_number_passport_key UNIQUE (number_passport);


--
-- TOC entry 2125 (class 2606 OID 25026)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2132 (class 2606 OID 24944)
-- Name: balance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_id_fkey FOREIGN KEY (id) REFERENCES currency(id);


--
-- TOC entry 2130 (class 2606 OID 24808)
-- Name: exchange_rate_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk0 FOREIGN KEY (currency_id_from) REFERENCES currency(id);


--
-- TOC entry 2131 (class 2606 OID 24813)
-- Name: exchange_rate_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk1 FOREIGN KEY (currency_id_to) REFERENCES currency(id);


--
-- TOC entry 2127 (class 2606 OID 24798)
-- Name: transaction_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk1 FOREIGN KEY (operation_id) REFERENCES operation(id);


--
-- TOC entry 2128 (class 2606 OID 24803)
-- Name: transaction_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk2 FOREIGN KEY (exchange_rate_id) REFERENCES exchange_rate(id);


--
-- TOC entry 2129 (class 2606 OID 24826)
-- Name: transaction_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_profile(id);


--
-- TOC entry 2126 (class 2606 OID 24788)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


SET search_path = test, pg_catalog;

--
-- TOC entry 2133 (class 2606 OID 25027)
-- Name: balance_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_id_fkey FOREIGN KEY (id) REFERENCES currency(id);


--
-- TOC entry 2134 (class 2606 OID 25032)
-- Name: exchange_rate_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk0 FOREIGN KEY (currency_from_id) REFERENCES currency(id);


--
-- TOC entry 2135 (class 2606 OID 25037)
-- Name: exchange_rate_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk1 FOREIGN KEY (currency_to_id) REFERENCES currency(id);


--
-- TOC entry 2136 (class 2606 OID 25042)
-- Name: transaction_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk1 FOREIGN KEY (operation_id) REFERENCES operation(id);


--
-- TOC entry 2137 (class 2606 OID 25047)
-- Name: transaction_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk2 FOREIGN KEY (exchange_rate_id) REFERENCES exchange_rate(id);


--
-- TOC entry 2138 (class 2606 OID 25052)
-- Name: transaction_user_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_profile(id);


--
-- TOC entry 2139 (class 2606 OID 25057)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-04-25 02:03:16

--
-- PostgreSQL database dump complete
--

