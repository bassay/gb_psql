--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-20 16:20:18

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
-- TOC entry 219 (class 1259 OID 32832)
-- Name: communities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(250),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32831)
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 218
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- TOC entry 221 (class 1259 OID 32841)
-- Name: communities_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.communities_users (
    id integer NOT NULL,
    community_id integer,
    user_id integer,
    created_at character varying(255)
);


ALTER TABLE public.communities_users OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32840)
-- Name: communities_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.communities_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_users_id_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 220
-- Name: communities_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.communities_users_id_seq OWNED BY public.communities_users.id;


--
-- TOC entry 223 (class 1259 OID 32880)
-- Name: friendship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer,
    requested_to_user_id integer,
    status_id integer,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32879)
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 222
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- TOC entry 225 (class 1259 OID 32888)
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.friendship_statuses OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 32887)
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO postgres;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 224
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- TOC entry 227 (class 1259 OID 32897)
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer,
    to_user_id integer,
    body text,
    is_important character varying(255) DEFAULT NULL::character varying,
    is_delivered character varying(255) DEFAULT NULL::character varying,
    created_at character varying(255)
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 32896)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 226
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 229 (class 1259 OID 32918)
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(255) DEFAULT NULL::character varying,
    owner_id integer,
    description text,
    uploaded_at character varying(255),
    size integer
);


ALTER TABLE public.photo OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 32917)
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO postgres;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 228
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- TOC entry 217 (class 1259 OID 32805)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    user_id integer,
    community_or_user_id integer,
    is_community boolean DEFAULT false,
    created_at timestamp without time zone
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32804)
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO postgres;

--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 216
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- TOC entry 215 (class 1259 OID 32789)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255) DEFAULT NULL::character varying,
    last_name character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    phone character varying(100) DEFAULT NULL::character varying,
    main_photo_id integer,
    created_at character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 32788)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 231 (class 1259 OID 32929)
-- Name: video; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(255) DEFAULT NULL::character varying,
    owner_id integer,
    description text,
    uploaded_at character varying(255),
    size integer
);


ALTER TABLE public.video OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 32928)
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO postgres;

--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 230
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- TOC entry 3223 (class 2604 OID 32835)
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 32844)
-- Name: communities_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities_users ALTER COLUMN id SET DEFAULT nextval('public.communities_users_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 32883)
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 32891)
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 32900)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 32921)
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 32808)
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 32792)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 32932)
-- Name: video id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- TOC entry 3402 (class 0 OID 32832)
-- Dependencies: 219
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	tellus. Suspendisse sed dolor. Fusce	1	2023-05-18 10:15:09
2	Aliquam nec enim. Nunc ut	19	2022-08-10 20:47:17
3	aliquam eros turpis non enim.	19	2022-05-31 17:35:35
4	mauris a nunc. In at	9	2024-02-02 10:52:43
5	laoreet, libero et tristique pellentesque,	13	2022-08-23 05:53:54
6	viverra. Maecenas iaculis aliquet diam.	18	2022-04-05 16:55:35
7	vehicula et, rutrum eu, ultrices	15	2022-04-14 02:27:51
8	Etiam laoreet, libero et tristique	3	2023-05-01 15:16:39
9	diam dictum sapien. Aenean massa.	2	2022-03-26 05:45:19
10	montes, nascetur ridiculus mus. Aenean	12	2022-04-18 12:55:49
11	Nunc sollicitudin commodo ipsum. Suspendisse	15	2024-01-07 16:25:20
12	fringilla mi lacinia mattis. Integer	6	2022-05-27 11:32:27
13	Nunc ac sem ut dolor	2	2022-05-01 05:42:37
14	ornare tortor at risus. Nunc	1	2023-02-01 17:33:40
15	eros non enim commodo hendrerit.	1	2022-06-30 10:14:25
16	eget laoreet posuere, enim nisl	3	2022-04-23 01:24:47
17	mattis. Integer eu lacus. Quisque	7	2023-10-20 03:40:13
18	felis purus ac tellus. Suspendisse	1	2023-08-31 05:20:22
19	nisi a odio semper cursus.	3	2023-04-11 05:58:44
20	non sapien molestie orci tincidunt	4	2023-03-02 22:32:51
\.


