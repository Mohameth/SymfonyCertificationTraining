--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: category; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    domain_id integer
);


ALTER TABLE public.category OWNER TO main;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: main
--

CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO main;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    conference_id integer NOT NULL,
    author character varying(255) NOT NULL,
    text text NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    photo_filename character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.comment OWNER TO main;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: main
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO main;

--
-- Name: conference; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.conference (
    id integer NOT NULL,
    city character varying(255) NOT NULL,
    year character varying(4) NOT NULL,
    is_international boolean NOT NULL
);


ALTER TABLE public.conference OWNER TO main;

--
-- Name: conference_id_seq; Type: SEQUENCE; Schema: public; Owner: main
--

CREATE SEQUENCE public.conference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conference_id_seq OWNER TO main;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO main;

--
-- Name: domain; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.domain (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.domain OWNER TO main;

--
-- Name: domain_id_seq; Type: SEQUENCE; Schema: public; Owner: main
--

CREATE SEQUENCE public.domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domain_id_seq OWNER TO main;

--
-- Name: question; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.question (
    id integer NOT NULL,
    category_id integer,
    family character varying(255) DEFAULT NULL::character varying,
    answers text NOT NULL,
    level integer NOT NULL,
    name character varying(255) NOT NULL,
    correct_answer_indexes text NOT NULL
);


ALTER TABLE public.question OWNER TO main;

--
-- Name: COLUMN question.answers; Type: COMMENT; Schema: public; Owner: main
--

COMMENT ON COLUMN public.question.answers IS '(DC2Type:array)';


--
-- Name: COLUMN question.correct_answer_indexes; Type: COMMENT; Schema: public; Owner: main
--

COMMENT ON COLUMN public.question.correct_answer_indexes IS '(DC2Type:array)';


--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: main
--

CREATE SEQUENCE public.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO main;

--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.category (id, name, domain_id) FROM stdin;
1	Twig	\N
16	ORM	1
15	Conventions	1
14	Exceptions	1
13	Events	1
12	Request	1
11	Code organization	1
10	Bridges	1
8	Flex	1
9	Components	1
2	Database	1
3	Console	1
4	Repository	1
5	Bundle	1
6	EasyAdmin	1
7	Entities	1
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.comment (id, conference_id, author, text, email, created_at, photo_filename) FROM stdin;
1	1	Admin	Wow what an amazing conference, can't believe how awesome it was!\r\nJust surreal.	mohameth@wiztopic.com	2021-01-01 05:07:00	\N
2	2	Admin	Improvable & dry. Like this comment.	mohameth@wiztopic.com	2019-01-01 00:00:00	\N
3	1	Admin	At the end I was into tears, didn't want to leave. So much feeling for a conference, thank you guys you changed my life.	mohameth@wiztopic.com	2021-05-12 16:17:00	\N
4	1	Mary	It's those kinds of events that makes life worthwhile!	mohameth@wiztopic.com	2021-11-12 00:00:00	\N
\.


--
-- Data for Name: conference; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.conference (id, city, year, is_international) FROM stdin;
1	Paris	2021	t
2	London	2020	f
3	Dakar	2025	t
4	Lyon	2019	f
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20210415155147	2021-04-15 15:54:01	85
DoctrineMigrations\\Version20210423131617	2021-04-23 13:16:28	79
DoctrineMigrations\\Version20210423135522	2021-04-23 13:55:30	31
DoctrineMigrations\\Version20210423140057	2021-04-23 14:01:02	38
DoctrineMigrations\\Version20210426152316	2021-04-26 15:26:00	47
\.


--
-- Data for Name: domain; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.domain (id, name) FROM stdin;
1	Symfony
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.question (id, category_id, family, answers, level, name, correct_answer_indexes) FROM stdin;
1	3	\N	a:4:{i:0;s:24:"php symfony server:start";i:1;s:20:"symfony start:server";i:2;s:19:"symfony open server";i:3;s:20:"symfony server:start";}	0	Which of the following commands are correct?	a:1:{i:0;s:1:"3";}
2	11	\N	a:4:{i:0;s:20:"[project]/migrations";i:1;s:27:"[project]/config/migrations";i:2;s:36:"[project]/config/packages/migrations";i:3;s:24:"[project]/src/Migrations";}	1	Where are symfony migrations located?	a:1:{i:0;s:1:"0";}
3	16	\N	a:4:{i:0;s:36:"@ORM\\ManyToOne (..., mappedBy="...")";i:1;s:36:"@ORM\\OneToMany (..., mappedBy="...")";i:2;s:38:"@ORM\\ManyToOne (..., inversedBy="...")";i:3;s:38:"@ORM\\OneToMany (..., inversedBy="...")";}	2	In an ManyToOne / OneToMany relationship which one of those annotations is correct	a:2:{i:0;s:1:"1";i:1;s:1:"2";}
4	6	\N	a:4:{i:0;s:38:"entities: \\n \\t class: App\\Entity\\User";i:1;s:33:"entities: \\n \\t - App\\Entity\\User";i:2;s:53:"entities: \\n \\t User: \\n \\t \\t class: App\\Entity\\User";i:3;s:48:"entities: \\n \\t User: \\n \\t \\t - App\\Entity\\User";}	1	Which of the following class registration are corrects?	a:2:{i:0;s:1:"1";i:1;s:1:"2";}
5	6	\N	a:4:{i:0;s:4:"list";i:1;s:5:"class";i:2;s:8:"entities";i:3;s:4:"menu";}	1	Which ones of these scopes can be a direct parent of "filters"	a:1:{i:0;s:1:"2";}
6	9	\N	a:4:{i:0;s:12:"Yes, always.";i:1;s:51:"Yes, only if is isn't dependant of any other bundle";i:2;s:9:"No, never";i:3;s:64:"No, unless we specify it with a special configuration beforehand";}	2	Are transitive dependencies kept after the bundle directly depending on them is removed?	a:1:{i:0;s:1:"1";}
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.category_id_seq', 16, true);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.comment_id_seq', 4, true);


--
-- Name: conference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.conference_id_seq', 4, true);


--
-- Name: domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.domain_id_seq', 1, true);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.question_id_seq', 6, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: conference conference_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.conference
    ADD CONSTRAINT conference_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: domain domain_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.domain
    ADD CONSTRAINT domain_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: idx_64c19c1115f0ee5; Type: INDEX; Schema: public; Owner: main
--

CREATE INDEX idx_64c19c1115f0ee5 ON public.category USING btree (domain_id);


--
-- Name: idx_9474526c604b8382; Type: INDEX; Schema: public; Owner: main
--

CREATE INDEX idx_9474526c604b8382 ON public.comment USING btree (conference_id);


--
-- Name: idx_b6f7494e12469de2; Type: INDEX; Schema: public; Owner: main
--

CREATE INDEX idx_b6f7494e12469de2 ON public.question USING btree (category_id);


--
-- Name: category fk_64c19c1115f0ee5; Type: FK CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT fk_64c19c1115f0ee5 FOREIGN KEY (domain_id) REFERENCES public.domain(id);


--
-- Name: comment fk_9474526c604b8382; Type: FK CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_9474526c604b8382 FOREIGN KEY (conference_id) REFERENCES public.conference(id);


--
-- Name: question fk_b6f7494e12469de2; Type: FK CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT fk_b6f7494e12469de2 FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- PostgreSQL database dump complete
--

