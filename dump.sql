--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO test;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO test;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO test;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO test;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: api_profile; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_profile (
    id integer NOT NULL,
    address character varying(256) NOT NULL,
    phone character varying(15) NOT NULL,
    cell_phone character varying(15) NOT NULL,
    gender boolean,
    birth_day date,
    medical_information character varying(512) NOT NULL,
    medical_condition character varying(512) NOT NULL,
    invited boolean NOT NULL,
    user_id integer,
    name character varying(128) NOT NULL,
    role_id integer,
    email character varying(254) NOT NULL
);


ALTER TABLE public.api_profile OWNER TO test;

--
-- Name: api_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_profile_id_seq OWNER TO test;

--
-- Name: api_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_profile_id_seq OWNED BY public.api_profile.id;


--
-- Name: api_role; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.api_role (
    id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.api_role OWNER TO test;

--
-- Name: api_role_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.api_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_role_id_seq OWNER TO test;

--
-- Name: api_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.api_role_id_seq OWNED BY public.api_role.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO test;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO test;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO test;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO test;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO test;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO test;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO test;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: test
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


ALTER TABLE public.django_admin_log OWNER TO test;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO test;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO test;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO test;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO test;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO test;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO test;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO test;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO test;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO test;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO test;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO test;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO test;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO test;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO test;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO test;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO test;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.users_user (
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
    date_joined timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.users_user OWNER TO test;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO test;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO test;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO test;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO test;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO test;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_profile ALTER COLUMN id SET DEFAULT nextval('public.api_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_role ALTER COLUMN id SET DEFAULT nextval('public.api_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	test@gmail.com	f	f	1
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: api_profile; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_profile (id, address, phone, cell_phone, gender, birth_day, medical_information, medical_condition, invited, user_id, name, role_id, email) FROM stdin;
3	my adress		0995320999	t	1987-05-25		Perfect health	f	1	test	1	doctor@gmail.com
7	homeless	(067)43-21-224	(067)43-21-224	t	2018-04-09	some info	Some issues	f	\N	John Doe	2	doe@gmail.com
5	402 West Russell- West Helena, Arkansas 72390	(870) 572-5803	(501) 687-4124	f	1971-02-20	Dr. Lee Davis -Office Phone 64210541798	Hypertension, Obesity, Anxiety and Vitamin D Deficiency	f	\N	Sharon Crumpton	2	patient@gmail.com
\.


--
-- Name: api_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_profile_id_seq', 7, true);


--
-- Data for Name: api_role; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.api_role (id, name) FROM stdin;
1	doctor
2	patient
\.


--
-- Name: api_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.api_role_id_seq', 2, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add content type	3	add_contenttype
8	Can change content type	3	change_contenttype
9	Can delete content type	3	delete_contenttype
10	Can add session	4	add_session
11	Can change session	4	change_session
12	Can delete session	4	delete_session
13	Can add site	5	add_site
14	Can change site	5	change_site
15	Can delete site	5	delete_site
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add email address	7	add_emailaddress
20	Can change email address	7	change_emailaddress
21	Can delete email address	7	delete_emailaddress
22	Can add email confirmation	8	add_emailconfirmation
23	Can change email confirmation	8	change_emailconfirmation
24	Can delete email confirmation	8	delete_emailconfirmation
25	Can add social application	9	add_socialapp
26	Can change social application	9	change_socialapp
27	Can delete social application	9	delete_socialapp
28	Can add social account	10	add_socialaccount
29	Can change social account	10	change_socialaccount
30	Can delete social account	10	delete_socialaccount
31	Can add social application token	11	add_socialtoken
32	Can change social application token	11	change_socialtoken
33	Can delete social application token	11	delete_socialtoken
34	Can add user	12	add_user
35	Can change user	12	change_user
36	Can delete user	12	delete_user
37	Can add profile	13	add_profile
38	Can change profile	13	change_profile
39	Can delete profile	13	delete_profile
40	Can add role	14	add_role
41	Can change role	14	change_role
42	Can delete role	14	delete_role
43	Can add Token	15	add_token
44	Can change Token	15	change_token
45	Can delete Token	15	delete_token
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 45, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
051b8e9cbf13c7243c4fdc4c30ca26448422ce89	2018-04-07 22:20:06.902127+03	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-04-07 21:24:02.521013+03	1	doctor	1	[{"added": {}}]	14	1
2	2018-04-07 21:24:09.309323+03	2	patient	1	[{"added": {}}]	14	1
3	2018-04-07 21:28:14.525651+03	3	test	1	[{"added": {}}]	13	1
4	2018-04-07 21:54:23.317221+03	5	<Profile> Sharon Crumpton	1	[{"added": {}}]	13	1
5	2018-04-07 21:54:42.897004+03	3	<Profile> test	2	[{"changed": {"fields": ["name"]}}]	13	1
6	2018-04-07 22:03:14.982275+03	5	<Profile> Sharon Crumpton	2	[{"changed": {"fields": ["role"]}}]	13	1
7	2018-04-07 22:03:29.729769+03	3	<Profile> test	2	[{"changed": {"fields": ["role"]}}]	13	1
8	2018-04-07 23:53:59.372528+03	5	<Profile> Sharon Crumpton	2	[{"changed": {"fields": ["email"]}}]	13	1
9	2018-04-07 23:54:09.970374+03	3	<Profile> test	2	[{"changed": {"fields": ["email"]}}]	13	1
10	2018-04-07 23:56:29.829623+03	11	test_09d3668	3		12	1
11	2018-04-07 23:56:29.854864+03	10	test_5d2f76f	3		12	1
12	2018-04-08 00:01:51.138253+03	13	sharon_94d3b2c	3		12	1
13	2018-04-08 00:01:51.16571+03	12	sharon_e202136	3		12	1
14	2018-04-08 00:06:30.12975+03	19	sharon_42d5f11	3		12	1
15	2018-04-08 00:06:30.152374+03	15	sharon_44c62ba	3		12	1
16	2018-04-08 00:06:30.18135+03	16	sharon_520dba1	3		12	1
17	2018-04-08 00:06:30.196605+03	17	sharon_b4198b4	3		12	1
18	2018-04-08 00:06:30.213706+03	14	sharon_baa0ad1	3		12	1
19	2018-04-08 00:06:30.231842+03	18	sharon_c3545f1	3		12	1
20	2018-04-08 17:38:12.788198+03	6	<Profile> John Doe	1	[{"added": {}}]	13	1
21	2018-04-09 01:03:24.803963+03	21	john_b843c82	3		12	1
22	2018-04-09 01:03:24.820686+03	20	john_d8e6a65	3		12	1
23	2018-04-09 15:57:34.910944+03	22	john_fec66e9	3		12	1
24	2018-04-09 16:08:33.680652+03	6	<Profile> John Doe	2	[{"changed": {"fields": ["invited"]}}]	13	1
25	2018-04-09 16:31:07.671924+03	23	john_3aee670	3		12	1
26	2018-04-09 16:32:46.010083+03	7	<Profile> John Doe	1	[{"added": {}}]	13	1
27	2018-04-09 16:35:00.006081+03	24	john_c6379f7	3		12	1
28	2018-04-09 16:35:16.273065+03	7	<Profile> John Doe	2	[{"changed": {"fields": ["invited"]}}]	13	1
29	2018-04-09 16:37:39.96986+03	7	<Profile> John Doe	2	[{"changed": {"fields": ["invited"]}}]	13	1
30	2018-04-09 16:37:59.576873+03	25	john_3750a64	3		12	1
31	2018-04-09 18:10:26.74261+03	7	<Profile> John Doe	2	[{"changed": {"fields": ["invited"]}}]	13	1
32	2018-04-09 18:10:34.207802+03	5	<Profile> Sharon Crumpton	2	[{"changed": {"fields": ["invited"]}}]	13	1
33	2018-04-09 18:11:07.911215+03	26	john_3dc9a8e	3		12	1
34	2018-04-09 18:14:08.024831+03	5	<Profile> Sharon Crumpton	2	[{"changed": {"fields": ["invited"]}}]	13	1
35	2018-04-09 18:14:26.144071+03	27	sharon_f6f7605	3		12	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 35, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	account	emailaddress
8	account	emailconfirmation
9	socialaccount	socialapp
10	socialaccount	socialaccount
11	socialaccount	socialtoken
12	users	user
13	api	profile
14	api	role
15	authtoken	token
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-04-07 19:32:48.322064+03
2	contenttypes	0002_remove_content_type_name	2018-04-07 19:32:48.330655+03
3	auth	0001_initial	2018-04-07 19:32:48.380284+03
4	auth	0002_alter_permission_name_max_length	2018-04-07 19:32:48.386455+03
5	auth	0003_alter_user_email_max_length	2018-04-07 19:32:48.392307+03
6	auth	0004_alter_user_username_opts	2018-04-07 19:32:48.399055+03
7	auth	0005_alter_user_last_login_null	2018-04-07 19:32:48.405841+03
8	auth	0006_require_contenttypes_0002	2018-04-07 19:32:48.408478+03
9	auth	0007_alter_validators_add_error_messages	2018-04-07 19:32:48.416764+03
10	auth	0008_alter_user_username_max_length	2018-04-07 19:32:48.423163+03
11	users	0001_initial	2018-04-07 19:32:48.476007+03
12	account	0001_initial	2018-04-07 19:32:48.531445+03
13	account	0002_email_max_length	2018-04-07 19:32:48.553386+03
14	admin	0001_initial	2018-04-07 19:32:48.577149+03
15	admin	0002_logentry_remove_auto_add	2018-04-07 19:32:48.589948+03
16	auth	0009_alter_user_last_name_max_length	2018-04-07 19:32:48.598087+03
17	sessions	0001_initial	2018-04-07 19:32:48.611555+03
18	sites	0001_initial	2018-04-07 19:32:48.62165+03
19	sites	0002_alter_domain_unique	2018-04-07 19:32:48.638719+03
20	sites	0003_set_site_domain_and_name	2018-04-07 19:32:48.662652+03
21	socialaccount	0001_initial	2018-04-07 19:32:48.748778+03
22	socialaccount	0002_token_max_lengths	2018-04-07 19:32:48.796159+03
23	socialaccount	0003_extra_data_default_dict	2018-04-07 19:32:48.809953+03
24	api	0001_initial	2018-04-07 21:16:17.397492+03
25	api	0002_auto_20180407_1848	2018-04-07 21:48:20.427213+03
26	api	0003_profile_role	2018-04-07 22:02:50.537735+03
27	authtoken	0001_initial	2018-04-07 22:15:03.230836+03
28	authtoken	0002_auto_20160226_1747	2018-04-07 22:15:03.277143+03
29	api	0004_profile_email	2018-04-07 23:53:35.698779+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
yi882oh8c86dkdrhwf12wvjp98wwn1kh	MjUzOTkxNmQwN2I2MGJmM2MyMjk4ZGJmNGIwNjgzOGIxODdiNGI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc5YzNhYjNhZTk4MTRmYTM3NzZlN2U3MDIzY2Q0ZDYxZGFiZGRiNGEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-21 22:20:06.972151+03
rziy1bf4vcew9xybr6sum76fho6po8lu	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-21 22:35:44.904158+03
qhe5v3rzmmb7k0w20nfnqb89f36ask2k	NmQ5OGYyYzgwNDVkZTg2ZjhlMzlkMTdmM2U2MWU0OWViZTc1ZTBkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWMzYWIzYWU5ODE0ZmEzNzc2ZTdlNzAyM2NkNGQ2MWRhYmRkYjRhIn0=	2018-04-23 12:08:08.307362+03
r1hyz1p6mw8a81agvy80a88yr9vlav0e	NmQ5OGYyYzgwNDVkZTg2ZjhlMzlkMTdmM2U2MWU0OWViZTc1ZTBkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWMzYWIzYWU5ODE0ZmEzNzc2ZTdlNzAyM2NkNGQ2MWRhYmRkYjRhIn0=	2018-04-23 12:50:38.222945+03
99y19mcpaicaathdg0bembhm2wrjznxh	NmQ5OGYyYzgwNDVkZTg2ZjhlMzlkMTdmM2U2MWU0OWViZTc1ZTBkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWMzYWIzYWU5ODE0ZmEzNzc2ZTdlNzAyM2NkNGQ2MWRhYmRkYjRhIn0=	2018-04-23 12:51:50.582197+03
3qlmzvdxng62oi5hpmnuvv8y0a12mrri	NmQ5OGYyYzgwNDVkZTg2ZjhlMzlkMTdmM2U2MWU0OWViZTc1ZTBkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWMzYWIzYWU5ODE0ZmEzNzc2ZTdlNzAyM2NkNGQ2MWRhYmRkYjRhIn0=	2018-04-23 12:54:13.61118+03
vxgs5u9302p71c10kv1ypigp05noxz84	NmQ5OGYyYzgwNDVkZTg2ZjhlMzlkMTdmM2U2MWU0OWViZTc1ZTBkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWMzYWIzYWU5ODE0ZmEzNzc2ZTdlNzAyM2NkNGQ2MWRhYmRkYjRhIn0=	2018-04-23 12:54:54.192327+03
ai851kttakc4eholxlgzpwbd3p43n24o	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 13:08:22.603846+03
zz3bwc4nhth03miee85b3wfi8a8vr5vu	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 13:09:27.900271+03
detvozh2vl8byisrys9b39uyadfdeuuw	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 13:27:33.090134+03
qn00f7h91s2edrzrwmm0nqzyia75dnxd	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 13:28:15.717176+03
qbu9bzn7q7k8q2ajz1jj345p9m7pumth	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 13:34:33.04+03
ppbj55tg4u6itngv9vyermypa7qia0e9	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 13:39:23.699842+03
95wmb2lry8s52i8ribvphbg8h3o5kcqi	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 13:54:24.803358+03
qfjxxc07sfex2nsa6ck0tvvmoqz0omem	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 13:57:39.472097+03
5m5a3l2ofrc34qquc2piip2vebrppabd	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:02:04.002049+03
s41jc931k40uyewmt96kooya61ndkjz2	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:02:11.906297+03
5kn02lm99c8pmpbstc66gdtmydrrcgxc	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:03:14.646075+03
56v1kmsu3nxqs76ktvk09cwoqkp69mu7	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:09:31.368859+03
hp5j200ok9vr8rjchwyefm7esd2pbi3n	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:09:57.712287+03
suf3k40d0cye2tz11j2m9ucd6lasyv57	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:12:08.713079+03
4ggbgyk4foioqeq0te9i3bf2jmhh6mdh	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:26:59.189786+03
zep5tfstkxcn4s9ubf9sxc2c7cs9be5m	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:32:07.619363+03
qwu5fyohavel824h01ov99bjn1udtln8	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:34:42.371195+03
bjptoz5lobuvjkb0d92yy3ih7leacs11	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:40:38.746696+03
lywi83v1qqcou1szau5j03vl20kba2iw	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:35:20.001102+03
ahzxpbyf7weiyfio45c1a8c4n01rw8o2	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:38:15.002708+03
we95phtcnav5wjz4mzt4vusj4u8sqapp	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:45:54.734587+03
54xl9egm43wlgz3uohib0gah4ajbp6ap	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:52:42.045935+03
fzied89t0sk4w169qhu3d3i1um96o82m	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:53:08.020232+03
zz7rxs0vi5hii0k8u9tbj3zb9exu2q5h	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:53:14.528339+03
9oniejk9345z8mrli7woxdnsd4cosv99	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:53:19.961287+03
fmzyme6k3drc031vppbkuy1hx7p11yt4	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:53:28.241031+03
51fjyxlowfb5dlodahoy9a8ivm2tmfgs	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:54:00.335377+03
3359vdt7na56dqf4jm45u1as9rixk3pk	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:54:10.626669+03
c60q95422ga2lnif8cspv19qeylfgnof	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:56:25.204321+03
uiqwpgu26561gppzrvudupreshdorztf	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:56:52.328659+03
e7pfckfj6efq8v4d9ggna0rs27004drw	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:58:50.745313+03
yx44757kps054fuloraig54256xz4b3w	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:58:57.038393+03
rwin4683vt6imokdrveiejjznimzmg38	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 14:59:03.927833+03
zz1g9d5h51h1otc6xu3j97b609ewf4tj	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:02:25.73308+03
boy6jzq6b4k46y79qzmb20m5ga0gs0hi	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:02:31.771273+03
jbo5422p0cwb4xqpk4ylttdp0diez9st	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:03:06.459421+03
ql7mipcemfkt0ufsqmuuvetimjjxo2ze	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:03:21.906449+03
p4fzxgyjq2xmzgojtqtnl881576xlsdz	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:03:29.158242+03
crmbb7cjndtctnlw4ex00sa23ulxcm8n	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:06:26.974667+03
4x6axdak5dffr6thc4zsmpn4b95q6l43	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:11:32.59463+03
tkrjgmmcs1b3xhis79kfoyyz82arpg8l	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:11:42.85288+03
bdabrancjl3yahk07n1s6h72cxpv36wy	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:12:00.308505+03
zxjlrgreo31ssftqonkgfnylso6wcx9o	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:41:21.303121+03
vispzcawg0azw9hmay6yjkmkgbzc1a1u	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:13:01.759945+03
vufjizyzqdwxnx1boco11v8ckd0r7m8y	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:41:35.183007+03
n8iou3fxe76yxdpogzpo4dkrx6crl5x5	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:15:07.405583+03
yn654pho1c4r3ups8hx59bz8kyz0y804	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:44:04.587174+03
9e8rijyeovhx9xd850crvkivq25jhbj8	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:21:31.443432+03
pld5qp493xc0dl9xbur3qkzlhq7ubm35	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:44:04.763973+03
txz2lib9mbdt1k4k7t16eq0wlz9na2sn	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:23:24.278363+03
sxnbiavbo0lomdaj8fktr3tgodp66323	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:44:34.825956+03
mgsmxflp9oug1r8edjf369v7egrjgf6l	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:24:29.563025+03
crohcva3o2po8cdshlf11cqavaoa1khs	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:45:42.381231+03
qduhtpeqgorqfou953k09k3sm7ogxk7z	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:24:40.712646+03
8jpv4a0jmxkfilyo9s87df4ptshej76t	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:48:59.825212+03
fyoytru9urtf5xfwxrce809atc4siofz	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:24:49.729615+03
r05q5m4rxkwge5ns7pobmujz2mdt111c	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:49:08.130811+03
0eeo6x2t0op1upphhnspojmcvfp9toyo	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:49:33.500128+03
skvu0pbn0afco3n0j6cmj5k1wr6zzifp	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:49:46.132146+03
2bqeqcaaxni9xpx4859o1d8wy6nrsz99	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 15:50:24.581505+03
5lri362hlx5feqhf3rzooze6iuxeb80u	MjVmMmE2YTQxZTJiMDdlZjY4ZGQ4MDc0ODQxY2IzNzYxMzI5MzA0Yjp7Il9hdXRoX3VzZXJfaWQiOiIyMiIsIl9hdXRoX3VzZXJfaGFzaCI6ImY2Y2IyMGMzM2UwNTcwNTQ0ZDNjMmMzNWU0Zjg3ZGZjMDUzNGQ2MjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-04-23 15:52:39.433568+03
nuplzddmpsmybcswlr3kurs9tgs3u1pk	NzA5NDNmNWJmOTNlYmY0NmRjMzNmNTY2ZDI2OTRhYTRiZTQ4MGEzMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-23 15:57:20.497233+03
m0p9y0kaagyio5xbwiteat4ahz4wgw8f	MjUzOTkxNmQwN2I2MGJmM2MyMjk4ZGJmNGIwNjgzOGIxODdiNGI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc5YzNhYjNhZTk4MTRmYTM3NzZlN2U3MDIzY2Q0ZDYxZGFiZGRiNGEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 16:06:38.554952+03
tzz80udpkpsg7q2ubreospfs1nz5r52p	YTY0ZWJhMjVkMjM2ZDA2N2VjZTFiNTRhOThhZGVmMWYzYTFhNGRjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZiODI0ZWVkYWU1YzkxNmE5OTdiM2ZlMjlkZDc3ZjRlZmZjOGFiYzciLCJfYXV0aF91c2VyX2lkIjoiMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-04-23 16:10:33.574371+03
k3m4i7e6vhjny2hzx35da29hmiqqdtu3	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 16:18:32.789545+03
9l76k6kapi9wk5cz1rk6l0ewlzdmbkbb	MDhkYzVjYTg4YjEwM2Y3NTU5MTVmNzE2MTBlOTE4YmU2NmMyODZiZjp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfaGFzaCI6ImZiODI0ZWVkYWU1YzkxNmE5OTdiM2ZlMjlkZDc3ZjRlZmZjOGFiYzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-04-23 16:19:13.977852+03
fosqlp6mphxhd8av9pxdtr12zyjqza36	MjU1NGMzNTYyYjUzNzJhMGRlOGQ0N2Q1YWRlOTQwODQ2NGE4OGM0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc5YzNhYjNhZTk4MTRmYTM3NzZlN2U3MDIzY2Q0ZDYxZGFiZGRiNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-04-23 16:31:22.29095+03
z3scw5fzki3g6g1dr5ayesva34v4etq0	MmMxNjA1YWI4OTBjMmE3OTQyODg3ZGE5NDAzNTY0OTNiZGFiN2Q0Yjp7Il9hdXRoX3VzZXJfaWQiOiIyNiIsIl9hdXRoX3VzZXJfaGFzaCI6IjI2YzcyYmQ5MjkxZDAyZjg0M2ZkNDJmZjE3ZGRkMDQ5OTk1NWE0NDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-04-23 16:38:55.101716+03
c4sb6e4durafg7idpwtmho1zr95bndb1	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 16:46:32.176928+03
251gdszn3lvp9qj0fx7p9bwaofegvm3z	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 16:47:53.396295+03
ayha8gfb4oaes4t6vhcbmgq04jwkxk3x	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 16:49:22.636937+03
rifal6ld6h8f7n6y6nng0pv8onjdpcoo	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 16:52:28.35553+03
c3emkejg8vnm4doj69inbl16zrgf1olx	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 16:52:52.610096+03
p4eblf84a39r1r9o2zgkcwc2mqpvfd71	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 16:54:41.542293+03
ovhg5ha8xz3t8kb80glmkefkcmp6mkjn	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:06:00.105743+03
l2cyyds1o1rzswufmdgppl1vxexmxytx	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:31:10.912513+03
wfwsscm1gy7h8l754xgi2gg3y9an3lgr	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:33:28.226819+03
1tqa1duepdyuorzja3oom79eofdlewdi	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:34:07.894166+03
k8vh9okpi89615xvsgblbv6k6ije8l4r	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:34:27.401309+03
105hf3jzwve7vcqn20b6czivavkw42u0	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:38:24.034511+03
tu6qb4cpbqdfi0hw32q41cpxher6z5y6	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:38:34.522061+03
nuw6h4whp0t42u6icbtr01f5oqn9e1gd	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:39:12.551335+03
g6psn9g4coaza5imf9i2hoh6c9jxuxld	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:43:01.684294+03
juegwxo7f3c2aqr66hgvovnk7dyyk2sd	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:43:29.710354+03
eh0lygn3nq47s313wu1prqcdfqaqaklr	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:43:54.160531+03
wa5n8ylt9mdlyphijm94hco4d5pkscnr	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:44:34.868724+03
9asqjic37mv4gx9h3favai5qavrzm3my	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:47:05.814116+03
zu0bp2zs0cmnu6eibewsu5hc8pr0xs0z	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:47:31.790976+03
9rdcz33fjvk8roam5v198i01jcmtya3p	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:47:52.225648+03
h0tr83bivwm1ifsk7obx2p8goejvca6v	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:50:18.444025+03
8w5zxf0223uzrln62uf9g4hq1k1vw2ol	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:50:36.49444+03
h4wlxvgk7zb559v8hxutkdam4ieay9q0	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:50:49.330881+03
67vzweow7w60y26ydg57stj34hqgh0vy	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:52:45.020198+03
usryknml8qb5pj5istp3lwdwqn1ik8o2	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:52:55.620878+03
4gga81btj2tmfsgmdj3i961dhvw0qxx5	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:54:51.948293+03
9eowi7qdwqsmrmctxtaqazyo4adv2r9u	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:55:10.718681+03
yfh4htv00z89dkuc7x63rhxrd7yvurr2	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:55:58.063958+03
2b1v5du1lurbbwju55qa4n0siitov3gh	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 17:56:41.430401+03
xfopn8seuagqyoxxm756lgl9qlsgjl28	YmYxMWNlZGZhOWJlMTE0NDA2N2FkMWEzYmFkMGEwZWYwODZmMGVjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzljM2FiM2FlOTgxNGZhMzc3NmU3ZTcwMjNjZDRkNjFkYWJkZGI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 18:11:47.342138+03
c1d7w5kq4wlercnjwu3jjytmrjao59rf	ZDk3MGI1NDQzM2Y1ZWI4N2EyMWRhZGZjMzc3OTAzM2RkYTE4ZGY2NTp7Il9hdXRoX3VzZXJfaWQiOiIyNyIsIl9hdXRoX3VzZXJfaGFzaCI6ImExZTU2NGE3OWE0ZmNlM2JmNjExNTBkOGMzN2E2ZjNjNjVmYmRiNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2018-04-23 18:12:57.695795+03
904c30738aso0jrenuz7mimmlbojlucb	MjUzOTkxNmQwN2I2MGJmM2MyMjk4ZGJmNGIwNjgzOGIxODdiNGI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc5YzNhYjNhZTk4MTRmYTM3NzZlN2U3MDIzY2Q0ZDYxZGFiZGRiNGEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 18:31:54.745269+03
7rkscc95fnzjlrqkz7f69hsg1zs7ij6h	MjUzOTkxNmQwN2I2MGJmM2MyMjk4ZGJmNGIwNjgzOGIxODdiNGI1NDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc5YzNhYjNhZTk4MTRmYTM3NzZlN2U3MDIzY2Q0ZDYxZGFiZGRiNGEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-23 18:33:25.967432+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	ncube_test_back
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, name) FROM stdin;
1	argon2$argon2i$v=19$m=512,t=2,p=2$YU14UmNRQldQaUt5$IYs7imRImWkHLTO5vk3dpw	2018-04-09 18:33:25.950134+03	t	test			test@gmail.com	t	t	2018-04-07 19:36:14.102621+03	test
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.users_user_id_seq', 27, true);


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: api_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_profile
    ADD CONSTRAINT api_profile_pkey PRIMARY KEY (id);


--
-- Name: api_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_profile
    ADD CONSTRAINT api_profile_user_id_key UNIQUE (user_id);


--
-- Name: api_role_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_role
    ADD CONSTRAINT api_role_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: api_profile_role_id_b56a342f; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX api_profile_role_id_b56a342f ON public.api_profile USING btree (role_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: test
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58_fk; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_profile_role_id_b56a342f_fk_api_role_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_profile
    ADD CONSTRAINT api_profile_role_id_b56a342f_fk_api_role_id FOREIGN KEY (role_id) REFERENCES public.api_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_profile_user_id_41309820_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.api_profile
    ADD CONSTRAINT api_profile_user_id_41309820_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