--
-- TOC entry 3404 (class 0 OID 32841)
-- Dependencies: 221
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.communities_users (id, community_id, user_id, created_at) FROM stdin;
1	8	2	2022-09-02 11:21:21
2	5	9	2022-06-29 12:02:56
3	6	14	2023-04-12 01:31:43
4	7	13	2024-01-23 13:35:59
5	12	10	2023-02-06 01:20:57
6	3	6	2022-08-20 04:33:56
7	18	8	2023-02-09 14:51:08
8	19	6	2023-03-01 00:53:23
9	10	16	2023-03-14 07:27:56
10	3	18	2023-10-26 15:15:00
11	5	10	2022-04-28 00:47:40
12	20	18	2022-08-26 11:01:19
13	15	11	2022-09-20 13:28:22
14	6	12	2023-04-12 17:30:27
15	5	12	2022-11-14 20:14:16
16	13	8	2022-08-08 05:40:52
17	6	6	2023-03-30 21:11:48
18	16	10	2022-09-30 01:55:19
19	17	6	2023-08-21 03:42:30
20	13	6	2023-11-01 21:52:36
\.


--
-- TOC entry 3406 (class 0 OID 32880)
-- Dependencies: 223
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	1	12	1	2023-12-11 20:54:37	2024-02-16 14:17:14
2	9	1	1	2023-05-25 17:19:45	2023-08-12 12:04:27
3	8	12	1	2022-09-18 19:04:18	2023-09-07 14:47:36
4	10	13	1	2023-03-01 20:24:28	2023-09-08 21:44:01
5	4	17	1	2022-12-19 03:50:27	2024-01-23 21:17:31
6	3	2	0	2024-01-09 20:04:39	2023-01-02 04:19:07
7	1	4	0	2022-11-05 19:30:12	2023-04-02 01:20:51
8	4	15	1	2024-02-14 18:52:42	2022-09-20 19:22:54
9	8	16	0	2022-08-13 04:06:56	2023-05-19 00:38:35
10	4	6	1	2023-05-10 17:05:44	2022-09-02 03:39:58
11	10	7	0	2023-04-12 21:20:59	2022-09-30 02:29:44
12	14	13	1	2022-07-25 11:59:22	2023-05-09 10:22:58
13	8	19	0	2023-11-11 14:53:32	2023-06-21 14:34:10
14	17	2	0	2022-06-18 03:41:18	2022-12-02 03:13:20
15	8	18	0	2023-04-22 08:09:39	2022-03-03 07:33:43
16	16	11	1	2022-05-13 00:53:15	2023-02-01 07:22:55
17	14	20	0	2022-09-16 20:29:18	2022-06-24 07:54:58
18	11	5	1	2022-11-08 03:28:39	2022-03-24 18:08:06
19	13	16	1	2022-10-11 02:53:38	2023-11-06 18:36:38
20	15	14	1	2022-10-17 07:46:47	2022-09-20 01:03:43
\.


--
-- TOC entry 3408 (class 0 OID 32888)
-- Dependencies: 225
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	супруг
2	любовь
3	игнор
4	игнор
5	любовь
6	игнор
7	игнор
8	не дружу
9	не дружу
10	игнор
11	любовь
12	любовь
13	не дружу
14	дружу
15	игнор
16	дружу
17	любовь
18	дружу
19	супруг
20	игнор
\.


--
-- TOC entry 3410 (class 0 OID 32897)
-- Dependencies: 227
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	19	16	Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis	No	No	2024-01-22 20:39:48
2	11	19	turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus	No	No	2023-06-18 18:01:43
3	19	5	tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet,	Yes	No	2022-10-11 21:14:31
4	8	7	id enim. Curabitur massa. Vestibulum accumsan neque et	No	Yes	2023-10-06 03:21:08
5	19	14	lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue,	Yes	No	2022-07-28 23:36:36
6	7	3	risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus	No	No	2023-01-09 12:57:43
7	13	9	commodo auctor velit. Aliquam nisl. Nulla eu neque	Yes	Yes	2024-02-11 00:52:55
8	19	13	gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,	Yes	No	2023-08-10 17:40:46
9	11	5	inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi	No	No	2023-02-07 13:29:37
10	7	6	Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus	No	Yes	2023-10-04 01:40:55
11	5	1	id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem.	Yes	Yes	2023-09-21 22:50:10
12	19	5	adipiscing, enim mi tempor lorem, eget mollis lectus pede	No	Yes	2023-12-24 09:11:04
13	9	10	nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula.	No	No	2023-02-05 23:16:47
14	20	6	enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum	No	Yes	2023-04-24 05:35:13
15	1	3	ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus.	Yes	Yes	2023-03-30 21:57:14
16	16	19	penatibus et magnis dis parturient montes, nascetur ridiculus	No	No	2023-06-04 22:54:24
17	3	5	libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan	No	No	2022-05-27 23:13:29
18	6	18	ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu	No	Yes	2023-03-14 02:44:10
19	13	17	Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum.	No	No	2023-10-23 14:57:15
20	19	16	dolor sit amet, consectetuer adipiscing elit. Aliquam	Yes	No	2023-05-18 00:45:37
\.


