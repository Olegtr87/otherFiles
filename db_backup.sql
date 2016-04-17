--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-04-17 22:19:23

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
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 24769)
-- Name: balance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE balance (
    id integer NOT NULL,
    sum integer NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 24767)
-- Name: balance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 191
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE balance_id_seq OWNED BY balance.id;


--
-- TOC entry 194 (class 1259 OID 24777)
-- Name: currency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE currency (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 24775)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 193
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE currency_id_seq OWNED BY currency.id;


--
-- TOC entry 188 (class 1259 OID 24746)
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
-- TOC entry 187 (class 1259 OID 24744)
-- Name: exchange_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exchange_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 187
-- Name: exchange_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exchange_rate_id_seq OWNED BY exchange_rate.id;


--
-- TOC entry 190 (class 1259 OID 24756)
-- Name: operation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE operation (
    id integer NOT NULL,
    name character varying NOT NULL,
    status_block boolean NOT NULL,
    tax double precision NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 24754)
-- Name: operation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 189
-- Name: operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operation_id_seq OWNED BY operation.id;


--
-- TOC entry 186 (class 1259 OID 24738)
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
-- TOC entry 185 (class 1259 OID 24736)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 185
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;


--
-- TOC entry 184 (class 1259 OID 24728)
-- Name: user_credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    role character varying NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 24726)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 183
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 182 (class 1259 OID 24715)
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
-- TOC entry 181 (class 1259 OID 24713)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2025 (class 2604 OID 24772)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance ALTER COLUMN id SET DEFAULT nextval('balance_id_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 24780)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency ALTER COLUMN id SET DEFAULT nextval('currency_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 24749)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate ALTER COLUMN id SET DEFAULT nextval('exchange_rate_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 24759)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation ALTER COLUMN id SET DEFAULT nextval('operation_id_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 24741)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction ALTER COLUMN id SET DEFAULT nextval('transaction_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 24731)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2183 (class 0 OID 24769)
-- Dependencies: 192
-- Data for Name: balance; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 191
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('balance_id_seq', 1, false);


--
-- TOC entry 2185 (class 0 OID 24777)
-- Dependencies: 194
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 193
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('currency_id_seq', 1, false);


--
-- TOC entry 2179 (class 0 OID 24746)
-- Dependencies: 188
-- Data for Name: exchange_rate; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 187
-- Name: exchange_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('exchange_rate_id_seq', 1, false);


--
-- TOC entry 2181 (class 0 OID 24756)
-- Dependencies: 190
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 189
-- Name: operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('operation_id_seq', 1, false);


--
-- TOC entry 2177 (class 0 OID 24738)
-- Dependencies: 186
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 185
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('transaction_id_seq', 1, false);


--
-- TOC entry 2175 (class 0 OID 24728)
-- Dependencies: 184
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 183
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1, false);


--
-- TOC entry 2173 (class 0 OID 24715)
-- Dependencies: 182
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2046 (class 2606 OID 24774)
-- Name: balance_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY balance
    ADD CONSTRAINT balance_pk PRIMARY KEY (id);


--
-- TOC entry 2048 (class 2606 OID 24787)
-- Name: currency_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_name_key UNIQUE (name);


--
-- TOC entry 2050 (class 2606 OID 24785)
-- Name: currency_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pk PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 24753)
-- Name: exchange_rate_date_course_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_date_course_key UNIQUE (date_course);


--
-- TOC entry 2040 (class 2606 OID 24751)
-- Name: exchange_rate_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_pk PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 24766)
-- Name: operation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_name_key UNIQUE (name);


--
-- TOC entry 2044 (class 2606 OID 24764)
-- Name: operation_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operation
    ADD CONSTRAINT operation_pk PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 24743)
-- Name: transaction_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 24735)
-- Name: user_credentials_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_login_key UNIQUE (login);


--
-- TOC entry 2034 (class 2606 OID 24733)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2028 (class 2606 OID 24725)
-- Name: user_profile_number_passport_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_number_passport_key UNIQUE (number_passport);


--
-- TOC entry 2030 (class 2606 OID 24723)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2057 (class 2606 OID 24818)
-- Name: currency_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_fk0 FOREIGN KEY (id) REFERENCES balance(id);


--
-- TOC entry 2055 (class 2606 OID 24808)
-- Name: exchange_rate_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk0 FOREIGN KEY (currency_id_from) REFERENCES currency(id);


--
-- TOC entry 2056 (class 2606 OID 24813)
-- Name: exchange_rate_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exchange_rate
    ADD CONSTRAINT exchange_rate_fk1 FOREIGN KEY (currency_id_to) REFERENCES currency(id);


--
-- TOC entry 2052 (class 2606 OID 24798)
-- Name: transaction_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk1 FOREIGN KEY (operation_id) REFERENCES operation(id);


--
-- TOC entry 2053 (class 2606 OID 24803)
-- Name: transaction_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fk2 FOREIGN KEY (exchange_rate_id) REFERENCES exchange_rate(id);


--
-- TOC entry 2054 (class 2606 OID 24826)
-- Name: transaction_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_profile(id);


--
-- TOC entry 2051 (class 2606 OID 24788)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-04-17 22:19:24

--
-- PostgreSQL database dump complete
--

