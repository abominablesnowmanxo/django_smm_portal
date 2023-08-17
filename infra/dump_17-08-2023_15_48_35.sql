--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE smm_dev;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md532e12f215ba27cb750c9e093ce4b5127';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "smm_dev" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

--
-- Name: smm_dev; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE smm_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE smm_dev OWNER TO postgres;

\connect smm_dev

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
-- Name: accounts_customuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.accounts_customuser OWNER TO postgres;

--
-- Name: accounts_customuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_groups OWNER TO postgres;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.accounts_customuser_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.accounts_customuser ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_customuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_user_permissions OWNER TO postgres;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.accounts_customuser_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: projects_contenttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_contenttype (
    id bigint NOT NULL,
    content_type character varying(64) NOT NULL
);


ALTER TABLE public.projects_contenttype OWNER TO postgres;

--
-- Name: projects_contenttype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.projects_contenttype ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_contenttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_done; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_done (
    id bigint NOT NULL,
    is_done character varying(32) NOT NULL
);


ALTER TABLE public.projects_done OWNER TO postgres;

--
-- Name: projects_done_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.projects_done ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_done_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_format; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_format (
    id bigint NOT NULL,
    format character varying(32) NOT NULL
);


ALTER TABLE public.projects_format OWNER TO postgres;

--
-- Name: projects_format_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.projects_format ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_format_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_heading; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_heading (
    id bigint NOT NULL,
    heading character varying(64) NOT NULL
);


ALTER TABLE public.projects_heading OWNER TO postgres;

--
-- Name: projects_heading_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.projects_heading ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_heading_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_postidea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_postidea (
    id bigint NOT NULL,
    theme character varying(64) NOT NULL,
    short_description text NOT NULL,
    full_description text,
    publish_date date,
    hashtags character varying(64),
    geolocation character varying(128),
    "references" text,
    inventory text,
    to_do_list text,
    notes text,
    author_id bigint NOT NULL,
    content_type_id bigint,
    format_id bigint NOT NULL,
    heading_id bigint,
    is_done_id bigint NOT NULL,
    project_id bigint,
    social_network_id bigint
);


ALTER TABLE public.projects_postidea OWNER TO postgres;

--
-- Name: projects_postidea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.projects_postidea ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_postidea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_project (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    author_id bigint NOT NULL
);


ALTER TABLE public.projects_project OWNER TO postgres;

--
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.projects_project ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: projects_socialnetwork; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_socialnetwork (
    id bigint NOT NULL,
    social_network_name character varying(64) NOT NULL
);


ALTER TABLE public.projects_socialnetwork OWNER TO postgres;

--
-- Name: projects_socialnetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.projects_socialnetwork ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.projects_socialnetwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rubricator_rubricator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rubricator_rubricator (
    id bigint NOT NULL,
    description text,
    author_id bigint NOT NULL,
    content_type_id bigint,
    heading_id bigint
);


ALTER TABLE public.rubricator_rubricator OWNER TO postgres;

--
-- Name: rubricator_rubricator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rubricator_rubricator ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rubricator_rubricator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: accounts_customuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$600000$RCx69T03RF0sSOIKNh39Oz$hp73lzkQzYzpAH+/yEVaHbOK9fW1T5kqE2Ex6c8v6fA=	\N	f	testuser2	test	user	testuser2@gmail.com	f	t	2023-07-08 14:38:10.982321+00
4	pbkdf2_sha256$600000$STjbYCriFfEr8VNVRn7Rkx$A1ta/iUs2rDOs0q2jr6KhTsh5dqy9u9Wq4Zoae1Lsuc=	\N	f				test@gmail.com	f	t	2023-07-18 18:20:36.040334+00
2	pbkdf2_sha256$600000$RCx69T03RF0sSOIKNh39Oz$hp73lzkQzYzpAH+/yEVaHbOK9fW1T5kqE2Ex6c8v6fA=	2023-07-19 23:44:44.861567+00	f	testuser1	test	user	testuser1@gmail.com	f	t	2023-07-08 14:38:10.982321+00
9	pbkdf2_sha256$600000$dtRaKUd7H7PBUvg6VIBxyX$5EY5JeAwH+4dqjqPP3qi1v8rY9pKII+4BZEHeCMJpiM=	2023-08-17 11:25:21.699606+00	f	admin2			admin@gmail.com	f	t	2023-08-17 11:25:14.906197+00
1	pbkdf2_sha256$600000$RCx69T03RF0sSOIKNh39Oz$hp73lzkQzYzpAH+/yEVaHbOK9fW1T5kqE2Ex6c8v6fA=	2023-08-17 11:41:14.639604+00	t	admin	zah	zah	zah@gmail.com	t	t	2023-07-08 14:38:10+00
\.


