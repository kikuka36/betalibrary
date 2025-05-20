--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16602)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    birthdate date
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16601)
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_author_id_seq OWNER TO postgres;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 217
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- TOC entry 226 (class 1259 OID 16643)
-- Name: book_copies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_copies (
    copy_id integer NOT NULL,
    book_id integer NOT NULL,
    location_id integer NOT NULL,
    status_id integer NOT NULL
);


ALTER TABLE public.book_copies OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16642)
-- Name: book_copies_copy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_copies_copy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_copies_copy_id_seq OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 225
-- Name: book_copies_copy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_copies_copy_id_seq OWNED BY public.book_copies.copy_id;


--
-- TOC entry 220 (class 1259 OID 16611)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    title text NOT NULL,
    author_id integer NOT NULL,
    year integer,
    genre text
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16610)
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_id_seq OWNER TO postgres;

--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 219
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;


--
-- TOC entry 230 (class 1259 OID 16674)
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loans (
    loan_id integer NOT NULL,
    copy_id integer NOT NULL,
    reader_id integer NOT NULL,
    loan_date date NOT NULL,
    due_date date NOT NULL,
    return_date date,
    status_id integer NOT NULL
);


ALTER TABLE public.loans OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16673)
-- Name: loans_loan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loans_loan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loans_loan_id_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 229
-- Name: loans_loan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loans_loan_id_seq OWNED BY public.loans.loan_id;


--
-- TOC entry 222 (class 1259 OID 16625)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    row_number text NOT NULL,
    shelf_number text NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16624)
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_location_id_seq OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 221
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;


--
-- TOC entry 228 (class 1259 OID 16665)
-- Name: readers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.readers (
    reader_id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    birthdate date,
    phone text
);


ALTER TABLE public.readers OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16664)
-- Name: readers_reader_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.readers_reader_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.readers_reader_id_seq OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 227
-- Name: readers_reader_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.readers_reader_id_seq OWNED BY public.readers.reader_id;


--
-- TOC entry 224 (class 1259 OID 16634)
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    status_id integer NOT NULL,
    category text NOT NULL,
    status text NOT NULL
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16633)
-- Name: statuses_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statuses_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statuses_status_id_seq OWNER TO postgres;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 223
-- Name: statuses_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statuses_status_id_seq OWNED BY public.statuses.status_id;


--
-- TOC entry 232 (class 1259 OID 16696)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username text NOT NULL,
    password_hash text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16695)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 231
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4676 (class 2604 OID 16605)
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- TOC entry 4680 (class 2604 OID 16646)
-- Name: book_copies copy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_copies ALTER COLUMN copy_id SET DEFAULT nextval('public.book_copies_copy_id_seq'::regclass);


--
-- TOC entry 4677 (class 2604 OID 16614)
-- Name: books book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);


--
-- TOC entry 4682 (class 2604 OID 16677)
-- Name: loans loan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans ALTER COLUMN loan_id SET DEFAULT nextval('public.loans_loan_id_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 16628)
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 16668)
-- Name: readers reader_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readers ALTER COLUMN reader_id SET DEFAULT nextval('public.readers_reader_id_seq'::regclass);


--
-- TOC entry 4679 (class 2604 OID 16637)
-- Name: statuses status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses ALTER COLUMN status_id SET DEFAULT nextval('public.statuses_status_id_seq'::regclass);


--
-- TOC entry 4683 (class 2604 OID 16699)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4855 (class 0 OID 16602)
-- Dependencies: 218
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, name, surname, birthdate) FROM stdin;
1	Джоан	Роулинг	\N
2	ыфвфыв	фвыфв	\N
3	ы	ы	\N
4	Вася	Пупкин	\N
5	насос	подсос	\N
36	Александр	Пушкин	\N
37	Лев	Толстой	\N
38	Фёдор	Достоевский	\N
\.


--
-- TOC entry 4863 (class 0 OID 16643)
-- Dependencies: 226
-- Data for Name: book_copies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_copies (copy_id, book_id, location_id, status_id) FROM stdin;
58	25	1	1
60	25	1	1
61	25	1	1
62	25	1	1
63	25	2	1
64	25	2	1
65	25	2	1
66	25	2	1
67	25	2	1
68	25	2	1
69	26	2	1
70	26	2	1
72	26	2	1
73	26	2	1
74	27	3	1
75	27	3	1
76	27	7	1
77	27	7	1
78	27	7	1
79	27	7	1
80	27	7	1
81	27	7	1
82	27	7	1
83	27	7	1
85	27	7	1
86	27	7	1
87	27	7	1
88	27	7	1
89	27	7	1
59	25	1	1
71	26	2	2
84	27	7	2
\.


