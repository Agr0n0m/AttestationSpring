--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-10-18 16:14:27

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
-- TOC entry 215 (class 1259 OID 24588)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24587)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 217 (class 1259 OID 24595)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24594)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 223 (class 1259 OID 24633)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24632)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 219 (class 1259 OID 24602)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24601)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 218
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 221 (class 1259 OID 24611)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24640)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24639)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 220 (class 1259 OID 24610)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3198 (class 2604 OID 24591)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 24598)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 24636)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 24605)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 24614)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 24643)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 24588)
-- Dependencies: 215
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Одежда');
INSERT INTO public.category (id, name) VALUES (2, 'Мебель');
INSERT INTO public.category (id, name) VALUES (3, 'Бытовая техника');


--
-- TOC entry 3370 (class 0 OID 24595)
-- Dependencies: 217
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (6, 'c1ecb109-f51e-467f-a1ca-e0a9917ebb1f.1.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '7ebe4c62-83ef-4695-ac13-423e845e78f2.2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '42195f76-ebab-4b52-8c66-7446771d2fb3.3.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '9a6ecd8e-fa1f-4c27-9ce4-863562c02884.4.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, '06152262-b2ec-4a87-81b5-580496c2329c.5.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '221fe8c5-5f67-430d-ba7b-73490e63ce15.1.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '99734928-1ea5-4926-a6d3-f3185cc03730.2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, 'f2dfc6d8-2ccc-4f71-ba83-012516644242.3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, 'de4c68ea-3378-4b35-8954-a8b5c0509eac.4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, 'fadd1a5c-1e0c-4164-91aa-cb25093ba555.5.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '91b4d2f2-21c7-4117-8ff3-b4245ed3be1f.1.jpeg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, '56f40390-448d-4d49-a382-970e67c22453.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, 'd473340e-0680-4bca-bfab-7d3b4ca290eb.3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, '5cbdf66d-84a1-4f06-af16-7b9fdc9ddfc1.4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, 'a733afae-426e-411b-a6bb-2f195e5f317b.5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '76260de0-9907-4d6a-a3e4-009bce9456fd.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'a11ce825-3e50-4731-aade-d3f208ccde9b.2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '5f3cd440-fa5d-48da-9bd6-9a49eebdfd6e.3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, 'eff85ce2-6542-49b8-9c71-43cc8283ac3e.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, 'ea386745-1075-4d99-a7fc-9d30110edd14.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, 'e5892f48-6338-4582-8913-9c48b8d3bd63.1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '99fc7a7b-7e32-45fa-b160-8698ac939f4d.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, 'd4a30137-92e3-43df-a68b-6264f15b6176.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, 'b47b5c34-6db2-4173-ad9d-55588ca3077d.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '19586101-6450-4547-af96-1e4f017741da.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, 'cab1e925-affb-4286-8477-7b75fbaf7f16.1 (1).jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, '6369d583-6dff-4272-bdbb-f9985ea0dcae.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '3c8b9fb6-ab13-4f6c-9a05-28b014d14dc9.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'c873595a-fdae-40e1-a6a9-32fc1327fbc3.4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, 'e08b7df9-8038-4430-b344-777a55504713.5.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '94e501f9-52e3-49cf-976a-890a8975d7ab.1 .jpeg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, 'c91a4501-03b5-4d96-98d9-52f10ecb6ac5.2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '60ab7910-130c-48d4-8a69-ea22efea26bc.3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, '87484722-4ac5-400d-9eb2-83aaf9679059.4.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, 'f7557be0-ba62-4e80-8fa9-0d2c218b846b.5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, 'cd23ee33-c026-4c4d-9384-5643417fc2f1.1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '564281f8-0250-4ea8-af50-cd2fa18fe5f3.2.jpeg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, '3791288e-3189-470b-8c74-1616fe177f19.3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '12346005-7d8a-41bd-8838-39539d9fe780.4.jpeg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '1af53087-7a5b-46ec-b072-1c092eb24758.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, 'e3adbf62-c17e-4a25-8e5b-4a271e1550fb.1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, '7002f080-7d01-4a22-b315-28e855297f94.2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '0315f629-df55-41da-a37d-7aaf28edb63e.3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, '37f3b972-8eda-4605-8487-55e2e99abb66.4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, '0214dc29-ec52-41a7-b572-3ffa82bddf78.5.jpg', 10);


