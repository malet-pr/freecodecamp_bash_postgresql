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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type_id integer,
    age_billion_years numeric(5,2)
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(15) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    has_ring boolean,
    number_of_moons integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    temperature_in_k integer,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that includes the Solar System, with the name describing its appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 1, 13.61);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way, where the Solar System resides. It was originally named the Andromeda Nebula and is cataloged as Messier 31, M31, and NGC 224.', 1, 10.00);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'The Large Magellanic Cloud is a satellite galaxy of the Milky Way. At a distance of around 50 kiloparsecs the LMC is the second- or third-closest galaxy to the Milky Way, after the Sagittarius Dwarf Spheroidal and the possible dwarf irregular galaxy called the Canis Major Overdensity', 4, NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'The Small Magellanic Cloud, or Nubecula Minor, is a dwarf galaxy near the Milky Way. Classified as a dwarf irregular galaxy, the SMC has a D25 isophotal diameter of about 5.78 kiloparsecs (18,900 light-years), and contains several hundred million stars.', 4, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'The Triangulum Galaxy is a spiral galaxy 2.73 million light-years from Earth in the constellation Triangulum.The galaxy is the smallest spiral galaxy in the Local Group, and is believed to be a satellite of the Andromeda Galaxy or on its rebound into the latter.', 1, 10.00);