--
-- TOC entry 4857 (class 0 OID 16611)
-- Dependencies: 220
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (book_id, title, author_id, year, genre) FROM stdin;
25	Евгений Онегин	36	1883	Роман
26	Война и мир	37	1869	Роман
27	Преступление и наказание	38	1869	Роман
\.


--
-- TOC entry 4867 (class 0 OID 16674)
-- Dependencies: 230
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loans (loan_id, copy_id, reader_id, loan_date, due_date, return_date, status_id) FROM stdin;
17	59	20	2025-05-19	2025-06-18	2025-05-19	5
18	71	20	2025-05-19	2025-06-18	\N	3
19	84	19	2025-05-19	2025-06-18	\N	3
\.


--
-- TOC entry 4859 (class 0 OID 16625)
-- Dependencies: 222
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (location_id, row_number, shelf_number) FROM stdin;
1	1	1
2	1	2
3	1	3
4	5	3
5	4	5
6	3	3
7	1	4
\.


--
-- TOC entry 4865 (class 0 OID 16665)
-- Dependencies: 228
-- Data for Name: readers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.readers (reader_id, name, surname, birthdate, phone) FROM stdin;
19	Василий	Вася	2009-10-15	+8 999 222-99-95
20	София	Мельникова	2006-06-15	+8 123 456-78-90
21	Михаил	Горшенёв	2011-07-13	+8 987 654-32-10
23	Александр	Попов	2002-07-05	+8 982 333-77-77
\.


--
-- TOC entry 4861 (class 0 OID 16634)
-- Dependencies: 224
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statuses (status_id, category, status) FROM stdin;
1	copy	available
2	copy	borrowed
3	loan	issued
4	loan	overdue
5	loan	returned
\.


--
-- TOC entry 4869 (class 0 OID 16696)
-- Dependencies: 232
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password_hash) FROM stdin;
1	1	claqYEO4DgucYBrq0GloLQ==:30vGLEmISTkojbAT7Pt+fwO4YMGeOMxcfkUf6ATB4oE=
2	123	w98TksvE3uwwjq46pk6g1Q==:Tm1o8bQ6FjZtkcBGSTeIVqh/WO+IvsPIQj5yvsfRARo=
\.


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 217
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 38, true);


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 225
-- Name: book_copies_copy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_copies_copy_id_seq', 89, true);


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 219
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_book_id_seq', 27, true);


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 229
-- Name: loans_loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loans_loan_id_seq', 19, true);


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 221
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_location_id_seq', 7, true);


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 227
-- Name: readers_reader_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.readers_reader_id_seq', 23, true);


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 223
-- Name: statuses_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statuses_status_id_seq', 5, true);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 231
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- TOC entry 4685 (class 2606 OID 16609)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- TOC entry 4693 (class 2606 OID 16648)
-- Name: book_copies book_copies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_copies
    ADD CONSTRAINT book_copies_pkey PRIMARY KEY (copy_id);


--
-- TOC entry 4687 (class 2606 OID 16618)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- TOC entry 4697 (class 2606 OID 16679)
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (loan_id);


--
-- TOC entry 4689 (class 2606 OID 16632)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- TOC entry 4695 (class 2606 OID 16672)
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (reader_id);


--
-- TOC entry 4691 (class 2606 OID 16641)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (status_id);


--
-- TOC entry 4699 (class 2606 OID 16703)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4701 (class 2606 OID 16705)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4703 (class 2606 OID 16649)
-- Name: book_copies book_copies_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_copies
    ADD CONSTRAINT book_copies_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id) ON DELETE CASCADE;


--
-- TOC entry 4704 (class 2606 OID 16654)
-- Name: book_copies book_copies_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_copies
    ADD CONSTRAINT book_copies_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id) ON DELETE RESTRICT;


--
-- TOC entry 4705 (class 2606 OID 16659)
-- Name: book_copies book_copies_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_copies
    ADD CONSTRAINT book_copies_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.statuses(status_id) ON DELETE RESTRICT;


--
-- TOC entry 4702 (class 2606 OID 16619)
-- Name: books books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id) ON DELETE RESTRICT;


--
-- TOC entry 4706 (class 2606 OID 16680)
-- Name: loans loans_copy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_copy_id_fkey FOREIGN KEY (copy_id) REFERENCES public.book_copies(copy_id) ON DELETE RESTRICT;


--
-- TOC entry 4707 (class 2606 OID 16685)
-- Name: loans loans_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES public.readers(reader_id) ON DELETE RESTRICT;


--
-- TOC entry 4708 (class 2606 OID 16690)
-- Name: loans loans_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.statuses(status_id) ON DELETE RESTRICT;




--
-- PostgreSQL database dump complete
--

