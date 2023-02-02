--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    game_id integer NOT NULL,
    user_id integer,
    try integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_game_id_seq OWNED BY public.game.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: game game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game ALTER COLUMN game_id SET DEFAULT nextval('public.game_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (9, 17, 11);
INSERT INTO public.game VALUES (10, 17, 8);
INSERT INTO public.game VALUES (11, 17, 4);
INSERT INTO public.game VALUES (12, 18, 11);
INSERT INTO public.game VALUES (13, 19, 613);
INSERT INTO public.game VALUES (14, 19, 606);
INSERT INTO public.game VALUES (15, 20, 3);
INSERT INTO public.game VALUES (16, 20, 242);
INSERT INTO public.game VALUES (17, 19, 214);
INSERT INTO public.game VALUES (18, 19, 998);
INSERT INTO public.game VALUES (19, 19, 206);
INSERT INTO public.game VALUES (20, 21, 448);
INSERT INTO public.game VALUES (21, 21, 796);
INSERT INTO public.game VALUES (22, 22, 131);
INSERT INTO public.game VALUES (23, 22, 174);
INSERT INTO public.game VALUES (24, 21, 359);
INSERT INTO public.game VALUES (25, 21, 78);
INSERT INTO public.game VALUES (26, 21, 238);
INSERT INTO public.game VALUES (27, 23, 588);
INSERT INTO public.game VALUES (28, 23, 768);
INSERT INTO public.game VALUES (29, 24, 152);
INSERT INTO public.game VALUES (30, 24, 450);
INSERT INTO public.game VALUES (31, 23, 444);
INSERT INTO public.game VALUES (32, 23, 14);
INSERT INTO public.game VALUES (33, 23, 56);
INSERT INTO public.game VALUES (34, 25, 968);
INSERT INTO public.game VALUES (35, 25, 828);
INSERT INTO public.game VALUES (36, 26, 84);
INSERT INTO public.game VALUES (37, 26, 720);
INSERT INTO public.game VALUES (38, 25, 59);
INSERT INTO public.game VALUES (39, 25, 743);
INSERT INTO public.game VALUES (40, 25, 194);
INSERT INTO public.game VALUES (41, 27, 934);
INSERT INTO public.game VALUES (42, 27, 850);
INSERT INTO public.game VALUES (43, 28, 506);
INSERT INTO public.game VALUES (44, 28, 425);
INSERT INTO public.game VALUES (45, 27, 191);
INSERT INTO public.game VALUES (46, 27, 854);
INSERT INTO public.game VALUES (47, 27, 468);
INSERT INTO public.game VALUES (48, 18, 10);
INSERT INTO public.game VALUES (49, 18, 9);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (17, '123');
INSERT INTO public.users VALUES (18, '456');
INSERT INTO public.users VALUES (19, 'user_1675353632496');
INSERT INTO public.users VALUES (20, 'user_1675353632495');
INSERT INTO public.users VALUES (21, 'user_1675353734232');
INSERT INTO public.users VALUES (22, 'user_1675353734231');
INSERT INTO public.users VALUES (23, 'user_1675353828365');
INSERT INTO public.users VALUES (24, 'user_1675353828364');
INSERT INTO public.users VALUES (25, 'user_1675353883732');
INSERT INTO public.users VALUES (26, 'user_1675353883731');
INSERT INTO public.users VALUES (27, 'user_1675353950340');
INSERT INTO public.users VALUES (28, 'user_1675353950339');


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_game_id_seq', 49, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 28, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);


--
-- Name: users name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: game game_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

