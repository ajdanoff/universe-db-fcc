--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) UNIQUE NOT NULL,
    abbr character varying(10) NOT NULL,
    contains_gal_center boolean DEFAULT false,
    contains_gal_anticenter boolean DEFAULT false,
    hemisphere character varying(10),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) UNIQUE NOT NULL,
    galaxy_type character varying(10) NOT NULL,
    galaxy_distance_mly numeric(4,1),
    galaxy_apparent_mag numeric(4,1),
    galaxy_distance_kly integer,
    galaxy_diameter_ly integer,
    galaxy_interstellar_matter text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) UNIQUE NOT NULL,
    planet_id integer NOT NULL,
    moon_mean_radius_km numeric(6,2),
    moon_orbital_radius_1000km numeric(6,2),
    moon_notes text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) UNIQUE NOT NULL,
    planet_type character varying(20) NOT NULL,
    star_id integer NOT NULL,
    planet_avg_dist_au numeric(4,2),
    planet_radius_er numeric(4,2),
    planet_orbital_period_years numeric(5,2),
    planet_has_moons boolean DEFAULT true
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) UNIQUE NOT NULL,
    spectral_type character varying(50) NOT NULL,
    star_distance_ly numeric(7,4),
    star_apparent_mag numeric(7,4),
    star_absolute_mag numeric(7,4),
    star_radius_mk numeric(7,4),
    star_temperature_k integer NOT NULL,
    star_age_my integer NOT NULL,
    galaxy_id integer NOT NULL,
    constellation_id integer DEFAULT 7 NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Canis Major', 'CMa', false, false, 'S', 1);