--
-- TOC entry 3412 (class 0 OID 32918)
-- Dependencies: 229
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	img/2	19	dolor quam,	2022-06-12 05:10:23	972
2	img/5	18	tristique ac, eleifend vitae, erat.	2023-03-21 09:39:33	189
3	img/1	4	a felis	2022-09-12 23:47:19	822
4	img/3	7	tristique pharetra. Quisque	2023-07-24 20:05:22	608
5	img/3	14	enim, gravida sit amet,	2023-11-04 19:40:45	31
6	img/3	3	eu nulla	2023-07-14 13:00:36	304
7	img/2	13	dolor	2023-05-05 02:04:47	955
8	img/1	10	auctor, velit eget laoreet	2022-08-10 04:24:42	58
9	img/1	9	non ante bibendum ullamcorper. Duis	2023-07-18 17:17:35	735
10	img/2	11	in	2022-04-10 00:46:49	528
11	img/1	15	aliquam arcu. Aliquam ultrices iaculis	2022-09-14 10:01:42	154
12	img/3	10	hendrerit a, arcu. Sed	2023-08-13 14:43:53	415
13	img/3	6	vestibulum massa rutrum	2023-12-27 23:27:42	225
14	img/1	10	ipsum. Suspendisse sagittis. Nullam vitae	2023-01-23 15:34:27	29
\.


--
-- TOC entry 3400 (class 0 OID 32805)
-- Dependencies: 217
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, user_id, community_or_user_id, is_community, created_at) FROM stdin;
1	14	16	f	2023-11-11 14:51:33
2	1	17	f	2023-03-22 20:51:30
3	18	13	f	2023-01-23 00:03:07
4	15	10	f	2023-06-06 15:46:02
5	5	11	t	2022-11-22 17:34:35
6	17	5	t	2022-08-29 00:21:11
7	5	9	t	2022-07-25 12:41:10
8	18	10	t	2022-05-01 09:45:30
9	20	1	t	2023-12-20 15:47:28
10	17	13	t	2022-09-14 16:37:40
11	15	1	f	2022-06-10 08:05:25
12	8	10	t	2022-02-28 01:38:03
13	14	2	f	2022-06-07 03:09:27
14	7	8	t	2022-06-01 05:21:58
15	14	13	t	2024-01-27 17:39:29
16	17	6	f	2023-12-12 05:36:52
17	6	10	t	2023-09-06 13:29:05
18	17	12	t	2023-12-16 14:50:19
19	12	2	f	2024-01-06 11:26:48
20	5	6	t	2022-10-02 16:32:18
\.


