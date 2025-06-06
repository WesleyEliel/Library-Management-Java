PGDMP  	                    }            cedric-wesley "   14.15 (Ubuntu 14.15-1.pgdg22.04+1)     17.2 (Ubuntu 17.2-1.pgdg22.04+1)     7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            :           1262    203588    cedric-wesley    DATABASE     {   CREATE DATABASE "cedric-wesley" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'fr_FR.UTF-8';
    DROP DATABASE "cedric-wesley";
                     postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                     postgres    false            ;           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                        postgres    false    4            �            1259    203589    books    TABLE     o  CREATE TABLE public.books (
    id integer NOT NULL,
    genre character varying(255),
    is_available character varying(255),
    published_at date,
    title character varying(255),
    author_id integer NOT NULL,
    CONSTRAINT books_is_available_check CHECK (((is_available)::text = ANY ((ARRAY['OUI'::character varying, 'NON'::character varying])::text[])))
);
    DROP TABLE public.books;
       public         heap r       postgres    false    4            �            1259    203610 	   books_seq    SEQUENCE     s   CREATE SEQUENCE public.books_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.books_seq;
       public               postgres    false    4            �            1259    203597    loans    TABLE     U  CREATE TABLE public.loans (
    id integer NOT NULL,
    expected_return_date date,
    loan_date date,
    status character varying(255),
    related_book_id integer,
    related_user_id integer,
    CONSTRAINT loans_status_check CHECK (((status)::text = ANY ((ARRAY['EN_COURS'::character varying, 'FINI'::character varying])::text[])))
);
    DROP TABLE public.loans;
       public         heap r       postgres    false    4            �            1259    203611 	   loans_seq    SEQUENCE     s   CREATE SEQUENCE public.loans_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.loans_seq;
       public               postgres    false    4            �            1259    203603    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    full_name character varying(255),
    phone character varying(255)
);
    DROP TABLE public.users;
       public         heap r       postgres    false    4            �            1259    203612 	   users_seq    SEQUENCE     s   CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.users_seq;
       public               postgres    false    4            /          0    203589    books 
   TABLE DATA           X   COPY public.books (id, genre, is_available, published_at, title, author_id) FROM stdin;
    public               postgres    false    209   P       0          0    203597    loans 
   TABLE DATA           n   COPY public.loans (id, expected_return_date, loan_date, status, related_book_id, related_user_id) FROM stdin;
    public               postgres    false    210          1          0    203603    users 
   TABLE DATA           <   COPY public.users (id, email, full_name, phone) FROM stdin;
    public               postgres    false    211   f       <           0    0 	   books_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.books_seq', 151, true);
          public               postgres    false    212            =           0    0 	   loans_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.loans_seq', 151, true);
          public               postgres    false    213            >           0    0 	   users_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.users_seq', 101, true);
          public               postgres    false    214            �           2606    203596    books books_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public                 postgres    false    209            �           2606    203602    loans loans_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_pkey;
       public                 postgres    false    210            �           2606    203609    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    211            �           2606    203618 !   loans fkgggxqdy7qac4ebymdc094g7il    FK CONSTRAINT     �   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT fkgggxqdy7qac4ebymdc094g7il FOREIGN KEY (related_book_id) REFERENCES public.books(id);
 K   ALTER TABLE ONLY public.loans DROP CONSTRAINT fkgggxqdy7qac4ebymdc094g7il;
       public               postgres    false    209    210    3228            �           2606    203623 !   loans fkkr2cu2plf8e9m7pva0wh2hjkm    FK CONSTRAINT     �   ALTER TABLE ONLY public.loans
    ADD CONSTRAINT fkkr2cu2plf8e9m7pva0wh2hjkm FOREIGN KEY (related_user_id) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.loans DROP CONSTRAINT fkkr2cu2plf8e9m7pva0wh2hjkm;
       public               postgres    false    210    211    3232            �           2606    203613 !   books fkqb2rrlcshy07plus4qspykstw    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT fkqb2rrlcshy07plus4qspykstw FOREIGN KEY (author_id) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.books DROP CONSTRAINT fkqb2rrlcshy07plus4qspykstw;
       public               postgres    false    209    211    3232            /   �   x�m�A
�0���s #IjP��B�V���MhG	��dZ��9z1�+A�/��?����E�����H=�1���Oc�	WóN�#�?b��H����*�6zi�Tz��s���}��M�5�[����!�.@^��ۇI=�2���!��x�a�{���ǀ�X#NS!�[�Ab      0   K   x�3�4202�50�52�3M8�<�<99��
��p��FXTq �[ ������	V����� e      1   �   x�]�O�0����*v�ζ�V�PP�(��E׏l�\�$_�o�?x������x�u�SUny��6T9�ο��F�!;�?ek�f�%A(�0"�1CJ�j�*K�{=�\?���\��Q�9�q"0g�Ѳc:�h'L��ށ��B-ԭm0��Z����CO����n�\(����F�     