INSERT INTO public.constellation VALUES (2, 'Carina', 'Car', false, false, 'S', 1);
INSERT INTO public.constellation VALUES (3, 'Centaurus', 'Cen', false, false, 'S', 1);
INSERT INTO public.constellation VALUES (4, 'Herdsman', 'Boo', false, false, 'N', 1);
INSERT INTO public.constellation VALUES (5, 'Lyra', 'Lyr', false, false, 'N', 1);
INSERT INTO public.constellation VALUES (6, 'Orion', 'Ori', false, false, 'N/S', 1);
INSERT INTO public.constellation VALUES (7, 'No-Constellation', 'NoC', false, false, '-', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', NULL, NULL, 150, 120000, 'Composed of about 100–400 billion stars, plus gas and dust (interstellar medium) which makes up roughly 10-15% of the visible mass.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 'Sb', 2.5, 3.4, 152, 200000, 'The galaxy is rich in gas and dust.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum (M33)', 'Sc', 2.9, 5.7, 60, 61000, 'It has an abundance of interstellar matter, particularly in its spiral arms and H II regions, where young, hot stars are forming. The gas component, including neutral and molecular hydrogen, is substantial, aiding in a high star formation rate.');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'E/SO (pec)', 13.7, 6.8, 60, 100000, 'Features a distinct, broad, warped dusty disk that cuts across the center, containing dense gas, young blue stars, and active star formation regions.');
INSERT INTO public.galaxy VALUES (5, 'Bodes Galaxy (M81)', 'Sb', 12.0, 6.9, 90, 90000, 'M81 contains significant dust and gas, particularly within its spiral arms, which are sites of active star formation. It has been subject to gravitational interaction with neighboring galaxies (M82 and NGC 3077), resulting in tidal stripping of hydrogen gas.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud (LMC)', 'Irr', 0.2, 0.9, 14, 32200, 'Rich in gas and interstellar matter, with high rates of star formation.');
INSERT INTO public.galaxy VALUES (7, 'Small Magellnaic Cloud (SMC)', 'Irr', 0.2, 2.7, 7, 40, ' The SMC is extremely gas-rich (heavy in neutral hydrogen). It is connected to the Large Magellanic Cloud (LMC) by a bridge of gas known as the "Magellanic Bridge" and has a "wing" structure extending towards the LMC, which is evidence of ongoing tidal interaction.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.40, 384.40, 'Only natural satellite of Earth');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.2, 9.3, 'Closest moon to its planet, likely doomed');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, 23.4, 'Smaller and outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 6, 1821.6, 421.7, 'Most volcanically active body in solar system');
INSERT INTO public.moon VALUES (5, 'Europa', 6, 1560.8, 671.1, 'Icy crust with a potential liquid ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 2634.1, 1070.4, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 6, 2410.3, 1882.7, 'Heavily cratered, old surface');
INSERT INTO public.moon VALUES (8, 'Amalthea', 6, 83.5, 181.4, 'Inner, irregular red moon');
INSERT INTO public.moon VALUES (9, 'Titan', 7, 2574.7, 1221.8, 'Only moon with a dense, thick atmosphere');
INSERT INTO public.moon VALUES (10, 'Rhea', 7, 763.8, 527.1, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Enceladus', 7, 252.1, 238.0, 'Geysers erupt from its south pole');
INSERT INTO public.moon VALUES (12, 'Dione', 7,	561.4, 377.4, 'Icy moon with wispy terrain');
INSERT INTO public.moon VALUES (13, 'Tethys', 7, 531.1, 294.6, 'Home to a massive canyon system');
INSERT INTO public.moon VALUES (14, 'Mimas', 7,	198.2, 185.5, 'Features a giant crater, looks like Death Star');
INSERT INTO public.moon VALUES (15, 'Iapetus', 7, 734.3, 3561.0, 'Known for its two-toned coloring (bright/dark)');
INSERT INTO public.moon VALUES (16, 'Miranda', 8, 235.8, 129.4, 'Features highest cliffs in solar system');
INSERT INTO public.moon VALUES (17, 'Ariel', 8, 578.9, 190.9, 'Brightest surface of Uranus''s moons');
INSERT INTO public.moon VALUES (18, 'Titania', 8, 788.4, 436.3, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Oberon', 8, 761.4, 583.5, 'Outermost major moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Triton', 9, 1353.4, 354.8, 'Largest moon to orbit "backward" (retrograde)');




--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 1, 0.39, 0.38, 0.24, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 1, 0.72, 0.95, 0.62, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1, 1.00, 1.00, 1.00, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 1, 1.52, 0.53, 1.88, true);
INSERT INTO public.planet VALUES (5, 'Ceres', 'Dwarf Planet', 1, 2.77, 0.07, 4.60, false);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'Gas Giant', 1, 5.20, 11.20, 11.86, true);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Gas Giant', 1, 9.54, 9.45, 29.46, true);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice Giant', 1, 19.22, 4.00, 84.01, true);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Ice Giant', 1, 30.05, 3.88, 164.8, true);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Dwarf Planet', 1, 39.48, 0.18, 248.0, true);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf Planet', 1, 43.13, 0.12, 283.0, true);
INSERT INTO public.planet VALUES (12, 'Eris', 'Dwarf Planet', 1, 67.78, 0.18, 557.0, true);




--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 0.0000, -26.7400, 4.8300, 0.7000, 5772, 4600, 1, 7);
INSERT INTO public.star VALUES (2, 'Sirius A', 'A1V', 8.6000, -1.4400, 1.4500, 1.1900, 9940, 242, 1, 1);
INSERT INTO public.star VALUES (3, 'Canopus', 'A9II', 310.0000, -0.7400, -5.5300, 51.0000, 7400, 34, 1, 2);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus', 'G2V', 4.3000, -0.0100, 4.3400, 0.8500, 5800, 6000, 1, 3);
INSERT INTO public.star VALUES (5, 'Arcturus', 'K0III', 437.0000, -0.0500, -0.3100, 17.6000, 4286, 8000, 1, 4);
INSERT INTO public.star VALUES (6, 'Vega', 'A0V', 25.0000, 0.0300, 0.5800, 1.7000, 9602, 455, 1, 5);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 'M1-M2Ia-ab', 640.0000, 0.5000, -5.8500, 700.0000, 3700, 14, 1, 6);
INSERT INTO public.star VALUES (8, 'Proxima Cen', 'M5.5Ve', 4.2400, 11.0100, 15.4500, 0.1000, 3042, 4850, 1, 3);
INSERT INTO public.star VALUES (9, 'Sirius B', 'DA2 (White Dwarf)', 8.6000, 8.4400, 11.1800, 0.0060, 25000, 120, 1, 1);



--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