--
-- TOC entry 3398 (class 0 OID 32789)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Vance	Schmidt	nulla@google.couk	1-848-915-6317	9	2022-10-29 13:49:19
2	Armando	Hawkins	id.sapien@protonmail.edu	(442) 632-5167	66	2023-03-17 03:40:03
3	Merritt	Jimenez	proin.dolor.nulla@aol.ca	(673) 677-9370	4	2024-01-17 23:22:52
4	May	Cote	etiam@hotmail.couk	1-222-822-2717	37	2022-07-06 01:58:45
5	Levi	Miranda	integer@protonmail.com	1-633-212-2452	56	2023-03-27 10:02:03
6	Eagan	Sexton	nunc.laoreet@outlook.ca	(738) 488-1134	34	2023-04-09 10:30:57
7	Quamar	Harper	adipiscing@icloud.couk	1-815-484-3245	81	2024-01-30 06:23:54
8	Tyler	Deleon	sed.et@aol.edu	(392) 719-2026	56	2022-07-03 11:49:57
9	Brady	Hunter	rutrum.non@outlook.com	1-868-882-3847	34	2024-01-13 11:31:20
10	Elliott	Hooper	non.dui@outlook.edu	(434) 534-3052	24	2023-10-01 00:12:41
11	Veda	Copeland	etiam.gravida@protonmail.com	(562) 456-8481	37	2022-05-30 06:37:03
12	Cameran	Hays	quam.curabitur@aol.org	(542) 236-7826	63	2023-07-27 14:59:12
13	Damon	Puckett	tempus.mauris.erat@outlook.net	1-727-323-3257	7	2022-10-06 07:21:27
14	Carissa	Perry	facilisis.suspendisse@google.net	(136) 805-5601	98	2023-07-12 04:00:52
15	Edward	Solis	suspendisse.sed@yahoo.edu	1-911-325-4179	7	2023-01-01 07:20:31
16	Rebekah	Gross	gravida.molestie@outlook.net	(458) 453-8010	35	2023-02-19 18:35:12
17	Galena	Marquez	elit.fermentum@yahoo.net	(890) 885-8814	33	2022-04-29 00:15:32
18	Gavin	Sears	ultrices.iaculis@outlook.net	1-671-563-4646	29	2022-05-18 00:59:45
19	Aidan	Hardin	odio@google.couk	(889) 962-4389	86	2023-06-06 08:02:00
20	Yoshi	Holt	sem.consequat.nec@yahoo.net	(341) 264-1585	12	2022-11-22 21:02:34
21	Callie	Chavez	urna.et@protonmail.org	(551) 581-1483	43	2023-10-10 06:57:03
22	Berk	Mcknight	suscipit.nonummy@google.com	(137) 618-3363	32	2023-06-05 03:33:47
23	Fitzgerald	Rojas	id.magna@aol.com	(556) 835-5143	61	2023-03-20 05:15:07
24	Rebekah	Jones	ut.nisi@aol.ca	1-882-302-5549	11	2022-04-20 15:03:56
25	Nehru	Simpson	et.pede@hotmail.net	1-595-765-4251	73	2023-10-31 10:17:03
26	Lacey	Tran	dictum.placerat@google.org	(973) 424-5582	30	2023-09-21 08:36:37
27	Abel	Ramos	dui@hotmail.ca	1-641-550-5357	70	2022-06-25 09:39:44
28	Axel	Singleton	volutpat.nunc@protonmail.com	(957) 567-6132	40	2022-06-25 21:19:25
29	Warren	Reilly	leo@outlook.net	(251) 563-2409	10	2023-12-08 00:20:06
30	Austin	Stevens	consequat.nec@protonmail.couk	(547) 168-5036	43	2023-03-20 01:47:53
31	Scarlett	Giles	tempus.mauris@aol.couk	(413) 128-2452	43	2023-07-11 15:02:53
32	Aquila	Rowe	lacus.quisque@protonmail.org	(604) 355-2757	14	2024-02-12 00:05:03
33	Melinda	Lamb	sed.diam@hotmail.couk	1-657-526-8835	54	2024-01-25 13:54:32
34	Jasmine	Rasmussen	pellentesque@protonmail.com	1-862-836-7236	4	2023-02-06 23:15:32
35	Briar	Compton	turpis.nec@protonmail.couk	(625) 728-7021	12	2022-07-16 21:55:45
36	Malachi	Mejia	semper.pretium@hotmail.couk	(525) 800-9336	79	2022-08-07 02:23:37
37	Noelle	Moreno	pharetra@google.ca	(423) 425-1868	15	2023-02-08 06:18:26
38	Wylie	Blanchard	phasellus.elit@hotmail.com	1-229-775-5841	41	2022-07-01 08:01:35
39	George	Guerra	nullam.velit@aol.com	1-271-876-4742	75	2023-04-12 13:38:24
40	Oprah	Sandoval	sit.amet@aol.couk	(197) 530-3355	64	2023-05-01 03:29:58
41	Blythe	Berry	arcu@icloud.net	1-303-378-8635	94	2023-08-04 22:16:20
42	Denton	Mccall	semper.pretium@google.org	(674) 693-5238	63	2022-03-19 22:02:04
43	Iliana	Strickland	aliquam.rutrum@google.net	1-665-252-8164	93	2023-09-28 17:39:34
44	Liberty	Gates	volutpat@protonmail.couk	(731) 760-8821	79	2023-08-25 21:14:05
45	Diana	Maddox	in.faucibus@yahoo.com	(862) 537-4054	5	2023-02-06 20:19:13
46	Karly	Howell	ridiculus@icloud.org	1-331-557-2320	21	2022-02-21 00:59:46
47	Gwendolyn	Dodson	ornare@google.couk	(745) 743-8264	56	2024-02-05 19:19:14
48	Wang	Keller	cras.interdum@icloud.org	1-544-340-2881	23	2023-01-24 09:01:26
49	Gil	Potter	dictum.magna@outlook.edu	1-716-371-2160	46	2022-10-08 17:31:55
50	Tucker	Branch	quam.dignissim@google.org	1-523-586-5616	78	2022-07-21 16:28:49
51	Evelyn	Beard	at.arcu@yahoo.edu	1-413-769-1568	45	2023-10-07 00:47:40
52	Erica	Good	non.nisi@aol.org	(276) 853-2116	98	2022-11-24 08:33:28
53	Leilani	Estrada	mi.duis@yahoo.org	(291) 681-7937	10	2022-03-20 02:09:53
54	Kyle	Hebert	gravida.sit@protonmail.org	1-461-148-8796	29	2022-10-15 04:45:42
55	Jared	Best	gravida.mauris@protonmail.couk	(462) 724-9995	19	2023-10-04 07:10:57
56	Ray	Sosa	tincidunt.pede@google.couk	(327) 534-3748	5	2023-10-25 23:20:27
57	Tanner	Kelly	eu@icloud.com	(974) 548-4161	52	2022-12-11 06:14:29
58	Gannon	Sosa	et.magnis@outlook.org	(878) 666-2824	52	2022-09-10 04:52:31
59	Benjamin	Burgess	amet.ante.vivamus@aol.com	(464) 566-1632	52	2023-07-20 22:53:37
60	Eleanor	Randolph	fusce.mi@icloud.com	(560) 526-6852	42	2023-02-01 21:32:04
61	Shea	O'donnell	diam@hotmail.net	(655) 555-6088	53	2022-08-16 07:26:47
62	Susan	Haney	convallis.ante@protonmail.org	(542) 332-5102	91	2022-05-28 03:51:29
63	Cheryl	Mclaughlin	donec@protonmail.ca	(418) 300-3214	44	2023-11-18 22:17:37
64	Vanna	Baker	at.sem@outlook.edu	1-705-121-9820	99	2022-09-25 12:32:32
65	Stewart	Perry	sollicitudin.commodo@icloud.com	1-490-786-0771	1	2022-04-03 15:48:44
66	Katell	Barr	laoreet.lectus@yahoo.edu	1-283-623-5333	35	2022-05-25 09:12:29
67	Camden	Ochoa	ornare@yahoo.edu	(125) 714-1181	75	2022-09-16 02:44:49
68	Quamar	Weiss	dolor.dapibus@outlook.org	(655) 612-5754	73	2022-12-27 23:59:58
69	Joseph	Rodriquez	imperdiet.non@hotmail.com	(475) 362-2332	58	2022-06-25 17:34:24
70	Devin	Wise	mauris.magna@yahoo.couk	1-566-909-1862	29	2023-01-03 18:15:54
71	Paul	Dickson	commodo@aol.ca	1-333-344-9348	4	2022-08-13 04:36:38
72	Tatyana	Hancock	sed@aol.org	1-836-452-1537	20	2022-09-24 16:45:53
73	Malik	Mathis	aliquam.nec@aol.com	(767) 169-2664	55	2024-01-14 03:31:25
74	Amos	Hicks	pede.nec.ante@outlook.org	1-257-955-4904	59	2023-07-03 20:41:45
75	Russell	Ingram	ridiculus.mus.donec@google.org	(308) 942-7624	46	2023-01-21 16:25:20
76	Simon	Moore	quis.arcu@aol.edu	(785) 613-3766	14	2022-06-04 07:35:47
77	Merrill	Santos	tincidunt@google.couk	1-171-821-4236	7	2023-10-01 07:35:14
78	Adria	Weber	ac@aol.net	(631) 262-2525	94	2023-06-16 04:19:43
79	Harper	Wall	quis.turpis@protonmail.edu	(935) 172-2552	92	2022-08-03 08:26:53
80	Josephine	Klein	ante.dictum@yahoo.edu	(535) 126-2167	59	2022-04-21 18:18:33
81	Cheyenne	Callahan	suscipit.nonummy.fusce@hotmail.com	(983) 573-2638	38	2022-08-22 17:12:07
82	Lani	Strong	nisi.aenean@hotmail.org	1-429-526-0765	74	2023-05-16 19:00:40
83	Dustin	Carney	risus.donec@icloud.ca	(375) 445-1817	34	2024-02-03 22:49:16
84	Juliet	Woods	eget@yahoo.edu	1-788-347-3313	35	2023-06-03 12:05:20
85	Addison	Parker	sed.et.libero@aol.com	1-321-612-1772	36	2023-03-20 16:44:57
86	Alvin	Austin	non.lorem.vitae@icloud.org	1-857-428-4192	54	2022-09-02 21:02:29
87	Mariko	Ramirez	consequat.nec@hotmail.ca	1-953-250-1194	20	2023-06-11 21:22:56
88	Charlotte	Wooten	donec@icloud.com	1-129-798-7141	98	2024-01-18 20:58:21
89	Stacy	Lester	tortor@hotmail.org	1-441-846-3635	10	2023-02-16 13:08:56
90	Azalia	Phelps	metus.aliquam@outlook.ca	(568) 272-1575	100	2023-11-25 10:26:20
91	Ariana	Mendoza	fermentum.convallis.ligula@icloud.edu	1-387-503-6139	70	2023-05-20 22:01:32
92	Imani	Brady	a.magna@hotmail.couk	1-581-734-8721	44	2023-08-19 02:04:14
93	Jackson	Rodgers	tortor.integer@outlook.edu	(382) 926-4885	33	2023-12-23 15:00:43
94	Ina	Mosley	duis.volutpat@google.couk	1-334-947-2563	2	2022-03-14 21:11:29
95	Alden	Patel	quis.diam@google.edu	1-681-502-1741	89	2023-04-03 19:55:11
96	Flynn	Mooney	lobortis.mauris@outlook.edu	1-786-565-2287	58	2022-04-22 06:13:13
97	Timothy	Osborn	eget@hotmail.com	1-687-738-8831	34	2022-04-23 16:35:21
98	Jack	Cantrell	lectus.convallis@google.com	1-921-348-2283	5	2022-11-03 16:53:13
99	Petra	Moore	justo@hotmail.net	1-333-676-5178	38	2023-01-18 04:37:40
100	Garrett	Castaneda	tellus.imperdiet@protonmail.couk	(341) 885-6280	97	2023-12-02 22:53:39
\.