--
-- TOC entry 3376 (class 0 OID 24633)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2023-10-17 17:28:55.387097', '59d432be-b081-4cfe-bbc8-f783c9f68f1b', 1450, 1, 2, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2023-10-17 17:28:55.438458', '59d432be-b081-4cfe-bbc8-f783c9f68f1b', 338, 1, 2, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2023-10-17 17:28:55.446458', '59d432be-b081-4cfe-bbc8-f783c9f68f1b', 11249, 1, 2, 7);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-06-12 10:58:30.840682', '4ca8f459-94a1-4016-a5e4-420a1eb884eb', 3960, 1, 2, 2);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2023-10-17 22:16:22.27838', '9129bfe5-00b5-4f89-a7e9-d0bb8239ce93', 338, 1, 2, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (7, 1, '2023-10-17 22:16:22.293379', '9129bfe5-00b5-4f89-a7e9-d0bb8239ce93', 11249, 1, 2, 7);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2023-06-12 10:58:30.773671', '4ca8f459-94a1-4016-a5e4-420a1eb884eb', 3000, 2, 2, 4);


--
-- TOC entry 3372 (class 0 OID 24602)
-- Dependencies: 219
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$H1T1JuvpORUQeYTSVmqgLOe//3qt/t61LfZDj1iktX2u7q9BlQHie', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$KW68/XT.UrmW/FxR4K.rYeeqxf70HzIVLtwB7wcOdZRWIwrpJrOmC', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'user2', '$2a$10$TGFIoVYPryLITx9Z1ZeAMelgvl0OOrG0bZyuf.kihrJ5hP2BN9Qsu', 'ROLE_USER');


