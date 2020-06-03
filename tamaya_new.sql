--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.6

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

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: hotel_customers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.hotel_customers (
    id integer NOT NULL,
    name character varying(191) NOT NULL,
    phone character varying(191),
    id_number character varying(191),
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    updated_by_id integer NOT NULL
);


ALTER TABLE public.hotel_customers OWNER TO root;

--
-- Name: hotel_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.hotel_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_customers_id_seq OWNER TO root;

--
-- Name: hotel_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.hotel_customers_id_seq OWNED BY public.hotel_customers.id;


--
-- Name: hotel_reservations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.hotel_reservations (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    nights smallint NOT NULL,
    payment character varying(10) NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer,
    customer_id integer,
    room_id integer,
    updated_by_id integer,
    CONSTRAINT hotel_reservations_nights_check CHECK ((nights >= 0))
);


ALTER TABLE public.hotel_reservations OWNER TO root;

--
-- Name: hotel_reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.hotel_reservations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_reservations_id_seq OWNER TO root;

--
-- Name: hotel_reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.hotel_reservations_id_seq OWNED BY public.hotel_reservations.id;


--
-- Name: hotel_rooms; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.hotel_rooms (
    id integer NOT NULL,
    room_number character varying(50) NOT NULL,
    room_type character varying(191) NOT NULL,
    price character varying(10) NOT NULL,
    status character varying(20) NOT NULL,
    is_booked boolean NOT NULL,
    has_damages boolean NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.hotel_rooms OWNER TO root;

--
-- Name: hotel_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.hotel_rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_rooms_id_seq OWNER TO root;

--
-- Name: hotel_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.hotel_rooms_id_seq OWNED BY public.hotel_rooms.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: hotel_customers id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_customers ALTER COLUMN id SET DEFAULT nextval('public.hotel_customers_id_seq'::regclass);


--
-- Name: hotel_reservations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_reservations ALTER COLUMN id SET DEFAULT nextval('public.hotel_reservations_id_seq'::regclass);


--
-- Name: hotel_rooms id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_rooms ALTER COLUMN id SET DEFAULT nextval('public.hotel_rooms_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add customer	7	add_customer
26	Can change customer	7	change_customer
27	Can delete customer	7	delete_customer
28	Can view customer	7	view_customer
29	Can add reservation	8	add_reservation
30	Can change reservation	8	change_reservation
31	Can delete reservation	8	delete_reservation
32	Can view reservation	8	view_reservation
33	Can add room	9	add_room
34	Can change room	9	change_room
35	Can delete room	9	delete_room
36	Can view room	9	view_room
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$120000$2mDpBRmLb9fX$86IkFfygt7YYpFjV2L+TxjAd3g7JuymXhZYyqOEDjMs=	\N	t	editor			editor@editor.com	t	t	2020-06-02 16:51:29.310108+03
1	pbkdf2_sha256$120000$fSjWrGdbmYNY$re88ZpM+0j8I7CYdz3SJi8+6ZhyKu7iotDCUhAa+lZE=	2020-06-02 16:51:37.167619+03	t	admin			admin@admin.com	t	t	2020-06-02 16:51:14.525187+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	reservations	customer
8	reservations	reservation
9	reservations	room
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-06-02 16:49:52.084659+03
2	auth	0001_initial	2020-06-02 16:49:52.364744+03
3	admin	0001_initial	2020-06-02 16:49:52.433624+03
4	admin	0002_logentry_remove_auto_add	2020-06-02 16:49:52.444625+03
5	admin	0003_logentry_add_action_flag_choices	2020-06-02 16:49:52.452626+03
6	contenttypes	0002_remove_content_type_name	2020-06-02 16:49:52.474493+03
7	auth	0002_alter_permission_name_max_length	2020-06-02 16:49:52.483492+03
8	auth	0003_alter_user_email_max_length	2020-06-02 16:49:52.494163+03
9	auth	0004_alter_user_username_opts	2020-06-02 16:49:52.503701+03
10	auth	0005_alter_user_last_login_null	2020-06-02 16:49:52.515709+03
11	auth	0006_require_contenttypes_0002	2020-06-02 16:49:52.518713+03
12	auth	0007_alter_validators_add_error_messages	2020-06-02 16:49:52.52875+03
13	auth	0008_alter_user_username_max_length	2020-06-02 16:49:52.555038+03
14	auth	0009_alter_user_last_name_max_length	2020-06-02 16:49:52.56737+03
15	reservations	0001_initial	2020-06-02 16:49:52.83961+03
16	sessions	0001_initial	2020-06-02 16:49:52.894139+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xs16h0irzw43dj5ezdxvg7qfoxt158m5	NDFiODEyODcxNTk4NTBlMmNhZjAxMWUzNmJkZWZjYjNiZWI1MmY2MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MGIyMjUxODE5YTQzNGI4Njk2Y2FiNzEzM2E5MGY5M2UyMTlkNjQzIn0=	2020-06-16 16:51:37.19358+03
\.


--
-- Data for Name: hotel_customers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.hotel_customers (id, name, phone, id_number, is_active, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	sos peter	111	121331	t	2020-06-02 16:54:26.406643+03	2020-06-02 16:54:26.406643+03	1	1
2	Jane Kamud	12121	121331	t	2020-06-02 16:54:59.259801+03	2020-06-02 16:54:59.259801+03	1	1
3	testing	12121	3424	t	2020-06-03 09:48:22.27528+03	2020-06-03 09:48:22.27528+03	1	1
4	testing	12121	3424	t	2020-06-03 09:49:43.690844+03	2020-06-03 09:49:43.690844+03	1	1
5	testing	12121	3424	t	2020-06-03 09:50:13.100827+03	2020-06-03 09:50:13.100827+03	1	1
6	testing	12121	3424	t	2020-06-03 09:50:59.612491+03	2020-06-03 09:50:59.612491+03	1	1
9	testing	12121	3424	t	2020-06-03 09:57:33.878516+03	2020-06-03 09:57:33.878516+03	1	1
10	testing	12121	3424	t	2020-06-03 09:58:05.030175+03	2020-06-03 09:58:05.030175+03	1	1
11	testing	12121	3424	t	2020-06-03 09:58:27.540858+03	2020-06-03 09:58:27.540858+03	1	1
13	testing	12121	121331	t	2020-06-03 10:02:22.339906+03	2020-06-03 10:02:22.339906+03	1	1
15	sos peter	823289	3424	t	2020-06-03 12:02:16.843491+03	2020-06-03 12:02:16.843491+03	1	1
19	newere	12121	121331	t	2020-06-03 12:36:29.797794+03	2020-06-03 12:36:29.797794+03	1	1
20	newere	12121	3424	t	2020-06-03 12:37:18.77474+03	2020-06-03 12:37:18.77474+03	1	1
21	customer new testing	823289	121331	t	2020-06-03 12:41:32.868501+03	2020-06-03 12:41:19.094315+03	1	1
\.


--
-- Data for Name: hotel_reservations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.hotel_reservations (id, code, nights, payment, check_in, check_out, is_active, created_at, updated_at, created_by_id, customer_id, room_id, updated_by_id) FROM stdin;
1	FKCJ4CETEA	1	cash	2020-06-02	2020-06-03	t	2020-06-02 16:54:26.560037+03	2020-06-02 16:54:26.560037+03	1	1	1	1
2	GTUF52LA2T	2	cash	2020-06-10	2020-06-12	t	2020-06-02 16:54:59.3358+03	2020-06-02 16:54:59.3358+03	1	2	2	1
6	V2SLYW3SR2	1	mpesa	2020-06-25	2020-06-26	t	2020-06-03 10:02:22.464914+03	2020-06-03 10:02:22.48058+03	1	13	3	1
8	792TRT7FNN	1	cash	2020-06-03	2020-06-05	t	2020-06-03 12:02:16.952864+03	2020-06-03 12:02:16.952864+03	1	15	1	1
12	64TGE73OYV	1	mpesa	2020-06-04	2020-06-04	t	2020-06-03 12:36:29.893794+03	2020-06-03 12:36:29.893794+03	1	19	2	1
13	89OUROLA5U	1	mpesa	2020-06-04	2020-06-04	t	2020-06-03 12:37:18.850739+03	2020-06-03 12:37:18.850739+03	1	20	4	1
14	E53D94DFDL	1	mpesa	2020-06-11	2020-06-12	f	2020-06-03 12:56:28.859642+03	2020-06-03 12:41:19.165277+03	1	21	1	1
\.


--
-- Data for Name: hotel_rooms; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.hotel_rooms (id, room_number, room_type, price, status, is_booked, has_damages, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
3	003	Deluxe	1300	active	t	f	room 3	2020-06-02 16:53:03.639467+03	2020-06-03 10:02:22.511774+03	1	1
2	002	Double	1200	active	t	f	room 2	2020-06-02 16:52:49.265526+03	2020-06-03 12:36:29.917794+03	1	1
4	004	Suite	1400	active	t	f	suite	2020-06-02 16:53:18.400831+03	2020-06-03 12:37:18.872739+03	1	1
1	001	Single	1000	active	f	f	room 1	2020-06-02 16:52:01.512805+03	2020-06-03 12:56:28.886644+03	1	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 16, true);


--
-- Name: hotel_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.hotel_customers_id_seq', 22, true);


--
-- Name: hotel_reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.hotel_reservations_id_seq', 14, true);


--
-- Name: hotel_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.hotel_rooms_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: hotel_customers hotel_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_customers
    ADD CONSTRAINT hotel_customers_pkey PRIMARY KEY (id);


--
-- Name: hotel_reservations hotel_reservations_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_reservations
    ADD CONSTRAINT hotel_reservations_code_key UNIQUE (code);


--
-- Name: hotel_reservations hotel_reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_reservations
    ADD CONSTRAINT hotel_reservations_pkey PRIMARY KEY (id);


--
-- Name: hotel_rooms hotel_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_pkey PRIMARY KEY (id);


--
-- Name: hotel_rooms hotel_rooms_room_number_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_room_number_key UNIQUE (room_number);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: hotel_customers_created_by_id_b024716d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_customers_created_by_id_b024716d ON public.hotel_customers USING btree (created_by_id);


--
-- Name: hotel_customers_updated_by_id_91f89938; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_customers_updated_by_id_91f89938 ON public.hotel_customers USING btree (updated_by_id);


--
-- Name: hotel_reservations_code_3e8182c8_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_reservations_code_3e8182c8_like ON public.hotel_reservations USING btree (code varchar_pattern_ops);


--
-- Name: hotel_reservations_created_by_id_49fd704d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_reservations_created_by_id_49fd704d ON public.hotel_reservations USING btree (created_by_id);


--
-- Name: hotel_reservations_customer_id_14ca4c6d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_reservations_customer_id_14ca4c6d ON public.hotel_reservations USING btree (customer_id);


--
-- Name: hotel_reservations_room_id_d2769341; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_reservations_room_id_d2769341 ON public.hotel_reservations USING btree (room_id);


--
-- Name: hotel_reservations_updated_by_id_3bf9a789; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_reservations_updated_by_id_3bf9a789 ON public.hotel_reservations USING btree (updated_by_id);


--
-- Name: hotel_rooms_created_by_id_489fe45b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_rooms_created_by_id_489fe45b ON public.hotel_rooms USING btree (created_by_id);


--
-- Name: hotel_rooms_room_number_e9815f64_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_rooms_room_number_e9815f64_like ON public.hotel_rooms USING btree (room_number varchar_pattern_ops);


--
-- Name: hotel_rooms_updated_by_id_5d445edb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX hotel_rooms_updated_by_id_5d445edb ON public.hotel_rooms USING btree (updated_by_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hotel_customers hotel_customers_created_by_id_b024716d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_customers
    ADD CONSTRAINT hotel_customers_created_by_id_b024716d_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hotel_customers hotel_customers_updated_by_id_91f89938_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_customers
    ADD CONSTRAINT hotel_customers_updated_by_id_91f89938_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hotel_reservations hotel_reservations_created_by_id_49fd704d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_reservations
    ADD CONSTRAINT hotel_reservations_created_by_id_49fd704d_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hotel_reservations hotel_reservations_customer_id_14ca4c6d_fk_hotel_customers_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_reservations
    ADD CONSTRAINT hotel_reservations_customer_id_14ca4c6d_fk_hotel_customers_id FOREIGN KEY (customer_id) REFERENCES public.hotel_customers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hotel_reservations hotel_reservations_room_id_d2769341_fk_hotel_rooms_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_reservations
    ADD CONSTRAINT hotel_reservations_room_id_d2769341_fk_hotel_rooms_id FOREIGN KEY (room_id) REFERENCES public.hotel_rooms(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hotel_reservations hotel_reservations_updated_by_id_3bf9a789_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_reservations
    ADD CONSTRAINT hotel_reservations_updated_by_id_3bf9a789_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hotel_rooms hotel_rooms_created_by_id_489fe45b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_created_by_id_489fe45b_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hotel_rooms hotel_rooms_updated_by_id_5d445edb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_updated_by_id_5d445edb_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