--
-- TOC entry 3414 (class 0 OID 32929)
-- Dependencies: 231
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	video/2	19	dolor quam,	2022-06-12 05:10:23	972
2	video/5	18	tristique ac, eleifend vitae, erat.	2023-03-21 09:39:33	189
3	video/1	4	a felis	2022-09-12 23:47:19	822
4	video/3	7	tristique pharetra. Quisque	2023-07-24 20:05:22	608
5	video/3	14	enim, gravida sit amet,	2023-11-04 19:40:45	31
6	video/3	3	eu nulla	2023-07-14 13:00:36	304
7	video/2	13	dolor	2023-05-05 02:04:47	955
8	video/1	10	auctor, velit eget laoreet	2022-08-10 04:24:42	58
9	video/1	9	non ante bibendum ullamcorper. Duis	2023-07-18 17:17:35	735
10	video/2	11	in	2022-04-10 00:46:49	528
11	video/1	15	aliquam arcu. Aliquam ultrices iaculis	2022-09-14 10:01:42	154
12	video/3	10	hendrerit a, arcu. Sed	2023-08-13 14:43:53	415
13	video/3	6	vestibulum massa rutrum	2023-12-27 23:27:42	225
14	video/1	10	ipsum. Suspendisse sagittis. Nullam vitae	2023-01-23 15:34:27	29
\.


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 218
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.communities_id_seq', 1, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 220
-- Name: communities_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.communities_users_id_seq', 20, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 222
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.friendship_id_seq', 1, false);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 224
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 1, false);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 226
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 228
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photo_id_seq', 1, false);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 216
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 230
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.video_id_seq', 1, false);


--
-- TOC entry 3240 (class 2606 OID 32839)
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- TOC entry 3242 (class 2606 OID 32837)
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 32846)
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 32885)
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 32894)
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 32906)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 32926)
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 32811)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 32800)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 32937)
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


-- Completed on 2023-02-20 16:20:18

--
-- PostgreSQL database dump complete
--