--
-- TOC entry 3374 (class 0 OID 24611)
-- Dependencies: 221
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, '2023-05-29 10:57:21.431186', 'Джинсы молодежные на лето и осень - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега. Разнообразие моделей джинсовых брюк широкое: трубы, бананы, бойфренды, джоггеры, slim, бриджи, мотоджинсы. Особой популярностью пользуются прямые и зауженные к низу классические джинсы со средней и высокой посадкой. В коллекции бренда EREMES представлены синие голубые джинсы для мужчин высокого роста ( до 190 см), отлично сочетаются с рубашкой, толстовкой, худи, пиджаком и водолазкой. Модель штанов классического прямого кроя, застежка молния и шарнирная пуговица, накладные карманы сзади, штаны не зауженные, без флиса. Идеальная посадка обеспечена за счет точных лекал с фабрик Турции. Штаны подойдут обладателям больших размеров и высоким мальчикам подросткам. В них удобно водить автомобиль и мотоцикл. Мужские брюки комфортно носить в летний период. Подарок любимому другу папе. Турецкие джинсы мужские прямые широкие штаны классика брюки для невысоких мужская одежда для мальчиков рваные американки брюки с карманами без утепления скинни осень зима casual слоучи момы из плотного денима skinny с потертостями спортивки оверсайз стрейч светлые узкие молодежные слим большие зимние потертые по бокам больших размеров летние брюки', 1450, 'EREMES', 'Eremes Джинсы мужские прямые классические', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, '2023-05-29 10:59:08.960411', 'Футболка мужская хлопок спортивная однотонная базовая модная свободная пляжная с коротким рукавом. Стильная хлопковая футболка классического кроя - это вещь унисекс, которая подойдет и мужчинам, и женщинам. СОСТАВ: ХЛОПОК 100% ПЛОТНОСТЬ 180 гр/мк в. Молодежная женская и мужская футболка выполнена из плотной хлопковой ткани и имеет круглый вырез горловины. Удлиненная футболка подходит для отдыха, туризма и занятий спортом: фитнеса, йоги, бега и тренировок в зале. В ней можно отправиться на прогулку в город. Базовая футболка вписывается в школьную форму и офисный стиль. Ее можно носить дома или надеть в школу и на работу в офис под пиджак. Трикотажная футболка оптимальна для носки летом. Она является базовой вещью и будет прекрасно сочетаться со всеми вещами в вашем гардеробе, в том числе в стиле оверсайз. Красивая футболка подойдет парням и девушкам любого роста - высоким и невысоким. Ее могут носить взрослые и подростки. В ассортименте большой выбор ярких цветов. Вы можете подарить ее на день рождения любимому мужу, маме, брату или папе. У нас есть акции и распродажи, вы можете купить наши товары в подарок со скидкой!', 338, 'UZcotton', 'UZcotton Футболка мужская хлопок спортивная однотонная базовая', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (3, '2023-05-29 10:54:52.007006', 'Размеры (ШхГхВ): 60х25,6х75 смНаша обувница Джулия станет прекрасным решением для удобного хранения обуви в прихожей, создав комфорт и чистоту в Вашем доме. Основное преимущество данной модели - её компактные размеры, позволяющие сэкономить несколько квадратных метров пола прихожей даже небольшой квартиры, обувная полка подойдет для хранения мужской, женской и детской обуви. Благодаря классическому дизайну, универсальности и актуальным цветовым решениям этажерка для обуви отлично дополнит Ваш комплект мебели любого стиля. Обувница в прихожую или как ее еще называют, галошница оснащена изолированной полочкой под аксессуары, которая станет незаменимой для домашних мелочей, ключей, перчаток, шапок, шарфов или предметов по уходу за обувью. В закрытом состоянии используйте её, чтобы поставить сумочку или пакет, положить зонт. Обувница белая, как и другие цвета имеет три наклонные полки для обуви в прихожую общей вместимостью до 9 пар обуви. Обувница для обуви сделана из сертифицированных и высококачественных ЛДСП, поэтому она прослужит Вам не один год. Собрать полки для обуви легко в домашних условиях. К набору прилагается подробная инструкция по сборке. Габаритные размеры обувницы (ШхВхГ) 60х25,6х75 см. Так же предлагаем другие наши товары бренда Стендмебель: Вешалка Глория артикул 73452816, Обувница Дина артикул 73474145, Вешалка Грация-2 артикул 112396129.', 2521, 'Стендмебель - фабрика мебели', 'Стендмебель Обувница Джулия СТМ, тумба для обуви', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, '2023-05-29 11:00:49.05751', 'Мужская футбольная куртка для тренировок в прохладную погоду. Утепленная модель дополнена стегаными вставками на подкладке и рукавах. Застежка на молнию и глубокий прилегающий капюшон. Современный приталенный крой.', 11249, 'ВАЙЛДБЕРРИЗ', 'adidas Куртка', 'Коледино', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, '2023-05-29 11:02:36.36', '**5 в 1: Планетарный миксер с 3-мя насадками, Блендер, Мясорубка. Технология SmartMIX - прибор автоматически подбирает оптимальную мощность работы для каждого вида и количества ингредиентов. Технология PROtect+ защита двигателя от перегрева.** Надёжная конструкция со стальными шестернями. Планетарное вращение насадок. Чаша из нержавеющей стали. Объем чаши 5 л. 6 скоростных режимов. Плавная регулировка скорости. Импульсивный режим. Венчик для взбивания. Насадка для смешивания. Крюк для замешивания теста. Крышка чаши для добавления ингредиентов. Мясорубка: 2 диска из нержавеющей стали (5 и 7 мм). Кувшин блендера из высокопрочного стекла объемом 1,5 л.Низкий уровень шума. Система безопасного включения. Защита двигателя от перегрева. Отсек для намотки сетевого шнура. Прорезиненные ножки. Мощность: 1100 Вт.', 10999, 'ВАЙЛДБЕРРИЗ', 'Polaris Планетарный миксер / Кухонная машина PKM 1104, (POLARIS)', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, '2023-05-29 11:06:21.984352', 'Беспроводной ручной портативный пылесос отлично подойдет для уборки различных помещений. В комплекте присутствуют фильтр, вертикальный стакан или контейнер для воды, есть насадки, но набор идет без мешка. Присутствует 3 бака для воды. В одном вода очищается, в другом - хранится в чистом виде, а в третий - поступает грязная. Также есть функция самоочистки пылесоса. И сухая, и влажная уборка с ним станут намного проще и быстрее. Щетка имеет мощный аккумулятор и работает на батарейка. Компактный мобильный пылесос может использоваться как швабра. Моющий прибор хорошо подойдет для уборки шерсти с дивана, чистки ковров, для пыли и грязи, или просто для мытья полов. Мобильный аккумуляторный пылесос очень хороший помощник для дома.', 17995, 'Официальный магазин Polaris', 'Redkey Вертикальный пылесос , моющий пылесос', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (10, '2023-05-29 11:07:45.556', 'Новая стиральная машина ATLANT серии INTENSE EXPERT имеет уникальный дизайн, который прекрасно дополнит любой интерьер своим внешним видом. С помощью новых сенсорных технологий достаточно легкого касания для выбора функций и программ. Светодиодные индикаторы и сегментный дисплей машины размещены на панели управления под небольшим углом, что облегчает визуальное восприятие отображаемой информации о работе машины. Благодаря интеллектуальным программам она не только интуитивно понятна в управлении, но и обеспечивает превосходные результаты стирки при низком потреблении воды и электроэнергии. Кроме того, действует увеличенная гарантия 5 лет на двигатель.', 33615, 'ВАЙЛДБЕРРИЗ', 'ATLANT Стиральная машина CMA-80 C 1214-01', 'Коледино', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (2, '2023-05-29 10:50:20.018', 'Размеры (ШхГхВ): 75,2х43х75 см. Комод неотъемлемая часть мебели квартиры или дома. Комод деревянный Ксения станет надежным помощником в хранении вещей. Комод для хранения представлен в нескольких цветах: белый, крафт белый, серый, дуб сонома и бук, что позволит вписать в интерьер комнаты и сочетать с другой мебелью в доме. Комод для вещей идет в двух вариантах: с ручками и без них. Во втором варианте в комоде убраны ручки и удлинен фасад, за который и происходит открывание. Универсальность тумбы позволяет использовать ее, как детскую мебель в комнате вашего ребенка, в четырех больших ящиках поместятся игрушки и вещи. Поставьте его вместе с письменным столом Альянс арт. 100243145 в детской и он станет помощником в хранении учебников, тетрадей и канцелярии. В спальне он выступит как тумба для ТВ. А поставив в прихожей, комод Ксения будет сочетаться с обувницей Грация арт. 114272890 и настенной вешалкой Глория арт. 73452816. Мебельная фабрика «Стендмебель» использует только высококачественные материалы и фурнитуру, мы заботимся о наших покупателях и хотим, чтобы наша мебель прослужила Вам как можно дольше. Мы делаем все возможное, чтобы наша продукция доезжала даже в самые дальние уголки нашей страны целой и радовало Вас, для этого мы упаковываем нашу продукцию в картон, а по периметру укрепляем упаковку пенопластом. Для сборки Вам понадобится отвертка или шуроповерт, ключ шестигранник идет в комплекте. Гарантия: 12 месяцев', 3961, 'Стендмебель - фабрика мебели', 'Стендмебель Комод с ящиками Ксения СТМ для вещей', 'Коледино', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (4, '2023-05-29 10:55:10.852499', 'Размеры (ШхГхВ): 100х38,6х74,6 см Компьютерный стол Софи привлекает своей функциональностью, строгим дизайном и высоким уровнем прочности. Наш стол выполнен в трех цветах поэтому для него найдется место в любой комнате Вашего дома. Может использоваться как детский, компьютерный столик для учебы и отдыха или в кабинет и использовать его как рабочий стол. Вы можете расставить на него косметику и использовать как туалетный столик в спальню. В открытые полочки можно положить не только любимые книги и игрушки, но и различную мелочь для дома. Так же стол отлично впишется в любой офис и станет удобным рабочим местом для сотрудника. Модели обладают стандартной высотой, которая обеспечит вам и вашему ребенку комфортную посадку. Для стола используются сертифицированные, высококачественные ЛДСП, поэтому наша мебель прослужит вам не один год. К набору прилагается подробная инструкция по сборке.', 3001, 'Стендмебель - фабрика мебели', 'Стендмебель Стол письменный Софи СТМ, компьютерный', 'Коледино', 2);


--
-- TOC entry 3378 (class 0 OID 24640)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 65, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 7, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 218
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 3, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 12, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 15, true);


--
-- TOC entry 3206 (class 2606 OID 24593)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 24600)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 24638)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 24609)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 24645)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 24619)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 24621)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3221 (class 2606 OID 24646)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3220 (class 2606 OID 24627)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3222 (class 2606 OID 24651)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3219 (class 2606 OID 24622)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3223 (class 2606 OID 24661)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3224 (class 2606 OID 24656)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-10-18 16:14:27

--
-- PostgreSQL database dump complete
--

