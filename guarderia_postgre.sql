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
-- Name: cuota_mensual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuota_mensual (
    id_mensualidad character varying(20) NOT NULL,
    valor_mensualidad double precision NOT NULL,
    costo_comida double precision,
    pagador_id character varying(15) NOT NULL,
    "ni¤o_id" integer NOT NULL
);


ALTER TABLE public.cuota_mensual OWNER TO postgres;

--
-- Name: ingrediente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingrediente (
    nombre character varying(50) NOT NULL,
    fecha_caducidad date,
    "ni¤o_id" integer NOT NULL,
    plato_id character varying(50) NOT NULL
);


ALTER TABLE public.ingrediente OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: ni¤o; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ni¤o" (
    id_matricula integer NOT NULL,
    fecha_ingreso date,
    comidas_realizadas integer,
    fecha_nacimiento date NOT NULL,
    fecha_baja date,
    persona_id character varying(15) NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public."ni¤o" OWNER TO postgres;

--
-- Name: pagador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagador (
    dni character varying(15) NOT NULL,
    numero_cuenta character varying(20) NOT NULL
);


ALTER TABLE public.pagador OWNER TO postgres;

--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    dni character varying(15) NOT NULL,
    nombre character varying(50) NOT NULL,
    direccion text,
    telefono character varying(10),
    parentezco character varying(50) NOT NULL
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- Name: plato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plato (
    nombre character varying(50) NOT NULL,
    cantidad double precision NOT NULL,
    descripcion text,
    menu_id integer NOT NULL
);


ALTER TABLE public.plato OWNER TO postgres;

--
-- Data for Name: cuota_mensual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuota_mensual (id_mensualidad, valor_mensualidad, costo_comida, pagador_id, "ni¤o_id") FROM stdin;
\.


--
-- Data for Name: ingrediente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingrediente (nombre, fecha_caducidad, "ni¤o_id", plato_id) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu) FROM stdin;
\.


--
-- Data for Name: ni¤o; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ni¤o" (id_matricula, fecha_ingreso, comidas_realizadas, fecha_nacimiento, fecha_baja, persona_id, menu_id) FROM stdin;
\.


--
-- Data for Name: pagador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagador (dni, numero_cuenta) FROM stdin;
\.


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (dni, nombre, direccion, telefono, parentezco) FROM stdin;
\.


--
-- Data for Name: plato; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plato (nombre, cantidad, descripcion, menu_id) FROM stdin;
\.


--
-- Name: cuota_mensual cuota_mensual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuota_mensual
    ADD CONSTRAINT cuota_mensual_pkey PRIMARY KEY (id_mensualidad);


--
-- Name: ingrediente ingrediente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT ingrediente_pkey PRIMARY KEY (nombre);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- Name: ni¤o ni¤o_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ni¤o"
    ADD CONSTRAINT "ni¤o_pkey" PRIMARY KEY (id_matricula);


--
-- Name: pagador pagador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagador
    ADD CONSTRAINT pagador_pkey PRIMARY KEY (dni);


--
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (dni);


--
-- Name: plato plato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plato
    ADD CONSTRAINT plato_pkey PRIMARY KEY (nombre);


--
-- Name: idx_cuota_ni¤o; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_cuota_ni¤o" ON public.cuota_mensual USING btree ("ni¤o_id");


--
-- Name: idx_cuota_pagador; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cuota_pagador ON public.cuota_mensual USING btree (pagador_id);


--
-- Name: idx_ingrediente_ni¤o; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_ingrediente_ni¤o" ON public.ingrediente USING btree ("ni¤o_id");


--
-- Name: idx_ingrediente_plato; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ingrediente_plato ON public.ingrediente USING btree (plato_id);


--
-- Name: idx_ni¤o_menu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_ni¤o_menu" ON public."ni¤o" USING btree (menu_id);


--
-- Name: idx_ni¤o_persona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_ni¤o_persona" ON public."ni¤o" USING btree (persona_id);


--
-- Name: idx_pagador_persona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pagador_persona ON public.pagador USING btree (dni);


--
-- Name: idx_plato_menu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_plato_menu ON public.plato USING btree (menu_id);


--
-- Name: cuota_mensual fk_cuota_ni¤o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuota_mensual
    ADD CONSTRAINT "fk_cuota_ni¤o" FOREIGN KEY ("ni¤o_id") REFERENCES public."ni¤o"(id_matricula);


--
-- Name: cuota_mensual fk_cuota_pagador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuota_mensual
    ADD CONSTRAINT fk_cuota_pagador FOREIGN KEY (pagador_id) REFERENCES public.pagador(dni);


--
-- Name: ingrediente fk_ingrediente_ni¤o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT "fk_ingrediente_ni¤o" FOREIGN KEY ("ni¤o_id") REFERENCES public."ni¤o"(id_matricula);


--
-- Name: ingrediente fk_ingrediente_plato; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT fk_ingrediente_plato FOREIGN KEY (plato_id) REFERENCES public.plato(nombre);


--
-- Name: ni¤o fk_ni¤o_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ni¤o"
    ADD CONSTRAINT "fk_ni¤o_menu" FOREIGN KEY (menu_id) REFERENCES public.menu(id_menu);


--
-- Name: ni¤o fk_ni¤o_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ni¤o"
    ADD CONSTRAINT "fk_ni¤o_persona" FOREIGN KEY (persona_id) REFERENCES public.persona(dni);


--
-- Name: pagador fk_pagador_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagador
    ADD CONSTRAINT fk_pagador_persona FOREIGN KEY (dni) REFERENCES public.persona(dni);


--
-- Name: plato fk_plato_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plato
    ADD CONSTRAINT fk_plato_menu FOREIGN KEY (menu_id) REFERENCES public.menu(id_menu);


--
-- PostgreSQL database dump complete
--