--
-- Data for Name: accounts_customuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_customuser
22	Can change user	6	change_customuser
23	Can delete user	6	delete_customuser
24	Can view user	6	view_customuser
25	Can add Тип контента	7	add_contenttype
26	Can change Тип контента	7	change_contenttype
27	Can delete Тип контента	7	delete_contenttype
28	Can view Тип контента	7	view_contenttype
29	Can add Статус	8	add_done
30	Can change Статус	8	change_done
31	Can delete Статус	8	delete_done
32	Can view Статус	8	view_done
33	Can add Формат	9	add_format
34	Can change Формат	9	change_format
35	Can delete Формат	9	delete_format
36	Can view Формат	9	view_format
37	Can add Рубрика	10	add_heading
38	Can change Рубрика	10	change_heading
39	Can delete Рубрика	10	delete_heading
40	Can view Рубрика	10	view_heading
41	Can add Площадка	11	add_socialnetwork
42	Can change Площадка	11	change_socialnetwork
43	Can delete Площадка	11	delete_socialnetwork
44	Can view Площадка	11	view_socialnetwork
45	Can add Проект	12	add_project
46	Can change Проект	12	change_project
47	Can delete Проект	12	delete_project
48	Can view Проект	12	view_project
49	Can add Идея для поста	13	add_postidea
50	Can change Идея для поста	13	change_postidea
51	Can delete Идея для поста	13	delete_postidea
52	Can view Идея для поста	13	view_postidea
53	Can add rubricator	14	add_rubricator
54	Can change rubricator	14	change_rubricator
55	Can delete rubricator	14	delete_rubricator
56	Can view rubricator	14	view_rubricator
57	Can add rubricator	15	add_rubricator
58	Can change rubricator	15	change_rubricator
59	Can delete rubricator	15	delete_rubricator
60	Can view rubricator	15	view_rubricator
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-07-17 11:35:01.056088+00	1	etika	1	[{"added": {}}]	12	1
2	2023-07-17 11:35:05.464251+00	2	irina	1	[{"added": {}}]	12	1
3	2023-07-17 11:35:15.374798+00	3	sasha	1	[{"added": {}}]	12	1
4	2023-07-17 15:03:09.53253+00	1	Etika	2	[{"changed": {"fields": ["Name"]}}]	12	1
5	2023-07-17 15:03:55.075646+00	2	City Business Law	2	[{"changed": {"fields": ["Name"]}}]	12	1
6	2023-07-17 15:04:07.340208+00	3	Sasha Lilu	2	[{"changed": {"fields": ["Name"]}}]	12	1
7	2023-07-17 17:41:07.190126+00	4	Анонс	1	[{"added": {}}]	10	1
8	2023-07-17 17:41:17.337765+00	5	Отчет	1	[{"added": {}}]	10	1
9	2023-07-17 17:41:22.006976+00	6	Вдохновение	1	[{"added": {}}]	10	1
10	2023-07-18 11:54:18.494422+00	2	Irina	2	[{"changed": {"fields": ["Name"]}}]	12	1
11	2023-07-18 14:54:18.026489+00	1	admin	2	[{"changed": {"fields": ["Username"]}}]	6	1
12	2023-07-19 13:13:14.532747+00	4	Rubricator object (4)	2	[{"changed": {"fields": ["Author"]}}]	14	1
13	2023-07-19 13:13:18.224131+00	3	Rubricator object (3)	2	[{"changed": {"fields": ["Author"]}}]	14	1
14	2023-07-19 13:13:22.354318+00	2	Rubricator object (2)	2	[{"changed": {"fields": ["Author"]}}]	14	1
15	2023-07-19 13:13:26.872076+00	1	Rubricator object (1)	2	[{"changed": {"fields": ["Author"]}}]	14	1
16	2023-07-19 13:16:01.816645+00	5	Rubricator object (5)	3		14	1
17	2023-07-20 00:14:04.406883+00	1	Rubricator object (1)	1	[{"added": {}}]	15	1
18	2023-07-20 00:14:16.623812+00	2	Rubricator object (2)	1	[{"added": {}}]	15	1
19	2023-07-20 00:14:34.041858+00	3	Rubricator object (3)	1	[{"added": {}}]	15	1
20	2023-07-20 09:36:31.364892+00	1	Этика	2	[{"changed": {"fields": ["Name"]}}]	12	1
21	2023-07-20 09:36:38.349088+00	2	Ирина	2	[{"changed": {"fields": ["Name"]}}]	12	1
22	2023-07-20 09:36:45.5211+00	3	Саша Лилу	2	[{"changed": {"fields": ["Name"]}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	customuser
7	projects	contenttype
8	projects	done
9	projects	format
10	projects	heading
11	projects	socialnetwork
12	projects	project
13	projects	postidea
14	projects	rubricator
15	rubricator	rubricator
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-07-17 11:31:04.903673+00
2	contenttypes	0002_remove_content_type_name	2023-07-17 11:31:04.906528+00
3	auth	0001_initial	2023-07-17 11:31:04.927067+00
4	auth	0002_alter_permission_name_max_length	2023-07-17 11:31:04.929132+00
5	auth	0003_alter_user_email_max_length	2023-07-17 11:31:04.931349+00
6	auth	0004_alter_user_username_opts	2023-07-17 11:31:04.933638+00
7	auth	0005_alter_user_last_login_null	2023-07-17 11:31:04.935893+00
8	auth	0006_require_contenttypes_0002	2023-07-17 11:31:04.936712+00
9	auth	0007_alter_validators_add_error_messages	2023-07-17 11:31:04.938923+00
10	auth	0008_alter_user_username_max_length	2023-07-17 11:31:04.941946+00
11	auth	0009_alter_user_last_name_max_length	2023-07-17 11:31:04.944189+00
12	auth	0010_alter_group_name_max_length	2023-07-17 11:31:04.946677+00
13	auth	0011_update_proxy_permissions	2023-07-17 11:31:04.948861+00
14	auth	0012_alter_user_first_name_max_length	2023-07-17 11:31:04.951+00
15	accounts	0001_initial	2023-07-17 11:31:04.970748+00
16	admin	0001_initial	2023-07-17 11:31:04.980034+00
17	admin	0002_logentry_remove_auto_add	2023-07-17 11:31:04.983125+00
18	admin	0003_logentry_add_action_flag_choices	2023-07-17 11:31:04.986091+00
19	projects	0001_initial	2023-07-17 11:31:05.015625+00
20	sessions	0001_initial	2023-07-17 11:31:05.023151+00
21	projects	0002_alter_postidea_author_alter_postidea_content_type_and_more	2023-07-18 06:50:51.00165+00
22	accounts	0002_alter_customuser_email	2023-07-18 18:14:40.019457+00
23	accounts	0003_alter_customuser_email	2023-07-18 18:30:42.300435+00
24	projects	0003_rubricator	2023-07-19 11:41:29.638319+00
25	projects	0004_rubricator_author	2023-07-19 13:12:44.815747+00
26	projects	0005_delete_rubricator	2023-07-20 00:13:04.012428+00
27	rubricator	0001_initial	2023-07-20 00:13:04.033648+00
28	rubricator	0002_rename_examples_rubricator_description	2023-07-20 07:03:10.88171+00
29	rubricator	0003_alter_rubricator_description	2023-08-17 11:24:55.241467+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8zwtnpd5g0jbbci07dpnlj1314yckh8a	.eJxVjMEOwiAQRP-FsyGLyEI9eu83EBYWqRqalPZk_Hdp0oOeJpn3Zt7Ch20tfmu8-CmJq1Di9NtRiE-uO0iPUO-zjHNdl4nkrsiDNjnOiV-3w_07KKGVvraghpg1gh3QEIGO1gFlwzmyzcoERDwbyDZC6PCibQ-nSTlGdI7E5wvPoTdD:1qWbNK:le32FwKhuUeFoIM-e8b0ikTAe9M9-5OrR0jnmyRwq8A	2023-08-31 11:41:14.65775+00
zccc1s3sb0qx5jjg6ghbdevzo8tfarak	.eJxVjMEOwiAQRP-FsyGLyEI9eu83EBYWqRqalPZk_Hdp0oOeJpn3Zt7Ch20tfmu8-CmJq1Di9NtRiE-uO0iPUO-zjHNdl4nkrsiDNjnOiV-3w_07KKGVvraghpg1gh3QEIGO1gFlwzmyzcoERDwbyDZC6PCibQ-nSTlGdI7E5wvPoTdD:1qMHIL:THHNF6c98MqmTvhu7lnZX7vXRZBlWj4z-Z8xf05YK4A	2023-08-03 00:13:25.646953+00
\.


--
-- Data for Name: projects_contenttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_contenttype (id, content_type) FROM stdin;
1	Коммуникационный
2	Образовательный
3	Продуктовый
4	Развлекательный
5	Репутационный
6	Смешанный
\.


--
-- Data for Name: projects_done; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_done (id, is_done) FROM stdin;
1	Да
2	Нет
3	В процессе
\.


--
-- Data for Name: projects_format; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_format (id, format) FROM stdin;
1	Карусель
2	Кружочек
3	Пост
4	Рилз
5	Сториз
\.


--
-- Data for Name: projects_heading; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_heading (id, heading) FROM stdin;
1	Кейсы
2	Лайфстайл
3	Услуги
4	Анонс
5	Отчет
6	Вдохновение
\.


--
-- Data for Name: projects_postidea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_postidea (id, theme, short_description, full_description, publish_date, hashtags, geolocation, "references", inventory, to_do_list, notes, author_id, content_type_id, format_id, heading_id, is_done_id, project_id, social_network_id) FROM stdin;
85	theme 7	short description 7	\N	2023-07-15	\N	\N	\N	\N	\N	\N	1	\N	1	\N	2	\N	\N
92	theme 1	short description 1	\N	2023-07-08	\N	\N	\N	\N	\N	\N	2	\N	1	\N	1	\N	\N
93	theme 2	short description 2	\N	2023-07-09	\N	\N	\N	\N	\N	\N	2	\N	2	\N	2	\N	\N
94	theme 3	short description 3	\N	2023-07-10	\N	\N	\N	\N	\N	\N	2	\N	3	\N	2	\N	\N
95	theme 4	short description 4	\N	2023-07-11	\N	\N	\N	\N	\N	\N	2	\N	4	\N	2	\N	\N
97	theme 6	short description 6	\N	2023-07-15	\N	\N	\N	\N	\N	\N	2	\N	5	\N	2	\N	\N
98	theme 7	short description 7	\N	2023-07-15	\N	\N	\N	\N	\N	\N	2	\N	1	\N	2	\N	\N
99	theme 8	short description 8	\N	2023-07-17	\N	\N	\N	\N	\N	\N	2	\N	2	\N	3	\N	\N
101	theme 10	short description 10	\N	2023-07-23	\N	\N	\N	\N	\N	\N	2	\N	4	\N	2	\N	\N
102	theme 11	short description 11	\N	2023-07-24	\N	\N	\N	\N	\N	\N	2	\N	5	\N	3	\N	\N
103	theme 12	short description 12	\N	2023-07-26	\N	\N	\N	\N	\N	\N	2	\N	3	\N	2	\N	\N
104	theme 13	short description 13	\N	2023-07-30	\N	\N	\N	\N	\N	\N	2	\N	1	\N	2	\N	\N
105	theme 1	short description 1	\N	2023-07-08	\N	\N	\N	\N	\N	\N	3	\N	1	\N	1	\N	\N
106	theme 2	short description 2	\N	2023-07-09	\N	\N	\N	\N	\N	\N	3	\N	2	\N	2	\N	\N
107	theme 3	short description 3	\N	2023-07-10	\N	\N	\N	\N	\N	\N	3	\N	3	\N	2	\N	\N
108	theme 4	short description 4	\N	2023-07-11	\N	\N	\N	\N	\N	\N	3	\N	4	\N	2	\N	\N
109	theme 5	short description 5	\N	2023-07-13	\N	\N	\N	\N	\N	\N	3	\N	5	\N	3	\N	\N
110	theme 6	short description 6	\N	2023-07-15	\N	\N	\N	\N	\N	\N	3	\N	1	\N	2	\N	\N
111	theme 7	short description 7	\N	2023-07-15	\N	\N	\N	\N	\N	\N	3	\N	1	\N	2	\N	\N
112	theme 8	short description 8	\N	2023-07-17	\N	\N	\N	\N	\N	\N	3	\N	2	\N	3	\N	\N
113	theme 9	short description 9	\N	2023-07-18	\N	\N	\N	\N	\N	\N	3	\N	3	\N	3	\N	\N
114	theme 10	short description 10	\N	2023-07-23	\N	\N	\N	\N	\N	\N	3	\N	4	\N	2	\N	\N
115	theme 11	short description 11	\N	2023-07-24	\N	\N	\N	\N	\N	\N	3	\N	5	\N	3	\N	\N
116	theme 12	short description 12	\N	2023-07-26	\N	\N	\N	\N	\N	\N	3	\N	3	\N	2	\N	\N
117	theme 13	short description 13	\N	2023-07-30	\N	\N	\N	\N	\N	\N	3	\N	1	\N	2	\N	\N
128	novaia idea	ads		2023-07-08	\N	\N					1	\N	2	\N	2	3	\N
118	свободная лепка и глазуровка на этой неделе: 4 и 8 июля	свободная лепка и глазуровка на этой неделе: 4 и 8 июля		2023-07-17	\N	\N					1	3	2	1	1	1	6
81	theme123123321	short description 3		2023-07-10	\N	\N					1	\N	3	\N	2	1	\N
88	theme 10	short description 10		2023-07-23	\N	\N					1	2	4	2	2	3	7
120	про занятия и события грядущей недели	Short desc		2023-07-18	\N	\N					1	2	4	3	2	3	4
130	321	132		2023-07-06	\N	\N					1	\N	2	\N	2	3	\N
79	theme 1	short description 1		2023-07-08	\N	\N					1	2	1	1	1	3	3
123	novaia idea	afsd		2023-07-17	\N	\N					1	3	4	3	1	2	4
80	theme 2	short description 2		2023-07-09	\N	\N					1	2	2	6	2	2	3
86	сегодня в нашей студии проходит индивидуальное занятие	short description 8		2023-07-17	\N	\N			321		1	2	4	2	1	1	2
91	theme 13	short description 13	\N	2023-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	2	\N	\N
125	321	312		2023-07-22	\N	\N					1	\N	2	\N	2	1	\N
126	1rst jule123	safd		2023-07-02	\N	\N					1	\N	2	\N	3	3	\N
89	theme 11	short description 11		2023-07-24	\N	\N					1	\N	5	\N	3	1	\N
119	индивидуальное занятие	индивидуальное занятие		2023-07-18	\N	\N					1	2	2	3	1	1	3
87	пикник: рилз от Аркаши	short description 9		2023-07-19	\N	\N		21			1	2	3	1	1	2	2
127	sdfa	afsd		2023-07-20	\N	\N					1	\N	3	\N	2	1	\N
100	theme 9	short description 9	\N	2023-07-12	\N	\N	\N	\N	\N	\N	2	\N	3	\N	3	\N	\N
122	уже завтра занятие по свободной лепке, остались места	132		2023-07-19	\N	\N					1	5	2	5	2	1	2
96	theme 5	short description 5	\N	2023-07-12	\N	\N	\N	\N	\N	\N	2	\N	5	\N	3	\N	\N
132	safd	fsad		2023-06-30	\N	\N					1	\N	2	\N	2	2	\N
133	123	123		2023-06-28	\N	\N					1	\N	3	\N	2	2	\N
90	theme 12	short description 12		2023-07-21	\N	\N					1	\N	2	\N	2	3	\N
124	NEW IDEA	SHORT		2023-08-16	\N	\N					1	\N	5	\N	2	1	\N
129	edit	fsad		2023-07-01	\N	\N					1	\N	2	\N	2	1	\N
83	Prive poka	short description 5		2023-07-13	\N	\N		4			1	\N	5	\N	3	1	\N
84	theme 6	short description 6	\N	2023-07-21	\N	\N	\N	\N	\N	\N	1	\N	3	\N	2	\N	\N
82	theme 4	short description 4		2023-07-22	\N	\N					1	2	4	1	2	1	3
131	DRAGGABLE ELEMENT	draggin		2023-07-19	\N	\N					1	\N	3	\N	1	1	\N
134	New theme	123		2023-08-11	\N	\N					9	\N	2	\N	1	2	\N
\.


--
-- Data for Name: projects_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_project (id, name, author_id) FROM stdin;
1	Этика	1
2	Ирина	1
3	Саша Лилу	1
\.


--
-- Data for Name: projects_socialnetwork; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_socialnetwork (id, social_network_name) FROM stdin;
1	Facebook
2	Instagram
3	Pinterest
4	Telegram
5	TikTok
6	Twitter
7	VK
8	Youtube
9	Одноклассники
\.


--
-- Data for Name: rubricator_rubricator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rubricator_rubricator (id, description, author_id, content_type_id, heading_id) FROM stdin;
3	Nteger id magna at sapien finibus convallis. Quisque ullamcorper finibus laoreet. Sed placerat bibendum consequat. Aliquam at ante a tellus rhoncus volutpat sed nec ex. Aliquam lorem leo, imperdiet ullamcorper metus ut, accumsan ultrices lorem. Mauris ullamcorper, tellus sed tristique dictum, enim ex molestie sapien, vel volutpat lectus quam eu nibh. Nunc libero sapien, dignissim vitae feugiat eget, euismod id erat. Fusce quis nunc at lacus hendrerit malesuada. Morbi fermentum ut tellus in dapibus. Morbi sit amet magna nisl.	1	4	4
2	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ligula ante, aliquam et diam nec, scelerisque imperdiet dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nisi mauris, finibus eu mauris nec, sodales sodales nulla. Nullam lorem neque, vestibulum sed maximus eget, laoreet ac erat. Donec suscipit diam ut sollicitudin luctus. Aenean tortor nulla, scelerisque sed urna eget, eleifend molestie lacus.	1	3	3
1	Ut ut tempor odio. Sed accumsan, erat a dictum aliquet, nunc purus tincidunt ligula, in condimentum odio dui at ipsum. Sed quam nibh, feugiat et venenatis id, cursus et mauris. Proin ipsum nisl, placerat eget vestibulum vitae, interdum vitae purus. Vestibulum eu turpis a urna congue bibendum nec eu dolor.	1	2	6
\.


--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_customuser_groups_id_seq', 1, false);


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_customuser_id_seq', 9, true);


--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_customuser_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 22, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: projects_contenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_contenttype_id_seq', 6, true);


--
-- Name: projects_done_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_done_id_seq', 3, true);


--
-- Name: projects_format_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_format_id_seq', 5, true);


--
-- Name: projects_heading_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_heading_id_seq', 6, true);


--
-- Name: projects_postidea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_postidea_id_seq', 134, true);


--
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_project_id_seq', 3, true);


--
-- Name: projects_socialnetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_socialnetwork_id_seq', 9, true);


--
-- Name: rubricator_rubricator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rubricator_rubricator_id_seq', 3, true);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq UNIQUE (customuser_id, group_id);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_customuser_id_permission_9632a709_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_customuser_id_permission_9632a709_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: projects_contenttype projects_contenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_contenttype
    ADD CONSTRAINT projects_contenttype_pkey PRIMARY KEY (id);


--
-- Name: projects_done projects_done_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_done
    ADD CONSTRAINT projects_done_pkey PRIMARY KEY (id);


--
-- Name: projects_format projects_format_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_format
    ADD CONSTRAINT projects_format_pkey PRIMARY KEY (id);


--
-- Name: projects_heading projects_heading_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_heading
    ADD CONSTRAINT projects_heading_pkey PRIMARY KEY (id);


--
-- Name: projects_postidea projects_postidea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_postidea
    ADD CONSTRAINT projects_postidea_pkey PRIMARY KEY (id);


--
-- Name: projects_project projects_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_pkey PRIMARY KEY (id);


--
-- Name: projects_socialnetwork projects_socialnetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_socialnetwork
    ADD CONSTRAINT projects_socialnetwork_pkey PRIMARY KEY (id);


--
-- Name: rubricator_rubricator rubricator_rubricator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rubricator_rubricator
    ADD CONSTRAINT rubricator_rubricator_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser_groups_customuser_id_bc55088e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_groups_customuser_id_bc55088e ON public.accounts_customuser_groups USING btree (customuser_id);


--
-- Name: accounts_customuser_groups_group_id_86ba5f9e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_groups_group_id_86ba5f9e ON public.accounts_customuser_groups USING btree (group_id);


--
-- Name: accounts_customuser_user_permissions_customuser_id_0deaefae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_user_permissions_customuser_id_0deaefae ON public.accounts_customuser_user_permissions USING btree (customuser_id);


--
-- Name: accounts_customuser_user_permissions_permission_id_aea3d0e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_user_permissions_permission_id_aea3d0e5 ON public.accounts_customuser_user_permissions USING btree (permission_id);


--
-- Name: accounts_customuser_username_722f3555_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_username_722f3555_like ON public.accounts_customuser USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: projects_postidea_author_id_728e45d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_postidea_author_id_728e45d9 ON public.projects_postidea USING btree (author_id);


--
-- Name: projects_postidea_content_type_id_ae6bd9b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_postidea_content_type_id_ae6bd9b4 ON public.projects_postidea USING btree (content_type_id);


--
-- Name: projects_postidea_format_id_c80f4f31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_postidea_format_id_c80f4f31 ON public.projects_postidea USING btree (format_id);


--
-- Name: projects_postidea_heading_id_c3ab35bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_postidea_heading_id_c3ab35bb ON public.projects_postidea USING btree (heading_id);


--
-- Name: projects_postidea_is_done_id_7bba1700; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_postidea_is_done_id_7bba1700 ON public.projects_postidea USING btree (is_done_id);


--
-- Name: projects_postidea_project_id_b6359e00; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_postidea_project_id_b6359e00 ON public.projects_postidea USING btree (project_id);


--
-- Name: projects_postidea_social_network_id_94db1227; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_postidea_social_network_id_94db1227 ON public.projects_postidea USING btree (social_network_id);


--
-- Name: projects_project_author_id_9499cc7e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_author_id_9499cc7e ON public.projects_project USING btree (author_id);


--
-- Name: rubricator_rubricator_author_id_9e1354a6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rubricator_rubricator_author_id_9e1354a6 ON public.rubricator_rubricator USING btree (author_id);


--
-- Name: rubricator_rubricator_content_type_id_c6a0e79e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rubricator_rubricator_content_type_id_c6a0e79e ON public.rubricator_rubricator USING btree (content_type_id);


--
-- Name: rubricator_rubricator_heading_id_25c6a83f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rubricator_rubricator_heading_id_25c6a83f ON public.rubricator_rubricator USING btree (heading_id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser__customuser_id_0deaefae_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__customuser_id_0deaefae_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser__customuser_id_bc55088e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser__customuser_id_bc55088e_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_user_permissions accounts_customuser__permission_id_aea3d0e5_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__permission_id_aea3d0e5_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_postidea projects_postidea_author_id_728e45d9_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_postidea
    ADD CONSTRAINT projects_postidea_author_id_728e45d9_fk_accounts_customuser_id FOREIGN KEY (author_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_postidea projects_postidea_content_type_id_ae6bd9b4_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_postidea
    ADD CONSTRAINT projects_postidea_content_type_id_ae6bd9b4_fk_projects_ FOREIGN KEY (content_type_id) REFERENCES public.projects_contenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_postidea projects_postidea_format_id_c80f4f31_fk_projects_format_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_postidea
    ADD CONSTRAINT projects_postidea_format_id_c80f4f31_fk_projects_format_id FOREIGN KEY (format_id) REFERENCES public.projects_format(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_postidea projects_postidea_heading_id_c3ab35bb_fk_projects_heading_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_postidea
    ADD CONSTRAINT projects_postidea_heading_id_c3ab35bb_fk_projects_heading_id FOREIGN KEY (heading_id) REFERENCES public.projects_heading(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_postidea projects_postidea_is_done_id_7bba1700_fk_projects_done_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_postidea
    ADD CONSTRAINT projects_postidea_is_done_id_7bba1700_fk_projects_done_id FOREIGN KEY (is_done_id) REFERENCES public.projects_done(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_postidea projects_postidea_project_id_b6359e00_fk_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_postidea
    ADD CONSTRAINT projects_postidea_project_id_b6359e00_fk_projects_project_id FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_postidea projects_postidea_social_network_id_94db1227_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_postidea
    ADD CONSTRAINT projects_postidea_social_network_id_94db1227_fk_projects_ FOREIGN KEY (social_network_id) REFERENCES public.projects_socialnetwork(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_author_id_9499cc7e_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_author_id_9499cc7e_fk_accounts_customuser_id FOREIGN KEY (author_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rubricator_rubricator rubricator_rubricato_author_id_9e1354a6_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rubricator_rubricator
    ADD CONSTRAINT rubricator_rubricato_author_id_9e1354a6_fk_accounts_ FOREIGN KEY (author_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rubricator_rubricator rubricator_rubricato_content_type_id_c6a0e79e_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rubricator_rubricator
    ADD CONSTRAINT rubricator_rubricato_content_type_id_c6a0e79e_fk_projects_ FOREIGN KEY (content_type_id) REFERENCES public.projects_contenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rubricator_rubricator rubricator_rubricato_heading_id_25c6a83f_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rubricator_rubricator
    ADD CONSTRAINT rubricator_rubricato_heading_id_25c6a83f_fk_projects_ FOREIGN KEY (heading_id) REFERENCES public.projects_heading(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--
