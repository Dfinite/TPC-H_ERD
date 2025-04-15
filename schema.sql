--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-1.pgdg120+1)
-- Dumped by pg_dump version 15.12 (Ubuntu 15.12-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    c_custkey bigint NOT NULL,
    c_name character varying(25) NOT NULL,
    c_address character varying(40) NOT NULL,
    c_nationkey integer NOT NULL,
    c_phone character(15) NOT NULL,
    c_acctbal double precision NOT NULL,
    c_mktsegment character(10) NOT NULL,
    c_comment character varying(117) NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: lineitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lineitem (
    l_orderkey bigint NOT NULL,
    l_partkey bigint NOT NULL,
    l_suppkey bigint NOT NULL,
    l_linenumber bigint NOT NULL,
    l_quantity double precision NOT NULL,
    l_extendedprice double precision NOT NULL,
    l_discount double precision NOT NULL,
    l_tax double precision NOT NULL,
    l_returnflag character(1) NOT NULL,
    l_linestatus character(1) NOT NULL,
    l_shipdate date NOT NULL,
    l_commitdate date NOT NULL,
    l_receiptdate date NOT NULL,
    l_shipinstruct character(25) NOT NULL,
    l_shipmode character(10) NOT NULL,
    l_comment character varying(44) NOT NULL
);


ALTER TABLE public.lineitem OWNER TO postgres;

--
-- Name: nation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nation (
    n_nationkey integer NOT NULL,
    n_name character(25) NOT NULL,
    n_regionkey integer NOT NULL,
    n_comment character varying(152)
);


ALTER TABLE public.nation OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    o_orderkey bigint NOT NULL,
    o_custkey bigint NOT NULL,
    o_orderstatus character(1) NOT NULL,
    o_totalprice double precision NOT NULL,
    o_orderdate date NOT NULL,
    o_orderpriority character(15) NOT NULL,
    o_clerk character(15) NOT NULL,
    o_shippriority integer NOT NULL,
    o_comment character varying(79) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.part (
    p_partkey bigint NOT NULL,
    p_name character varying(55) NOT NULL,
    p_mfgr character(25) NOT NULL,
    p_brand character(10) NOT NULL,
    p_type character varying(25) NOT NULL,
    p_size integer NOT NULL,
    p_container character(10) NOT NULL,
    p_retailprice double precision NOT NULL,
    p_comment character varying(23) NOT NULL
);


ALTER TABLE public.part OWNER TO postgres;

--
-- Name: partsupp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partsupp (
    ps_partkey bigint NOT NULL,
    ps_suppkey bigint NOT NULL,
    ps_availqty bigint NOT NULL,
    ps_supplycost double precision NOT NULL,
    ps_comment character varying(199) NOT NULL
);


ALTER TABLE public.partsupp OWNER TO postgres;

--
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    r_regionkey integer NOT NULL,
    r_name character(25) NOT NULL,
    r_comment character varying(152)
);


ALTER TABLE public.region OWNER TO postgres;

--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    s_suppkey bigint NOT NULL,
    s_name character(25) NOT NULL,
    s_address character varying(40) NOT NULL,
    s_nationkey integer NOT NULL,
    s_phone character(15) NOT NULL,
    s_acctbal double precision NOT NULL,
    s_comment character varying(101) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- PostgreSQL database dump complete
--