INSERT INTO public.galaxy VALUES (6, 'Abell 1835', 'Abell 1835 IR1916 was a candidate for being the most distant galaxy ever observed, although that claim has not been verified by additional observations. It was claimed to lie behind the galaxy cluster Abell 1835, in the Virgo constellation.', 5, 13.20);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'Defined by the presence of spiral arms. These galaxies resemble giant rotating pinwheels with a pancake-like disk of stars and a central bulge or tight concentration of stars.');
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', 'Elliptical galaxies have shapes that range from completely round to oval. They usually contain little gas and dust and show very little organization or structure.');
INSERT INTO public.galaxy_type VALUES (3, 'lenticular', 'They have the central bulge and disk common to spiral galaxies but no arms. But like ellipticals, lenticular galaxies have older stellar populations and little ongoing star formation.');
INSERT INTO public.galaxy_type VALUES (4, 'irregular', 'Irregular galaxies have unusual shapes, like toothpicks, rings, or even little groupings of stars. They range from dwarf irregular galaxies with 100 million times the Sun’s mass to large ones weighing 10 billion solar masses.');
INSERT INTO public.galaxy_type VALUES (5, 'Unknown', 'Very distant galaxy of unknown type');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is Earth`s only natural satellite. Its diameter is about one-quarter of Earth`s (comparable to the width of Australia),[17] making it the fifth largest satellite in the Solar System and the largest and most massive relative to its parent planet. It is larger than all known dwarf planets in the Solar System.[18] The Moon is a planetary-mass object with a differentiated rocky body, making it a satellite planet under the geophysical definitions of the term. It lacks any significant atmosphere, hydrosphere, or magnetic field. Its surface gravity is about one-sixth of Earths at 0.1654 g—Jupiter`s moon Io is the only satellite in the Solar System known to have a higher surface gravity and density.', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos looks about one-third as big as a full moon on Earth. It has an angular diameter of between 8 inch (rising) and 12 inch (overhead). Due to its close orbit, it would look smaller when the observer is further away from the Martian equator and is below the horizon and thus not visible from Mars`s polar ice caps.', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos looks more like a bright star or planet for an observer on Mars, only slightly bigger than Venus looks from Earth; it has an angular diameter of about 2 inch.', false, 4);
INSERT INTO public.moon VALUES (4, 'Metis', 'Metis, also known as Jupiter XVI, is the innermost known moon of Jupiter. It was discovered in 1979 in images taken by Voyager 1, and was named in 1983 after the first wife of Zeus, Metis. Additional observations made between early 1996 and September 2003 by the Galileo spacecraft allowed its surface to be imaged.', false, 5);
INSERT INTO public.moon VALUES (5, 'Adrastea', 'Adrastea, also known as Jupiter XV, is the second by distance, and the smallest of the four inner moons of Jupiter. It was discovered in photographs taken by Voyager 2 in 1979, making it the first natural satellite to be discovered from images taken by an interplanetary spacecraft, rather than through a telescope.[6] It was officially named after the mythological Adrasteia, foster mother of the Greek god Zeus—the equivalent of the Roman god Jupiter.', false, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'Amalthea has the third closest orbit around Jupiter among known moons and was the fifth moon of Jupiter to be discovered, so it is also known as Jupiter V. It is also the fifth largest moon of Jupiter, after the four Galilean Moons. Edward Emerson Barnard discovered the moon on 9 September 1892 and named it after Amalthea of Greek mythology.[10] It was the last natural satellite to be discovered by direct visual observation; all later moons were discovered by photographic or digital imaging.', false, 5);
INSERT INTO public.moon VALUES (7, 'Thebe', 'Thebe, also known as Jupiter XIV, is the fourth of its moons by distance from the planet. It was discovered by Stephen P. Synnott in images from the Voyager 1 space probe taken on March 5, 1979, while making its flyby of Jupiter.[7] In 1983, it was officially named after the mythological nymph Thebe.', false, 5);
INSERT INTO public.moon VALUES (8, 'Io', 'Io, or Jupiter I, is the innermost and third-largest of the four Galilean moons of the planet Jupiter. Slightly larger than Earth’s moon, Io is the fourth-largest moon in the Solar System, has the highest density of any moon, the strongest surface gravity of any moon, and the lowest amount of water (by atomic ratio) of any known astronomical object in the Solar System. It was discovered in 1610 by Galileo Galilei and was named after the mythological character Io, a priestess of Hera who became one of Zeus`s lovers.', true, 5);
INSERT INTO public.moon VALUES (9, 'Europa', 'Europa, or Jupiter II, is the smallest of the four Galilean moons orbiting Jupiter, and the sixth-closest to the planet of all the 95 known moons of Jupiter. It is also the sixth-largest moon in the Solar System. Europa was discovered independently by Simon Marius and Galileo Galilei and was named (by Marius) after Europa, the Phoenician mother of King Minos of Crete and lover of Zeus (the Greek equivalent of the Roman god Jupiter).', true, 5);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'Ganymede, or Jupiter III, is the largest and most massive natural satellite of Jupiter as well as in the Solar System, being a planetary-mass moon. It is the largest Solar System object without an atmosphere, despite being the only moon of the Solar System with a magnetic field. Like Titan, it is larger than the planet Mercury, but has somewhat less surface gravity than Mercury, Io or the Moon.', true, 5);
INSERT INTO public.moon VALUES (11, 'Callisto', 'Callisto, or Jupiter IV, is the second-largest moon of Jupiter, after Ganymede. In the Solar System it is the third-largest moon after Ganymede and Saturn`s largest moon Titan, and as large as the smallest planet Mercury, though only about a third as massive. Callisto is, with a diameter of 4821 km, roughly a third larger than the Moon and orbits Jupiter on average at a distance of 1883000 km, which is about six times further out than the Moon orbiting Earth. It is the outermost of the four large Galilean moons of Jupiter, which were discovered in 1610 with one of the first telescopes, being visible from Earth with common binoculars.', true, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 'Titan is the largest moon of Saturn, the second-largest in the Solar System and larger than any of the dwarf planets of the Solar System. It is the only moon known to have a dense atmosphere, and is the only known object in space other than Earth on which clear evidence of stable bodies of surface liquid has been found.', true, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System, with a surface area that is compareable to the area of Australia. It is the smallest body in the Solar System for which precise measurements have confirmed a shape consistent with hydrostatic equilibrium.[11] It was discovered in 1672 by Giovanni Domenico Cassini.', true, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Iapetus, with an estimated diameter of 1,469 km, it is the third-largest moon of Saturn and the eleventh-largest in the Solar System.[b] Named after the Titan Iapetus, the moon was discovered in 1671 by Giovanni Domenico Cassini.', false, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Miranda, also designated Uranus V, is the smallest and innermost of Uranus`s five round satellites. It was discovered by Gerard Kuiper on 16 February 1948 at McDonald Observatory in Texas, and named after Miranda from William Shakespeare`s play The Tempest. Like the other large moons of Uranus, Miranda orbits close to its planet`s equatorial plane. Because Uranus orbits the Sun on its side, Miranda`s orbit is perpendicular to the ecliptic and shares Uranus` extreme seasonal cycle.', true, 7);
INSERT INTO public.moon VALUES (16, 'Cordelia', 'Cordelia is the innermost known moon of Uranus. It was discovered from the images taken by Voyager 2 on January 20, 1986, and was given the temporary designation S/1986 U 7. It was not detected again until the Hubble Space Telescope observed it in 1997. Cordelia takes its name from the youngest daughter of Lear in William Shakespeare`s King Lear. It is also designated Uranus VI.', false, 7);
INSERT INTO public.moon VALUES (17, 'Ophelia', 'Ophelia is a moon of Uranus. It was discovered from the images taken by Voyager 2 on January 20, 1986, and was given the temporary designation S/1986 U 8. It was not seen until the Hubble Space Telescope recovered it in 2003. Ophelia was named after the daughter of Polonius, Ophelia, in William Shakespeare`s play Hamlet. It is also designated Uranus VII.', false, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Triton is the largest natural satellite of the planet Neptune, and was the first Neptunian moon to be discovered, on October 11, 1846, by English astronomer William Lassell. It is the only large moon in the Solar System with a retrograde orbit, an orbit in the direction opposite to its planet`s rotation. Because of its retrograde orbit and composition similar to Pluto, Triton is thought to have been a dwarf planet, captured from the Kuiper belt.', true, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 'Proteus, also known as Neptune VIII, is the second-largest Neptunian moon, and Neptune`s largest inner satellite. Discovered by Voyager 2 spacecraft in 1989, it is named after Proteus, the shape-changing sea god of Greek mythology. Proteus orbits Neptune in a nearly equatorial orbit at a distance of about 4.75 times the radius of Neptune`s equator.', false, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 'Nereid is the third-largest moon of Neptune. It has a prograde but very eccentric orbit and is believed to be a former regular satellite that was scattered to its current orbit through gravitational interactions during Triton`s capture. Water ice has been spectroscopically detected on its surface.', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Mercury (0.307–0.588 AU (45.9–88.0 million km; 28.5–54.7 million mi) from the Sun) is the closest planet to the Sun. The smallest planet in the Solar System (0.055 MEarth), Mercury has no natural satellites. The dominant geological features are impact craters or basins with ejecta blankets, the remains of early volcanic activity including magma flows, and lobed ridges or rupes that were probably produced by a period of contraction early its history.', false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus (0.718–0.728 AU (107.4–108.9 million km; 66.7–67.7 million mi) from the Sun) is close in size to Earth (0.815 MEarth) and, like Earth, has a thick silicate mantle around an iron core, a substantial atmosphere, and evidence of internal geological activity. It is much drier than Earth, and its atmosphere is ninety times as dense. Venus has no natural satellites. It is the hottest planet, with surface temperatures over 400 °C (752 °F), mainly due to the amount of greenhouse gases in the atmosphere.', false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Earth (0.983–1.017 AU (147.1–152.1 million km; 91.4–94.5 million mi) from the Sun) is the largest and densest of the inner planets, the only one known to have current geological activity, and the only place in the universe where life is known to exist. Its liquid hydrosphere is unique among the terrestrial planets, and it is the only planet where plate tectonics has been observed. Its atmosphere is radically different from those of the other planets, having been altered by the presence of life to contain 21% free oxygen', false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars (1.382–1.666 AU (206.7–249.2 million km; 128.5–154.9 million mi) from the Sun) is smaller than Earth and Venus (0.107 MEarth). It has an atmosphere of mostly carbon dioxide with a surface pressure of 6.1 millibars (0.088 psi; 0.18 inHg); roughly 0.6% of that of Earth but sufficient to support weather phenomena. Its surface, peppered with volcanoes, such as Olympus Mons, and rift valleys, such as Valles Marineris, shows geological activity that may have persisted until as recently as 2 million years ago.[106] Its red color comes from iron oxide (rust) in its soil.', false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupyter', 'Jupiter (4.951–5.457 AU (740.7–816.4 million km; 460.2–507.3 million mi) from the Sun), at 318 MEarth, is 2.5 times the mass of all the other planets put together. It is composed largely of hydrogen and helium. Its strong internal heat creates semi-permanent features in its atmosphere, such as cloud bands and the Great Red Spot. The planet possesses a 4.2–14 Gauss strength magnetosphere that spans 22–29 million km, making it, in certain respects, the largest object in the Solar System.', true, 92, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn (9.075–10.07 AU (1.3576–1.5065 billion km; 843.6–936.1 million mi) from the Sun), distinguished by its extensive ring system, has several similarities to Jupiter, such as its atmospheric composition and magnetosphere. Although Saturn has 60% of Jupiter`s volume, it is less than a third as massive, at 95 MEarth. Saturn is the only planet of the Solar System that is less dense than water. The rings of Saturn are made up of small ice and rock particles.', true, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus (18.27–20.06 AU (2.733–3.001 billion km; 1.698–1.865 billion mi) from the Sun), at 14 MEarth, has the lowest mass of the outer planets. Uniquely among the planets, it orbits the Sun on its side; its axial tilt is over ninety degrees to the ecliptic. This gives the planet extreme seasonal variation as each pole points toward and then away from the Sun.[137] It has a much colder core than the other giant planets and radiates very little heat into space.[138] As a consequence, it has the coldest planetary atmosphere in the Solar System.', true, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune (29.89–30.47 AU (4.471–4.558 billion km; 2.778–2.832 billion mi) from the Sun), though slightly smaller than Uranus, is more massive (17 MEarth) and hence more dense. It radiates more internal heat than Uranus, but not as much as Jupiter or Saturn.[142] Neptune has 14 known satellites. The largest, Triton, is geologically active, with geysers of liquid nitrogen.', true, 14, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Proxima Centauri b is a terrestrial planet discovered in 2016 by astronomers at the European Southern Observatory (ESO). It has an estimated minimum mass of 1.17 MEarth and orbits approximately 0.049 AU from Proxima Centauri, placing it in the habitable zone', NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 'Proxima Centauri c is a planet that was formally published in 2020 and could be a super-Earth or mini-Neptune. It has a mass of roughly 7 MEarth and orbits about 1.49 AU from Proxima Centauri with a period of 1,928 days. In June 2020, a possible direct imaging detection of the planet hinted at the potential presence of a large ring system. However, a 2022 study disputed the existence of this planet.', true, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-223 b', 'Kepler-223 b has been discovered by the Kepler spacecraft and was originally classified as a planet candidate. A new statistical analysis led by a team at NASA Ames Research Center has validated the planet with more than 99 percent confidence. Although many parameters of Kepler-223 d are still unknown, the object is highly unlikely to be a false positive.', NULL, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Kepler-223 c', 'Kepler-223 c has been discovered by the Kepler spacecraft and was originally classified as a planet candidate. A new statistical analysis led by a team at NASA Ames Research Center has validated the planet with more than 99 percent confidence. Although many parameters of Kepler-223 d are still unknown, the object is highly unlikely to be a false positive.', NULL, NULL, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core. The Sun radiates this energy mainly as light, ultraviolet, and infrared radiation, and is the most important source of energy for life on Earth.', 5772, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Proxima Centauri is a small, low-mass star located 4.2465 light-years away from the Sun in the southern constellation of Centaurus. Its Latin name means the "nearest [star] of Centaurus".', 3042, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Sirius is the brightest star in the night sky. Its name is derived from the Greek word Σείριος, or Seirios, meaning lit. "glowing" or "scorching".', 9940, 1);
INSERT INTO public.star VALUES (4, 'Procyon', 'Procyon is the brightest star in the constellation of Canis Minor and usually the eighth-brightest star in the night sky, with an apparent visual magnitude of 0.34.', 6530, 1);
INSERT INTO public.star VALUES (5, 'Tau Ceti', 'Tau Ceti is a single star in the constellation Cetus that is spectrally similar to the Sun, although it has only about 78% of its mass. At a distance of just under 12 light-years from the Solar System, it is a relatively nearby star and the closest solitary G-class star. The star appears stable, with little stellar variation, and is metal-deficient relative to the Sun.', 5344, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Betelgeuse is a red supergiant star of spectral type M1-2 and one of the largest visible to the naked eye. It is usually the tenth-brightest star in the night sky and, after Rigel, the second-brightest in the constellation of Orion. It is a distinctly reddish, semiregular variable star whose apparent magnitude, varying between +0.0 and +1.6, has the widest range displayed by any first-magnitude star.', 3000, 1);
INSERT INTO public.star VALUES (7, 'Kepler 223', 'Kepler-223 is a G5V star with an extrasolar planetary system discovered by the Kepler mission. Studies indicate that the Kepler-223 star system consists of 4 planets orbiting the star.', 5599, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key1 UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

