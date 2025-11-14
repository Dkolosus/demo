--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.15

-- Started on 2025-01-19 19:44:59 UTC

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
-- TOC entry 378 (class 1259 OID 18109)
-- Name: ansible_roles; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.ansible_roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ansible_roles OWNER TO foreman;

--
-- TOC entry 377 (class 1259 OID 18108)
-- Name: ansible_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.ansible_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ansible_roles_id_seq OWNER TO foreman;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 377
-- Name: ansible_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.ansible_roles_id_seq OWNED BY public.ansible_roles.id;


--
-- TOC entry 210 (class 1259 OID 16393)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO foreman;

--
-- TOC entry 220 (class 1259 OID 16451)
-- Name: architectures; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.architectures (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.architectures OWNER TO foreman;

--
-- TOC entry 219 (class 1259 OID 16450)
-- Name: architectures_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.architectures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.architectures_id_seq OWNER TO foreman;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 219
-- Name: architectures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.architectures_id_seq OWNED BY public.architectures.id;


--
-- TOC entry 221 (class 1259 OID 16458)
-- Name: architectures_operatingsystems; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.architectures_operatingsystems (
    architecture_id integer NOT NULL,
    operatingsystem_id integer NOT NULL
);


ALTER TABLE public.architectures_operatingsystems OWNER TO foreman;

--
-- TOC entry 218 (class 1259 OID 16437)
-- Name: audits; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.audits (
    id integer NOT NULL,
    auditable_id integer,
    auditable_type character varying(255),
    user_id integer,
    user_type character varying(255),
    username character varying(255),
    action character varying(255),
    audited_changes text,
    version integer DEFAULT 0,
    comment character varying(255),
    associated_id integer,
    associated_type character varying(255),
    request_uuid character varying(255),
    created_at timestamp without time zone,
    remote_address character varying(255),
    auditable_name text,
    associated_name character varying(255)
);


ALTER TABLE public.audits OWNER TO foreman;

--
-- TOC entry 217 (class 1259 OID 16436)
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.audits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audits_id_seq OWNER TO foreman;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 217
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- TOC entry 246 (class 1259 OID 16576)
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.auth_sources (
    id integer NOT NULL,
    type character varying(255) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    host character varying(255),
    port integer,
    account character varying(255),
    account_password character varying(255),
    base_dn character varying(255),
    attr_login character varying(255),
    attr_firstname character varying(255),
    attr_lastname character varying(255),
    attr_mail character varying(255),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ldap_filter text,
    attr_photo character varying(255),
    server_type character varying(255) DEFAULT 'posix'::character varying,
    groups_base character varying(255),
    usergroup_sync boolean DEFAULT true NOT NULL,
    use_netgroups boolean DEFAULT false
);


ALTER TABLE public.auth_sources OWNER TO foreman;

--
-- TOC entry 245 (class 1259 OID 16575)
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.auth_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_id_seq OWNER TO foreman;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 245
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.auth_sources_id_seq OWNED BY public.auth_sources.id;


--
-- TOC entry 288 (class 1259 OID 16827)
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.bookmarks (
    id integer NOT NULL,
    name character varying(255),
    query text,
    controller character varying(255),
    public boolean DEFAULT false NOT NULL,
    owner_id integer,
    owner_type character varying(255)
);


ALTER TABLE public.bookmarks OWNER TO foreman;

--
-- TOC entry 287 (class 1259 OID 16826)
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.bookmarks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookmarks_id_seq OWNER TO foreman;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 287
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


--
-- TOC entry 311 (class 1259 OID 17417)
-- Name: cached_user_roles; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.cached_user_roles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    user_role_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.cached_user_roles OWNER TO foreman;

--
-- TOC entry 310 (class 1259 OID 17416)
-- Name: cached_user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.cached_user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cached_user_roles_id_seq OWNER TO foreman;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 310
-- Name: cached_user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.cached_user_roles_id_seq OWNED BY public.cached_user_roles.id;


--
-- TOC entry 313 (class 1259 OID 17427)
-- Name: cached_usergroup_members; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.cached_usergroup_members (
    id integer NOT NULL,
    user_id integer,
    usergroup_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.cached_usergroup_members OWNER TO foreman;

--
-- TOC entry 312 (class 1259 OID 17426)
-- Name: cached_usergroup_members_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.cached_usergroup_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cached_usergroup_members_id_seq OWNER TO foreman;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 312
-- Name: cached_usergroup_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.cached_usergroup_members_id_seq OWNED BY public.cached_usergroup_members.id;


--
-- TOC entry 328 (class 1259 OID 17528)
-- Name: compute_attributes; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.compute_attributes (
    id integer NOT NULL,
    compute_profile_id integer,
    compute_resource_id integer,
    name character varying(255),
    vm_attrs text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.compute_attributes OWNER TO foreman;

--
-- TOC entry 327 (class 1259 OID 17527)
-- Name: compute_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.compute_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compute_attributes_id_seq OWNER TO foreman;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 327
-- Name: compute_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.compute_attributes_id_seq OWNED BY public.compute_attributes.id;


--
-- TOC entry 326 (class 1259 OID 17521)
-- Name: compute_profiles; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.compute_profiles (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.compute_profiles OWNER TO foreman;

--
-- TOC entry 325 (class 1259 OID 17520)
-- Name: compute_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.compute_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compute_profiles_id_seq OWNER TO foreman;

--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 325
-- Name: compute_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.compute_profiles_id_seq OWNED BY public.compute_profiles.id;


--
-- TOC entry 295 (class 1259 OID 16868)
-- Name: compute_resources; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.compute_resources (
    id integer NOT NULL,
    name character varying(255),
    description text,
    url character varying(255),
    "user" character varying(255),
    password text,
    uuid character varying(255),
    type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    attrs text,
    caching_enabled boolean DEFAULT true,
    domain character varying,
    http_proxy_id integer
);


ALTER TABLE public.compute_resources OWNER TO foreman;

--
-- TOC entry 294 (class 1259 OID 16867)
-- Name: compute_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.compute_resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compute_resources_id_seq OWNER TO foreman;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 294
-- Name: compute_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.compute_resources_id_seq OWNED BY public.compute_resources.id;


--
-- TOC entry 332 (class 1259 OID 17594)
-- Name: config_group_classes; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.config_group_classes (
    id integer NOT NULL,
    puppetclass_id integer,
    config_group_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.config_group_classes OWNER TO foreman;

--
-- TOC entry 331 (class 1259 OID 17593)
-- Name: config_group_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.config_group_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_group_classes_id_seq OWNER TO foreman;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 331
-- Name: config_group_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.config_group_classes_id_seq OWNED BY public.config_group_classes.id;


--
-- TOC entry 330 (class 1259 OID 17587)
-- Name: config_groups; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.config_groups (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.config_groups OWNER TO foreman;

--
-- TOC entry 329 (class 1259 OID 17586)
-- Name: config_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.config_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_groups_id_seq OWNER TO foreman;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 329
-- Name: config_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.config_groups_id_seq OWNED BY public.config_groups.id;


--
-- TOC entry 346 (class 1259 OID 17718)
-- Name: discovery_attribute_sets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.discovery_attribute_sets (
    id integer NOT NULL,
    host_id integer,
    memory bigint DEFAULT 0,
    cpu_count integer DEFAULT 0,
    disk_count integer DEFAULT 0,
    disks_size bigint DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.discovery_attribute_sets OWNER TO foreman;

--
-- TOC entry 345 (class 1259 OID 17717)
-- Name: discovery_attribute_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.discovery_attribute_sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discovery_attribute_sets_id_seq OWNER TO foreman;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 345
-- Name: discovery_attribute_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.discovery_attribute_sets_id_seq OWNED BY public.discovery_attribute_sets.id;


--
-- TOC entry 344 (class 1259 OID 17702)
-- Name: discovery_rules; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.discovery_rules (
    id integer NOT NULL,
    name character varying(255),
    search character varying(255),
    hostgroup_id integer NOT NULL,
    hostname character varying(255) DEFAULT ''::character varying,
    max_count integer DEFAULT 0,
    priority integer DEFAULT 0 NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.discovery_rules OWNER TO foreman;

--
-- TOC entry 343 (class 1259 OID 17701)
-- Name: discovery_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.discovery_rules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discovery_rules_id_seq OWNER TO foreman;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 343
-- Name: discovery_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.discovery_rules_id_seq OWNED BY public.discovery_rules.id;


--
-- TOC entry 225 (class 1259 OID 16471)
-- Name: domains; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.domains (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    fullname character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    dns_id integer
);


ALTER TABLE public.domains OWNER TO foreman;

--
-- TOC entry 224 (class 1259 OID 16470)
-- Name: domains_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.domains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domains_id_seq OWNER TO foreman;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 224
-- Name: domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.domains_id_seq OWNED BY public.domains.id;


--
-- TOC entry 430 (class 1259 OID 18791)
-- Name: dynflow_actions; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.dynflow_actions (
    execution_plan_uuid uuid NOT NULL,
    id integer NOT NULL,
    caller_execution_plan_id character(36),
    caller_action_id integer,
    class text,
    plan_step_id integer,
    run_step_id integer,
    finalize_step_id integer,
    data bytea,
    input bytea,
    output bytea
);


ALTER TABLE public.dynflow_actions OWNER TO foreman;

--
-- TOC entry 432 (class 1259 OID 18826)
-- Name: dynflow_coordinator_records; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.dynflow_coordinator_records (
    id character varying(100) NOT NULL,
    class character varying(100) NOT NULL,
    owner_id text,
    data bytea
);


ALTER TABLE public.dynflow_coordinator_records OWNER TO foreman;

--
-- TOC entry 435 (class 1259 OID 18844)
-- Name: dynflow_delayed_plans; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.dynflow_delayed_plans (
    execution_plan_uuid uuid,
    start_at timestamp without time zone,
    start_before timestamp without time zone,
    args_serializer text,
    frozen boolean,
    serialized_args bytea,
    data bytea
);


ALTER TABLE public.dynflow_delayed_plans OWNER TO foreman;

--
-- TOC entry 434 (class 1259 OID 18836)
-- Name: dynflow_envelopes; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.dynflow_envelopes (
    id integer NOT NULL,
    receiver_id character(36),
    data bytea
);


ALTER TABLE public.dynflow_envelopes OWNER TO foreman;

--
-- TOC entry 433 (class 1259 OID 18835)
-- Name: dynflow_envelopes_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

ALTER TABLE public.dynflow_envelopes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.dynflow_envelopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 429 (class 1259 OID 18783)
-- Name: dynflow_execution_plans; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.dynflow_execution_plans (
    uuid uuid NOT NULL,
    state text,
    result text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    real_time double precision,
    execution_time double precision,
    label text,
    class text,
    root_plan_step_id integer,
    run_flow bytea,
    finalize_flow bytea,
    execution_history bytea,
    step_ids bytea,
    data bytea
);


ALTER TABLE public.dynflow_execution_plans OWNER TO foreman;

--
-- TOC entry 437 (class 1259 OID 18922)
-- Name: dynflow_output_chunks; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.dynflow_output_chunks (
    id integer NOT NULL,
    execution_plan_uuid uuid,
    action_id integer NOT NULL,
    kind text,
    "timestamp" timestamp without time zone NOT NULL,
    chunk bytea
);


ALTER TABLE public.dynflow_output_chunks OWNER TO foreman;

--
-- TOC entry 436 (class 1259 OID 18921)
-- Name: dynflow_output_chunks_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

ALTER TABLE public.dynflow_output_chunks ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.dynflow_output_chunks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 428 (class 1259 OID 18779)
-- Name: dynflow_schema_info; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.dynflow_schema_info (
    version integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.dynflow_schema_info OWNER TO foreman;

--
-- TOC entry 431 (class 1259 OID 18805)
-- Name: dynflow_steps; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.dynflow_steps (
    execution_plan_uuid uuid NOT NULL,
    id integer NOT NULL,
    action_id integer,
    state text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    real_time double precision,
    execution_time double precision,
    progress_done double precision,
    progress_weight double precision,
    class text,
    action_class text,
    queue text,
    error bytea,
    children bytea,
    data bytea
);


ALTER TABLE public.dynflow_steps OWNER TO foreman;

--
-- TOC entry 235 (class 1259 OID 16514)
-- Name: environment_classes; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.environment_classes (
    id integer NOT NULL,
    puppetclass_id integer NOT NULL,
    environment_id integer,
    puppetclass_lookup_key_id integer
);


ALTER TABLE public.environment_classes OWNER TO foreman;

--
-- TOC entry 234 (class 1259 OID 16513)
-- Name: environment_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.environment_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.environment_classes_id_seq OWNER TO foreman;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 234
-- Name: environment_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.environment_classes_id_seq OWNED BY public.environment_classes.id;


--
-- TOC entry 233 (class 1259 OID 16507)
-- Name: environments; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.environments (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.environments OWNER TO foreman;

--
-- TOC entry 232 (class 1259 OID 16506)
-- Name: environments_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.environments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.environments_id_seq OWNER TO foreman;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 232
-- Name: environments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.environments_id_seq OWNED BY public.environments.id;


--
-- TOC entry 336 (class 1259 OID 17608)
-- Name: external_usergroups; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.external_usergroups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    auth_source_id integer NOT NULL,
    usergroup_id integer NOT NULL
);


ALTER TABLE public.external_usergroups OWNER TO foreman;

--
-- TOC entry 335 (class 1259 OID 17607)
-- Name: external_usergroups_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.external_usergroups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_usergroups_id_seq OWNER TO foreman;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 335
-- Name: external_usergroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.external_usergroups_id_seq OWNED BY public.external_usergroups.id;


--
-- TOC entry 214 (class 1259 OID 16412)
-- Name: fact_names; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.fact_names (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    compose boolean DEFAULT false NOT NULL,
    short_name character varying(255),
    type character varying(255) DEFAULT 'FactName'::character varying,
    ancestry character varying(255)
);


ALTER TABLE public.fact_names OWNER TO foreman;

--
-- TOC entry 213 (class 1259 OID 16411)
-- Name: fact_names_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.fact_names_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_names_id_seq OWNER TO foreman;

--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 213
-- Name: fact_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.fact_names_id_seq OWNED BY public.fact_names.id;


--
-- TOC entry 216 (class 1259 OID 16420)
-- Name: fact_values; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.fact_values (
    id bigint NOT NULL,
    value text,
    fact_name_id integer NOT NULL,
    host_id integer NOT NULL,
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE public.fact_values OWNER TO foreman;

--
-- TOC entry 215 (class 1259 OID 16419)
-- Name: fact_values_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.fact_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_values_id_seq OWNER TO foreman;

--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 215
-- Name: fact_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.fact_values_id_seq OWNED BY public.fact_values.id;


--
-- TOC entry 285 (class 1259 OID 16815)
-- Name: features; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.features (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.features OWNER TO foreman;

--
-- TOC entry 284 (class 1259 OID 16814)
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.features_id_seq OWNER TO foreman;

--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 284
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- TOC entry 321 (class 1259 OID 17484)
-- Name: filterings; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.filterings (
    id integer NOT NULL,
    filter_id integer,
    permission_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.filterings OWNER TO foreman;

--
-- TOC entry 320 (class 1259 OID 17483)
-- Name: filterings_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.filterings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filterings_id_seq OWNER TO foreman;

--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 320
-- Name: filterings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.filterings_id_seq OWNED BY public.filterings.id;


--
-- TOC entry 319 (class 1259 OID 17475)
-- Name: filters; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.filters (
    id integer NOT NULL,
    search text,
    role_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    taxonomy_search text,
    override boolean DEFAULT false NOT NULL
);


ALTER TABLE public.filters OWNER TO foreman;

--
-- TOC entry 318 (class 1259 OID 17474)
-- Name: filters_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filters_id_seq OWNER TO foreman;

--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 318
-- Name: filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.filters_id_seq OWNED BY public.filters.id;


--
-- TOC entry 374 (class 1259 OID 17991)
-- Name: foreign_input_sets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreign_input_sets (
    id integer NOT NULL,
    template_id integer NOT NULL,
    target_template_id integer NOT NULL,
    include_all boolean DEFAULT true NOT NULL,
    include text,
    exclude text
);


ALTER TABLE public.foreign_input_sets OWNER TO foreman;

--
-- TOC entry 373 (class 1259 OID 17990)
-- Name: foreign_input_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreign_input_sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreign_input_sets_id_seq OWNER TO foreman;

--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 373
-- Name: foreign_input_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreign_input_sets_id_seq OWNED BY public.foreign_input_sets.id;


--
-- TOC entry 415 (class 1259 OID 18604)
-- Name: foreman_internals; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_internals (
    id bigint NOT NULL,
    key character varying,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.foreman_internals OWNER TO foreman;

--
-- TOC entry 414 (class 1259 OID 18603)
-- Name: foreman_internals_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreman_internals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreman_internals_id_seq OWNER TO foreman;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 414
-- Name: foreman_internals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreman_internals_id_seq OWNED BY public.foreman_internals.id;


--
-- TOC entry 405 (class 1259 OID 18537)
-- Name: foreman_tasks_links; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_tasks_links (
    id integer NOT NULL,
    task_id uuid,
    "{:index=>true, :null=>true}" uuid,
    resource_type character varying,
    resource_id integer
);


ALTER TABLE public.foreman_tasks_links OWNER TO foreman;

--
-- TOC entry 404 (class 1259 OID 18536)
-- Name: foreman_tasks_links_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreman_tasks_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreman_tasks_links_id_seq OWNER TO foreman;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 404
-- Name: foreman_tasks_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreman_tasks_links_id_seq OWNED BY public.foreman_tasks_links.id;


--
-- TOC entry 324 (class 1259 OID 17506)
-- Name: foreman_tasks_locks; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_tasks_locks (
    id integer NOT NULL,
    task_id uuid NOT NULL,
    resource_type character varying,
    resource_id integer
);


ALTER TABLE public.foreman_tasks_locks OWNER TO foreman;

--
-- TOC entry 323 (class 1259 OID 17505)
-- Name: foreman_tasks_locks_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreman_tasks_locks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreman_tasks_locks_id_seq OWNER TO foreman;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 323
-- Name: foreman_tasks_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreman_tasks_locks_id_seq OWNED BY public.foreman_tasks_locks.id;


--
-- TOC entry 364 (class 1259 OID 17919)
-- Name: foreman_tasks_recurring_logics; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_tasks_recurring_logics (
    id integer NOT NULL,
    cron_line character varying NOT NULL,
    end_time timestamp without time zone,
    max_iteration integer,
    iteration integer DEFAULT 0,
    task_group_id integer NOT NULL,
    state character varying,
    triggering_id integer,
    purpose character varying
);


ALTER TABLE public.foreman_tasks_recurring_logics OWNER TO foreman;

--
-- TOC entry 363 (class 1259 OID 17918)
-- Name: foreman_tasks_recurring_logics_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreman_tasks_recurring_logics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreman_tasks_recurring_logics_id_seq OWNER TO foreman;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 363
-- Name: foreman_tasks_recurring_logics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreman_tasks_recurring_logics_id_seq OWNED BY public.foreman_tasks_recurring_logics.id;


--
-- TOC entry 398 (class 1259 OID 18375)
-- Name: foreman_tasks_remote_tasks; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_tasks_remote_tasks (
    id integer NOT NULL,
    execution_plan_id character varying NOT NULL,
    step_id integer NOT NULL,
    state character varying DEFAULT 'new'::character varying NOT NULL,
    proxy_url character varying NOT NULL,
    remote_task_id character varying,
    created_at timestamp without time zone,
    operation character varying,
    parent_task_id character varying
);


ALTER TABLE public.foreman_tasks_remote_tasks OWNER TO foreman;

--
-- TOC entry 397 (class 1259 OID 18374)
-- Name: foreman_tasks_remote_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreman_tasks_remote_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreman_tasks_remote_tasks_id_seq OWNER TO foreman;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 397
-- Name: foreman_tasks_remote_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreman_tasks_remote_tasks_id_seq OWNED BY public.foreman_tasks_remote_tasks.id;


--
-- TOC entry 368 (class 1259 OID 17940)
-- Name: foreman_tasks_task_group_members; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_tasks_task_group_members (
    id integer NOT NULL,
    task_id uuid NOT NULL,
    task_group_id integer NOT NULL
);


ALTER TABLE public.foreman_tasks_task_group_members OWNER TO foreman;

--
-- TOC entry 367 (class 1259 OID 17939)
-- Name: foreman_tasks_task_group_members_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreman_tasks_task_group_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreman_tasks_task_group_members_id_seq OWNER TO foreman;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 367
-- Name: foreman_tasks_task_group_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreman_tasks_task_group_members_id_seq OWNED BY public.foreman_tasks_task_group_members.id;


--
-- TOC entry 366 (class 1259 OID 17930)
-- Name: foreman_tasks_task_groups; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_tasks_task_groups (
    id integer NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.foreman_tasks_task_groups OWNER TO foreman;

--
-- TOC entry 365 (class 1259 OID 17929)
-- Name: foreman_tasks_task_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreman_tasks_task_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreman_tasks_task_groups_id_seq OWNER TO foreman;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 365
-- Name: foreman_tasks_task_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreman_tasks_task_groups_id_seq OWNED BY public.foreman_tasks_task_groups.id;


--
-- TOC entry 322 (class 1259 OID 17492)
-- Name: foreman_tasks_tasks; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_tasks_tasks (
    id uuid NOT NULL,
    type character varying NOT NULL,
    label character varying,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    state character varying NOT NULL,
    result character varying NOT NULL,
    external_id character varying,
    parent_task_id uuid,
    start_at timestamp without time zone,
    start_before timestamp without time zone,
    action character varying,
    user_id integer,
    state_updated_at timestamp without time zone
);


ALTER TABLE public.foreman_tasks_tasks OWNER TO foreman;

--
-- TOC entry 370 (class 1259 OID 17959)
-- Name: foreman_tasks_triggerings; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.foreman_tasks_triggerings (
    id integer NOT NULL,
    mode character varying NOT NULL,
    start_at timestamp without time zone,
    start_before timestamp without time zone
);


ALTER TABLE public.foreman_tasks_triggerings OWNER TO foreman;

--
-- TOC entry 369 (class 1259 OID 17958)
-- Name: foreman_tasks_triggerings_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.foreman_tasks_triggerings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foreman_tasks_triggerings_id_seq OWNER TO foreman;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 369
-- Name: foreman_tasks_triggerings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.foreman_tasks_triggerings_id_seq OWNED BY public.foreman_tasks_triggerings.id;


--
-- TOC entry 379 (class 1259 OID 18115)
-- Name: host_ansible_roles; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.host_ansible_roles (
    ansible_role_id integer NOT NULL,
    host_id integer NOT NULL,
    id integer NOT NULL,
    "position" integer NOT NULL
);


ALTER TABLE public.host_ansible_roles OWNER TO foreman;

--
-- TOC entry 380 (class 1259 OID 18120)
-- Name: host_ansible_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.host_ansible_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_ansible_roles_id_seq OWNER TO foreman;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 380
-- Name: host_ansible_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.host_ansible_roles_id_seq OWNED BY public.host_ansible_roles.id;


--
-- TOC entry 241 (class 1259 OID 16560)
-- Name: host_classes; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.host_classes (
    puppetclass_id integer NOT NULL,
    id integer NOT NULL,
    host_puppet_facet_id bigint
);


ALTER TABLE public.host_classes OWNER TO foreman;

--
-- TOC entry 291 (class 1259 OID 16852)
-- Name: host_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.host_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_classes_id_seq OWNER TO foreman;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 291
-- Name: host_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.host_classes_id_seq OWNED BY public.host_classes.id;


--
-- TOC entry 334 (class 1259 OID 17601)
-- Name: host_config_groups; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.host_config_groups (
    id integer NOT NULL,
    config_group_id integer,
    host_id integer,
    host_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.host_config_groups OWNER TO foreman;

--
-- TOC entry 333 (class 1259 OID 17600)
-- Name: host_config_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.host_config_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_config_groups_id_seq OWNER TO foreman;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 333
-- Name: host_config_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.host_config_groups_id_seq OWNED BY public.host_config_groups.id;


--
-- TOC entry 421 (class 1259 OID 18692)
-- Name: host_facets_infrastructure_facets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.host_facets_infrastructure_facets (
    id bigint NOT NULL,
    host_id integer,
    foreman_instance boolean DEFAULT false NOT NULL,
    smart_proxy_id bigint
);


ALTER TABLE public.host_facets_infrastructure_facets OWNER TO foreman;

--
-- TOC entry 420 (class 1259 OID 18691)
-- Name: host_facets_infrastructure_facets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.host_facets_infrastructure_facets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_facets_infrastructure_facets_id_seq OWNER TO foreman;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 420
-- Name: host_facets_infrastructure_facets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.host_facets_infrastructure_facets_id_seq OWNED BY public.host_facets_infrastructure_facets.id;


--
-- TOC entry 411 (class 1259 OID 18578)
-- Name: host_facets_reported_data_facets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.host_facets_reported_data_facets (
    id bigint NOT NULL,
    host_id integer,
    boot_time timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    virtual boolean,
    sockets integer,
    cores integer,
    ram integer,
    disks_total bigint,
    kernel_version character varying(255),
    bios_vendor character varying(255),
    bios_release_date character varying(255),
    bios_version character varying(255)
);


ALTER TABLE public.host_facets_reported_data_facets OWNER TO foreman;

--
-- TOC entry 410 (class 1259 OID 18577)
-- Name: host_facets_reported_data_facets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.host_facets_reported_data_facets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_facets_reported_data_facets_id_seq OWNER TO foreman;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 410
-- Name: host_facets_reported_data_facets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.host_facets_reported_data_facets_id_seq OWNED BY public.host_facets_reported_data_facets.id;


--
-- TOC entry 425 (class 1259 OID 18730)
-- Name: host_proxy_invocations; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.host_proxy_invocations (
    id bigint NOT NULL,
    host_id bigint NOT NULL,
    smart_proxy_id bigint NOT NULL
);


ALTER TABLE public.host_proxy_invocations OWNER TO foreman;

--
-- TOC entry 424 (class 1259 OID 18729)
-- Name: host_proxy_invocations_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.host_proxy_invocations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_proxy_invocations_id_seq OWNER TO foreman;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 424
-- Name: host_proxy_invocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.host_proxy_invocations_id_seq OWNED BY public.host_proxy_invocations.id;


--
-- TOC entry 417 (class 1259 OID 18630)
-- Name: host_puppet_facets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.host_puppet_facets (
    id bigint NOT NULL,
    host_id bigint,
    environment_id bigint,
    puppet_proxy_id bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.host_puppet_facets OWNER TO foreman;

--
-- TOC entry 416 (class 1259 OID 18629)
-- Name: host_puppet_facets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.host_puppet_facets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_puppet_facets_id_seq OWNER TO foreman;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 416
-- Name: host_puppet_facets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.host_puppet_facets_id_seq OWNED BY public.host_puppet_facets.id;


--
-- TOC entry 348 (class 1259 OID 17781)
-- Name: host_status; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.host_status (
    id integer NOT NULL,
    type character varying(255),
    status bigint DEFAULT 0 NOT NULL,
    host_id integer NOT NULL,
    reported_at timestamp without time zone NOT NULL
);


ALTER TABLE public.host_status OWNER TO foreman;

--
-- TOC entry 347 (class 1259 OID 17780)
-- Name: host_status_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.host_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_status_id_seq OWNER TO foreman;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 347
-- Name: host_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.host_status_id_seq OWNED BY public.host_status.id;


--
-- TOC entry 381 (class 1259 OID 18135)
-- Name: hostgroup_ansible_roles; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.hostgroup_ansible_roles (
    hostgroup_id integer NOT NULL,
    ansible_role_id integer NOT NULL,
    id integer NOT NULL,
    "position" integer NOT NULL
);


ALTER TABLE public.hostgroup_ansible_roles OWNER TO foreman;

--
-- TOC entry 382 (class 1259 OID 18140)
-- Name: hostgroup_ansible_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.hostgroup_ansible_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hostgroup_ansible_roles_id_seq OWNER TO foreman;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 382
-- Name: hostgroup_ansible_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.hostgroup_ansible_roles_id_seq OWNED BY public.hostgroup_ansible_roles.id;


--
-- TOC entry 249 (class 1259 OID 16595)
-- Name: hostgroup_classes; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.hostgroup_classes (
    puppetclass_id bigint NOT NULL,
    id integer NOT NULL,
    hostgroup_puppet_facet_id bigint
);


ALTER TABLE public.hostgroup_classes OWNER TO foreman;

--
-- TOC entry 306 (class 1259 OID 16992)
-- Name: hostgroup_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.hostgroup_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hostgroup_classes_id_seq OWNER TO foreman;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 306
-- Name: hostgroup_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.hostgroup_classes_id_seq OWNED BY public.hostgroup_classes.id;


--
-- TOC entry 419 (class 1259 OID 18655)
-- Name: hostgroup_puppet_facets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.hostgroup_puppet_facets (
    id bigint NOT NULL,
    hostgroup_id bigint,
    environment_id bigint,
    puppet_proxy_id bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.hostgroup_puppet_facets OWNER TO foreman;

--
-- TOC entry 418 (class 1259 OID 18654)
-- Name: hostgroup_puppet_facets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.hostgroup_puppet_facets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hostgroup_puppet_facets_id_seq OWNER TO foreman;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 418
-- Name: hostgroup_puppet_facets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.hostgroup_puppet_facets_id_seq OWNED BY public.hostgroup_puppet_facets.id;


--
-- TOC entry 248 (class 1259 OID 16589)
-- Name: hostgroups; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.hostgroups (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    operatingsystem_id integer,
    architecture_id integer,
    medium_id integer,
    ptable_id integer,
    root_pass text,
    puppet_ca_proxy_id integer,
    use_image boolean,
    image_file character varying(128),
    ancestry character varying(255),
    vm_defaults text,
    subnet_id integer,
    domain_id integer,
    puppet_proxy_id integer,
    title character varying(255),
    realm_id integer,
    compute_profile_id integer,
    grub_pass character varying(255) DEFAULT ''::character varying,
    lookup_value_matcher character varying(255),
    subnet6_id integer,
    pxe_loader character varying(255),
    description text,
    compute_resource_id integer
);


ALTER TABLE public.hostgroups OWNER TO foreman;

--
-- TOC entry 247 (class 1259 OID 16588)
-- Name: hostgroups_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.hostgroups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hostgroups_id_seq OWNER TO foreman;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 247
-- Name: hostgroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.hostgroups_id_seq OWNED BY public.hostgroups.id;


--
-- TOC entry 212 (class 1259 OID 16401)
-- Name: hosts; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.hosts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    last_compile timestamp without time zone,
    last_report timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    root_pass text,
    architecture_id integer,
    operatingsystem_id integer,
    ptable_id integer,
    medium_id integer,
    build boolean DEFAULT false,
    comment text DEFAULT ''::text NOT NULL,
    disk text,
    installed_at timestamp without time zone,
    model_id integer,
    hostgroup_id integer,
    owner_id integer,
    owner_type character varying(255),
    enabled boolean DEFAULT true,
    puppet_ca_proxy_id integer,
    managed boolean DEFAULT false NOT NULL,
    use_image boolean,
    image_file character varying(128),
    uuid character varying(255),
    compute_resource_id integer,
    puppet_proxy_id integer,
    certname character varying(255),
    image_id integer,
    organization_id integer,
    location_id integer,
    type character varying(255),
    otp character varying(255),
    realm_id integer,
    compute_profile_id integer,
    provision_method character varying(255),
    grub_pass character varying(255) DEFAULT ''::character varying,
    discovery_rule_id integer,
    global_status integer DEFAULT 0 NOT NULL,
    lookup_value_matcher character varying(255),
    pxe_loader character varying(255),
    initiated_at timestamp without time zone,
    build_errors text,
    creator_id bigint
);


ALTER TABLE public.hosts OWNER TO foreman;

--
-- TOC entry 211 (class 1259 OID 16400)
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hosts_id_seq OWNER TO foreman;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 211
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.hosts_id_seq OWNED BY public.hosts.id;


--
-- TOC entry 394 (class 1259 OID 18324)
-- Name: http_proxies; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.http_proxies (
    id integer NOT NULL,
    name character varying NOT NULL,
    url character varying NOT NULL,
    username character varying,
    password character varying,
    cacert text
);


ALTER TABLE public.http_proxies OWNER TO foreman;

--
-- TOC entry 393 (class 1259 OID 18323)
-- Name: http_proxies_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.http_proxies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.http_proxies_id_seq OWNER TO foreman;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 393
-- Name: http_proxies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.http_proxies_id_seq OWNED BY public.http_proxies.id;


--
-- TOC entry 299 (class 1259 OID 16918)
-- Name: images; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.images (
    id integer NOT NULL,
    operatingsystem_id integer,
    compute_resource_id integer,
    architecture_id integer,
    uuid character varying(255),
    username character varying(255),
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    iam_role character varying(255),
    user_data boolean DEFAULT false,
    password character varying(255)
);


ALTER TABLE public.images OWNER TO foreman;

--
-- TOC entry 298 (class 1259 OID 16917)
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO foreman;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 298
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- TOC entry 423 (class 1259 OID 18719)
-- Name: invocation_provider_input_values; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.invocation_provider_input_values (
    id bigint NOT NULL,
    template_invocation_id bigint NOT NULL,
    value character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.invocation_provider_input_values OWNER TO foreman;

--
-- TOC entry 422 (class 1259 OID 18718)
-- Name: invocation_provider_input_values_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.invocation_provider_input_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invocation_provider_input_values_id_seq OWNER TO foreman;

--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 422
-- Name: invocation_provider_input_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.invocation_provider_input_values_id_seq OWNED BY public.invocation_provider_input_values.id;


--
-- TOC entry 356 (class 1259 OID 17853)
-- Name: job_invocations; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.job_invocations (
    id integer NOT NULL,
    targeting_id integer NOT NULL,
    job_category character varying(255) NOT NULL,
    task_id uuid,
    task_group_id integer,
    triggering_id integer,
    description character varying(255),
    concurrency_level integer,
    execution_timeout_interval integer,
    password character varying,
    key_passphrase character varying,
    remote_execution_feature_id integer,
    effective_user_password character varying,
    ssh_user character varying,
    time_to_pickup integer
);


ALTER TABLE public.job_invocations OWNER TO foreman;

--
-- TOC entry 355 (class 1259 OID 17852)
-- Name: job_invocations_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.job_invocations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_invocations_id_seq OWNER TO foreman;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 355
-- Name: job_invocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.job_invocations_id_seq OWNED BY public.job_invocations.id;


--
-- TOC entry 372 (class 1259 OID 17973)
-- Name: job_template_effective_users; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.job_template_effective_users (
    id integer NOT NULL,
    job_template_id integer,
    value character varying(255),
    overridable boolean,
    "current_user" boolean
);


ALTER TABLE public.job_template_effective_users OWNER TO foreman;

--
-- TOC entry 371 (class 1259 OID 17972)
-- Name: job_template_effective_users_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.job_template_effective_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_template_effective_users_id_seq OWNER TO foreman;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 371
-- Name: job_template_effective_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.job_template_effective_users_id_seq OWNED BY public.job_template_effective_users.id;


--
-- TOC entry 396 (class 1259 OID 18354)
-- Name: jwt_secrets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.jwt_secrets (
    id bigint NOT NULL,
    token character varying NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.jwt_secrets OWNER TO foreman;

--
-- TOC entry 395 (class 1259 OID 18353)
-- Name: jwt_secrets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.jwt_secrets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jwt_secrets_id_seq OWNER TO foreman;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 395
-- Name: jwt_secrets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.jwt_secrets_id_seq OWNED BY public.jwt_secrets.id;


--
-- TOC entry 301 (class 1259 OID 16928)
-- Name: key_pairs; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.key_pairs (
    id integer NOT NULL,
    secret text,
    compute_resource_id integer,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    public text
);


ALTER TABLE public.key_pairs OWNER TO foreman;

--
-- TOC entry 300 (class 1259 OID 16927)
-- Name: key_pairs_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.key_pairs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.key_pairs_id_seq OWNER TO foreman;

--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 300
-- Name: key_pairs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.key_pairs_id_seq OWNED BY public.key_pairs.id;


--
-- TOC entry 307 (class 1259 OID 17002)
-- Name: locations_organizations; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.locations_organizations (
    location_id integer,
    organization_id integer
);


ALTER TABLE public.locations_organizations OWNER TO foreman;

--
-- TOC entry 272 (class 1259 OID 16756)
-- Name: logs; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.logs (
    id bigint NOT NULL,
    source_id integer,
    message_id integer,
    report_id integer,
    level_id integer
);


ALTER TABLE public.logs OWNER TO foreman;

--
-- TOC entry 271 (class 1259 OID 16755)
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO foreman;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 271
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 255 (class 1259 OID 16649)
-- Name: lookup_keys; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.lookup_keys (
    id integer NOT NULL,
    key character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    default_value text,
    path text,
    description text,
    validator_type character varying(255),
    validator_rule character varying(255),
    key_type character varying(255) DEFAULT NULL::character varying,
    override boolean DEFAULT false,
    required boolean DEFAULT false,
    lookup_values_count integer DEFAULT 0,
    merge_overrides boolean DEFAULT false NOT NULL,
    avoid_duplicates boolean DEFAULT false NOT NULL,
    omit boolean,
    type character varying(255),
    merge_default boolean DEFAULT false NOT NULL,
    hidden_value boolean DEFAULT false,
    ansible_role_id integer,
    imported boolean
);


ALTER TABLE public.lookup_keys OWNER TO foreman;

--
-- TOC entry 254 (class 1259 OID 16648)
-- Name: lookup_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.lookup_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lookup_keys_id_seq OWNER TO foreman;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 254
-- Name: lookup_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.lookup_keys_id_seq OWNED BY public.lookup_keys.id;


--
-- TOC entry 257 (class 1259 OID 16657)
-- Name: lookup_values; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.lookup_values (
    id integer NOT NULL,
    match text,
    value text,
    lookup_key_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    omit boolean DEFAULT false
);


ALTER TABLE public.lookup_values OWNER TO foreman;

--
-- TOC entry 256 (class 1259 OID 16656)
-- Name: lookup_values_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.lookup_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lookup_values_id_seq OWNER TO foreman;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 256
-- Name: lookup_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.lookup_values_id_seq OWNED BY public.lookup_values.id;


--
-- TOC entry 340 (class 1259 OID 17674)
-- Name: mail_notifications; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.mail_notifications (
    id integer NOT NULL,
    name character varying(255),
    description text,
    mailer character varying(255),
    method character varying(255),
    subscriptable boolean DEFAULT true,
    default_interval character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    subscription_type character varying(255),
    queryable boolean DEFAULT false,
    type character varying(255)
);


ALTER TABLE public.mail_notifications OWNER TO foreman;

--
-- TOC entry 339 (class 1259 OID 17673)
-- Name: mail_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.mail_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_notifications_id_seq OWNER TO foreman;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 339
-- Name: mail_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.mail_notifications_id_seq OWNED BY public.mail_notifications.id;


--
-- TOC entry 223 (class 1259 OID 16462)
-- Name: media; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.media (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    path character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    media_path character varying(255),
    config_path character varying(255),
    image_path character varying(255),
    os_family character varying(255)
);


ALTER TABLE public.media OWNER TO foreman;

--
-- TOC entry 222 (class 1259 OID 16461)
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO foreman;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 222
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- TOC entry 262 (class 1259 OID 16682)
-- Name: media_operatingsystems; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.media_operatingsystems (
    medium_id integer NOT NULL,
    operatingsystem_id integer NOT NULL
);


ALTER TABLE public.media_operatingsystems OWNER TO foreman;

--
-- TOC entry 268 (class 1259 OID 16736)
-- Name: messages; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    value text
);


ALTER TABLE public.messages OWNER TO foreman;

--
-- TOC entry 267 (class 1259 OID 16735)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO foreman;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 267
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 231 (class 1259 OID 16498)
-- Name: models; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.models (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    info text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    vendor_class character varying(255),
    hardware_model character varying(255)
);


ALTER TABLE public.models OWNER TO foreman;

--
-- TOC entry 230 (class 1259 OID 16497)
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.models_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.models_id_seq OWNER TO foreman;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 230
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.models_id_seq OWNED BY public.models.id;


--
-- TOC entry 297 (class 1259 OID 16877)
-- Name: nics; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.nics (
    id integer NOT NULL,
    mac character varying(255),
    ip character varying(15),
    type character varying(255),
    name character varying(255),
    host_id integer,
    subnet_id integer,
    domain_id integer,
    attrs text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    provider character varying(255),
    username character varying(255),
    password character varying(255),
    virtual boolean DEFAULT false NOT NULL,
    link boolean DEFAULT true NOT NULL,
    identifier character varying(255),
    tag character varying(255) DEFAULT ''::character varying NOT NULL,
    attached_to character varying(255) DEFAULT ''::character varying NOT NULL,
    managed boolean DEFAULT true,
    mode character varying(255) DEFAULT 'balance-rr'::character varying NOT NULL,
    attached_devices character varying(255) DEFAULT ''::character varying NOT NULL,
    bond_options character varying(255) DEFAULT ''::character varying NOT NULL,
    "primary" boolean DEFAULT false,
    provision boolean DEFAULT false,
    compute_attributes text,
    execution boolean DEFAULT false,
    ip6 character varying(45),
    subnet6_id integer
);


ALTER TABLE public.nics OWNER TO foreman;

--
-- TOC entry 296 (class 1259 OID 16876)
-- Name: nics_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.nics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nics_id_seq OWNER TO foreman;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 296
-- Name: nics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.nics_id_seq OWNED BY public.nics.id;


--
-- TOC entry 384 (class 1259 OID 18156)
-- Name: notification_blueprints; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.notification_blueprints (
    id integer NOT NULL,
    "group" character varying,
    level character varying,
    message character varying,
    name text,
    expires_in integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    actions text
);


ALTER TABLE public.notification_blueprints OWNER TO foreman;

--
-- TOC entry 383 (class 1259 OID 18155)
-- Name: notification_blueprints_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.notification_blueprints_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_blueprints_id_seq OWNER TO foreman;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 383
-- Name: notification_blueprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.notification_blueprints_id_seq OWNED BY public.notification_blueprints.id;


--
-- TOC entry 388 (class 1259 OID 18187)
-- Name: notification_recipients; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.notification_recipients (
    id integer NOT NULL,
    notification_id integer,
    user_id integer,
    seen boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.notification_recipients OWNER TO foreman;

--
-- TOC entry 387 (class 1259 OID 18186)
-- Name: notification_recipients_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.notification_recipients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_recipients_id_seq OWNER TO foreman;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 387
-- Name: notification_recipients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.notification_recipients_id_seq OWNED BY public.notification_recipients.id;


--
-- TOC entry 386 (class 1259 OID 18166)
-- Name: notifications; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    notification_blueprint_id integer NOT NULL,
    user_id integer,
    audience character varying,
    expired_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subject_type character varying,
    subject_id integer,
    message character varying,
    actions text
);


ALTER TABLE public.notifications OWNER TO foreman;

--
-- TOC entry 385 (class 1259 OID 18165)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO foreman;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 385
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 229 (class 1259 OID 16490)
-- Name: operatingsystems; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.operatingsystems (
    id integer NOT NULL,
    major character varying(5) DEFAULT ''::character varying NOT NULL,
    name character varying(255) NOT NULL,
    minor character varying(16) DEFAULT ''::character varying NOT NULL,
    nameindicator character varying(3),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    release_name character varying(255),
    type character varying(255),
    description character varying(255),
    password_hash character varying(255) DEFAULT 'SHA512'::character varying,
    title character varying(255)
);


ALTER TABLE public.operatingsystems OWNER TO foreman;

--
-- TOC entry 228 (class 1259 OID 16489)
-- Name: operatingsystems_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.operatingsystems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operatingsystems_id_seq OWNER TO foreman;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 228
-- Name: operatingsystems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.operatingsystems_id_seq OWNED BY public.operatingsystems.id;


--
-- TOC entry 277 (class 1259 OID 16786)
-- Name: operatingsystems_provisioning_templates; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.operatingsystems_provisioning_templates (
    provisioning_template_id integer NOT NULL,
    operatingsystem_id integer NOT NULL
);


ALTER TABLE public.operatingsystems_provisioning_templates OWNER TO foreman;

--
-- TOC entry 238 (class 1259 OID 16543)
-- Name: operatingsystems_ptables; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.operatingsystems_ptables (
    ptable_id integer NOT NULL,
    operatingsystem_id integer NOT NULL
);


ALTER TABLE public.operatingsystems_ptables OWNER TO foreman;

--
-- TOC entry 242 (class 1259 OID 16563)
-- Name: operatingsystems_puppetclasses; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.operatingsystems_puppetclasses (
    puppetclass_id integer NOT NULL,
    operatingsystem_id integer NOT NULL
);


ALTER TABLE public.operatingsystems_puppetclasses OWNER TO foreman;

--
-- TOC entry 281 (class 1259 OID 16797)
-- Name: os_default_templates; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.os_default_templates (
    id integer NOT NULL,
    provisioning_template_id integer,
    template_kind_id integer,
    operatingsystem_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.os_default_templates OWNER TO foreman;

--
-- TOC entry 280 (class 1259 OID 16796)
-- Name: os_default_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.os_default_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.os_default_templates_id_seq OWNER TO foreman;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 280
-- Name: os_default_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.os_default_templates_id_seq OWNED BY public.os_default_templates.id;


--
-- TOC entry 244 (class 1259 OID 16567)
-- Name: parameters; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    name character varying(255),
    value text,
    reference_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying(255),
    priority integer,
    hidden_value boolean DEFAULT false,
    key_type character varying(255),
    searchable_value text
);


ALTER TABLE public.parameters OWNER TO foreman;

--
-- TOC entry 243 (class 1259 OID 16566)
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parameters_id_seq OWNER TO foreman;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 243
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- TOC entry 317 (class 1259 OID 17465)
-- Name: permissions; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    resource_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.permissions OWNER TO foreman;

--
-- TOC entry 316 (class 1259 OID 17464)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO foreman;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 316
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 392 (class 1259 OID 18307)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.personal_access_tokens (
    id integer NOT NULL,
    token character varying NOT NULL,
    name character varying NOT NULL,
    expires_at timestamp without time zone,
    last_used_at timestamp without time zone,
    revoked boolean DEFAULT false,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.personal_access_tokens OWNER TO foreman;

--
-- TOC entry 391 (class 1259 OID 18306)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO foreman;

--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 391
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 240 (class 1259 OID 16547)
-- Name: puppetclasses; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.puppetclasses (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.puppetclasses OWNER TO foreman;

--
-- TOC entry 239 (class 1259 OID 16546)
-- Name: puppetclasses_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.puppetclasses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puppetclasses_id_seq OWNER TO foreman;

--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 239
-- Name: puppetclasses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.puppetclasses_id_seq OWNED BY public.puppetclasses.id;


--
-- TOC entry 315 (class 1259 OID 17436)
-- Name: realms; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.realms (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    realm_type character varying(255),
    realm_proxy_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.realms OWNER TO foreman;

--
-- TOC entry 314 (class 1259 OID 17435)
-- Name: realms_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.realms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.realms_id_seq OWNER TO foreman;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 314
-- Name: realms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.realms_id_seq OWNED BY public.realms.id;


--
-- TOC entry 409 (class 1259 OID 18560)
-- Name: registration_facets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.registration_facets (
    id bigint NOT NULL,
    host_id bigint NOT NULL,
    jwt_secret character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.registration_facets OWNER TO foreman;

--
-- TOC entry 408 (class 1259 OID 18559)
-- Name: registration_facets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.registration_facets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_facets_id_seq OWNER TO foreman;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 408
-- Name: registration_facets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.registration_facets_id_seq OWNED BY public.registration_facets.id;


--
-- TOC entry 376 (class 1259 OID 18017)
-- Name: remote_execution_features; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.remote_execution_features (
    id integer NOT NULL,
    label character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    provided_inputs text,
    job_template_id integer,
    host_action_button boolean DEFAULT false NOT NULL,
    notification_builder character varying,
    proxy_selector_override character varying
);


ALTER TABLE public.remote_execution_features OWNER TO foreman;

--
-- TOC entry 375 (class 1259 OID 18016)
-- Name: remote_execution_features_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.remote_execution_features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remote_execution_features_id_seq OWNER TO foreman;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 375
-- Name: remote_execution_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.remote_execution_features_id_seq OWNED BY public.remote_execution_features.id;


--
-- TOC entry 237 (class 1259 OID 16526)
-- Name: reports; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.reports (
    id bigint NOT NULL,
    host_id integer NOT NULL,
    reported_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    status bigint,
    metrics text,
    type character varying(255) DEFAULT 'ConfigReport'::character varying NOT NULL,
    origin character varying
);


ALTER TABLE public.reports OWNER TO foreman;

--
-- TOC entry 236 (class 1259 OID 16525)
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO foreman;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 236
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- TOC entry 264 (class 1259 OID 16701)
-- Name: roles; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255),
    builtin integer DEFAULT 0,
    description text,
    origin character varying,
    cloned_from_id integer
);


ALTER TABLE public.roles OWNER TO foreman;

--
-- TOC entry 263 (class 1259 OID 16700)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO foreman;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 263
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 209 (class 1259 OID 16386)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO foreman;

--
-- TOC entry 253 (class 1259 OID 16635)
-- Name: sessions; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO foreman;

--
-- TOC entry 252 (class 1259 OID 16634)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.sessions_id_seq OWNER TO foreman;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 252
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 290 (class 1259 OID 16843)
-- Name: settings; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    name character varying(255),
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.settings OWNER TO foreman;

--
-- TOC entry 289 (class 1259 OID 16842)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO foreman;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 289
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 283 (class 1259 OID 16804)
-- Name: smart_proxies; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.smart_proxies (
    id integer NOT NULL,
    name character varying(255),
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pubkey text,
    expired_logs character varying(255) DEFAULT '0'::character varying
);


ALTER TABLE public.smart_proxies OWNER TO foreman;

--
-- TOC entry 282 (class 1259 OID 16803)
-- Name: smart_proxies_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.smart_proxies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.smart_proxies_id_seq OWNER TO foreman;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 282
-- Name: smart_proxies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.smart_proxies_id_seq OWNED BY public.smart_proxies.id;


--
-- TOC entry 286 (class 1259 OID 16821)
-- Name: smart_proxy_features; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.smart_proxy_features (
    smart_proxy_id integer,
    feature_id integer,
    id bigint NOT NULL,
    capabilities text,
    settings text
);


ALTER TABLE public.smart_proxy_features OWNER TO foreman;

--
-- TOC entry 403 (class 1259 OID 18503)
-- Name: smart_proxy_features_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.smart_proxy_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.smart_proxy_features_id_seq OWNER TO foreman;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 403
-- Name: smart_proxy_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.smart_proxy_features_id_seq OWNED BY public.smart_proxy_features.id;


--
-- TOC entry 270 (class 1259 OID 16746)
-- Name: sources; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.sources (
    id integer NOT NULL,
    value text
);


ALTER TABLE public.sources OWNER TO foreman;

--
-- TOC entry 269 (class 1259 OID 16745)
-- Name: sources_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sources_id_seq OWNER TO foreman;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 269
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.sources_id_seq OWNED BY public.sources.id;


--
-- TOC entry 390 (class 1259 OID 18287)
-- Name: ssh_keys; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.ssh_keys (
    id integer NOT NULL,
    name character varying(255),
    key text,
    fingerprint character varying,
    user_id integer,
    length integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ssh_keys OWNER TO foreman;

--
-- TOC entry 389 (class 1259 OID 18286)
-- Name: ssh_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.ssh_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ssh_keys_id_seq OWNER TO foreman;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 389
-- Name: ssh_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.ssh_keys_id_seq OWNED BY public.ssh_keys.id;


--
-- TOC entry 407 (class 1259 OID 18550)
-- Name: stored_values; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.stored_values (
    id bigint NOT NULL,
    key character varying NOT NULL,
    value bytea,
    expire_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.stored_values OWNER TO foreman;

--
-- TOC entry 406 (class 1259 OID 18549)
-- Name: stored_values_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.stored_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stored_values_id_seq OWNER TO foreman;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 406
-- Name: stored_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.stored_values_id_seq OWNED BY public.stored_values.id;


--
-- TOC entry 293 (class 1259 OID 16861)
-- Name: subnet_domains; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.subnet_domains (
    id integer NOT NULL,
    domain_id integer NOT NULL,
    subnet_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.subnet_domains OWNER TO foreman;

--
-- TOC entry 292 (class 1259 OID 16860)
-- Name: subnet_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.subnet_domains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subnet_domains_id_seq OWNER TO foreman;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 292
-- Name: subnet_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.subnet_domains_id_seq OWNED BY public.subnet_domains.id;


--
-- TOC entry 227 (class 1259 OID 16481)
-- Name: subnets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.subnets (
    id integer NOT NULL,
    network character varying(45),
    mask character varying(45),
    priority integer,
    name text,
    vlanid integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    dhcp_id integer,
    tftp_id integer,
    gateway character varying(45),
    dns_primary character varying(45),
    dns_secondary character varying(45),
    "from" character varying(45),
    "to" character varying(45),
    dns_id integer,
    boot_mode character varying DEFAULT 'DHCP'::character varying NOT NULL,
    ipam character varying(255) DEFAULT 'None'::character varying NOT NULL,
    discovery_id integer,
    type character varying DEFAULT 'Subnet::Ipv4'::character varying NOT NULL,
    description text,
    mtu bigint DEFAULT 1500 NOT NULL,
    template_id integer,
    httpboot_id integer,
    nic_delay integer,
    externalipam_id integer,
    externalipam_group text,
    bmc_id integer
);


ALTER TABLE public.subnets OWNER TO foreman;

--
-- TOC entry 226 (class 1259 OID 16480)
-- Name: subnets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.subnets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subnets_id_seq OWNER TO foreman;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 226
-- Name: subnets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.subnets_id_seq OWNED BY public.subnets.id;


--
-- TOC entry 400 (class 1259 OID 18386)
-- Name: table_preferences; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.table_preferences (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    columns text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.table_preferences OWNER TO foreman;

--
-- TOC entry 399 (class 1259 OID 18385)
-- Name: table_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.table_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_preferences_id_seq OWNER TO foreman;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 399
-- Name: table_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.table_preferences_id_seq OWNED BY public.table_preferences.id;


--
-- TOC entry 362 (class 1259 OID 17909)
-- Name: target_remote_execution_proxies; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.target_remote_execution_proxies (
    id integer NOT NULL,
    remote_execution_proxy_id integer,
    target_id integer,
    target_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.target_remote_execution_proxies OWNER TO foreman;

--
-- TOC entry 361 (class 1259 OID 17908)
-- Name: target_remote_execution_proxies_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.target_remote_execution_proxies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.target_remote_execution_proxies_id_seq OWNER TO foreman;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 361
-- Name: target_remote_execution_proxies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.target_remote_execution_proxies_id_seq OWNED BY public.target_remote_execution_proxies.id;


--
-- TOC entry 354 (class 1259 OID 17835)
-- Name: targeting_hosts; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.targeting_hosts (
    id integer NOT NULL,
    host_id integer NOT NULL,
    targeting_id integer NOT NULL
);


ALTER TABLE public.targeting_hosts OWNER TO foreman;

--
-- TOC entry 353 (class 1259 OID 17834)
-- Name: targeting_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.targeting_hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targeting_hosts_id_seq OWNER TO foreman;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 353
-- Name: targeting_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.targeting_hosts_id_seq OWNED BY public.targeting_hosts.id;


--
-- TOC entry 352 (class 1259 OID 17814)
-- Name: targetings; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.targetings (
    id integer NOT NULL,
    search_query text,
    bookmark_id integer,
    user_id integer,
    targeting_type character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    resolved_at timestamp without time zone,
    randomized_ordering boolean DEFAULT false
);


ALTER TABLE public.targetings OWNER TO foreman;

--
-- TOC entry 351 (class 1259 OID 17813)
-- Name: targetings_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.targetings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targetings_id_seq OWNER TO foreman;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 351
-- Name: targetings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.targetings_id_seq OWNED BY public.targetings.id;


--
-- TOC entry 309 (class 1259 OID 17006)
-- Name: taxable_taxonomies; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.taxable_taxonomies (
    id integer NOT NULL,
    taxonomy_id integer,
    taxable_id integer,
    taxable_type character varying(255)
);


ALTER TABLE public.taxable_taxonomies OWNER TO foreman;

--
-- TOC entry 308 (class 1259 OID 17005)
-- Name: taxable_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.taxable_taxonomies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxable_taxonomies_id_seq OWNER TO foreman;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 308
-- Name: taxable_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.taxable_taxonomies_id_seq OWNED BY public.taxable_taxonomies.id;


--
-- TOC entry 303 (class 1259 OID 16942)
-- Name: taxonomies; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.taxonomies (
    id integer NOT NULL,
    name character varying(255),
    type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ignore_types text,
    ancestry character varying(255),
    title character varying(255),
    description text
);


ALTER TABLE public.taxonomies OWNER TO foreman;

--
-- TOC entry 302 (class 1259 OID 16941)
-- Name: taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.taxonomies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxonomies_id_seq OWNER TO foreman;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 302
-- Name: taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.taxonomies_id_seq OWNED BY public.taxonomies.id;


--
-- TOC entry 276 (class 1259 OID 16775)
-- Name: template_combinations; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.template_combinations (
    id integer NOT NULL,
    provisioning_template_id integer,
    hostgroup_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    environment_id integer
);


ALTER TABLE public.template_combinations OWNER TO foreman;

--
-- TOC entry 275 (class 1259 OID 16774)
-- Name: template_combinations_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.template_combinations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_combinations_id_seq OWNER TO foreman;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 275
-- Name: template_combinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.template_combinations_id_seq OWNED BY public.template_combinations.id;


--
-- TOC entry 350 (class 1259 OID 17796)
-- Name: template_inputs; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.template_inputs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    required boolean DEFAULT false NOT NULL,
    input_type character varying(255) NOT NULL,
    fact_name character varying(255),
    variable_name character varying(255),
    puppet_class_name character varying(255),
    puppet_parameter_name character varying(255),
    description text,
    template_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    options text,
    advanced boolean DEFAULT false NOT NULL,
    value_type character varying DEFAULT 'plain'::character varying NOT NULL,
    resource_type character varying,
    "default" character varying,
    hidden_value boolean DEFAULT false NOT NULL
);


ALTER TABLE public.template_inputs OWNER TO foreman;

--
-- TOC entry 349 (class 1259 OID 17795)
-- Name: template_inputs_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.template_inputs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_inputs_id_seq OWNER TO foreman;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 349
-- Name: template_inputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.template_inputs_id_seq OWNED BY public.template_inputs.id;


--
-- TOC entry 427 (class 1259 OID 18744)
-- Name: template_invocation_events; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.template_invocation_events (
    id bigint NOT NULL,
    template_invocation_id bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    event_type character varying NOT NULL,
    event character varying NOT NULL,
    meta character varying,
    sequence_id integer NOT NULL
);


ALTER TABLE public.template_invocation_events OWNER TO foreman;

--
-- TOC entry 426 (class 1259 OID 18743)
-- Name: template_invocation_events_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.template_invocation_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_invocation_events_id_seq OWNER TO foreman;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 426
-- Name: template_invocation_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.template_invocation_events_id_seq OWNED BY public.template_invocation_events.id;


--
-- TOC entry 360 (class 1259 OID 17884)
-- Name: template_invocation_input_values; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.template_invocation_input_values (
    id integer NOT NULL,
    template_invocation_id integer NOT NULL,
    template_input_id integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.template_invocation_input_values OWNER TO foreman;

--
-- TOC entry 359 (class 1259 OID 17883)
-- Name: template_invocation_input_values_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.template_invocation_input_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_invocation_input_values_id_seq OWNER TO foreman;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 359
-- Name: template_invocation_input_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.template_invocation_input_values_id_seq OWNED BY public.template_invocation_input_values.id;


--
-- TOC entry 358 (class 1259 OID 17866)
-- Name: template_invocations; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.template_invocations (
    id integer NOT NULL,
    template_id integer NOT NULL,
    job_invocation_id integer NOT NULL,
    effective_user character varying(255),
    host_id integer,
    run_host_job_task_id uuid,
    smart_proxy_id bigint
);


ALTER TABLE public.template_invocations OWNER TO foreman;

--
-- TOC entry 357 (class 1259 OID 17865)
-- Name: template_invocations_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.template_invocations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_invocations_id_seq OWNER TO foreman;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 357
-- Name: template_invocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.template_invocations_id_seq OWNED BY public.template_invocations.id;


--
-- TOC entry 279 (class 1259 OID 16790)
-- Name: template_kinds; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.template_kinds (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text
);


ALTER TABLE public.template_kinds OWNER TO foreman;

--
-- TOC entry 278 (class 1259 OID 16789)
-- Name: template_kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.template_kinds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_kinds_id_seq OWNER TO foreman;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 278
-- Name: template_kinds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.template_kinds_id_seq OWNED BY public.template_kinds.id;


--
-- TOC entry 274 (class 1259 OID 16766)
-- Name: templates; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.templates (
    id integer NOT NULL,
    name character varying(255),
    template text,
    snippet boolean DEFAULT false NOT NULL,
    template_kind_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    locked boolean DEFAULT false,
    "default" boolean DEFAULT false,
    vendor character varying(255),
    type character varying,
    os_family character varying(255),
    job_category character varying(255) DEFAULT 'Miscellaneous'::character varying,
    provider_type character varying(255),
    description_format character varying(255),
    execution_timeout_interval integer,
    description text,
    ansible_callback_enabled boolean DEFAULT false,
    cloned_from_id bigint
);


ALTER TABLE public.templates OWNER TO foreman;

--
-- TOC entry 273 (class 1259 OID 16765)
-- Name: templates_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.templates_id_seq OWNER TO foreman;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 273
-- Name: templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.templates_id_seq OWNED BY public.templates.id;


--
-- TOC entry 305 (class 1259 OID 16983)
-- Name: tokens; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    value text,
    expires timestamp without time zone,
    host_id integer,
    type character varying DEFAULT 'Token::Build'::character varying NOT NULL
);


ALTER TABLE public.tokens OWNER TO foreman;

--
-- TOC entry 304 (class 1259 OID 16982)
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO foreman;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 304
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- TOC entry 402 (class 1259 OID 18490)
-- Name: upgrade_tasks; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.upgrade_tasks (
    id bigint NOT NULL,
    name character varying NOT NULL,
    task_name character varying NOT NULL,
    long_running boolean DEFAULT false NOT NULL,
    always_run boolean DEFAULT false NOT NULL,
    skip_failure boolean DEFAULT false NOT NULL,
    last_run_time timestamp without time zone,
    ordering integer DEFAULT 100 NOT NULL,
    subject character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.upgrade_tasks OWNER TO foreman;

--
-- TOC entry 401 (class 1259 OID 18489)
-- Name: upgrade_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.upgrade_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upgrade_tasks_id_seq OWNER TO foreman;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 401
-- Name: upgrade_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.upgrade_tasks_id_seq OWNED BY public.upgrade_tasks.id;


--
-- TOC entry 342 (class 1259 OID 17684)
-- Name: user_mail_notifications; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.user_mail_notifications (
    id integer NOT NULL,
    user_id integer,
    mail_notification_id integer,
    last_sent timestamp without time zone,
    "interval" character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    mail_query character varying(255)
);


ALTER TABLE public.user_mail_notifications OWNER TO foreman;

--
-- TOC entry 341 (class 1259 OID 17683)
-- Name: user_mail_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.user_mail_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_mail_notifications_id_seq OWNER TO foreman;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 341
-- Name: user_mail_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.user_mail_notifications_id_seq OWNED BY public.user_mail_notifications.id;


--
-- TOC entry 266 (class 1259 OID 16710)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.user_roles (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    role_id integer,
    owner_type character varying(255) DEFAULT 'User'::character varying NOT NULL
);


ALTER TABLE public.user_roles OWNER TO foreman;

--
-- TOC entry 265 (class 1259 OID 16709)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO foreman;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 265
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- TOC entry 261 (class 1259 OID 16674)
-- Name: usergroup_members; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.usergroup_members (
    id integer NOT NULL,
    member_type character varying,
    member_id integer,
    usergroup_id integer
);


ALTER TABLE public.usergroup_members OWNER TO foreman;

--
-- TOC entry 260 (class 1259 OID 16673)
-- Name: usergroup_members_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.usergroup_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usergroup_members_id_seq OWNER TO foreman;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 260
-- Name: usergroup_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.usergroup_members_id_seq OWNED BY public.usergroup_members.id;


--
-- TOC entry 259 (class 1259 OID 16667)
-- Name: usergroups; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.usergroups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean DEFAULT false NOT NULL
);


ALTER TABLE public.usergroups OWNER TO foreman;

--
-- TOC entry 258 (class 1259 OID 16666)
-- Name: usergroups_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.usergroups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usergroups_id_seq OWNER TO foreman;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 258
-- Name: usergroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.usergroups_id_seq OWNED BY public.usergroups.id;


--
-- TOC entry 251 (class 1259 OID 16626)
-- Name: users; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    mail character varying(255),
    admin boolean DEFAULT false NOT NULL,
    last_login_on timestamp without time zone,
    auth_source_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    password_hash character varying(128),
    password_salt character varying(128),
    locale character varying(5),
    avatar_hash character varying(128),
    default_organization_id integer,
    default_location_id integer,
    lower_login character varying(255),
    mail_enabled boolean DEFAULT false,
    timezone character varying(255),
    description text,
    disabled boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO foreman;

--
-- TOC entry 250 (class 1259 OID 16625)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO foreman;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 250
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 413 (class 1259 OID 18593)
-- Name: webhooks; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.webhooks (
    id bigint NOT NULL,
    name character varying NOT NULL,
    target_url character varying NOT NULL,
    events character varying[] NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    webhook_template_id bigint,
    http_method character varying DEFAULT 'POST'::character varying NOT NULL,
    http_content_type character varying DEFAULT 'application/json'::character varying NOT NULL,
    enabled boolean DEFAULT true,
    verify_ssl boolean DEFAULT true,
    ssl_ca_certs text,
    "user" character varying,
    password text,
    http_headers text,
    proxy_authorization boolean DEFAULT false NOT NULL
);


ALTER TABLE public.webhooks OWNER TO foreman;

--
-- TOC entry 412 (class 1259 OID 18592)
-- Name: webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhooks_id_seq OWNER TO foreman;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 412
-- Name: webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.webhooks_id_seq OWNED BY public.webhooks.id;


--
-- TOC entry 338 (class 1259 OID 17659)
-- Name: widgets; Type: TABLE; Schema: public; Owner: foreman
--

CREATE TABLE public.widgets (
    id integer NOT NULL,
    user_id integer,
    template character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    data text,
    sizex integer DEFAULT 4,
    sizey integer DEFAULT 1,
    col integer DEFAULT 1,
    "row" integer DEFAULT 1,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.widgets OWNER TO foreman;

--
-- TOC entry 337 (class 1259 OID 17658)
-- Name: widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: foreman
--

CREATE SEQUENCE public.widgets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.widgets_id_seq OWNER TO foreman;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 337
-- Name: widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foreman
--

ALTER SEQUENCE public.widgets_id_seq OWNED BY public.widgets.id;


--
-- TOC entry 3931 (class 2604 OID 18112)
-- Name: ansible_roles id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.ansible_roles ALTER COLUMN id SET DEFAULT nextval('public.ansible_roles_id_seq'::regclass);


--
-- TOC entry 3774 (class 2604 OID 16454)
-- Name: architectures id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.architectures ALTER COLUMN id SET DEFAULT nextval('public.architectures_id_seq'::regclass);


--
-- TOC entry 3772 (class 2604 OID 16440)
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- TOC entry 3798 (class 2604 OID 16579)
-- Name: auth_sources id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN id SET DEFAULT nextval('public.auth_sources_id_seq'::regclass);


--
-- TOC entry 3848 (class 2604 OID 16830)
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


--
-- TOC entry 3873 (class 2604 OID 17420)
-- Name: cached_user_roles id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.cached_user_roles ALTER COLUMN id SET DEFAULT nextval('public.cached_user_roles_id_seq'::regclass);


--
-- TOC entry 3874 (class 2604 OID 17430)
-- Name: cached_usergroup_members id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.cached_usergroup_members ALTER COLUMN id SET DEFAULT nextval('public.cached_usergroup_members_id_seq'::regclass);


--
-- TOC entry 3883 (class 2604 OID 17531)
-- Name: compute_attributes id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.compute_attributes ALTER COLUMN id SET DEFAULT nextval('public.compute_attributes_id_seq'::regclass);


--
-- TOC entry 3882 (class 2604 OID 17524)
-- Name: compute_profiles id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.compute_profiles ALTER COLUMN id SET DEFAULT nextval('public.compute_profiles_id_seq'::regclass);


--
-- TOC entry 3852 (class 2604 OID 16871)
-- Name: compute_resources id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.compute_resources ALTER COLUMN id SET DEFAULT nextval('public.compute_resources_id_seq'::regclass);


--
-- TOC entry 3885 (class 2604 OID 17597)
-- Name: config_group_classes id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.config_group_classes ALTER COLUMN id SET DEFAULT nextval('public.config_group_classes_id_seq'::regclass);


--
-- TOC entry 3884 (class 2604 OID 17590)
-- Name: config_groups id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.config_groups ALTER COLUMN id SET DEFAULT nextval('public.config_groups_id_seq'::regclass);


--
-- TOC entry 3902 (class 2604 OID 17721)
-- Name: discovery_attribute_sets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.discovery_attribute_sets ALTER COLUMN id SET DEFAULT nextval('public.discovery_attribute_sets_id_seq'::regclass);


--
-- TOC entry 3897 (class 2604 OID 17705)
-- Name: discovery_rules id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.discovery_rules ALTER COLUMN id SET DEFAULT nextval('public.discovery_rules_id_seq'::regclass);


--
-- TOC entry 3778 (class 2604 OID 16474)
-- Name: domains id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.domains ALTER COLUMN id SET DEFAULT nextval('public.domains_id_seq'::regclass);


--
-- TOC entry 3791 (class 2604 OID 16517)
-- Name: environment_classes id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.environment_classes ALTER COLUMN id SET DEFAULT nextval('public.environment_classes_id_seq'::regclass);


--
-- TOC entry 3790 (class 2604 OID 16510)
-- Name: environments id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.environments ALTER COLUMN id SET DEFAULT nextval('public.environments_id_seq'::regclass);


--
-- TOC entry 3887 (class 2604 OID 17611)
-- Name: external_usergroups id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.external_usergroups ALTER COLUMN id SET DEFAULT nextval('public.external_usergroups_id_seq'::regclass);


--
-- TOC entry 3768 (class 2604 OID 16415)
-- Name: fact_names id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.fact_names ALTER COLUMN id SET DEFAULT nextval('public.fact_names_id_seq'::regclass);


--
-- TOC entry 3771 (class 2604 OID 18269)
-- Name: fact_values id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.fact_values ALTER COLUMN id SET DEFAULT nextval('public.fact_values_id_seq'::regclass);


--
-- TOC entry 3846 (class 2604 OID 16818)
-- Name: features id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- TOC entry 3880 (class 2604 OID 17487)
-- Name: filterings id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.filterings ALTER COLUMN id SET DEFAULT nextval('public.filterings_id_seq'::regclass);


--
-- TOC entry 3878 (class 2604 OID 17478)
-- Name: filters id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.filters ALTER COLUMN id SET DEFAULT nextval('public.filters_id_seq'::regclass);


--
-- TOC entry 3927 (class 2604 OID 17994)
-- Name: foreign_input_sets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreign_input_sets ALTER COLUMN id SET DEFAULT nextval('public.foreign_input_sets_id_seq'::regclass);


--
-- TOC entry 3961 (class 2604 OID 18607)
-- Name: foreman_internals id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_internals ALTER COLUMN id SET DEFAULT nextval('public.foreman_internals_id_seq'::regclass);


--
-- TOC entry 3951 (class 2604 OID 18540)
-- Name: foreman_tasks_links id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_links ALTER COLUMN id SET DEFAULT nextval('public.foreman_tasks_links_id_seq'::regclass);


--
-- TOC entry 3881 (class 2604 OID 17509)
-- Name: foreman_tasks_locks id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_locks ALTER COLUMN id SET DEFAULT nextval('public.foreman_tasks_locks_id_seq'::regclass);


--
-- TOC entry 3921 (class 2604 OID 17922)
-- Name: foreman_tasks_recurring_logics id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_recurring_logics ALTER COLUMN id SET DEFAULT nextval('public.foreman_tasks_recurring_logics_id_seq'::regclass);


--
-- TOC entry 3943 (class 2604 OID 18378)
-- Name: foreman_tasks_remote_tasks id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_remote_tasks ALTER COLUMN id SET DEFAULT nextval('public.foreman_tasks_remote_tasks_id_seq'::regclass);


--
-- TOC entry 3924 (class 2604 OID 17943)
-- Name: foreman_tasks_task_group_members id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_task_group_members ALTER COLUMN id SET DEFAULT nextval('public.foreman_tasks_task_group_members_id_seq'::regclass);


--
-- TOC entry 3923 (class 2604 OID 17933)
-- Name: foreman_tasks_task_groups id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_task_groups ALTER COLUMN id SET DEFAULT nextval('public.foreman_tasks_task_groups_id_seq'::regclass);


--
-- TOC entry 3925 (class 2604 OID 17962)
-- Name: foreman_tasks_triggerings id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_triggerings ALTER COLUMN id SET DEFAULT nextval('public.foreman_tasks_triggerings_id_seq'::regclass);


--
-- TOC entry 3932 (class 2604 OID 18121)
-- Name: host_ansible_roles id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_ansible_roles ALTER COLUMN id SET DEFAULT nextval('public.host_ansible_roles_id_seq'::regclass);


--
-- TOC entry 3795 (class 2604 OID 16853)
-- Name: host_classes id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_classes ALTER COLUMN id SET DEFAULT nextval('public.host_classes_id_seq'::regclass);


--
-- TOC entry 3886 (class 2604 OID 17604)
-- Name: host_config_groups id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_config_groups ALTER COLUMN id SET DEFAULT nextval('public.host_config_groups_id_seq'::regclass);


--
-- TOC entry 3964 (class 2604 OID 18695)
-- Name: host_facets_infrastructure_facets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_facets_infrastructure_facets ALTER COLUMN id SET DEFAULT nextval('public.host_facets_infrastructure_facets_id_seq'::regclass);


--
-- TOC entry 3954 (class 2604 OID 18581)
-- Name: host_facets_reported_data_facets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_facets_reported_data_facets ALTER COLUMN id SET DEFAULT nextval('public.host_facets_reported_data_facets_id_seq'::regclass);


--
-- TOC entry 3967 (class 2604 OID 18733)
-- Name: host_proxy_invocations id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_proxy_invocations ALTER COLUMN id SET DEFAULT nextval('public.host_proxy_invocations_id_seq'::regclass);


--
-- TOC entry 3962 (class 2604 OID 18633)
-- Name: host_puppet_facets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_puppet_facets ALTER COLUMN id SET DEFAULT nextval('public.host_puppet_facets_id_seq'::regclass);


--
-- TOC entry 3907 (class 2604 OID 17784)
-- Name: host_status id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_status ALTER COLUMN id SET DEFAULT nextval('public.host_status_id_seq'::regclass);


--
-- TOC entry 3933 (class 2604 OID 18141)
-- Name: hostgroup_ansible_roles id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_ansible_roles ALTER COLUMN id SET DEFAULT nextval('public.hostgroup_ansible_roles_id_seq'::regclass);


--
-- TOC entry 3808 (class 2604 OID 16993)
-- Name: hostgroup_classes id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_classes ALTER COLUMN id SET DEFAULT nextval('public.hostgroup_classes_id_seq'::regclass);


--
-- TOC entry 3963 (class 2604 OID 18658)
-- Name: hostgroup_puppet_facets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_puppet_facets ALTER COLUMN id SET DEFAULT nextval('public.hostgroup_puppet_facets_id_seq'::regclass);


--
-- TOC entry 3806 (class 2604 OID 16592)
-- Name: hostgroups id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups ALTER COLUMN id SET DEFAULT nextval('public.hostgroups_id_seq'::regclass);


--
-- TOC entry 3761 (class 2604 OID 16404)
-- Name: hosts id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts ALTER COLUMN id SET DEFAULT nextval('public.hosts_id_seq'::regclass);


--
-- TOC entry 3941 (class 2604 OID 18327)
-- Name: http_proxies id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.http_proxies ALTER COLUMN id SET DEFAULT nextval('public.http_proxies_id_seq'::regclass);


--
-- TOC entry 3866 (class 2604 OID 16921)
-- Name: images id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- TOC entry 3966 (class 2604 OID 18722)
-- Name: invocation_provider_input_values id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.invocation_provider_input_values ALTER COLUMN id SET DEFAULT nextval('public.invocation_provider_input_values_id_seq'::regclass);


--
-- TOC entry 3917 (class 2604 OID 17856)
-- Name: job_invocations id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_invocations ALTER COLUMN id SET DEFAULT nextval('public.job_invocations_id_seq'::regclass);


--
-- TOC entry 3926 (class 2604 OID 17976)
-- Name: job_template_effective_users id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_template_effective_users ALTER COLUMN id SET DEFAULT nextval('public.job_template_effective_users_id_seq'::regclass);


--
-- TOC entry 3942 (class 2604 OID 18357)
-- Name: jwt_secrets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.jwt_secrets ALTER COLUMN id SET DEFAULT nextval('public.jwt_secrets_id_seq'::regclass);


--
-- TOC entry 3868 (class 2604 OID 16931)
-- Name: key_pairs id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.key_pairs ALTER COLUMN id SET DEFAULT nextval('public.key_pairs_id_seq'::regclass);


--
-- TOC entry 3834 (class 2604 OID 18245)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 3814 (class 2604 OID 16652)
-- Name: lookup_keys id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.lookup_keys ALTER COLUMN id SET DEFAULT nextval('public.lookup_keys_id_seq'::regclass);


--
-- TOC entry 3823 (class 2604 OID 16660)
-- Name: lookup_values id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.lookup_values ALTER COLUMN id SET DEFAULT nextval('public.lookup_values_id_seq'::regclass);


--
-- TOC entry 3893 (class 2604 OID 17677)
-- Name: mail_notifications id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.mail_notifications ALTER COLUMN id SET DEFAULT nextval('public.mail_notifications_id_seq'::regclass);


--
-- TOC entry 3775 (class 2604 OID 16465)
-- Name: media id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- TOC entry 3832 (class 2604 OID 16739)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 3789 (class 2604 OID 16501)
-- Name: models id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.models ALTER COLUMN id SET DEFAULT nextval('public.models_id_seq'::regclass);


--
-- TOC entry 3854 (class 2604 OID 16880)
-- Name: nics id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.nics ALTER COLUMN id SET DEFAULT nextval('public.nics_id_seq'::regclass);


--
-- TOC entry 3934 (class 2604 OID 18159)
-- Name: notification_blueprints id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notification_blueprints ALTER COLUMN id SET DEFAULT nextval('public.notification_blueprints_id_seq'::regclass);


--
-- TOC entry 3936 (class 2604 OID 18190)
-- Name: notification_recipients id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notification_recipients ALTER COLUMN id SET DEFAULT nextval('public.notification_recipients_id_seq'::regclass);


--
-- TOC entry 3935 (class 2604 OID 18169)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 3785 (class 2604 OID 16493)
-- Name: operatingsystems id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.operatingsystems ALTER COLUMN id SET DEFAULT nextval('public.operatingsystems_id_seq'::regclass);


--
-- TOC entry 3843 (class 2604 OID 16800)
-- Name: os_default_templates id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.os_default_templates ALTER COLUMN id SET DEFAULT nextval('public.os_default_templates_id_seq'::regclass);


--
-- TOC entry 3796 (class 2604 OID 16570)
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- TOC entry 3877 (class 2604 OID 17468)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3939 (class 2604 OID 18310)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3794 (class 2604 OID 16550)
-- Name: puppetclasses id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.puppetclasses ALTER COLUMN id SET DEFAULT nextval('public.puppetclasses_id_seq'::regclass);


--
-- TOC entry 3875 (class 2604 OID 17439)
-- Name: realms id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.realms ALTER COLUMN id SET DEFAULT nextval('public.realms_id_seq'::regclass);


--
-- TOC entry 3953 (class 2604 OID 18563)
-- Name: registration_facets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.registration_facets ALTER COLUMN id SET DEFAULT nextval('public.registration_facets_id_seq'::regclass);


--
-- TOC entry 3929 (class 2604 OID 18020)
-- Name: remote_execution_features id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.remote_execution_features ALTER COLUMN id SET DEFAULT nextval('public.remote_execution_features_id_seq'::regclass);


--
-- TOC entry 3793 (class 2604 OID 18256)
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- TOC entry 3828 (class 2604 OID 16704)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3813 (class 2604 OID 18613)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 3850 (class 2604 OID 16846)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 3844 (class 2604 OID 16807)
-- Name: smart_proxies id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.smart_proxies ALTER COLUMN id SET DEFAULT nextval('public.smart_proxies_id_seq'::regclass);


--
-- TOC entry 3847 (class 2604 OID 18504)
-- Name: smart_proxy_features id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.smart_proxy_features ALTER COLUMN id SET DEFAULT nextval('public.smart_proxy_features_id_seq'::regclass);


--
-- TOC entry 3833 (class 2604 OID 16749)
-- Name: sources id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.sources ALTER COLUMN id SET DEFAULT nextval('public.sources_id_seq'::regclass);


--
-- TOC entry 3938 (class 2604 OID 18290)
-- Name: ssh_keys id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.ssh_keys ALTER COLUMN id SET DEFAULT nextval('public.ssh_keys_id_seq'::regclass);


--
-- TOC entry 3952 (class 2604 OID 18553)
-- Name: stored_values id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.stored_values ALTER COLUMN id SET DEFAULT nextval('public.stored_values_id_seq'::regclass);


--
-- TOC entry 3851 (class 2604 OID 16864)
-- Name: subnet_domains id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnet_domains ALTER COLUMN id SET DEFAULT nextval('public.subnet_domains_id_seq'::regclass);


--
-- TOC entry 3780 (class 2604 OID 16484)
-- Name: subnets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnets ALTER COLUMN id SET DEFAULT nextval('public.subnets_id_seq'::regclass);


--
-- TOC entry 3945 (class 2604 OID 18389)
-- Name: table_preferences id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.table_preferences ALTER COLUMN id SET DEFAULT nextval('public.table_preferences_id_seq'::regclass);


--
-- TOC entry 3920 (class 2604 OID 17912)
-- Name: target_remote_execution_proxies id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.target_remote_execution_proxies ALTER COLUMN id SET DEFAULT nextval('public.target_remote_execution_proxies_id_seq'::regclass);


--
-- TOC entry 3916 (class 2604 OID 17838)
-- Name: targeting_hosts id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.targeting_hosts ALTER COLUMN id SET DEFAULT nextval('public.targeting_hosts_id_seq'::regclass);


--
-- TOC entry 3914 (class 2604 OID 17817)
-- Name: targetings id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.targetings ALTER COLUMN id SET DEFAULT nextval('public.targetings_id_seq'::regclass);


--
-- TOC entry 3872 (class 2604 OID 17009)
-- Name: taxable_taxonomies id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.taxable_taxonomies ALTER COLUMN id SET DEFAULT nextval('public.taxable_taxonomies_id_seq'::regclass);


--
-- TOC entry 3869 (class 2604 OID 16945)
-- Name: taxonomies id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.taxonomies ALTER COLUMN id SET DEFAULT nextval('public.taxonomies_id_seq'::regclass);


--
-- TOC entry 3841 (class 2604 OID 16778)
-- Name: template_combinations id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_combinations ALTER COLUMN id SET DEFAULT nextval('public.template_combinations_id_seq'::regclass);


--
-- TOC entry 3909 (class 2604 OID 17799)
-- Name: template_inputs id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_inputs ALTER COLUMN id SET DEFAULT nextval('public.template_inputs_id_seq'::regclass);


--
-- TOC entry 3968 (class 2604 OID 18747)
-- Name: template_invocation_events id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocation_events ALTER COLUMN id SET DEFAULT nextval('public.template_invocation_events_id_seq'::regclass);


--
-- TOC entry 3919 (class 2604 OID 17887)
-- Name: template_invocation_input_values id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocation_input_values ALTER COLUMN id SET DEFAULT nextval('public.template_invocation_input_values_id_seq'::regclass);


--
-- TOC entry 3918 (class 2604 OID 17869)
-- Name: template_invocations id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocations ALTER COLUMN id SET DEFAULT nextval('public.template_invocations_id_seq'::regclass);


--
-- TOC entry 3842 (class 2604 OID 16793)
-- Name: template_kinds id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_kinds ALTER COLUMN id SET DEFAULT nextval('public.template_kinds_id_seq'::regclass);


--
-- TOC entry 3835 (class 2604 OID 16769)
-- Name: templates id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.templates ALTER COLUMN id SET DEFAULT nextval('public.templates_id_seq'::regclass);


--
-- TOC entry 3870 (class 2604 OID 16986)
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- TOC entry 3946 (class 2604 OID 18493)
-- Name: upgrade_tasks id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.upgrade_tasks ALTER COLUMN id SET DEFAULT nextval('public.upgrade_tasks_id_seq'::regclass);


--
-- TOC entry 3896 (class 2604 OID 17687)
-- Name: user_mail_notifications id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.user_mail_notifications ALTER COLUMN id SET DEFAULT nextval('public.user_mail_notifications_id_seq'::regclass);


--
-- TOC entry 3830 (class 2604 OID 16713)
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- TOC entry 3827 (class 2604 OID 16677)
-- Name: usergroup_members id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.usergroup_members ALTER COLUMN id SET DEFAULT nextval('public.usergroup_members_id_seq'::regclass);


--
-- TOC entry 3825 (class 2604 OID 16670)
-- Name: usergroups id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.usergroups ALTER COLUMN id SET DEFAULT nextval('public.usergroups_id_seq'::regclass);


--
-- TOC entry 3809 (class 2604 OID 16629)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3955 (class 2604 OID 18596)
-- Name: webhooks id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.webhooks ALTER COLUMN id SET DEFAULT nextval('public.webhooks_id_seq'::regclass);


--
-- TOC entry 3888 (class 2604 OID 17662)
-- Name: widgets id; Type: DEFAULT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.widgets ALTER COLUMN id SET DEFAULT nextval('public.widgets_id_seq'::regclass);


--
-- TOC entry 4820 (class 0 OID 18109)
-- Dependencies: 378
-- Data for Name: ansible_roles; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.ansible_roles (id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4652 (class 0 OID 16393)
-- Dependencies: 210
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2025-01-19 19:42:24.71007	2025-01-19 19:42:24.71007
\.


--
-- TOC entry 4662 (class 0 OID 16451)
-- Dependencies: 220
-- Data for Name: architectures; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.architectures (id, name, created_at, updated_at) FROM stdin;
1	x86_64	2025-01-19 19:42:37.219815	2025-01-19 19:42:37.219815
\.


--
-- TOC entry 4663 (class 0 OID 16458)
-- Dependencies: 221
-- Data for Name: architectures_operatingsystems; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.architectures_operatingsystems (architecture_id, operatingsystem_id) FROM stdin;
\.


--
-- TOC entry 4660 (class 0 OID 16437)
-- Dependencies: 218
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.audits (id, auditable_id, auditable_type, user_id, user_type, username, action, audited_changes, version, comment, associated_id, associated_type, request_uuid, created_at, remote_address, auditable_name, associated_name) FROM stdin;
1	1	Setting	\N	\N	\N	create	---\nvalue: "--- 10"\n	1	\N	\N	\N	cb129435-873e-4954-9925-e04ff7147ab3	2025-01-19 19:42:35.965714	\N	bcrypt_cost	\N
2	2	Setting	1	\N	Anonymous Admin	create	---\nvalue: "--- Optimum"\n	1	\N	\N	\N	6797338f-efa8-43e6-864c-64595553f3f3	2025-01-19 19:42:37.176448	\N	default_organization	\N
3	3	Setting	1	\N	Anonymous Admin	create	---\nvalue: "--- Moscow"\n	1	\N	\N	\N	500d5c27-06be-4188-9903-c3c59427ab48	2025-01-19 19:42:37.213968	\N	default_location	\N
4	4	Setting	1	\N	Anonymous Admin	create	---\nvalue: "--- 25b18dc3-a882-4d1c-b3bf-021a8d639540"\n	1	\N	\N	\N	736613b7-252c-4640-8b08-b1bd4074a0f0	2025-01-19 19:42:38.964357	\N	instance_id	\N
5	145	Filter	1	\N	Anonymous Admin	create	---\nsearch: owner.id = current_user\nrole_id: 1\ntaxonomy_search: \noverride: false\norganization_ids: []\nlocation_ids: []\n	1	\N	1	Role	4c86e5cc-c09e-4130-8203-31e0afbacea0	2025-01-19 19:42:39.118033	\N		Default role
6	146	Filter	1	\N	Anonymous Admin	create	---\nsearch: user = current_user\nrole_id: 1\ntaxonomy_search: \noverride: false\norganization_ids: []\nlocation_ids: []\n	1	\N	1	Role	9367f862-f1f9-43aa-9e9f-8d4403580ea7	2025-01-19 19:42:39.130009	\N		Default role
7	1	RemoteExecutionFeature	1	\N	Anonymous Admin	update	---\njob_template_id:\n- \n- 170\n	1	\N	\N	\N	dc71a9c5-d4bd-4321-92ee-b91818b45808	2025-01-19 19:42:39.258524	\N	Run Puppet Once	\N
8	2	RemoteExecutionFeature	1	\N	Anonymous Admin	update	---\njob_template_id:\n- \n- 171\n	1	\N	\N	\N	f6d5688b-b071-4426-9a94-757bda0b95f5	2025-01-19 19:42:39.277008	\N	Run Script	\N
9	5	Setting	\N	\N	\N	create	---\nvalue: "--- false"\n	1	\N	\N	\N	f9c86ad8-79ce-4111-a049-952f615f6858	2025-01-19 19:42:39.608979	\N	db_pending_seed	\N
\.


--
-- TOC entry 4688 (class 0 OID 16576)
-- Dependencies: 246
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.auth_sources (id, type, name, host, port, account, account_password, base_dn, attr_login, attr_firstname, attr_lastname, attr_mail, onthefly_register, tls, created_at, updated_at, ldap_filter, attr_photo, server_type, groups_base, usergroup_sync, use_netgroups) FROM stdin;
1	AuthSourceInternal	Internal	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	2025-01-19 19:42:35.986641	2025-01-19 19:42:35.986641	\N	\N	posix	\N	t	f
2	AuthSourceHidden	Hidden	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	2025-01-19 19:42:36.020127	2025-01-19 19:42:36.020127	\N	\N	posix	\N	t	f
3	AuthSourceExternal	External	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	f	2025-01-19 19:42:36.03033	2025-01-19 19:42:36.03033	\N	\N	posix	\N	t	f
\.


--
-- TOC entry 4730 (class 0 OID 16827)
-- Dependencies: 288
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.bookmarks (id, name, query, controller, public, owner_id, owner_type) FROM stdin;
1	eventful	eventful = true	config_reports	t	1	User
2	active	last_report > "35 minutes ago" and (status.applied > 0 or status.restarted > 0)	hosts	t	1	User
3	out of sync	last_report < "30 minutes ago" and status.enabled = true	hosts	t	1	User
4	error	last_report > "35 minutes ago" and (status.failed > 0 or status.failed_restarts > 0 or status.skipped > 0)	hosts	t	1	User
5	disabled	status.enabled = false	hosts	t	1	User
6	ok hosts	last_report > "35 minutes ago" and status.enabled = true and status.applied = 0 and status.failed = 0 and status.pending = 0	hosts	t	1	User
7	running	state = running	foreman_tasks_tasks	t	1	User
8	failed	state = paused or result = error or result = warning	foreman_tasks_tasks	t	1	User
9	failed	status = failed	job_invocations	t	1	User
10	succeeded	status = succeeded	job_invocations	t	1	User
11	running	status = running	job_invocations	t	1	User
12	pending	status = queued or status = running	job_invocations	t	1	User
13	recurring	recurring = true	job_invocations	t	1	User
14	recent	started_at > "24 hours ago"	job_invocations	t	1	User
\.


--
-- TOC entry 4753 (class 0 OID 17417)
-- Dependencies: 311
-- Data for Name: cached_user_roles; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.cached_user_roles (id, user_id, role_id, user_role_id, created_at, updated_at) FROM stdin;
1	1	1	1	2025-01-19 19:42:36.257269	2025-01-19 19:42:36.257269
2	2	1	2	2025-01-19 19:42:36.276894	2025-01-19 19:42:36.276894
3	3	1	3	2025-01-19 19:42:36.295871	2025-01-19 19:42:36.295871
4	4	1	4	2025-01-19 19:42:36.419879	2025-01-19 19:42:36.419879
\.


--
-- TOC entry 4755 (class 0 OID 17427)
-- Dependencies: 313
-- Data for Name: cached_usergroup_members; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.cached_usergroup_members (id, user_id, usergroup_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4770 (class 0 OID 17528)
-- Dependencies: 328
-- Data for Name: compute_attributes; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.compute_attributes (id, compute_profile_id, compute_resource_id, name, vm_attrs, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4768 (class 0 OID 17521)
-- Dependencies: 326
-- Data for Name: compute_profiles; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.compute_profiles (id, name, created_at, updated_at) FROM stdin;
1	1-Small	2025-01-19 19:42:38.897181	2025-01-19 19:42:38.897181
2	2-Medium	2025-01-19 19:42:38.898651	2025-01-19 19:42:38.898651
3	3-Large	2025-01-19 19:42:38.90001	2025-01-19 19:42:38.90001
\.


--
-- TOC entry 4737 (class 0 OID 16868)
-- Dependencies: 295
-- Data for Name: compute_resources; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.compute_resources (id, name, description, url, "user", password, uuid, type, created_at, updated_at, attrs, caching_enabled, domain, http_proxy_id) FROM stdin;
\.


--
-- TOC entry 4774 (class 0 OID 17594)
-- Dependencies: 332
-- Data for Name: config_group_classes; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.config_group_classes (id, puppetclass_id, config_group_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4772 (class 0 OID 17587)
-- Dependencies: 330
-- Data for Name: config_groups; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.config_groups (id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4788 (class 0 OID 17718)
-- Dependencies: 346
-- Data for Name: discovery_attribute_sets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.discovery_attribute_sets (id, host_id, memory, cpu_count, disk_count, disks_size, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4786 (class 0 OID 17702)
-- Dependencies: 344
-- Data for Name: discovery_rules; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.discovery_rules (id, name, search, hostgroup_id, hostname, max_count, priority, enabled, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4667 (class 0 OID 16471)
-- Dependencies: 225
-- Data for Name: domains; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.domains (id, name, fullname, created_at, updated_at, dns_id) FROM stdin;
\.


--
-- TOC entry 4872 (class 0 OID 18791)
-- Dependencies: 430
-- Data for Name: dynflow_actions; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.dynflow_actions (execution_plan_uuid, id, caller_execution_plan_id, caller_action_id, class, plan_step_id, run_step_id, finalize_step_id, data, input, output) FROM stdin;
\.


--
-- TOC entry 4874 (class 0 OID 18826)
-- Dependencies: 432
-- Data for Name: dynflow_coordinator_records; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.dynflow_coordinator_records (id, class, owner_id, data) FROM stdin;
\.


--
-- TOC entry 4877 (class 0 OID 18844)
-- Dependencies: 435
-- Data for Name: dynflow_delayed_plans; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.dynflow_delayed_plans (execution_plan_uuid, start_at, start_before, args_serializer, frozen, serialized_args, data) FROM stdin;
\.


--
-- TOC entry 4876 (class 0 OID 18836)
-- Dependencies: 434
-- Data for Name: dynflow_envelopes; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.dynflow_envelopes (id, receiver_id, data) FROM stdin;
\.


--
-- TOC entry 4871 (class 0 OID 18783)
-- Dependencies: 429
-- Data for Name: dynflow_execution_plans; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.dynflow_execution_plans (uuid, state, result, started_at, ended_at, real_time, execution_time, label, class, root_plan_step_id, run_flow, finalize_flow, execution_history, step_ids, data) FROM stdin;
\.


--
-- TOC entry 4879 (class 0 OID 18922)
-- Dependencies: 437
-- Data for Name: dynflow_output_chunks; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.dynflow_output_chunks (id, execution_plan_uuid, action_id, kind, "timestamp", chunk) FROM stdin;
\.


--
-- TOC entry 4870 (class 0 OID 18779)
-- Dependencies: 428
-- Data for Name: dynflow_schema_info; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.dynflow_schema_info (version) FROM stdin;
24
\.


--
-- TOC entry 4873 (class 0 OID 18805)
-- Dependencies: 431
-- Data for Name: dynflow_steps; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.dynflow_steps (execution_plan_uuid, id, action_id, state, started_at, ended_at, real_time, execution_time, progress_done, progress_weight, class, action_class, queue, error, children, data) FROM stdin;
\.


--
-- TOC entry 4677 (class 0 OID 16514)
-- Dependencies: 235
-- Data for Name: environment_classes; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.environment_classes (id, puppetclass_id, environment_id, puppetclass_lookup_key_id) FROM stdin;
\.


--
-- TOC entry 4675 (class 0 OID 16507)
-- Dependencies: 233
-- Data for Name: environments; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.environments (id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4778 (class 0 OID 17608)
-- Dependencies: 336
-- Data for Name: external_usergroups; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.external_usergroups (id, name, auth_source_id, usergroup_id) FROM stdin;
\.


--
-- TOC entry 4656 (class 0 OID 16412)
-- Dependencies: 214
-- Data for Name: fact_names; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.fact_names (id, name, updated_at, created_at, compose, short_name, type, ancestry) FROM stdin;
\.


--
-- TOC entry 4658 (class 0 OID 16420)
-- Dependencies: 216
-- Data for Name: fact_values; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.fact_values (id, value, fact_name_id, host_id, updated_at, created_at) FROM stdin;
\.


--
-- TOC entry 4727 (class 0 OID 16815)
-- Dependencies: 285
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.features (id, name, created_at, updated_at) FROM stdin;
1	Templates	2025-01-19 19:42:38.881135	2025-01-19 19:42:38.881135
2	TFTP	2025-01-19 19:42:38.882168	2025-01-19 19:42:38.882168
3	DNS	2025-01-19 19:42:38.883054	2025-01-19 19:42:38.883054
4	DHCP	2025-01-19 19:42:38.884021	2025-01-19 19:42:38.884021
5	Puppet CA	2025-01-19 19:42:38.884874	2025-01-19 19:42:38.884874
6	BMC	2025-01-19 19:42:38.885719	2025-01-19 19:42:38.885719
7	Realm	2025-01-19 19:42:38.886641	2025-01-19 19:42:38.886641
8	Facts	2025-01-19 19:42:38.887469	2025-01-19 19:42:38.887469
9	Logs	2025-01-19 19:42:38.888296	2025-01-19 19:42:38.888296
10	HTTPBoot	2025-01-19 19:42:38.889249	2025-01-19 19:42:38.889249
11	External IPAM	2025-01-19 19:42:38.890067	2025-01-19 19:42:38.890067
12	Registration	2025-01-19 19:42:38.890898	2025-01-19 19:42:38.890898
13	Puppet	2025-01-19 19:42:38.892733	2025-01-19 19:42:38.892733
14	Dynflow	2025-01-19 19:42:39.141279	2025-01-19 19:42:39.141279
15	SSH	2025-01-19 19:42:39.14315	2025-01-19 19:42:39.14315
16	Script	2025-01-19 19:42:39.144012	2025-01-19 19:42:39.144012
17	Discovery	2025-01-19 19:42:39.145828	2025-01-19 19:42:39.145828
18	Ansible	2025-01-19 19:42:39.153874	2025-01-19 19:42:39.153874
19	Shellhooks	2025-01-19 19:42:39.155627	2025-01-19 19:42:39.155627
\.


--
-- TOC entry 4763 (class 0 OID 17484)
-- Dependencies: 321
-- Data for Name: filterings; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.filterings (id, filter_id, permission_id, created_at, updated_at) FROM stdin;
1	1	31	2025-01-19 19:42:36.445442	2025-01-19 19:42:36.445442
2	1	33	2025-01-19 19:42:36.446175	2025-01-19 19:42:36.446175
3	1	124	2025-01-19 19:42:36.44656	2025-01-19 19:42:36.44656
4	1	125	2025-01-19 19:42:36.446925	2025-01-19 19:42:36.446925
5	1	126	2025-01-19 19:42:36.447283	2025-01-19 19:42:36.447283
6	1	127	2025-01-19 19:42:36.447637	2025-01-19 19:42:36.447637
7	1	128	2025-01-19 19:42:36.447989	2025-01-19 19:42:36.447989
8	1	129	2025-01-19 19:42:36.448317	2025-01-19 19:42:36.448317
9	1	130	2025-01-19 19:42:36.448637	2025-01-19 19:42:36.448637
10	2	32	2025-01-19 19:42:36.451946	2025-01-19 19:42:36.451946
11	2	34	2025-01-19 19:42:36.452409	2025-01-19 19:42:36.452409
12	2	122	2025-01-19 19:42:36.45274	2025-01-19 19:42:36.45274
13	2	123	2025-01-19 19:42:36.453064	2025-01-19 19:42:36.453064
14	3	76	2025-01-19 19:42:36.455377	2025-01-19 19:42:36.455377
15	3	77	2025-01-19 19:42:36.455714	2025-01-19 19:42:36.455714
16	3	78	2025-01-19 19:42:36.45604	2025-01-19 19:42:36.45604
17	3	79	2025-01-19 19:42:36.45636	2025-01-19 19:42:36.45636
18	4	80	2025-01-19 19:42:36.458422	2025-01-19 19:42:36.458422
19	5	81	2025-01-19 19:42:36.461647	2025-01-19 19:42:36.461647
20	5	82	2025-01-19 19:42:36.461997	2025-01-19 19:42:36.461997
21	5	83	2025-01-19 19:42:36.462332	2025-01-19 19:42:36.462332
22	5	84	2025-01-19 19:42:36.462663	2025-01-19 19:42:36.462663
23	6	85	2025-01-19 19:42:36.464819	2025-01-19 19:42:36.464819
24	6	86	2025-01-19 19:42:36.465157	2025-01-19 19:42:36.465157
25	6	87	2025-01-19 19:42:36.465479	2025-01-19 19:42:36.465479
26	7	88	2025-01-19 19:42:36.467854	2025-01-19 19:42:36.467854
27	7	89	2025-01-19 19:42:36.468188	2025-01-19 19:42:36.468188
28	7	90	2025-01-19 19:42:36.468514	2025-01-19 19:42:36.468514
29	7	91	2025-01-19 19:42:36.468836	2025-01-19 19:42:36.468836
30	8	92	2025-01-19 19:42:36.472908	2025-01-19 19:42:36.472908
31	8	93	2025-01-19 19:42:36.473252	2025-01-19 19:42:36.473252
32	8	94	2025-01-19 19:42:36.473581	2025-01-19 19:42:36.473581
33	8	95	2025-01-19 19:42:36.473901	2025-01-19 19:42:36.473901
34	8	96	2025-01-19 19:42:36.474219	2025-01-19 19:42:36.474219
35	8	97	2025-01-19 19:42:36.474556	2025-01-19 19:42:36.474556
36	8	98	2025-01-19 19:42:36.474876	2025-01-19 19:42:36.474876
37	8	99	2025-01-19 19:42:36.475196	2025-01-19 19:42:36.475196
38	8	100	2025-01-19 19:42:36.475617	2025-01-19 19:42:36.475617
39	8	101	2025-01-19 19:42:36.475944	2025-01-19 19:42:36.475944
40	8	102	2025-01-19 19:42:36.476267	2025-01-19 19:42:36.476267
41	8	103	2025-01-19 19:42:36.476586	2025-01-19 19:42:36.476586
42	9	104	2025-01-19 19:42:36.47877	2025-01-19 19:42:36.47877
43	9	105	2025-01-19 19:42:36.479103	2025-01-19 19:42:36.479103
44	9	106	2025-01-19 19:42:36.479426	2025-01-19 19:42:36.479426
45	10	107	2025-01-19 19:42:36.481685	2025-01-19 19:42:36.481685
46	10	193	2025-01-19 19:42:36.482021	2025-01-19 19:42:36.482021
47	10	231	2025-01-19 19:42:36.482364	2025-01-19 19:42:36.482364
48	11	108	2025-01-19 19:42:36.485537	2025-01-19 19:42:36.485537
49	11	109	2025-01-19 19:42:36.485874	2025-01-19 19:42:36.485874
50	11	110	2025-01-19 19:42:36.486201	2025-01-19 19:42:36.486201
51	11	111	2025-01-19 19:42:36.486545	2025-01-19 19:42:36.486545
52	12	112	2025-01-19 19:42:36.490112	2025-01-19 19:42:36.490112
53	12	113	2025-01-19 19:42:36.490462	2025-01-19 19:42:36.490462
54	12	114	2025-01-19 19:42:36.490798	2025-01-19 19:42:36.490798
55	12	115	2025-01-19 19:42:36.491127	2025-01-19 19:42:36.491127
56	13	116	2025-01-19 19:42:36.494145	2025-01-19 19:42:36.494145
57	13	117	2025-01-19 19:42:36.494493	2025-01-19 19:42:36.494493
58	14	118	2025-01-19 19:42:36.496517	2025-01-19 19:42:36.496517
59	15	131	2025-01-19 19:42:36.502803	2025-01-19 19:42:36.502803
60	15	132	2025-01-19 19:42:36.503155	2025-01-19 19:42:36.503155
61	15	133	2025-01-19 19:42:36.503482	2025-01-19 19:42:36.503482
62	15	134	2025-01-19 19:42:36.503806	2025-01-19 19:42:36.503806
63	16	135	2025-01-19 19:42:36.506056	2025-01-19 19:42:36.506056
64	16	136	2025-01-19 19:42:36.506401	2025-01-19 19:42:36.506401
65	16	137	2025-01-19 19:42:36.506733	2025-01-19 19:42:36.506733
66	16	138	2025-01-19 19:42:36.507055	2025-01-19 19:42:36.507055
67	17	139	2025-01-19 19:42:36.510457	2025-01-19 19:42:36.510457
68	17	140	2025-01-19 19:42:36.510797	2025-01-19 19:42:36.510797
69	18	141	2025-01-19 19:42:36.513659	2025-01-19 19:42:36.513659
70	18	142	2025-01-19 19:42:36.513992	2025-01-19 19:42:36.513992
71	18	143	2025-01-19 19:42:36.514315	2025-01-19 19:42:36.514315
72	18	144	2025-01-19 19:42:36.514654	2025-01-19 19:42:36.514654
73	18	145	2025-01-19 19:42:36.51498	2025-01-19 19:42:36.51498
74	19	146	2025-01-19 19:42:36.517305	2025-01-19 19:42:36.517305
75	19	147	2025-01-19 19:42:36.517642	2025-01-19 19:42:36.517642
76	19	148	2025-01-19 19:42:36.517963	2025-01-19 19:42:36.517963
77	19	149	2025-01-19 19:42:36.518281	2025-01-19 19:42:36.518281
78	20	150	2025-01-19 19:42:36.52192	2025-01-19 19:42:36.52192
79	20	151	2025-01-19 19:42:36.522262	2025-01-19 19:42:36.522262
80	21	152	2025-01-19 19:42:36.525499	2025-01-19 19:42:36.525499
81	21	153	2025-01-19 19:42:36.525837	2025-01-19 19:42:36.525837
82	21	154	2025-01-19 19:42:36.526266	2025-01-19 19:42:36.526266
83	21	155	2025-01-19 19:42:36.52663	2025-01-19 19:42:36.52663
84	22	156	2025-01-19 19:42:36.528953	2025-01-19 19:42:36.528953
85	22	157	2025-01-19 19:42:36.529286	2025-01-19 19:42:36.529286
86	22	158	2025-01-19 19:42:36.529609	2025-01-19 19:42:36.529609
87	22	159	2025-01-19 19:42:36.529929	2025-01-19 19:42:36.529929
88	23	160	2025-01-19 19:42:36.532278	2025-01-19 19:42:36.532278
89	23	161	2025-01-19 19:42:36.532614	2025-01-19 19:42:36.532614
90	23	162	2025-01-19 19:42:36.53294	2025-01-19 19:42:36.53294
91	23	163	2025-01-19 19:42:36.533262	2025-01-19 19:42:36.533262
92	24	164	2025-01-19 19:42:36.536173	2025-01-19 19:42:36.536173
93	24	165	2025-01-19 19:42:36.536512	2025-01-19 19:42:36.536512
94	24	166	2025-01-19 19:42:36.536836	2025-01-19 19:42:36.536836
95	24	167	2025-01-19 19:42:36.537162	2025-01-19 19:42:36.537162
96	24	168	2025-01-19 19:42:36.537487	2025-01-19 19:42:36.537487
97	25	169	2025-01-19 19:42:36.53973	2025-01-19 19:42:36.53973
98	25	170	2025-01-19 19:42:36.540065	2025-01-19 19:42:36.540065
99	25	171	2025-01-19 19:42:36.540471	2025-01-19 19:42:36.540471
100	25	172	2025-01-19 19:42:36.540795	2025-01-19 19:42:36.540795
101	26	173	2025-01-19 19:42:36.542937	2025-01-19 19:42:36.542937
102	26	174	2025-01-19 19:42:36.543268	2025-01-19 19:42:36.543268
103	26	175	2025-01-19 19:42:36.543596	2025-01-19 19:42:36.543596
104	27	176	2025-01-19 19:42:36.546844	2025-01-19 19:42:36.546844
105	27	177	2025-01-19 19:42:36.547178	2025-01-19 19:42:36.547178
106	27	178	2025-01-19 19:42:36.547506	2025-01-19 19:42:36.547506
107	27	179	2025-01-19 19:42:36.547898	2025-01-19 19:42:36.547898
108	27	180	2025-01-19 19:42:36.548218	2025-01-19 19:42:36.548218
109	28	181	2025-01-19 19:42:36.551547	2025-01-19 19:42:36.551547
110	28	182	2025-01-19 19:42:36.551883	2025-01-19 19:42:36.551883
111	28	183	2025-01-19 19:42:36.552206	2025-01-19 19:42:36.552206
112	28	184	2025-01-19 19:42:36.552525	2025-01-19 19:42:36.552525
113	28	185	2025-01-19 19:42:36.552843	2025-01-19 19:42:36.552843
114	28	186	2025-01-19 19:42:36.553163	2025-01-19 19:42:36.553163
115	29	187	2025-01-19 19:42:36.559074	2025-01-19 19:42:36.559074
116	29	188	2025-01-19 19:42:36.559418	2025-01-19 19:42:36.559418
117	29	189	2025-01-19 19:42:36.559829	2025-01-19 19:42:36.559829
118	29	190	2025-01-19 19:42:36.560153	2025-01-19 19:42:36.560153
119	29	191	2025-01-19 19:42:36.560477	2025-01-19 19:42:36.560477
120	29	192	2025-01-19 19:42:36.560796	2025-01-19 19:42:36.560796
121	30	194	2025-01-19 19:42:36.563985	2025-01-19 19:42:36.563985
122	30	195	2025-01-19 19:42:36.56432	2025-01-19 19:42:36.56432
123	30	196	2025-01-19 19:42:36.564645	2025-01-19 19:42:36.564645
124	30	197	2025-01-19 19:42:36.564965	2025-01-19 19:42:36.564965
125	31	198	2025-01-19 19:42:36.56691	2025-01-19 19:42:36.56691
126	32	203	2025-01-19 19:42:36.569004	2025-01-19 19:42:36.569004
127	32	204	2025-01-19 19:42:36.569334	2025-01-19 19:42:36.569334
128	33	205	2025-01-19 19:42:36.573164	2025-01-19 19:42:36.573164
129	33	206	2025-01-19 19:42:36.573504	2025-01-19 19:42:36.573504
130	33	207	2025-01-19 19:42:36.573828	2025-01-19 19:42:36.573828
131	33	208	2025-01-19 19:42:36.574149	2025-01-19 19:42:36.574149
132	33	209	2025-01-19 19:42:36.574478	2025-01-19 19:42:36.574478
133	33	210	2025-01-19 19:42:36.5748	2025-01-19 19:42:36.5748
134	33	211	2025-01-19 19:42:36.575122	2025-01-19 19:42:36.575122
135	33	212	2025-01-19 19:42:36.575439	2025-01-19 19:42:36.575439
136	33	213	2025-01-19 19:42:36.575835	2025-01-19 19:42:36.575835
137	33	214	2025-01-19 19:42:36.576154	2025-01-19 19:42:36.576154
138	34	215	2025-01-19 19:42:36.578425	2025-01-19 19:42:36.578425
139	34	216	2025-01-19 19:42:36.578764	2025-01-19 19:42:36.578764
140	34	217	2025-01-19 19:42:36.579089	2025-01-19 19:42:36.579089
141	35	218	2025-01-19 19:42:36.582329	2025-01-19 19:42:36.582329
142	35	219	2025-01-19 19:42:36.582679	2025-01-19 19:42:36.582679
143	35	220	2025-01-19 19:42:36.583007	2025-01-19 19:42:36.583007
144	35	221	2025-01-19 19:42:36.58333	2025-01-19 19:42:36.58333
145	35	222	2025-01-19 19:42:36.583853	2025-01-19 19:42:36.583853
146	36	223	2025-01-19 19:42:36.586088	2025-01-19 19:42:36.586088
147	36	224	2025-01-19 19:42:36.586445	2025-01-19 19:42:36.586445
148	36	225	2025-01-19 19:42:36.586778	2025-01-19 19:42:36.586778
149	36	226	2025-01-19 19:42:36.587099	2025-01-19 19:42:36.587099
150	37	227	2025-01-19 19:42:36.590222	2025-01-19 19:42:36.590222
151	37	228	2025-01-19 19:42:36.590571	2025-01-19 19:42:36.590571
152	37	229	2025-01-19 19:42:36.590902	2025-01-19 19:42:36.590902
153	37	230	2025-01-19 19:42:36.591288	2025-01-19 19:42:36.591288
154	38	31	2025-01-19 19:42:36.600216	2025-01-19 19:42:36.600216
155	38	33	2025-01-19 19:42:36.600586	2025-01-19 19:42:36.600586
156	38	124	2025-01-19 19:42:36.600922	2025-01-19 19:42:36.600922
157	38	125	2025-01-19 19:42:36.601248	2025-01-19 19:42:36.601248
158	38	126	2025-01-19 19:42:36.60157	2025-01-19 19:42:36.60157
159	38	127	2025-01-19 19:42:36.601894	2025-01-19 19:42:36.601894
160	38	128	2025-01-19 19:42:36.602213	2025-01-19 19:42:36.602213
161	38	129	2025-01-19 19:42:36.602554	2025-01-19 19:42:36.602554
162	38	130	2025-01-19 19:42:36.602871	2025-01-19 19:42:36.602871
163	39	32	2025-01-19 19:42:36.606027	2025-01-19 19:42:36.606027
164	39	34	2025-01-19 19:42:36.606377	2025-01-19 19:42:36.606377
165	39	122	2025-01-19 19:42:36.606706	2025-01-19 19:42:36.606706
166	39	123	2025-01-19 19:42:36.607067	2025-01-19 19:42:36.607067
167	40	76	2025-01-19 19:42:36.609229	2025-01-19 19:42:36.609229
168	40	77	2025-01-19 19:42:36.609561	2025-01-19 19:42:36.609561
169	40	78	2025-01-19 19:42:36.609887	2025-01-19 19:42:36.609887
170	40	79	2025-01-19 19:42:36.610206	2025-01-19 19:42:36.610206
171	41	80	2025-01-19 19:42:36.612044	2025-01-19 19:42:36.612044
172	42	81	2025-01-19 19:42:36.615008	2025-01-19 19:42:36.615008
173	42	82	2025-01-19 19:42:36.615342	2025-01-19 19:42:36.615342
174	42	83	2025-01-19 19:42:36.615666	2025-01-19 19:42:36.615666
175	42	84	2025-01-19 19:42:36.615988	2025-01-19 19:42:36.615988
176	43	85	2025-01-19 19:42:36.618023	2025-01-19 19:42:36.618023
177	43	86	2025-01-19 19:42:36.618364	2025-01-19 19:42:36.618364
178	43	87	2025-01-19 19:42:36.61869	2025-01-19 19:42:36.61869
179	44	88	2025-01-19 19:42:36.62082	2025-01-19 19:42:36.62082
180	44	89	2025-01-19 19:42:36.621157	2025-01-19 19:42:36.621157
181	44	90	2025-01-19 19:42:36.62149	2025-01-19 19:42:36.62149
182	44	91	2025-01-19 19:42:36.621814	2025-01-19 19:42:36.621814
183	45	92	2025-01-19 19:42:36.625543	2025-01-19 19:42:36.625543
184	45	93	2025-01-19 19:42:36.62588	2025-01-19 19:42:36.62588
185	45	94	2025-01-19 19:42:36.626204	2025-01-19 19:42:36.626204
186	45	95	2025-01-19 19:42:36.626546	2025-01-19 19:42:36.626546
187	45	96	2025-01-19 19:42:36.626868	2025-01-19 19:42:36.626868
188	45	97	2025-01-19 19:42:36.627185	2025-01-19 19:42:36.627185
189	45	98	2025-01-19 19:42:36.627502	2025-01-19 19:42:36.627502
190	45	99	2025-01-19 19:42:36.627816	2025-01-19 19:42:36.627816
191	45	100	2025-01-19 19:42:36.628137	2025-01-19 19:42:36.628137
192	45	101	2025-01-19 19:42:36.628451	2025-01-19 19:42:36.628451
193	45	102	2025-01-19 19:42:36.628765	2025-01-19 19:42:36.628765
194	45	103	2025-01-19 19:42:36.629083	2025-01-19 19:42:36.629083
195	46	104	2025-01-19 19:42:36.631134	2025-01-19 19:42:36.631134
196	46	105	2025-01-19 19:42:36.631467	2025-01-19 19:42:36.631467
197	46	106	2025-01-19 19:42:36.631788	2025-01-19 19:42:36.631788
198	47	107	2025-01-19 19:42:36.633844	2025-01-19 19:42:36.633844
199	47	193	2025-01-19 19:42:36.634188	2025-01-19 19:42:36.634188
200	47	231	2025-01-19 19:42:36.634523	2025-01-19 19:42:36.634523
201	48	108	2025-01-19 19:42:36.637475	2025-01-19 19:42:36.637475
202	48	109	2025-01-19 19:42:36.637811	2025-01-19 19:42:36.637811
203	48	110	2025-01-19 19:42:36.638137	2025-01-19 19:42:36.638137
204	48	111	2025-01-19 19:42:36.638467	2025-01-19 19:42:36.638467
205	49	112	2025-01-19 19:42:36.640661	2025-01-19 19:42:36.640661
206	49	113	2025-01-19 19:42:36.641004	2025-01-19 19:42:36.641004
207	49	114	2025-01-19 19:42:36.641326	2025-01-19 19:42:36.641326
208	49	115	2025-01-19 19:42:36.641643	2025-01-19 19:42:36.641643
209	50	116	2025-01-19 19:42:36.644415	2025-01-19 19:42:36.644415
210	50	117	2025-01-19 19:42:36.644747	2025-01-19 19:42:36.644747
211	51	118	2025-01-19 19:42:36.646561	2025-01-19 19:42:36.646561
212	52	131	2025-01-19 19:42:36.649507	2025-01-19 19:42:36.649507
213	52	132	2025-01-19 19:42:36.649843	2025-01-19 19:42:36.649843
214	52	133	2025-01-19 19:42:36.650176	2025-01-19 19:42:36.650176
215	52	134	2025-01-19 19:42:36.650509	2025-01-19 19:42:36.650509
216	53	135	2025-01-19 19:42:36.652643	2025-01-19 19:42:36.652643
217	53	136	2025-01-19 19:42:36.652979	2025-01-19 19:42:36.652979
218	53	137	2025-01-19 19:42:36.653301	2025-01-19 19:42:36.653301
219	53	138	2025-01-19 19:42:36.65362	2025-01-19 19:42:36.65362
220	54	139	2025-01-19 19:42:36.655626	2025-01-19 19:42:36.655626
221	54	140	2025-01-19 19:42:36.655958	2025-01-19 19:42:36.655958
222	55	141	2025-01-19 19:42:36.658653	2025-01-19 19:42:36.658653
223	55	142	2025-01-19 19:42:36.658993	2025-01-19 19:42:36.658993
224	55	143	2025-01-19 19:42:36.659318	2025-01-19 19:42:36.659318
225	55	144	2025-01-19 19:42:36.659641	2025-01-19 19:42:36.659641
226	55	145	2025-01-19 19:42:36.659962	2025-01-19 19:42:36.659962
227	56	146	2025-01-19 19:42:36.66214	2025-01-19 19:42:36.66214
228	56	147	2025-01-19 19:42:36.662486	2025-01-19 19:42:36.662486
229	56	148	2025-01-19 19:42:36.662816	2025-01-19 19:42:36.662816
230	56	149	2025-01-19 19:42:36.663142	2025-01-19 19:42:36.663142
231	57	150	2025-01-19 19:42:36.665119	2025-01-19 19:42:36.665119
232	57	151	2025-01-19 19:42:36.665453	2025-01-19 19:42:36.665453
233	58	152	2025-01-19 19:42:36.668478	2025-01-19 19:42:36.668478
234	58	153	2025-01-19 19:42:36.668815	2025-01-19 19:42:36.668815
235	58	154	2025-01-19 19:42:36.669139	2025-01-19 19:42:36.669139
236	58	155	2025-01-19 19:42:36.669457	2025-01-19 19:42:36.669457
237	59	156	2025-01-19 19:42:36.671605	2025-01-19 19:42:36.671605
238	59	157	2025-01-19 19:42:36.672077	2025-01-19 19:42:36.672077
239	59	158	2025-01-19 19:42:36.6724	2025-01-19 19:42:36.6724
240	59	159	2025-01-19 19:42:36.672719	2025-01-19 19:42:36.672719
241	60	160	2025-01-19 19:42:36.675102	2025-01-19 19:42:36.675102
242	60	161	2025-01-19 19:42:36.675448	2025-01-19 19:42:36.675448
243	60	162	2025-01-19 19:42:36.675791	2025-01-19 19:42:36.675791
244	60	163	2025-01-19 19:42:36.676121	2025-01-19 19:42:36.676121
245	61	164	2025-01-19 19:42:36.681201	2025-01-19 19:42:36.681201
246	61	166	2025-01-19 19:42:36.681545	2025-01-19 19:42:36.681545
247	61	168	2025-01-19 19:42:36.683403	2025-01-19 19:42:36.683403
248	62	169	2025-01-19 19:42:36.691987	2025-01-19 19:42:36.691987
249	62	170	2025-01-19 19:42:36.692352	2025-01-19 19:42:36.692352
250	62	171	2025-01-19 19:42:36.693581	2025-01-19 19:42:36.693581
251	62	172	2025-01-19 19:42:36.693943	2025-01-19 19:42:36.693943
252	63	173	2025-01-19 19:42:36.700028	2025-01-19 19:42:36.700028
253	63	174	2025-01-19 19:42:36.701237	2025-01-19 19:42:36.701237
254	63	175	2025-01-19 19:42:36.701586	2025-01-19 19:42:36.701586
255	64	176	2025-01-19 19:42:36.712981	2025-01-19 19:42:36.712981
256	64	177	2025-01-19 19:42:36.714694	2025-01-19 19:42:36.714694
257	64	178	2025-01-19 19:42:36.715054	2025-01-19 19:42:36.715054
258	64	179	2025-01-19 19:42:36.715397	2025-01-19 19:42:36.715397
259	64	180	2025-01-19 19:42:36.715737	2025-01-19 19:42:36.715737
260	65	181	2025-01-19 19:42:36.732259	2025-01-19 19:42:36.732259
261	65	182	2025-01-19 19:42:36.732629	2025-01-19 19:42:36.732629
262	65	183	2025-01-19 19:42:36.732977	2025-01-19 19:42:36.732977
263	65	184	2025-01-19 19:42:36.735104	2025-01-19 19:42:36.735104
264	65	185	2025-01-19 19:42:36.735447	2025-01-19 19:42:36.735447
265	65	186	2025-01-19 19:42:36.737475	2025-01-19 19:42:36.737475
266	66	187	2025-01-19 19:42:36.750513	2025-01-19 19:42:36.750513
267	66	188	2025-01-19 19:42:36.750926	2025-01-19 19:42:36.750926
268	66	189	2025-01-19 19:42:36.752393	2025-01-19 19:42:36.752393
269	66	190	2025-01-19 19:42:36.752781	2025-01-19 19:42:36.752781
270	66	191	2025-01-19 19:42:36.754003	2025-01-19 19:42:36.754003
271	66	192	2025-01-19 19:42:36.754357	2025-01-19 19:42:36.754357
272	67	194	2025-01-19 19:42:36.765136	2025-01-19 19:42:36.765136
273	67	195	2025-01-19 19:42:36.765507	2025-01-19 19:42:36.765507
274	67	196	2025-01-19 19:42:36.767344	2025-01-19 19:42:36.767344
275	67	197	2025-01-19 19:42:36.767703	2025-01-19 19:42:36.767703
276	68	198	2025-01-19 19:42:36.771471	2025-01-19 19:42:36.771471
277	69	205	2025-01-19 19:42:36.791068	2025-01-19 19:42:36.791068
278	69	206	2025-01-19 19:42:36.793429	2025-01-19 19:42:36.793429
279	69	207	2025-01-19 19:42:36.793843	2025-01-19 19:42:36.793843
280	69	208	2025-01-19 19:42:36.795666	2025-01-19 19:42:36.795666
281	69	209	2025-01-19 19:42:36.796067	2025-01-19 19:42:36.796067
282	69	210	2025-01-19 19:42:36.798404	2025-01-19 19:42:36.798404
283	69	211	2025-01-19 19:42:36.798805	2025-01-19 19:42:36.798805
284	69	212	2025-01-19 19:42:36.8433	2025-01-19 19:42:36.8433
285	69	213	2025-01-19 19:42:36.844	2025-01-19 19:42:36.844
286	69	214	2025-01-19 19:42:36.84444	2025-01-19 19:42:36.84444
287	70	215	2025-01-19 19:42:36.847498	2025-01-19 19:42:36.847498
288	70	216	2025-01-19 19:42:36.847899	2025-01-19 19:42:36.847899
289	70	217	2025-01-19 19:42:36.848283	2025-01-19 19:42:36.848283
290	71	218	2025-01-19 19:42:36.852103	2025-01-19 19:42:36.852103
291	71	219	2025-01-19 19:42:36.852506	2025-01-19 19:42:36.852506
292	71	220	2025-01-19 19:42:36.853091	2025-01-19 19:42:36.853091
293	71	221	2025-01-19 19:42:36.853471	2025-01-19 19:42:36.853471
294	71	222	2025-01-19 19:42:36.853847	2025-01-19 19:42:36.853847
295	72	223	2025-01-19 19:42:36.856388	2025-01-19 19:42:36.856388
296	72	224	2025-01-19 19:42:36.856747	2025-01-19 19:42:36.856747
297	72	225	2025-01-19 19:42:36.857084	2025-01-19 19:42:36.857084
298	72	226	2025-01-19 19:42:36.857577	2025-01-19 19:42:36.857577
299	73	227	2025-01-19 19:42:36.861134	2025-01-19 19:42:36.861134
300	73	228	2025-01-19 19:42:36.861512	2025-01-19 19:42:36.861512
301	73	229	2025-01-19 19:42:36.861845	2025-01-19 19:42:36.861845
302	73	230	2025-01-19 19:42:36.862172	2025-01-19 19:42:36.862172
303	74	81	2025-01-19 19:42:36.869924	2025-01-19 19:42:36.869924
304	74	82	2025-01-19 19:42:36.870273	2025-01-19 19:42:36.870273
305	74	83	2025-01-19 19:42:36.870626	2025-01-19 19:42:36.870626
306	74	84	2025-01-19 19:42:36.870956	2025-01-19 19:42:36.870956
307	75	118	2025-01-19 19:42:36.873241	2025-01-19 19:42:36.873241
308	75	119	2025-01-19 19:42:36.87368	2025-01-19 19:42:36.87368
309	75	120	2025-01-19 19:42:36.874017	2025-01-19 19:42:36.874017
310	75	121	2025-01-19 19:42:36.874356	2025-01-19 19:42:36.874356
311	76	141	2025-01-19 19:42:36.877187	2025-01-19 19:42:36.877187
312	76	142	2025-01-19 19:42:36.877617	2025-01-19 19:42:36.877617
313	76	143	2025-01-19 19:42:36.877949	2025-01-19 19:42:36.877949
314	76	144	2025-01-19 19:42:36.878281	2025-01-19 19:42:36.878281
315	76	145	2025-01-19 19:42:36.87862	2025-01-19 19:42:36.87862
316	77	164	2025-01-19 19:42:36.881455	2025-01-19 19:42:36.881455
317	77	165	2025-01-19 19:42:36.881799	2025-01-19 19:42:36.881799
318	77	166	2025-01-19 19:42:36.882132	2025-01-19 19:42:36.882132
319	77	167	2025-01-19 19:42:36.882472	2025-01-19 19:42:36.882472
320	77	168	2025-01-19 19:42:36.882805	2025-01-19 19:42:36.882805
321	78	198	2025-01-19 19:42:36.885012	2025-01-19 19:42:36.885012
322	78	199	2025-01-19 19:42:36.88545	2025-01-19 19:42:36.88545
323	78	200	2025-01-19 19:42:36.885797	2025-01-19 19:42:36.885797
324	78	201	2025-01-19 19:42:36.886124	2025-01-19 19:42:36.886124
325	79	202	2025-01-19 19:42:36.888128	2025-01-19 19:42:36.888128
326	80	203	2025-01-19 19:42:36.890318	2025-01-19 19:42:36.890318
327	80	204	2025-01-19 19:42:36.890673	2025-01-19 19:42:36.890673
328	81	223	2025-01-19 19:42:36.893085	2025-01-19 19:42:36.893085
329	81	224	2025-01-19 19:42:36.893427	2025-01-19 19:42:36.893427
330	81	225	2025-01-19 19:42:36.89376	2025-01-19 19:42:36.89376
331	81	226	2025-01-19 19:42:36.894084	2025-01-19 19:42:36.894084
332	82	227	2025-01-19 19:42:36.897342	2025-01-19 19:42:36.897342
333	82	228	2025-01-19 19:42:36.897692	2025-01-19 19:42:36.897692
334	82	229	2025-01-19 19:42:36.898024	2025-01-19 19:42:36.898024
335	82	230	2025-01-19 19:42:36.898358	2025-01-19 19:42:36.898358
336	83	176	2025-01-19 19:42:36.905346	2025-01-19 19:42:36.905346
337	83	177	2025-01-19 19:42:36.905694	2025-01-19 19:42:36.905694
338	83	178	2025-01-19 19:42:36.906027	2025-01-19 19:42:36.906027
339	83	179	2025-01-19 19:42:36.90637	2025-01-19 19:42:36.90637
340	84	31	2025-01-19 19:42:36.913045	2025-01-19 19:42:36.913045
341	85	31	2025-01-19 19:42:36.919909	2025-01-19 19:42:36.919909
342	85	33	2025-01-19 19:42:36.920254	2025-01-19 19:42:36.920254
343	85	124	2025-01-19 19:42:36.920735	2025-01-19 19:42:36.920735
344	85	125	2025-01-19 19:42:36.921063	2025-01-19 19:42:36.921063
345	85	126	2025-01-19 19:42:36.92139	2025-01-19 19:42:36.92139
346	86	31	2025-01-19 19:42:36.928091	2025-01-19 19:42:36.928091
347	87	32	2025-01-19 19:42:36.931072	2025-01-19 19:42:36.931072
348	88	76	2025-01-19 19:42:36.933066	2025-01-19 19:42:36.933066
349	89	80	2025-01-19 19:42:36.935071	2025-01-19 19:42:36.935071
350	90	81	2025-01-19 19:42:36.938019	2025-01-19 19:42:36.938019
351	91	88	2025-01-19 19:42:36.939993	2025-01-19 19:42:36.939993
352	92	92	2025-01-19 19:42:36.94305	2025-01-19 19:42:36.94305
353	92	98	2025-01-19 19:42:36.943393	2025-01-19 19:42:36.943393
354	93	104	2025-01-19 19:42:36.945461	2025-01-19 19:42:36.945461
355	94	108	2025-01-19 19:42:36.948338	2025-01-19 19:42:36.948338
356	95	112	2025-01-19 19:42:36.950352	2025-01-19 19:42:36.950352
357	96	116	2025-01-19 19:42:36.953346	2025-01-19 19:42:36.953346
358	97	118	2025-01-19 19:42:36.95535	2025-01-19 19:42:36.95535
359	98	131	2025-01-19 19:42:36.958315	2025-01-19 19:42:36.958315
360	99	135	2025-01-19 19:42:36.960315	2025-01-19 19:42:36.960315
361	100	139	2025-01-19 19:42:36.962353	2025-01-19 19:42:36.962353
362	101	141	2025-01-19 19:42:36.964876	2025-01-19 19:42:36.964876
363	102	146	2025-01-19 19:42:36.96685	2025-01-19 19:42:36.96685
364	103	150	2025-01-19 19:42:36.968809	2025-01-19 19:42:36.968809
365	104	152	2025-01-19 19:42:36.971597	2025-01-19 19:42:36.971597
366	105	156	2025-01-19 19:42:36.973642	2025-01-19 19:42:36.973642
367	106	160	2025-01-19 19:42:36.97562	2025-01-19 19:42:36.97562
368	107	164	2025-01-19 19:42:36.978051	2025-01-19 19:42:36.978051
369	108	169	2025-01-19 19:42:36.980038	2025-01-19 19:42:36.980038
370	109	173	2025-01-19 19:42:36.982019	2025-01-19 19:42:36.982019
371	110	176	2025-01-19 19:42:36.98495	2025-01-19 19:42:36.98495
372	111	181	2025-01-19 19:42:36.987899	2025-01-19 19:42:36.987899
373	112	187	2025-01-19 19:42:36.990706	2025-01-19 19:42:36.990706
374	113	193	2025-01-19 19:42:36.992836	2025-01-19 19:42:36.992836
375	113	231	2025-01-19 19:42:36.993257	2025-01-19 19:42:36.993257
376	114	194	2025-01-19 19:42:36.996083	2025-01-19 19:42:36.996083
377	115	198	2025-01-19 19:42:36.998046	2025-01-19 19:42:36.998046
378	116	205	2025-01-19 19:42:37.001175	2025-01-19 19:42:37.001175
379	116	209	2025-01-19 19:42:37.001519	2025-01-19 19:42:37.001519
380	116	212	2025-01-19 19:42:37.001965	2025-01-19 19:42:37.001965
381	117	215	2025-01-19 19:42:37.003927	2025-01-19 19:42:37.003927
382	118	218	2025-01-19 19:42:37.006739	2025-01-19 19:42:37.006739
383	119	223	2025-01-19 19:42:37.008732	2025-01-19 19:42:37.008732
384	120	227	2025-01-19 19:42:37.011666	2025-01-19 19:42:37.011666
385	121	31	2025-01-19 19:42:37.018992	2025-01-19 19:42:37.018992
386	121	33	2025-01-19 19:42:37.019341	2025-01-19 19:42:37.019341
387	121	124	2025-01-19 19:42:37.019675	2025-01-19 19:42:37.019675
388	121	125	2025-01-19 19:42:37.020004	2025-01-19 19:42:37.020004
389	121	126	2025-01-19 19:42:37.020336	2025-01-19 19:42:37.020336
390	122	32	2025-01-19 19:42:37.023259	2025-01-19 19:42:37.023259
391	123	76	2025-01-19 19:42:37.025262	2025-01-19 19:42:37.025262
392	124	80	2025-01-19 19:42:37.027254	2025-01-19 19:42:37.027254
393	125	81	2025-01-19 19:42:37.030112	2025-01-19 19:42:37.030112
394	126	104	2025-01-19 19:42:37.032185	2025-01-19 19:42:37.032185
395	126	105	2025-01-19 19:42:37.032525	2025-01-19 19:42:37.032525
396	127	107	2025-01-19 19:42:37.034503	2025-01-19 19:42:37.034503
397	128	108	2025-01-19 19:42:37.037387	2025-01-19 19:42:37.037387
398	129	116	2025-01-19 19:42:37.040262	2025-01-19 19:42:37.040262
399	130	150	2025-01-19 19:42:37.042228	2025-01-19 19:42:37.042228
400	131	152	2025-01-19 19:42:37.045469	2025-01-19 19:42:37.045469
401	131	153	2025-01-19 19:42:37.045811	2025-01-19 19:42:37.045811
402	131	154	2025-01-19 19:42:37.046145	2025-01-19 19:42:37.046145
403	131	155	2025-01-19 19:42:37.046485	2025-01-19 19:42:37.046485
404	132	156	2025-01-19 19:42:37.048477	2025-01-19 19:42:37.048477
405	133	160	2025-01-19 19:42:37.050466	2025-01-19 19:42:37.050466
406	134	169	2025-01-19 19:42:37.052432	2025-01-19 19:42:37.052432
407	135	173	2025-01-19 19:42:37.054414	2025-01-19 19:42:37.054414
408	136	176	2025-01-19 19:42:37.057233	2025-01-19 19:42:37.057233
409	137	194	2025-01-19 19:42:37.060378	2025-01-19 19:42:37.060378
410	138	205	2025-01-19 19:42:37.063613	2025-01-19 19:42:37.063613
411	138	207	2025-01-19 19:42:37.063956	2025-01-19 19:42:37.063956
412	138	209	2025-01-19 19:42:37.064289	2025-01-19 19:42:37.064289
413	138	212	2025-01-19 19:42:37.064621	2025-01-19 19:42:37.064621
414	139	215	2025-01-19 19:42:37.066569	2025-01-19 19:42:37.066569
415	140	218	2025-01-19 19:42:37.069534	2025-01-19 19:42:37.069534
416	140	220	2025-01-19 19:42:37.069873	2025-01-19 19:42:37.069873
417	141	223	2025-01-19 19:42:37.072137	2025-01-19 19:42:37.072137
418	141	224	2025-01-19 19:42:37.072475	2025-01-19 19:42:37.072475
419	141	225	2025-01-19 19:42:37.072801	2025-01-19 19:42:37.072801
420	141	226	2025-01-19 19:42:37.073128	2025-01-19 19:42:37.073128
421	142	227	2025-01-19 19:42:37.076083	2025-01-19 19:42:37.076083
422	142	229	2025-01-19 19:42:37.076423	2025-01-19 19:42:37.076423
423	143	85	2025-01-19 19:42:37.080963	2025-01-19 19:42:37.080963
424	143	86	2025-01-19 19:42:37.081304	2025-01-19 19:42:37.081304
425	143	87	2025-01-19 19:42:37.081633	2025-01-19 19:42:37.081633
426	144	80	2025-01-19 19:42:37.085836	2025-01-19 19:42:37.085836
427	145	1	2025-01-19 19:42:39.119718	2025-01-19 19:42:39.119718
428	146	14	2025-01-19 19:42:39.130905	2025-01-19 19:42:39.130905
\.


--
-- TOC entry 4761 (class 0 OID 17475)
-- Dependencies: 319
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.filters (id, search, role_id, created_at, updated_at, taxonomy_search, override) FROM stdin;
1	\N	2	2025-01-19 19:42:36.444727	2025-01-19 19:42:36.444727	\N	f
2	\N	2	2025-01-19 19:42:36.451493	2025-01-19 19:42:36.451493	\N	f
3	\N	2	2025-01-19 19:42:36.454942	2025-01-19 19:42:36.454942	\N	f
4	\N	2	2025-01-19 19:42:36.457884	2025-01-19 19:42:36.457884	\N	f
5	\N	2	2025-01-19 19:42:36.461103	2025-01-19 19:42:36.461103	\N	f
6	\N	2	2025-01-19 19:42:36.464389	2025-01-19 19:42:36.464389	\N	f
7	\N	2	2025-01-19 19:42:36.467442	2025-01-19 19:42:36.467442	\N	f
8	\N	2	2025-01-19 19:42:36.472381	2025-01-19 19:42:36.472381	\N	f
9	\N	2	2025-01-19 19:42:36.478352	2025-01-19 19:42:36.478352	\N	f
10	\N	2	2025-01-19 19:42:36.481174	2025-01-19 19:42:36.481174	\N	f
11	\N	2	2025-01-19 19:42:36.485121	2025-01-19 19:42:36.485121	\N	f
12	\N	2	2025-01-19 19:42:36.489656	2025-01-19 19:42:36.489656	\N	f
13	\N	2	2025-01-19 19:42:36.493727	2025-01-19 19:42:36.493727	\N	f
14	\N	2	2025-01-19 19:42:36.496003	2025-01-19 19:42:36.496003	\N	f
15	\N	2	2025-01-19 19:42:36.502258	2025-01-19 19:42:36.502258	\N	f
16	\N	2	2025-01-19 19:42:36.505648	2025-01-19 19:42:36.505648	\N	f
17	\N	2	2025-01-19 19:42:36.510004	2025-01-19 19:42:36.510004	\N	f
18	\N	2	2025-01-19 19:42:36.513241	2025-01-19 19:42:36.513241	\N	f
19	\N	2	2025-01-19 19:42:36.516879	2025-01-19 19:42:36.516879	\N	f
20	\N	2	2025-01-19 19:42:36.521477	2025-01-19 19:42:36.521477	\N	f
21	\N	2	2025-01-19 19:42:36.525078	2025-01-19 19:42:36.525078	\N	f
22	\N	2	2025-01-19 19:42:36.52854	2025-01-19 19:42:36.52854	\N	f
23	\N	2	2025-01-19 19:42:36.531785	2025-01-19 19:42:36.531785	\N	f
24	\N	2	2025-01-19 19:42:36.535635	2025-01-19 19:42:36.535635	\N	f
25	\N	2	2025-01-19 19:42:36.539315	2025-01-19 19:42:36.539315	\N	f
26	\N	2	2025-01-19 19:42:36.54253	2025-01-19 19:42:36.54253	\N	f
27	\N	2	2025-01-19 19:42:36.546424	2025-01-19 19:42:36.546424	\N	f
28	\N	2	2025-01-19 19:42:36.551131	2025-01-19 19:42:36.551131	\N	f
29	\N	2	2025-01-19 19:42:36.558622	2025-01-19 19:42:36.558622	\N	f
30	\N	2	2025-01-19 19:42:36.563566	2025-01-19 19:42:36.563566	\N	f
31	\N	2	2025-01-19 19:42:36.566497	2025-01-19 19:42:36.566497	\N	f
32	\N	2	2025-01-19 19:42:36.568597	2025-01-19 19:42:36.568597	\N	f
33	\N	2	2025-01-19 19:42:36.572745	2025-01-19 19:42:36.572745	\N	f
34	\N	2	2025-01-19 19:42:36.578	2025-01-19 19:42:36.578	\N	f
35	\N	2	2025-01-19 19:42:36.581907	2025-01-19 19:42:36.581907	\N	f
36	\N	2	2025-01-19 19:42:36.585674	2025-01-19 19:42:36.585674	\N	f
37	\N	2	2025-01-19 19:42:36.589804	2025-01-19 19:42:36.589804	\N	f
38	\N	3	2025-01-19 19:42:36.599723	2025-01-19 19:42:36.599723	\N	f
39	\N	3	2025-01-19 19:42:36.60561	2025-01-19 19:42:36.60561	\N	f
40	\N	3	2025-01-19 19:42:36.608821	2025-01-19 19:42:36.608821	\N	f
41	\N	3	2025-01-19 19:42:36.611637	2025-01-19 19:42:36.611637	\N	f
42	\N	3	2025-01-19 19:42:36.614584	2025-01-19 19:42:36.614584	\N	f
43	\N	3	2025-01-19 19:42:36.617617	2025-01-19 19:42:36.617617	\N	f
44	\N	3	2025-01-19 19:42:36.62041	2025-01-19 19:42:36.62041	\N	f
45	\N	3	2025-01-19 19:42:36.625124	2025-01-19 19:42:36.625124	\N	f
46	\N	3	2025-01-19 19:42:36.630727	2025-01-19 19:42:36.630727	\N	f
47	\N	3	2025-01-19 19:42:36.633438	2025-01-19 19:42:36.633438	\N	f
48	\N	3	2025-01-19 19:42:36.637048	2025-01-19 19:42:36.637048	\N	f
49	\N	3	2025-01-19 19:42:36.640254	2025-01-19 19:42:36.640254	\N	f
50	\N	3	2025-01-19 19:42:36.644002	2025-01-19 19:42:36.644002	\N	f
51	\N	3	2025-01-19 19:42:36.646153	2025-01-19 19:42:36.646153	\N	f
52	\N	3	2025-01-19 19:42:36.649094	2025-01-19 19:42:36.649094	\N	f
53	\N	3	2025-01-19 19:42:36.652235	2025-01-19 19:42:36.652235	\N	f
54	\N	3	2025-01-19 19:42:36.655221	2025-01-19 19:42:36.655221	\N	f
55	\N	3	2025-01-19 19:42:36.658221	2025-01-19 19:42:36.658221	\N	f
56	\N	3	2025-01-19 19:42:36.661725	2025-01-19 19:42:36.661725	\N	f
57	\N	3	2025-01-19 19:42:36.664701	2025-01-19 19:42:36.664701	\N	f
58	\N	3	2025-01-19 19:42:36.66806	2025-01-19 19:42:36.66806	\N	f
59	\N	3	2025-01-19 19:42:36.671189	2025-01-19 19:42:36.671189	\N	f
60	\N	3	2025-01-19 19:42:36.674681	2025-01-19 19:42:36.674681	\N	f
61	\N	3	2025-01-19 19:42:36.678441	2025-01-19 19:42:36.678441	\N	f
62	\N	3	2025-01-19 19:42:36.690172	2025-01-19 19:42:36.690172	\N	f
63	\N	3	2025-01-19 19:42:36.699582	2025-01-19 19:42:36.699582	\N	f
64	\N	3	2025-01-19 19:42:36.711068	2025-01-19 19:42:36.711068	\N	f
65	\N	3	2025-01-19 19:42:36.729654	2025-01-19 19:42:36.729654	\N	f
66	\N	3	2025-01-19 19:42:36.749223	2025-01-19 19:42:36.749223	\N	f
67	\N	3	2025-01-19 19:42:36.763718	2025-01-19 19:42:36.763718	\N	f
68	\N	3	2025-01-19 19:42:36.771025	2025-01-19 19:42:36.771025	\N	f
69	\N	3	2025-01-19 19:42:36.789052	2025-01-19 19:42:36.789052	\N	f
70	\N	3	2025-01-19 19:42:36.84697	2025-01-19 19:42:36.84697	\N	f
71	\N	3	2025-01-19 19:42:36.851613	2025-01-19 19:42:36.851613	\N	f
72	\N	3	2025-01-19 19:42:36.855921	2025-01-19 19:42:36.855921	\N	f
73	\N	3	2025-01-19 19:42:36.860504	2025-01-19 19:42:36.860504	\N	f
74	\N	4	2025-01-19 19:42:36.869484	2025-01-19 19:42:36.869484	\N	f
75	\N	4	2025-01-19 19:42:36.872824	2025-01-19 19:42:36.872824	\N	f
76	\N	4	2025-01-19 19:42:36.876766	2025-01-19 19:42:36.876766	\N	f
77	\N	4	2025-01-19 19:42:36.880973	2025-01-19 19:42:36.880973	\N	f
78	\N	4	2025-01-19 19:42:36.884601	2025-01-19 19:42:36.884601	\N	f
79	\N	4	2025-01-19 19:42:36.887712	2025-01-19 19:42:36.887712	\N	f
80	\N	4	2025-01-19 19:42:36.889902	2025-01-19 19:42:36.889902	\N	f
81	\N	4	2025-01-19 19:42:36.89257	2025-01-19 19:42:36.89257	\N	f
82	\N	4	2025-01-19 19:42:36.896918	2025-01-19 19:42:36.896918	\N	f
83	\N	5	2025-01-19 19:42:36.904917	2025-01-19 19:42:36.904917	\N	f
84	\N	6	2025-01-19 19:42:36.912474	2025-01-19 19:42:36.912474	\N	f
85	\N	7	2025-01-19 19:42:36.919477	2025-01-19 19:42:36.919477	\N	f
86	\N	8	2025-01-19 19:42:36.927658	2025-01-19 19:42:36.927658	\N	f
87	\N	8	2025-01-19 19:42:36.930644	2025-01-19 19:42:36.930644	\N	f
88	\N	8	2025-01-19 19:42:36.932649	2025-01-19 19:42:36.932649	\N	f
89	\N	8	2025-01-19 19:42:36.93465	2025-01-19 19:42:36.93465	\N	f
90	\N	8	2025-01-19 19:42:36.937592	2025-01-19 19:42:36.937592	\N	f
91	\N	8	2025-01-19 19:42:36.939578	2025-01-19 19:42:36.939578	\N	f
92	\N	8	2025-01-19 19:42:36.942628	2025-01-19 19:42:36.942628	\N	f
93	\N	8	2025-01-19 19:42:36.944969	2025-01-19 19:42:36.944969	\N	f
94	\N	8	2025-01-19 19:42:36.947915	2025-01-19 19:42:36.947915	\N	f
95	\N	8	2025-01-19 19:42:36.949927	2025-01-19 19:42:36.949927	\N	f
96	\N	8	2025-01-19 19:42:36.952923	2025-01-19 19:42:36.952923	\N	f
97	\N	8	2025-01-19 19:42:36.954926	2025-01-19 19:42:36.954926	\N	f
98	\N	8	2025-01-19 19:42:36.957891	2025-01-19 19:42:36.957891	\N	f
99	\N	8	2025-01-19 19:42:36.959902	2025-01-19 19:42:36.959902	\N	f
100	\N	8	2025-01-19 19:42:36.961927	2025-01-19 19:42:36.961927	\N	f
101	\N	8	2025-01-19 19:42:36.964374	2025-01-19 19:42:36.964374	\N	f
102	\N	8	2025-01-19 19:42:36.96635	2025-01-19 19:42:36.96635	\N	f
103	\N	8	2025-01-19 19:42:36.968401	2025-01-19 19:42:36.968401	\N	f
104	\N	8	2025-01-19 19:42:36.971173	2025-01-19 19:42:36.971173	\N	f
105	\N	8	2025-01-19 19:42:36.973161	2025-01-19 19:42:36.973161	\N	f
106	\N	8	2025-01-19 19:42:36.97511	2025-01-19 19:42:36.97511	\N	f
107	\N	8	2025-01-19 19:42:36.977634	2025-01-19 19:42:36.977634	\N	f
108	\N	8	2025-01-19 19:42:36.979623	2025-01-19 19:42:36.979623	\N	f
109	\N	8	2025-01-19 19:42:36.981605	2025-01-19 19:42:36.981605	\N	f
110	\N	8	2025-01-19 19:42:36.984529	2025-01-19 19:42:36.984529	\N	f
111	\N	8	2025-01-19 19:42:36.987377	2025-01-19 19:42:36.987377	\N	f
112	\N	8	2025-01-19 19:42:36.990273	2025-01-19 19:42:36.990273	\N	f
113	\N	8	2025-01-19 19:42:36.992417	2025-01-19 19:42:36.992417	\N	f
114	\N	8	2025-01-19 19:42:36.995662	2025-01-19 19:42:36.995662	\N	f
115	\N	8	2025-01-19 19:42:36.997628	2025-01-19 19:42:36.997628	\N	f
116	\N	8	2025-01-19 19:42:37.000749	2025-01-19 19:42:37.000749	\N	f
117	\N	8	2025-01-19 19:42:37.003512	2025-01-19 19:42:37.003512	\N	f
118	\N	8	2025-01-19 19:42:37.006301	2025-01-19 19:42:37.006301	\N	f
119	\N	8	2025-01-19 19:42:37.008314	2025-01-19 19:42:37.008314	\N	f
120	\N	8	2025-01-19 19:42:37.011244	2025-01-19 19:42:37.011244	\N	f
121	\N	9	2025-01-19 19:42:37.018554	2025-01-19 19:42:37.018554	\N	f
122	\N	9	2025-01-19 19:42:37.022834	2025-01-19 19:42:37.022834	\N	f
123	\N	9	2025-01-19 19:42:37.024847	2025-01-19 19:42:37.024847	\N	f
124	\N	9	2025-01-19 19:42:37.026837	2025-01-19 19:42:37.026837	\N	f
125	\N	9	2025-01-19 19:42:37.029688	2025-01-19 19:42:37.029688	\N	f
126	\N	9	2025-01-19 19:42:37.031771	2025-01-19 19:42:37.031771	\N	f
127	\N	9	2025-01-19 19:42:37.034079	2025-01-19 19:42:37.034079	\N	f
128	\N	9	2025-01-19 19:42:37.036968	2025-01-19 19:42:37.036968	\N	f
129	\N	9	2025-01-19 19:42:37.039839	2025-01-19 19:42:37.039839	\N	f
130	\N	9	2025-01-19 19:42:37.041817	2025-01-19 19:42:37.041817	\N	f
131	\N	9	2025-01-19 19:42:37.045045	2025-01-19 19:42:37.045045	\N	f
132	\N	9	2025-01-19 19:42:37.048063	2025-01-19 19:42:37.048063	\N	f
133	\N	9	2025-01-19 19:42:37.050044	2025-01-19 19:42:37.050044	\N	f
134	\N	9	2025-01-19 19:42:37.052019	2025-01-19 19:42:37.052019	\N	f
135	\N	9	2025-01-19 19:42:37.053991	2025-01-19 19:42:37.053991	\N	f
136	\N	9	2025-01-19 19:42:37.056811	2025-01-19 19:42:37.056811	\N	f
137	\N	9	2025-01-19 19:42:37.059823	2025-01-19 19:42:37.059823	\N	f
138	\N	9	2025-01-19 19:42:37.063186	2025-01-19 19:42:37.063186	\N	f
139	\N	9	2025-01-19 19:42:37.066149	2025-01-19 19:42:37.066149	\N	f
140	\N	9	2025-01-19 19:42:37.069116	2025-01-19 19:42:37.069116	\N	f
141	\N	9	2025-01-19 19:42:37.071723	2025-01-19 19:42:37.071723	\N	f
142	\N	9	2025-01-19 19:42:37.075661	2025-01-19 19:42:37.075661	\N	f
143	\N	10	2025-01-19 19:42:37.080538	2025-01-19 19:42:37.080538	\N	f
144	\N	11	2025-01-19 19:42:37.085412	2025-01-19 19:42:37.085412	\N	f
145	owner.id = current_user	1	2025-01-19 19:42:38.971215	2025-01-19 19:42:38.971215	\N	f
146	user = current_user	1	2025-01-19 19:42:39.126988	2025-01-19 19:42:39.126988	\N	f
\.


--
-- TOC entry 4816 (class 0 OID 17991)
-- Dependencies: 374
-- Data for Name: foreign_input_sets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreign_input_sets (id, template_id, target_template_id, include_all, include, exclude) FROM stdin;
\.


--
-- TOC entry 4857 (class 0 OID 18604)
-- Dependencies: 415
-- Data for Name: foreman_internals; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_internals (id, key, value, created_at, updated_at) FROM stdin;
1	database_seed	FRKB6ramvtjv6N9X9loES/syYitxAou3VbWVYMDpG8U=	2025-01-19 19:42:35.788369	2025-01-19 19:42:39.583713
\.


--
-- TOC entry 4847 (class 0 OID 18537)
-- Dependencies: 405
-- Data for Name: foreman_tasks_links; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_tasks_links (id, task_id, "{:index=>true, :null=>true}", resource_type, resource_id) FROM stdin;
\.


--
-- TOC entry 4766 (class 0 OID 17506)
-- Dependencies: 324
-- Data for Name: foreman_tasks_locks; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_tasks_locks (id, task_id, resource_type, resource_id) FROM stdin;
\.


--
-- TOC entry 4806 (class 0 OID 17919)
-- Dependencies: 364
-- Data for Name: foreman_tasks_recurring_logics; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_tasks_recurring_logics (id, cron_line, end_time, max_iteration, iteration, task_group_id, state, triggering_id, purpose) FROM stdin;
\.


--
-- TOC entry 4840 (class 0 OID 18375)
-- Dependencies: 398
-- Data for Name: foreman_tasks_remote_tasks; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_tasks_remote_tasks (id, execution_plan_id, step_id, state, proxy_url, remote_task_id, created_at, operation, parent_task_id) FROM stdin;
\.


--
-- TOC entry 4810 (class 0 OID 17940)
-- Dependencies: 368
-- Data for Name: foreman_tasks_task_group_members; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_tasks_task_group_members (id, task_id, task_group_id) FROM stdin;
\.


--
-- TOC entry 4808 (class 0 OID 17930)
-- Dependencies: 366
-- Data for Name: foreman_tasks_task_groups; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_tasks_task_groups (id, type) FROM stdin;
\.


--
-- TOC entry 4764 (class 0 OID 17492)
-- Dependencies: 322
-- Data for Name: foreman_tasks_tasks; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_tasks_tasks (id, type, label, started_at, ended_at, state, result, external_id, parent_task_id, start_at, start_before, action, user_id, state_updated_at) FROM stdin;
\.


--
-- TOC entry 4812 (class 0 OID 17959)
-- Dependencies: 370
-- Data for Name: foreman_tasks_triggerings; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.foreman_tasks_triggerings (id, mode, start_at, start_before) FROM stdin;
\.


--
-- TOC entry 4821 (class 0 OID 18115)
-- Dependencies: 379
-- Data for Name: host_ansible_roles; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.host_ansible_roles (ansible_role_id, host_id, id, "position") FROM stdin;
\.


--
-- TOC entry 4683 (class 0 OID 16560)
-- Dependencies: 241
-- Data for Name: host_classes; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.host_classes (puppetclass_id, id, host_puppet_facet_id) FROM stdin;
\.


--
-- TOC entry 4776 (class 0 OID 17601)
-- Dependencies: 334
-- Data for Name: host_config_groups; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.host_config_groups (id, config_group_id, host_id, host_type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4863 (class 0 OID 18692)
-- Dependencies: 421
-- Data for Name: host_facets_infrastructure_facets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.host_facets_infrastructure_facets (id, host_id, foreman_instance, smart_proxy_id) FROM stdin;
\.


--
-- TOC entry 4853 (class 0 OID 18578)
-- Dependencies: 411
-- Data for Name: host_facets_reported_data_facets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.host_facets_reported_data_facets (id, host_id, boot_time, created_at, updated_at, virtual, sockets, cores, ram, disks_total, kernel_version, bios_vendor, bios_release_date, bios_version) FROM stdin;
\.


--
-- TOC entry 4867 (class 0 OID 18730)
-- Dependencies: 425
-- Data for Name: host_proxy_invocations; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.host_proxy_invocations (id, host_id, smart_proxy_id) FROM stdin;
\.


--
-- TOC entry 4859 (class 0 OID 18630)
-- Dependencies: 417
-- Data for Name: host_puppet_facets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.host_puppet_facets (id, host_id, environment_id, puppet_proxy_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4790 (class 0 OID 17781)
-- Dependencies: 348
-- Data for Name: host_status; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.host_status (id, type, status, host_id, reported_at) FROM stdin;
\.


--
-- TOC entry 4823 (class 0 OID 18135)
-- Dependencies: 381
-- Data for Name: hostgroup_ansible_roles; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.hostgroup_ansible_roles (hostgroup_id, ansible_role_id, id, "position") FROM stdin;
\.


--
-- TOC entry 4691 (class 0 OID 16595)
-- Dependencies: 249
-- Data for Name: hostgroup_classes; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.hostgroup_classes (puppetclass_id, id, hostgroup_puppet_facet_id) FROM stdin;
\.


--
-- TOC entry 4861 (class 0 OID 18655)
-- Dependencies: 419
-- Data for Name: hostgroup_puppet_facets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.hostgroup_puppet_facets (id, hostgroup_id, environment_id, puppet_proxy_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4690 (class 0 OID 16589)
-- Dependencies: 248
-- Data for Name: hostgroups; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.hostgroups (id, name, created_at, updated_at, operatingsystem_id, architecture_id, medium_id, ptable_id, root_pass, puppet_ca_proxy_id, use_image, image_file, ancestry, vm_defaults, subnet_id, domain_id, puppet_proxy_id, title, realm_id, compute_profile_id, grub_pass, lookup_value_matcher, subnet6_id, pxe_loader, description, compute_resource_id) FROM stdin;
\.


--
-- TOC entry 4654 (class 0 OID 16401)
-- Dependencies: 212
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.hosts (id, name, last_compile, last_report, updated_at, created_at, root_pass, architecture_id, operatingsystem_id, ptable_id, medium_id, build, comment, disk, installed_at, model_id, hostgroup_id, owner_id, owner_type, enabled, puppet_ca_proxy_id, managed, use_image, image_file, uuid, compute_resource_id, puppet_proxy_id, certname, image_id, organization_id, location_id, type, otp, realm_id, compute_profile_id, provision_method, grub_pass, discovery_rule_id, global_status, lookup_value_matcher, pxe_loader, initiated_at, build_errors, creator_id) FROM stdin;
\.


--
-- TOC entry 4836 (class 0 OID 18324)
-- Dependencies: 394
-- Data for Name: http_proxies; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.http_proxies (id, name, url, username, password, cacert) FROM stdin;
\.


--
-- TOC entry 4741 (class 0 OID 16918)
-- Dependencies: 299
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.images (id, operatingsystem_id, compute_resource_id, architecture_id, uuid, username, name, created_at, updated_at, iam_role, user_data, password) FROM stdin;
\.


--
-- TOC entry 4865 (class 0 OID 18719)
-- Dependencies: 423
-- Data for Name: invocation_provider_input_values; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.invocation_provider_input_values (id, template_invocation_id, value, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4798 (class 0 OID 17853)
-- Dependencies: 356
-- Data for Name: job_invocations; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.job_invocations (id, targeting_id, job_category, task_id, task_group_id, triggering_id, description, concurrency_level, execution_timeout_interval, password, key_passphrase, remote_execution_feature_id, effective_user_password, ssh_user, time_to_pickup) FROM stdin;
\.


--
-- TOC entry 4814 (class 0 OID 17973)
-- Dependencies: 372
-- Data for Name: job_template_effective_users; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.job_template_effective_users (id, job_template_id, value, overridable, "current_user") FROM stdin;
\.


--
-- TOC entry 4838 (class 0 OID 18354)
-- Dependencies: 396
-- Data for Name: jwt_secrets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.jwt_secrets (id, token, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4743 (class 0 OID 16928)
-- Dependencies: 301
-- Data for Name: key_pairs; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.key_pairs (id, secret, compute_resource_id, name, created_at, updated_at, public) FROM stdin;
\.


--
-- TOC entry 4749 (class 0 OID 17002)
-- Dependencies: 307
-- Data for Name: locations_organizations; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.locations_organizations (location_id, organization_id) FROM stdin;
2	1
\.


--
-- TOC entry 4714 (class 0 OID 16756)
-- Dependencies: 272
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.logs (id, source_id, message_id, report_id, level_id) FROM stdin;
\.


--
-- TOC entry 4697 (class 0 OID 16649)
-- Dependencies: 255
-- Data for Name: lookup_keys; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.lookup_keys (id, key, created_at, updated_at, default_value, path, description, validator_type, validator_rule, key_type, override, required, lookup_values_count, merge_overrides, avoid_duplicates, omit, type, merge_default, hidden_value, ansible_role_id, imported) FROM stdin;
\.


--
-- TOC entry 4699 (class 0 OID 16657)
-- Dependencies: 257
-- Data for Name: lookup_values; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.lookup_values (id, match, value, lookup_key_id, created_at, updated_at, omit) FROM stdin;
\.


--
-- TOC entry 4782 (class 0 OID 17674)
-- Dependencies: 340
-- Data for Name: mail_notifications; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.mail_notifications (id, name, description, mailer, method, subscriptable, default_interval, created_at, updated_at, subscription_type, queryable, type) FROM stdin;
1	config_summary	A summary of eventful configuration management reports	HostMailer	summary	t	\N	2025-01-19 19:42:38.929624	2025-01-19 19:42:38.929624	report	f	\N
2	welcome	A mail a user receives upon account creation	UserMailer	welcome	f	\N	2025-01-19 19:42:38.931384	2025-01-19 19:42:38.931384	\N	f	\N
3	audit_summary	A summary of audit changes report <br> Filtered by a query if needed	AuditMailer	summary	t	\N	2025-01-19 19:42:38.933051	2025-01-19 19:42:38.933051	report	t	\N
4	host_built	A notification when a host finishes building	HostMailer	host_built	t	\N	2025-01-19 19:42:38.934645	2025-01-19 19:42:38.934645	alert	f	\N
5	tester	A test message to check the email configuration is working	UserMailer	tester	f	\N	2025-01-19 19:42:38.936322	2025-01-19 19:42:38.936322	\N	f	\N
6	config_error_state	A notification when a host reports a configuration error	HostMailer	error_state	t	\N	2025-01-19 19:42:38.937965	2025-01-19 19:42:38.937965	alert	f	ConfigManagementError
7	discovered_summary	A summary of discovered hosts	DiscoveredMailer	discovered_summary	t	\N	2025-01-19 19:42:39.300894	2025-01-19 19:42:39.300894	report	f	\N
8	long_running_tasks	A notification when tasks run for suspiciously long time	TasksMailer	long_tasks	t	\N	2025-01-19 19:42:39.496377	2025-01-19 19:42:39.496377	alert	f	ForemanTasks::TasksMailNotification
9	remote_execution_job	A notification when a job finishes	RexJobMailer	job_finished	t	\N	2025-01-19 19:42:39.512234	2025-01-19 19:42:39.512234	alert	f	RexMailNotification
\.


--
-- TOC entry 4665 (class 0 OID 16462)
-- Dependencies: 223
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.media (id, name, path, created_at, updated_at, media_path, config_path, image_path, os_family) FROM stdin;
1	CentOS 7 mirror	http://mirror.centos.org/centos/$major/os/$arch	2025-01-19 19:42:38.763302	2025-01-19 19:42:38.763302	\N	\N	\N	Redhat
2	CentOS Stream	http://mirror.centos.org/centos/$major-stream/BaseOS/$arch/os	2025-01-19 19:42:38.771959	2025-01-19 19:42:38.771959	\N	\N	\N	Redhat
3	CentOS Stream 9 mirror	http://mirror.stream.centos.org/$major-stream/BaseOS/$arch/os	2025-01-19 19:42:38.778837	2025-01-19 19:42:38.778837	\N	\N	\N	Redhat
4	Debian mirror	http://ftp.debian.org/debian	2025-01-19 19:42:38.785818	2025-01-19 19:42:38.785818	\N	\N	\N	Debian
5	Fedora mirror	http://dl.fedoraproject.org/pub/fedora/linux/releases/$major/Server/$arch/os/	2025-01-19 19:42:38.792667	2025-01-19 19:42:38.792667	\N	\N	\N	Redhat
6	FreeBSD mirror	http://ftp.freebsd.org/pub/FreeBSD/releases/$arch/$version-RELEASE/	2025-01-19 19:42:38.799295	2025-01-19 19:42:38.799295	\N	\N	\N	Freebsd
7	OpenSUSE mirror	http://download.opensuse.org/distribution/leap/$version/repo/oss	2025-01-19 19:42:38.807704	2025-01-19 19:42:38.807704	\N	\N	\N	Suse
8	Ubuntu mirror	http://archive.ubuntu.com/ubuntu	2025-01-19 19:42:38.814495	2025-01-19 19:42:38.814495	\N	\N	\N	Debian
9	RancherOS mirror	https://github.com/rancher/os/releases/download/v$version	2025-01-19 19:42:38.821251	2025-01-19 19:42:38.821251	\N	\N	\N	Rancheros
10	Rocky Linux	https://download.rockylinux.org/pub/rocky/$version/BaseOS/$arch/os	2025-01-19 19:42:38.828048	2025-01-19 19:42:38.828048	\N	\N	\N	Redhat
11	AlmaLinux	https://repo.almalinux.org/almalinux/$version/BaseOS/$arch/os/	2025-01-19 19:42:38.834823	2025-01-19 19:42:38.834823	\N	\N	\N	Redhat
12	CoreOS mirror	http://$release-temporary-archive.release.core-os.net	2025-01-19 19:42:38.841557	2025-01-19 19:42:38.841557	\N	\N	\N	Coreos
13	Flatcar mirror	http://$release.release.flatcar-linux.net	2025-01-19 19:42:38.848326	2025-01-19 19:42:38.848326	\N	\N	\N	Coreos
14	Fedora CoreOS mirror	https://builds.coreos.fedoraproject.org	2025-01-19 19:42:38.855053	2025-01-19 19:42:38.855053	\N	\N	\N	Fcos
15	Red Hat CoreOS mirror	http://mirror.openshift.com	2025-01-19 19:42:38.861894	2025-01-19 19:42:38.861894	\N	\N	\N	Rhcos
\.


--
-- TOC entry 4704 (class 0 OID 16682)
-- Dependencies: 262
-- Data for Name: media_operatingsystems; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.media_operatingsystems (medium_id, operatingsystem_id) FROM stdin;
\.


--
-- TOC entry 4710 (class 0 OID 16736)
-- Dependencies: 268
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.messages (id, value) FROM stdin;
\.


--
-- TOC entry 4673 (class 0 OID 16498)
-- Dependencies: 231
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.models (id, name, info, created_at, updated_at, vendor_class, hardware_model) FROM stdin;
\.


--
-- TOC entry 4739 (class 0 OID 16877)
-- Dependencies: 297
-- Data for Name: nics; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.nics (id, mac, ip, type, name, host_id, subnet_id, domain_id, attrs, created_at, updated_at, provider, username, password, virtual, link, identifier, tag, attached_to, managed, mode, attached_devices, bond_options, "primary", provision, compute_attributes, execution, ip6, subnet6_id) FROM stdin;
\.


--
-- TOC entry 4826 (class 0 OID 18156)
-- Dependencies: 384
-- Data for Name: notification_blueprints; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.notification_blueprints (id, "group", level, message, name, expires_in, created_at, updated_at, actions) FROM stdin;
1	Hosts	success	%{subject} has been provisioned successfully	host_build_completed	86400	2025-01-19 19:42:38.948057	2025-01-19 19:42:38.948057	{"links":[{"path_method":"host_path","title":"Details"}]}
2	Hosts	info	%{subject} has been deleted successfully	host_destroyed	86400	2025-01-19 19:42:38.948931	2025-01-19 19:42:38.948931	\N
3	Community	info	RSS post message goes here	rss_post	2592000	2025-01-19 19:42:38.949687	2025-01-19 19:42:38.949687	{"links":[{"title":"URL","external":true}]}
4	Deprecations	warning	The %{setting} setting has been deprecated and will be removed in version %{version}	setting_deprecation	2592000	2025-01-19 19:42:38.950374	2025-01-19 19:42:38.950374	\N
5	Deprecations	warning	Support for %{feature} has been deprecated and will be removed in version %{version}	feature_deprecation	2592000	2025-01-19 19:42:38.951028	2025-01-19 19:42:38.951028	\N
6	Reports	info	Report is ready to download	report_finish	86400	2025-01-19 19:42:38.951706	2025-01-19 19:42:38.951706	{"links":[{"path_method":"edit_host_path","title":"Download Report"},{"path_method":"edit_host_path","title":"Regenerate Report"}]}
7	Tasks	warning	DYNAMIC	tasks_paused_admin	86400	2025-01-19 19:42:39.133434	2025-01-19 19:42:39.133434	{"links":[{"href":"/foreman_tasks/tasks?search=state%3Dpaused","title":"List of tasks"}]}
8	Tasks	warning	The task '%{subject}' got paused	tasks_paused_owner	86400	2025-01-19 19:42:39.134188	2025-01-19 19:42:39.134188	{"links":[{"path_method":"foreman_tasks_task_path","title":"Task Details"}]}
9	Tasks	info	DYNAMIC	tasks_bulk_resume	86400	2025-01-19 19:42:39.134981	2025-01-19 19:42:39.134981	\N
10	Tasks	info	DYNAMIC	tasks_bulk_cancel	86400	2025-01-19 19:42:39.135611	2025-01-19 19:42:39.135611	\N
11	Tasks	info	DYNAMIC	tasks_bulk_stop	86400	2025-01-19 19:42:39.136233	2025-01-19 19:42:39.136233	\N
12	Tasks	warning	DYNAMIC	tasks_running_long	86400	2025-01-19 19:42:39.136847	2025-01-19 19:42:39.136847	\N
13	Jobs	success	A job '%{subject}' has finished successfully	rex_job_succeeded	86400	2025-01-19 19:42:39.138539	2025-01-19 19:42:39.138539	{"links":[{"path_method":"job_invocation_path","title":"Job Details"}]}
14	Jobs	error	A job '%{subject}' has failed	rex_job_failed	86400	2025-01-19 19:42:39.139251	2025-01-19 19:42:39.139251	{"links":[{"path_method":"job_invocation_path","title":"Job Details"}]}
15	New hosts	info	One or more hosts have been discovered	new_discovered_host	86400	2025-01-19 19:42:39.464749	2025-01-19 19:42:39.464749	{"links":[{"path_method":"discovered_hosts_path","title":"Details"}]}
16	Hosts	error	Error message goes here	failed_discovery	86400	2025-01-19 19:42:39.465479	2025-01-19 19:42:39.465479	\N
17	Roles	success	Import roles and variables has finished successfully	Sync_roles_and_variables_successfully	86400	2025-01-19 19:42:39.487697	2025-01-19 19:42:39.487697	{"links":[{"path_method":"ansible_roles_path","title":"Roles"}]}
18	Roles	error	DYNAMIC	Sync_roles_and_variables_failed	86400	2025-01-19 19:42:39.488512	2025-01-19 19:42:39.488512	\N
19	Playbooks	success	Import playbooks has finished successfully	Sync_playbooks_successfully	86400	2025-01-19 19:42:39.489149	2025-01-19 19:42:39.489149	\N
20	Playbooks	error	DYNAMIC	Sync_playbooks_failed	86400	2025-01-19 19:42:39.489777	2025-01-19 19:42:39.489777	\N
\.


--
-- TOC entry 4830 (class 0 OID 18187)
-- Dependencies: 388
-- Data for Name: notification_recipients; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.notification_recipients (id, notification_id, user_id, seen, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4828 (class 0 OID 18166)
-- Dependencies: 386
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.notifications (id, notification_blueprint_id, user_id, audience, expired_at, created_at, updated_at, subject_type, subject_id, message, actions) FROM stdin;
\.


--
-- TOC entry 4671 (class 0 OID 16490)
-- Dependencies: 229
-- Data for Name: operatingsystems; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.operatingsystems (id, major, name, minor, nameindicator, created_at, updated_at, release_name, type, description, password_hash, title) FROM stdin;
\.


--
-- TOC entry 4719 (class 0 OID 16786)
-- Dependencies: 277
-- Data for Name: operatingsystems_provisioning_templates; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.operatingsystems_provisioning_templates (provisioning_template_id, operatingsystem_id) FROM stdin;
\.


--
-- TOC entry 4680 (class 0 OID 16543)
-- Dependencies: 238
-- Data for Name: operatingsystems_ptables; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.operatingsystems_ptables (ptable_id, operatingsystem_id) FROM stdin;
\.


--
-- TOC entry 4684 (class 0 OID 16563)
-- Dependencies: 242
-- Data for Name: operatingsystems_puppetclasses; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.operatingsystems_puppetclasses (puppetclass_id, operatingsystem_id) FROM stdin;
\.


--
-- TOC entry 4723 (class 0 OID 16797)
-- Dependencies: 281
-- Data for Name: os_default_templates; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.os_default_templates (id, provisioning_template_id, template_kind_id, operatingsystem_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4686 (class 0 OID 16567)
-- Dependencies: 244
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.parameters (id, name, value, reference_id, created_at, updated_at, type, priority, hidden_value, key_type, searchable_value) FROM stdin;
1	ansible_roles_check_mode	--- false\n	\N	2025-01-19 19:42:38.874886	2025-01-19 19:42:38.874886	CommonParameter	0	f	boolean	f
2	host_registration_insights	--- false\n	\N	2025-01-19 19:42:38.954211	2025-01-19 19:42:38.954211	CommonParameter	0	f	boolean	f
3	host_registration_remote_execution	--- true\n	\N	2025-01-19 19:42:38.956417	2025-01-19 19:42:38.956417	CommonParameter	0	f	boolean	t
4	host_packages	--- ''\n	\N	2025-01-19 19:42:38.959403	2025-01-19 19:42:38.959403	CommonParameter	0	f	string	
\.


--
-- TOC entry 4759 (class 0 OID 17465)
-- Dependencies: 317
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.permissions (id, name, resource_type, created_at, updated_at) FROM stdin;
1	view_foreman_tasks	ForemanTasks::Task	2025-01-19 19:42:29.788505	2025-01-19 19:42:29.788505
2	edit_foreman_tasks	ForemanTasks::Task	2025-01-19 19:42:29.800888	2025-01-19 19:42:29.800888
3	create_recurring_logics	ForemanTasks::RecurringLogic	2025-01-19 19:42:29.803933	2025-01-19 19:42:29.803933
4	view_recurring_logics	ForemanTasks::RecurringLogic	2025-01-19 19:42:29.806848	2025-01-19 19:42:29.806848
5	edit_recurring_logics	ForemanTasks::RecurringLogic	2025-01-19 19:42:29.809757	2025-01-19 19:42:29.809757
6	view_job_templates	JobTemplate	2025-01-19 19:42:29.813807	2025-01-19 19:42:29.813807
7	create_job_templates	JobTemplate	2025-01-19 19:42:29.816576	2025-01-19 19:42:29.816576
8	edit_job_templates	JobTemplate	2025-01-19 19:42:29.819556	2025-01-19 19:42:29.819556
9	view_remote_execution_features	RemoteExecutionFeature	2025-01-19 19:42:29.822425	2025-01-19 19:42:29.822425
10	edit_remote_execution_features	RemoteExecutionFeature	2025-01-19 19:42:29.825286	2025-01-19 19:42:29.825286
11	destroy_job_templates	JobTemplate	2025-01-19 19:42:29.828196	2025-01-19 19:42:29.828196
12	lock_job_templates	JobTemplate	2025-01-19 19:42:29.831098	2025-01-19 19:42:29.831098
13	create_job_invocations	JobInvocation	2025-01-19 19:42:29.834048	2025-01-19 19:42:29.834048
14	view_job_invocations	JobInvocation	2025-01-19 19:42:29.837042	2025-01-19 19:42:29.837042
15	view_template_invocations	TemplateInvocation	2025-01-19 19:42:29.839966	2025-01-19 19:42:29.839966
16	create_template_invocations	TemplateInvocation	2025-01-19 19:42:29.842915	2025-01-19 19:42:29.842915
17	execute_jobs_on_infrastructure_hosts	JobInvocation	2025-01-19 19:42:29.845775	2025-01-19 19:42:29.845775
18	cancel_job_invocations	JobInvocation	2025-01-19 19:42:29.848655	2025-01-19 19:42:29.848655
19	filter_autocompletion_for_template_invocation	TemplateInvocation	2025-01-19 19:42:29.851725	2025-01-19 19:42:29.851725
20	cockpit_hosts	Host	2025-01-19 19:42:29.854828	2025-01-19 19:42:29.854828
21	play_roles_on_host	Host	2025-01-19 19:42:29.858539	2025-01-19 19:42:29.858539
22	play_roles_on_hostgroup	Hostgroup	2025-01-19 19:42:29.861538	2025-01-19 19:42:29.861538
23	view_ansible_roles	AnsibleRole	2025-01-19 19:42:29.864938	2025-01-19 19:42:29.864938
24	destroy_ansible_roles	AnsibleRole	2025-01-19 19:42:29.868429	2025-01-19 19:42:29.868429
25	import_ansible_roles	AnsibleRole	2025-01-19 19:42:29.871865	2025-01-19 19:42:29.871865
26	view_ansible_variables	AnsibleVariable	2025-01-19 19:42:29.875271	2025-01-19 19:42:29.875271
27	edit_ansible_variables	AnsibleVariable	2025-01-19 19:42:29.87879	2025-01-19 19:42:29.87879
28	destroy_ansible_variables	AnsibleVariable	2025-01-19 19:42:29.882213	2025-01-19 19:42:29.882213
29	create_ansible_variables	AnsibleVariable	2025-01-19 19:42:29.88569	2025-01-19 19:42:29.88569
30	import_ansible_variables	AnsibleVariable	2025-01-19 19:42:29.889163	2025-01-19 19:42:29.889163
31	view_hosts	Host	2025-01-19 19:42:29.89265	2025-01-19 19:42:29.89265
32	view_hostgroups	Hostgroup	2025-01-19 19:42:29.89611	2025-01-19 19:42:29.89611
33	edit_hosts	Host	2025-01-19 19:42:29.899623	2025-01-19 19:42:29.899623
34	edit_hostgroups	Hostgroup	2025-01-19 19:42:29.903057	2025-01-19 19:42:29.903057
35	generate_ansible_inventory	\N	2025-01-19 19:42:29.906476	2025-01-19 19:42:29.906476
36	import_ansible_playbooks	\N	2025-01-19 19:42:29.909945	2025-01-19 19:42:29.909945
37	view_discovered_hosts	Host	2025-01-19 19:42:29.914511	2025-01-19 19:42:29.914511
38	submit_discovered_hosts	Host	2025-01-19 19:42:29.917992	2025-01-19 19:42:29.917992
39	auto_provision_discovered_hosts	Host	2025-01-19 19:42:29.921557	2025-01-19 19:42:29.921557
40	provision_discovered_hosts	Host	2025-01-19 19:42:29.925429	2025-01-19 19:42:29.925429
41	edit_discovered_hosts	Host	2025-01-19 19:42:29.929342	2025-01-19 19:42:29.929342
42	destroy_discovered_hosts	Host	2025-01-19 19:42:29.933182	2025-01-19 19:42:29.933182
43	view_discovery_rules	DiscoveryRule	2025-01-19 19:42:29.937	2025-01-19 19:42:29.937
44	create_discovery_rules	DiscoveryRule	2025-01-19 19:42:29.940896	2025-01-19 19:42:29.940896
45	edit_discovery_rules	DiscoveryRule	2025-01-19 19:42:29.944679	2025-01-19 19:42:29.944679
46	execute_discovery_rules	DiscoveryRule	2025-01-19 19:42:29.948516	2025-01-19 19:42:29.948516
47	destroy_discovery_rules	DiscoveryRule	2025-01-19 19:42:29.952394	2025-01-19 19:42:29.952394
48	view_config_groups	ForemanPuppet::ConfigGroup	2025-01-19 19:42:29.957691	2025-01-19 19:42:29.957691
49	create_config_groups	ForemanPuppet::ConfigGroup	2025-01-19 19:42:29.961657	2025-01-19 19:42:29.961657
50	edit_config_groups	ForemanPuppet::ConfigGroup	2025-01-19 19:42:29.965551	2025-01-19 19:42:29.965551
51	destroy_config_groups	ForemanPuppet::ConfigGroup	2025-01-19 19:42:29.969401	2025-01-19 19:42:29.969401
52	view_external_parameters	ForemanPuppet::PuppetclassLookupKey	2025-01-19 19:42:29.9734	2025-01-19 19:42:29.9734
53	create_external_parameters	ForemanPuppet::PuppetclassLookupKey	2025-01-19 19:42:29.977233	2025-01-19 19:42:29.977233
54	edit_external_parameters	ForemanPuppet::PuppetclassLookupKey	2025-01-19 19:42:29.981059	2025-01-19 19:42:29.981059
55	destroy_external_parameters	ForemanPuppet::PuppetclassLookupKey	2025-01-19 19:42:29.985031	2025-01-19 19:42:29.985031
56	view_environments	ForemanPuppet::Environment	2025-01-19 19:42:29.988845	2025-01-19 19:42:29.988845
57	create_environments	ForemanPuppet::Environment	2025-01-19 19:42:29.992899	2025-01-19 19:42:29.992899
58	edit_environments	ForemanPuppet::Environment	2025-01-19 19:42:29.996784	2025-01-19 19:42:29.996784
59	destroy_environments	ForemanPuppet::Environment	2025-01-19 19:42:30.000631	2025-01-19 19:42:30.000631
60	import_environments	ForemanPuppet::Environment	2025-01-19 19:42:30.004633	2025-01-19 19:42:30.004633
61	view_puppetclasses	ForemanPuppet::Puppetclass	2025-01-19 19:42:30.008707	2025-01-19 19:42:30.008707
62	create_puppetclasses	ForemanPuppet::Puppetclass	2025-01-19 19:42:30.012563	2025-01-19 19:42:30.012563
63	edit_puppetclasses	ForemanPuppet::Puppetclass	2025-01-19 19:42:30.016539	2025-01-19 19:42:30.016539
64	destroy_puppetclasses	ForemanPuppet::Puppetclass	2025-01-19 19:42:30.020445	2025-01-19 19:42:30.020445
65	import_puppetclasses	ForemanPuppet::Puppetclass	2025-01-19 19:42:30.024311	2025-01-19 19:42:30.024311
66	edit_classes	ForemanPuppet::HostClass	2025-01-19 19:42:30.028317	2025-01-19 19:42:30.028317
67	view_webhooks	Webhook	2025-01-19 19:42:30.033483	2025-01-19 19:42:30.033483
68	create_webhooks	Webhook	2025-01-19 19:42:30.037542	2025-01-19 19:42:30.037542
69	edit_webhooks	Webhook	2025-01-19 19:42:30.041365	2025-01-19 19:42:30.041365
70	destroy_webhooks	Webhook	2025-01-19 19:42:30.045199	2025-01-19 19:42:30.045199
71	view_webhook_templates	WebhookTemplate	2025-01-19 19:42:30.049276	2025-01-19 19:42:30.049276
72	create_webhook_templates	WebhookTemplate	2025-01-19 19:42:30.053111	2025-01-19 19:42:30.053111
73	edit_webhook_templates	WebhookTemplate	2025-01-19 19:42:30.056959	2025-01-19 19:42:30.056959
74	destroy_webhook_templates	WebhookTemplate	2025-01-19 19:42:30.060929	2025-01-19 19:42:30.060929
75	lock_webhook_templates	WebhookTemplate	2025-01-19 19:42:30.064805	2025-01-19 19:42:30.064805
76	view_architectures	Architecture	2025-01-19 19:42:36.035317	2025-01-19 19:42:36.035317
77	create_architectures	Architecture	2025-01-19 19:42:36.036356	2025-01-19 19:42:36.036356
78	edit_architectures	Architecture	2025-01-19 19:42:36.037309	2025-01-19 19:42:36.037309
79	destroy_architectures	Architecture	2025-01-19 19:42:36.038308	2025-01-19 19:42:36.038308
80	view_audit_logs	Audit	2025-01-19 19:42:36.03926	2025-01-19 19:42:36.03926
81	view_authenticators	AuthSource	2025-01-19 19:42:36.040264	2025-01-19 19:42:36.040264
82	create_authenticators	AuthSource	2025-01-19 19:42:36.041175	2025-01-19 19:42:36.041175
83	edit_authenticators	AuthSource	2025-01-19 19:42:36.042085	2025-01-19 19:42:36.042085
84	destroy_authenticators	AuthSource	2025-01-19 19:42:36.04306	2025-01-19 19:42:36.04306
85	create_bookmarks	Bookmark	2025-01-19 19:42:36.043947	2025-01-19 19:42:36.043947
86	edit_bookmarks	Bookmark	2025-01-19 19:42:36.044832	2025-01-19 19:42:36.044832
87	destroy_bookmarks	Bookmark	2025-01-19 19:42:36.045794	2025-01-19 19:42:36.045794
88	view_compute_profiles	ComputeProfile	2025-01-19 19:42:36.046692	2025-01-19 19:42:36.046692
89	create_compute_profiles	ComputeProfile	2025-01-19 19:42:36.047576	2025-01-19 19:42:36.047576
90	edit_compute_profiles	ComputeProfile	2025-01-19 19:42:36.04854	2025-01-19 19:42:36.04854
91	destroy_compute_profiles	ComputeProfile	2025-01-19 19:42:36.049424	2025-01-19 19:42:36.049424
92	view_compute_resources	ComputeResource	2025-01-19 19:42:36.050629	2025-01-19 19:42:36.050629
93	create_compute_resources	ComputeResource	2025-01-19 19:42:36.051595	2025-01-19 19:42:36.051595
94	edit_compute_resources	ComputeResource	2025-01-19 19:42:36.05249	2025-01-19 19:42:36.05249
95	destroy_compute_resources	ComputeResource	2025-01-19 19:42:36.053457	2025-01-19 19:42:36.053457
96	power_vm_compute_resources	ComputeResource	2025-01-19 19:42:36.054353	2025-01-19 19:42:36.054353
97	destroy_vm_compute_resources	ComputeResource	2025-01-19 19:42:36.055246	2025-01-19 19:42:36.055246
98	view_compute_resources_vms	ComputeResource	2025-01-19 19:42:36.056209	2025-01-19 19:42:36.056209
99	create_compute_resources_vms	ComputeResource	2025-01-19 19:42:36.057097	2025-01-19 19:42:36.057097
100	edit_compute_resources_vms	ComputeResource	2025-01-19 19:42:36.057984	2025-01-19 19:42:36.057984
101	destroy_compute_resources_vms	ComputeResource	2025-01-19 19:42:36.058957	2025-01-19 19:42:36.058957
102	power_compute_resources_vms	ComputeResource	2025-01-19 19:42:36.059845	2025-01-19 19:42:36.059845
103	console_compute_resources_vms	ComputeResource	2025-01-19 19:42:36.060803	2025-01-19 19:42:36.060803
104	view_config_reports	ConfigReport	2025-01-19 19:42:36.061687	2025-01-19 19:42:36.061687
105	destroy_config_reports	ConfigReport	2025-01-19 19:42:36.06258	2025-01-19 19:42:36.06258
106	upload_config_reports	ConfigReport	2025-01-19 19:42:36.063542	2025-01-19 19:42:36.063542
107	access_dashboard	\N	2025-01-19 19:42:36.064511	2025-01-19 19:42:36.064511
108	view_domains	Domain	2025-01-19 19:42:36.065398	2025-01-19 19:42:36.065398
109	create_domains	Domain	2025-01-19 19:42:36.066354	2025-01-19 19:42:36.066354
110	edit_domains	Domain	2025-01-19 19:42:36.067241	2025-01-19 19:42:36.067241
111	destroy_domains	Domain	2025-01-19 19:42:36.06819	2025-01-19 19:42:36.06819
112	view_external_usergroups	ExternalUsergroup	2025-01-19 19:42:36.069074	2025-01-19 19:42:36.069074
113	create_external_usergroups	ExternalUsergroup	2025-01-19 19:42:36.06996	2025-01-19 19:42:36.06996
114	edit_external_usergroups	ExternalUsergroup	2025-01-19 19:42:36.070915	2025-01-19 19:42:36.070915
115	destroy_external_usergroups	ExternalUsergroup	2025-01-19 19:42:36.071802	2025-01-19 19:42:36.071802
116	view_facts	FactValue	2025-01-19 19:42:36.072702	2025-01-19 19:42:36.072702
117	upload_facts	FactValue	2025-01-19 19:42:36.073656	2025-01-19 19:42:36.073656
118	view_filters	Filter	2025-01-19 19:42:36.074551	2025-01-19 19:42:36.074551
119	create_filters	Filter	2025-01-19 19:42:36.075496	2025-01-19 19:42:36.075496
120	edit_filters	Filter	2025-01-19 19:42:36.076388	2025-01-19 19:42:36.076388
121	destroy_filters	Filter	2025-01-19 19:42:36.077274	2025-01-19 19:42:36.077274
122	create_hostgroups	Hostgroup	2025-01-19 19:42:36.078519	2025-01-19 19:42:36.078519
123	destroy_hostgroups	Hostgroup	2025-01-19 19:42:36.079683	2025-01-19 19:42:36.079683
124	create_hosts	Host	2025-01-19 19:42:36.080915	2025-01-19 19:42:36.080915
125	destroy_hosts	Host	2025-01-19 19:42:36.082072	2025-01-19 19:42:36.082072
126	build_hosts	Host	2025-01-19 19:42:36.082963	2025-01-19 19:42:36.082963
127	power_hosts	Host	2025-01-19 19:42:36.083921	2025-01-19 19:42:36.083921
128	console_hosts	Host	2025-01-19 19:42:36.084801	2025-01-19 19:42:36.084801
129	ipmi_boot_hosts	Host	2025-01-19 19:42:36.08576	2025-01-19 19:42:36.08576
130	forget_status_hosts	Host	2025-01-19 19:42:36.08665	2025-01-19 19:42:36.08665
131	view_http_proxies	HttpProxy	2025-01-19 19:42:36.087532	2025-01-19 19:42:36.087532
132	create_http_proxies	HttpProxy	2025-01-19 19:42:36.08848	2025-01-19 19:42:36.08848
133	edit_http_proxies	HttpProxy	2025-01-19 19:42:36.089373	2025-01-19 19:42:36.089373
134	destroy_http_proxies	HttpProxy	2025-01-19 19:42:36.090264	2025-01-19 19:42:36.090264
135	view_images	Image	2025-01-19 19:42:36.09123	2025-01-19 19:42:36.09123
136	create_images	Image	2025-01-19 19:42:36.092112	2025-01-19 19:42:36.092112
137	edit_images	Image	2025-01-19 19:42:36.09306	2025-01-19 19:42:36.09306
138	destroy_images	Image	2025-01-19 19:42:36.093951	2025-01-19 19:42:36.093951
139	view_keypairs	KeyPair	2025-01-19 19:42:36.094854	2025-01-19 19:42:36.094854
140	destroy_keypairs	KeyPair	2025-01-19 19:42:36.095822	2025-01-19 19:42:36.095822
141	view_locations	Location	2025-01-19 19:42:36.096715	2025-01-19 19:42:36.096715
142	create_locations	Location	2025-01-19 19:42:36.097596	2025-01-19 19:42:36.097596
143	edit_locations	Location	2025-01-19 19:42:36.098556	2025-01-19 19:42:36.098556
144	destroy_locations	Location	2025-01-19 19:42:36.099456	2025-01-19 19:42:36.099456
145	assign_locations	Location	2025-01-19 19:42:36.100402	2025-01-19 19:42:36.100402
146	view_lookup_values	LookupValue	2025-01-19 19:42:36.101296	2025-01-19 19:42:36.101296
147	create_lookup_values	LookupValue	2025-01-19 19:42:36.102182	2025-01-19 19:42:36.102182
148	edit_lookup_values	LookupValue	2025-01-19 19:42:36.103146	2025-01-19 19:42:36.103146
149	destroy_lookup_values	LookupValue	2025-01-19 19:42:36.104033	2025-01-19 19:42:36.104033
150	view_mail_notifications	MailNotification	2025-01-19 19:42:36.104916	2025-01-19 19:42:36.104916
151	edit_user_mail_notifications	MailNotification	2025-01-19 19:42:36.105876	2025-01-19 19:42:36.105876
152	view_media	Medium	2025-01-19 19:42:36.106778	2025-01-19 19:42:36.106778
153	create_media	Medium	2025-01-19 19:42:36.107672	2025-01-19 19:42:36.107672
154	edit_media	Medium	2025-01-19 19:42:36.108632	2025-01-19 19:42:36.108632
155	destroy_media	Medium	2025-01-19 19:42:36.109516	2025-01-19 19:42:36.109516
156	view_models	Model	2025-01-19 19:42:36.110409	2025-01-19 19:42:36.110409
157	create_models	Model	2025-01-19 19:42:36.111361	2025-01-19 19:42:36.111361
158	edit_models	Model	2025-01-19 19:42:36.112251	2025-01-19 19:42:36.112251
159	destroy_models	Model	2025-01-19 19:42:36.113203	2025-01-19 19:42:36.113203
160	view_operatingsystems	Operatingsystem	2025-01-19 19:42:36.11409	2025-01-19 19:42:36.11409
161	create_operatingsystems	Operatingsystem	2025-01-19 19:42:36.114985	2025-01-19 19:42:36.114985
162	edit_operatingsystems	Operatingsystem	2025-01-19 19:42:36.115941	2025-01-19 19:42:36.115941
163	destroy_operatingsystems	Operatingsystem	2025-01-19 19:42:36.116825	2025-01-19 19:42:36.116825
164	view_organizations	Organization	2025-01-19 19:42:36.117716	2025-01-19 19:42:36.117716
165	create_organizations	Organization	2025-01-19 19:42:36.118684	2025-01-19 19:42:36.118684
166	edit_organizations	Organization	2025-01-19 19:42:36.119657	2025-01-19 19:42:36.119657
167	destroy_organizations	Organization	2025-01-19 19:42:36.120618	2025-01-19 19:42:36.120618
168	assign_organizations	Organization	2025-01-19 19:42:36.121508	2025-01-19 19:42:36.121508
169	view_params	Parameter	2025-01-19 19:42:36.12241	2025-01-19 19:42:36.12241
170	create_params	Parameter	2025-01-19 19:42:36.123365	2025-01-19 19:42:36.123365
171	edit_params	Parameter	2025-01-19 19:42:36.124251	2025-01-19 19:42:36.124251
172	destroy_params	Parameter	2025-01-19 19:42:36.125142	2025-01-19 19:42:36.125142
173	view_personal_access_tokens	PersonalAccessToken	2025-01-19 19:42:36.126089	2025-01-19 19:42:36.126089
174	create_personal_access_tokens	PersonalAccessToken	2025-01-19 19:42:36.126996	2025-01-19 19:42:36.126996
175	revoke_personal_access_tokens	PersonalAccessToken	2025-01-19 19:42:36.127956	2025-01-19 19:42:36.127956
176	view_ptables	Ptable	2025-01-19 19:42:36.128848	2025-01-19 19:42:36.128848
177	create_ptables	Ptable	2025-01-19 19:42:36.129738	2025-01-19 19:42:36.129738
178	edit_ptables	Ptable	2025-01-19 19:42:36.130697	2025-01-19 19:42:36.130697
179	destroy_ptables	Ptable	2025-01-19 19:42:36.131585	2025-01-19 19:42:36.131585
180	lock_ptables	Ptable	2025-01-19 19:42:36.13247	2025-01-19 19:42:36.13247
181	view_provisioning_templates	ProvisioningTemplate	2025-01-19 19:42:36.133436	2025-01-19 19:42:36.133436
182	create_provisioning_templates	ProvisioningTemplate	2025-01-19 19:42:36.134328	2025-01-19 19:42:36.134328
183	edit_provisioning_templates	ProvisioningTemplate	2025-01-19 19:42:36.135227	2025-01-19 19:42:36.135227
184	destroy_provisioning_templates	ProvisioningTemplate	2025-01-19 19:42:36.136241	2025-01-19 19:42:36.136241
185	deploy_provisioning_templates	ProvisioningTemplate	2025-01-19 19:42:36.137135	2025-01-19 19:42:36.137135
186	lock_provisioning_templates	ProvisioningTemplate	2025-01-19 19:42:36.138144	2025-01-19 19:42:36.138144
187	view_report_templates	ReportTemplate	2025-01-19 19:42:36.139062	2025-01-19 19:42:36.139062
188	create_report_templates	ReportTemplate	2025-01-19 19:42:36.139954	2025-01-19 19:42:36.139954
189	edit_report_templates	ReportTemplate	2025-01-19 19:42:36.14092	2025-01-19 19:42:36.14092
190	destroy_report_templates	ReportTemplate	2025-01-19 19:42:36.141814	2025-01-19 19:42:36.141814
191	lock_report_templates	ReportTemplate	2025-01-19 19:42:36.142735	2025-01-19 19:42:36.142735
192	generate_report_templates	ReportTemplate	2025-01-19 19:42:36.143683	2025-01-19 19:42:36.143683
193	view_plugins	\N	2025-01-19 19:42:36.144592	2025-01-19 19:42:36.144592
194	view_realms	Realm	2025-01-19 19:42:36.145538	2025-01-19 19:42:36.145538
195	create_realms	Realm	2025-01-19 19:42:36.14643	2025-01-19 19:42:36.14643
196	edit_realms	Realm	2025-01-19 19:42:36.147321	2025-01-19 19:42:36.147321
197	destroy_realms	Realm	2025-01-19 19:42:36.148293	2025-01-19 19:42:36.148293
198	view_roles	Role	2025-01-19 19:42:36.149194	2025-01-19 19:42:36.149194
199	create_roles	Role	2025-01-19 19:42:36.150075	2025-01-19 19:42:36.150075
200	edit_roles	Role	2025-01-19 19:42:36.151029	2025-01-19 19:42:36.151029
201	destroy_roles	Role	2025-01-19 19:42:36.151908	2025-01-19 19:42:36.151908
202	escalate_roles	\N	2025-01-19 19:42:36.152818	2025-01-19 19:42:36.152818
203	view_settings	Setting	2025-01-19 19:42:36.153746	2025-01-19 19:42:36.153746
204	edit_settings	Setting	2025-01-19 19:42:36.15464	2025-01-19 19:42:36.15464
205	view_smart_proxies	SmartProxy	2025-01-19 19:42:36.155533	2025-01-19 19:42:36.155533
206	create_smart_proxies	SmartProxy	2025-01-19 19:42:36.156481	2025-01-19 19:42:36.156481
207	edit_smart_proxies	SmartProxy	2025-01-19 19:42:36.15737	2025-01-19 19:42:36.15737
208	destroy_smart_proxies	SmartProxy	2025-01-19 19:42:36.158253	2025-01-19 19:42:36.158253
209	view_smart_proxies_autosign	SmartProxy	2025-01-19 19:42:36.159204	2025-01-19 19:42:36.159204
210	create_smart_proxies_autosign	SmartProxy	2025-01-19 19:42:36.160085	2025-01-19 19:42:36.160085
211	destroy_smart_proxies_autosign	SmartProxy	2025-01-19 19:42:36.16096	2025-01-19 19:42:36.16096
212	view_smart_proxies_puppetca	SmartProxy	2025-01-19 19:42:36.161893	2025-01-19 19:42:36.161893
213	edit_smart_proxies_puppetca	SmartProxy	2025-01-19 19:42:36.162787	2025-01-19 19:42:36.162787
214	destroy_smart_proxies_puppetca	SmartProxy	2025-01-19 19:42:36.16367	2025-01-19 19:42:36.16367
215	view_ssh_keys	SshKey	2025-01-19 19:42:36.164618	2025-01-19 19:42:36.164618
216	create_ssh_keys	SshKey	2025-01-19 19:42:36.165501	2025-01-19 19:42:36.165501
217	destroy_ssh_keys	SshKey	2025-01-19 19:42:36.166399	2025-01-19 19:42:36.166399
218	view_subnets	Subnet	2025-01-19 19:42:36.16735	2025-01-19 19:42:36.16735
219	create_subnets	Subnet	2025-01-19 19:42:36.168239	2025-01-19 19:42:36.168239
220	edit_subnets	Subnet	2025-01-19 19:42:36.169117	2025-01-19 19:42:36.169117
221	destroy_subnets	Subnet	2025-01-19 19:42:36.170061	2025-01-19 19:42:36.170061
222	import_subnets	Subnet	2025-01-19 19:42:36.170954	2025-01-19 19:42:36.170954
223	view_usergroups	Usergroup	2025-01-19 19:42:36.171837	2025-01-19 19:42:36.171837
224	create_usergroups	Usergroup	2025-01-19 19:42:36.172768	2025-01-19 19:42:36.172768
225	edit_usergroups	Usergroup	2025-01-19 19:42:36.173659	2025-01-19 19:42:36.173659
226	destroy_usergroups	Usergroup	2025-01-19 19:42:36.174559	2025-01-19 19:42:36.174559
227	view_users	User	2025-01-19 19:42:36.175517	2025-01-19 19:42:36.175517
228	create_users	User	2025-01-19 19:42:36.176405	2025-01-19 19:42:36.176405
229	edit_users	User	2025-01-19 19:42:36.177286	2025-01-19 19:42:36.177286
230	destroy_users	User	2025-01-19 19:42:36.178218	2025-01-19 19:42:36.178218
231	view_statuses	\N	2025-01-19 19:42:36.179139	2025-01-19 19:42:36.179139
\.


--
-- TOC entry 4834 (class 0 OID 18307)
-- Dependencies: 392
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.personal_access_tokens (id, token, name, expires_at, last_used_at, revoked, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4682 (class 0 OID 16547)
-- Dependencies: 240
-- Data for Name: puppetclasses; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.puppetclasses (id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4757 (class 0 OID 17436)
-- Dependencies: 315
-- Data for Name: realms; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.realms (id, name, realm_type, realm_proxy_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4851 (class 0 OID 18560)
-- Dependencies: 409
-- Data for Name: registration_facets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.registration_facets (id, host_id, jwt_secret, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4818 (class 0 OID 18017)
-- Dependencies: 376
-- Data for Name: remote_execution_features; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.remote_execution_features (id, label, name, description, provided_inputs, job_template_id, host_action_button, notification_builder, proxy_selector_override) FROM stdin;
1	puppet_run_host	Run Puppet Once	Perform a single Puppet run	\N	170	t	\N	\N
2	run_script	Run Script	Run a script	\N	171	f	\N	\N
6	ansible_run_capsule_upgrade	Upgrade Capsules on given hosts	Upgrade Capsules on given Capsule server hosts	\N	\N	f	\N	internal
3	ansible_run_host	Run Ansible roles	Runs an Ansible playbook which contains all the roles defined for a host	\N	175	t	\N	\N
4	ansible_run_playbook	Run playbook	Run an Ansible playbook against given hosts	playbook	187	f	\N	\N
5	ansible_enable_web_console	Enable web console	Run an Ansible playbook to enable web console on given hosts	\N	189	t	\N	\N
\.


--
-- TOC entry 4679 (class 0 OID 16526)
-- Dependencies: 237
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.reports (id, host_id, reported_at, created_at, updated_at, status, metrics, type, origin) FROM stdin;
\.


--
-- TOC entry 4706 (class 0 OID 16701)
-- Dependencies: 264
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.roles (id, name, builtin, description, origin, cloned_from_id) FROM stdin;
2	Manager	0	Role granting all available permissions. With this role, user is able to do everything that admin can except for changing settings.	foreman	\N
3	Organization admin	0	Role granting all permissions except for managing organizations. It can be used to delegate administration of specific organization to a user. In order to create such role, clone this role and assign desired organizations	foreman	\N
4	System admin	0	Role granting permissions for managing organizations, locations, users, usergroups, auth sources, roles, filters and settings. This is a very powerful role that can potentially gain access to all resources.	foreman	\N
5	Edit partition tables	0	Role granting permissions required for managing partition tables	foreman	\N
6	View hosts	0	Role granting permission only to view hosts	foreman	\N
7	Edit hosts	0	Role granting permissions to update hosts. For features provided by plugins, you might need to combine this role with roles provided by those plugins	foreman	\N
8	Viewer	0	Role granting read only access. Users with this role can see all data but can not do any modifications	foreman	\N
9	Site manager	0	Role granting mostly view permissions but also permissions required for managing hosts in the infrastructure. Users with this role can update puppet parameters, create and edit hosts, manage installation media, subnets, usergroups and edit existing users.	foreman	\N
10	Bookmarks manager	0	Role granting permissions for managing search bookmarks. Usually useful in combination with Viewer role. This role also grants the permission to update all public bookmarks.	foreman	\N
11	Auditor	0	Role granting permission to view only the Audit log and nothing else.	foreman	\N
1	Default role	2	Role that is automatically assigned to every user in the system. Adding a permission grants it to everybody	\N	\N
\.


--
-- TOC entry 4651 (class 0 OID 16386)
-- Dependencies: 209
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.schema_migrations (version) FROM stdin;
20090714132448
20090714132449
20090715143858
20090717025820
20090718060746
20090718064254
20090720134126
20090722140138
20090722141107
20090729132209
20090730152224
20090802062223
20090804130144
20090820130541
20090905150131
20090905150132
20090905155444
20090907045751
20090916053824
20090920043521
20090920064156
20090920065522
20091012135004
20091016031017
20091022054108
20091219132338
20091219132839
20100310080727
20100414125652
20100416124600
20100419151910
20100523141204
20100525094200
20100601221000
20100616114400
20100625155400
20100628123400
20100629093200
20100701081235
20100822072954
20100823181036
20100914092104
20101018120548
20101018120603
20101018120621
20101019122857
20101019183859
20101103150254
20101118130026
20101121080425
20101121135521
20101121140000
20101122132041
20101123152150
20101123153303
20101130093613
20101130100315
20101202104444
20110117162722
20110213104226
20110216101848
20110301154453
20110327123639
20110404150043
20110407091150
20110412103238
20110417102947
20110616080444
20110617190131
20110619130336
20110628115422
20110712070522
20110801090318
20110803114134
20111124095053
20111124095054
20111124095055
20111205231500
20120102071633
20120110113051
20120122131037
20120126113850
20120311081257
20120313081913
20120502105518
20120506143325
20120509131302
20120510113417
20120521142924
20120523065531
20120529113900
20120529115814
20120607074318
20120612070100
20120613082125
20120621135042
20120624081510
20120624093958
20120624094034
20120705130038
20120824142048
20120905095532
20120905131841
20120916080843
20120921000313
20120921105349
20121003172526
20121011115320
20121015113502
20121018152459
20121101141448
20121118120028
20121118125341
20121119102104
20121210214810
20121218084123
20130109155024
20130121130826
20130211160200
20130228145456
20130409081924
20130417110127
20130419145808
20130430150500
20130520161514
20130523131455
20130530061844
20130804131949
20130813105054
20130814132531
20130908170524
20130924145800
20131014133347
20131017142515
20131021125612
20131021152315
20131107094849
20131114084718
20131114094841
20131122170726
20131125230654
20131128150357
20131202120621
20131202131847
20131202144415
20131204174455
20131205204140
20131209122644
20131212125626
20131223120945
20131224153518
20131224153743
20131224154836
20140110164135
20140115130443
20140123185537
20140123194519
20140128123153
20140219183342
20140219183345
20140304184854
20140314004243
20140318221513
20140320000449
20140320004050
20140324104010
20140325093623
20140407161817
20140407162007
20140407162059
20140409031625
20140410134234
20140415052549
20140415053029
20140522122215
20140630114339
20140705173549
20140707113214
20140710132249
20140711142510
20140716102950
20140716140436
20140725101621
20140728190218
20140805114754
20140813215942
20140826104209
20140901115249
20140902102858
20140908192300
20140910111148
20140910153654
20140912113254
20140912114124
20140912145052
20140915141937
20140928131124
20140928140206
20140929073150
20140929073343
20140930201523
20141014131912
20141023114229
20141107091416
20141107091417
20141112165600
20141116131324
20141117093914
20141120140051
20141124055509
20141126165451
20141217101211
20141223101707
20141223142759
20141225073211
20150127085513
20150212161904
20150225131946
20150302112545
20150310153859
20150331132115
20150428070436
20150428110835
20150505111345
20150512150432
20150514072626
20150514114044
20150514121649
20150521121315
20150525081931
20150602153751
20150605073820
20150606065713
20150612121541
20150612135546
20150616080015
20150618093433
20150622090115
20150705131449
20150708070742
20150708133241
20150708133242
20150708133305
20150713143226
20150714132601
20150714144500
20150811170401
20150812110800
20150812145900
20150814204140
20150817102538
20150819105725
20150826191632
20150827144500
20150827152730
20150903192731
20150907124936
20150907131503
20150917155300
20150923125825
20151009084350
20151013135415
20151019174035
20151022105508
20151022123457
20151023144501
20151025120534
20151104100257
20151109152507
20151112152108
20151116105412
20151120171100
20151124162300
20151203100824
20151210143537
20151215114631
20151217092555
20160108134600
20160108141144
20160111113032
20160113161916
20160113162007
20160114120200
20160114125628
20160118124600
20160125155108
20160127134031
20160127162711
20160201131211
20160203104056
20160203110216
20160215143900
20160308102459
20160315161936
20160414063050
20160415134454
20160415135858
20160527093031
20160609092110
20160616074718
20160705082036
20160706074540
20160707195442
20160715131352
20160717125402
20160719081324
20160719124942
20160725142557
20160726085358
20160727084256
20160727142242
20160728095626
20160729094457
20160802153302
20160805094233
20160805104605
20160818091420
20160818091421
20160831121418
20160920151810
20160924213030
20160925213030
20160926225841
20160927071039
20160927071147
20160927073233
20160927164411
20161003091412
20161006094714
20161122154057
20161205142618
20161227082709
20161227082721
20170109115157
20170110113824
20170110145641
20170118142654
20170118154134
20170127094357
20170201135815
20170209084517
20170213154641
20170214132230
20170221100747
20170226193446
20170228134258
20170301155205
20170306100129
20170315154334
20170316142703
20170319131341
20170404134531
20170424131346
20170604082313
20170606115344
20170608130132
20170610132326
20170613101039
20170622011347
20170815130257
20170911133318
20171016202300
20171026082635
20171109095957
20171119094913
20171126131104
20171129103615
20171213161035
20171222120314
20171225122601
20171231134017
20180102082705
20180110104432
20180111130853
20180112125015
20180123140634
20180129143410
20180202072115
20180202123215
20180207150921
20180208053256
20180216092715
20180216094550
20180226095631
20180305111232
20180312080251
20180410125416
20180411160809
20180412124505
20180424080702
20180613100703
20180628125416
20180702102759
20180705191153
20180705230311
20180713154128
20180715202514
20180806151925
20180816110716
20180816134832
20180820072858
20180831115634
20180904142922
20180913101042
20180927120509
20181019135324
20181023112532
20181101101145
20181206123910
20181206124952
20181206131436
20181206131627
20181224174419
20190111153330
20190116120705
20190121084601
20190225115728
20190226182746
20190228160047
20190318094437
20190318153925
20190328114657
20190510082811
20190604081000
20190627083110
20190630034751
20190705060630
20190821135704
20190829102315
20190918170516
20190919155550
20191001120743
20191010074208
20191016100128
20191017151119
20191028082812
20200107181613
20200127103144
20200129123555
20200205105956
20200217110708
20200311131527
20200311134414
20200318135632
20200324210540
20200326164755
20200402190048
20200406113832
20200421201839
20200427151946
20200513092446
20200517215015
20200519093217
20200521082853
20200525073201
20200602155700
20200611090846
20200615071719
20200616134403
20200623073022
20200625081552
20200709160133
20200720123005
20200722171017
20200803113531
20200803113803
20200803113903
20200820122057
20200825121733
20200831194208
20200831194514
20200907232758
20200908004234
20200908120905
20200911083030
20200918223816
20200921135723
20201014115147
20201030102020
20201109135301
20201125113903
20201224095619
20210114143800
20210115124508
20210120150019
20210312074713
20210317090500
20210317170111
20210322144728
20210401124332
20210407104300
20210502113529
20210517132916
20210525144427
20210609093404
20210610131920
20210708123832
20210720115251
20210816100932
20210818083407
20210901081438
20210915132645
20210924103241
20210929132645
20211111115000
20211111125003
20211112130803
20211123170430
20220111110149
20220124174632
20220201205305
20220204155632
20220208134539
20220208135305
20220321101835
20220331112719
20220421204325
20220426145007
20220515130414
20220628083024
20220630104300
20220713095705
20220809191656
20220822155946
20220907145552
20221003153000
20221010174230
20221017161042
20221025151600
20221031114720
20221102065954
20221102075151
20221102134032
20221126232030
20221129170145
20230414091257
20230416170000
20230418075940
20230719080900
20230803180552
20230816154510
20230920093000
20231016000000
20231115151349
20240215150131
20240305131306
20240522093412
20240522093413
20240529100345
20240613133735
\.


--
-- TOC entry 4695 (class 0 OID 16635)
-- Dependencies: 253
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.sessions (id, session_id, data, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4732 (class 0 OID 16843)
-- Dependencies: 290
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.settings (id, name, value, created_at, updated_at) FROM stdin;
1	bcrypt_cost	--- 10	2025-01-19 19:42:35.94579	2025-01-19 19:42:35.94579
2	default_organization	--- Optimum	2025-01-19 19:42:37.174957	2025-01-19 19:42:37.174957
3	default_location	--- Moscow	2025-01-19 19:42:37.212459	2025-01-19 19:42:37.212459
4	instance_id	--- 25b18dc3-a882-4d1c-b3bf-021a8d639540	2025-01-19 19:42:38.962963	2025-01-19 19:42:38.962963
5	db_pending_seed	--- false	2025-01-19 19:42:39.607472	2025-01-19 19:42:39.607472
\.


--
-- TOC entry 4725 (class 0 OID 16804)
-- Dependencies: 283
-- Data for Name: smart_proxies; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.smart_proxies (id, name, url, created_at, updated_at, pubkey, expired_logs) FROM stdin;
\.


--
-- TOC entry 4728 (class 0 OID 16821)
-- Dependencies: 286
-- Data for Name: smart_proxy_features; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.smart_proxy_features (smart_proxy_id, feature_id, id, capabilities, settings) FROM stdin;
\.


--
-- TOC entry 4712 (class 0 OID 16746)
-- Dependencies: 270
-- Data for Name: sources; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.sources (id, value) FROM stdin;
\.


--
-- TOC entry 4832 (class 0 OID 18287)
-- Dependencies: 390
-- Data for Name: ssh_keys; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.ssh_keys (id, name, key, fingerprint, user_id, length, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4849 (class 0 OID 18550)
-- Dependencies: 407
-- Data for Name: stored_values; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.stored_values (id, key, value, expire_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4735 (class 0 OID 16861)
-- Dependencies: 293
-- Data for Name: subnet_domains; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.subnet_domains (id, domain_id, subnet_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4669 (class 0 OID 16481)
-- Dependencies: 227
-- Data for Name: subnets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.subnets (id, network, mask, priority, name, vlanid, created_at, updated_at, dhcp_id, tftp_id, gateway, dns_primary, dns_secondary, "from", "to", dns_id, boot_mode, ipam, discovery_id, type, description, mtu, template_id, httpboot_id, nic_delay, externalipam_id, externalipam_group, bmc_id) FROM stdin;
\.


--
-- TOC entry 4842 (class 0 OID 18386)
-- Dependencies: 400
-- Data for Name: table_preferences; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.table_preferences (id, name, columns, created_at, updated_at, user_id) FROM stdin;
\.


--
-- TOC entry 4804 (class 0 OID 17909)
-- Dependencies: 362
-- Data for Name: target_remote_execution_proxies; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.target_remote_execution_proxies (id, remote_execution_proxy_id, target_id, target_type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4796 (class 0 OID 17835)
-- Dependencies: 354
-- Data for Name: targeting_hosts; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.targeting_hosts (id, host_id, targeting_id) FROM stdin;
\.


--
-- TOC entry 4794 (class 0 OID 17814)
-- Dependencies: 352
-- Data for Name: targetings; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.targetings (id, search_query, bookmark_id, user_id, targeting_type, created_at, updated_at, resolved_at, randomized_ordering) FROM stdin;
\.


--
-- TOC entry 4751 (class 0 OID 17006)
-- Dependencies: 309
-- Data for Name: taxable_taxonomies; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.taxable_taxonomies (id, taxonomy_id, taxable_id, taxable_type) FROM stdin;
1	1	4	User
2	1	1	User
3	1	3	User
4	1	2	User
5	1	1	AuthSource
6	1	2	AuthSource
7	1	3	AuthSource
8	2	4	User
9	2	1	User
10	2	3	User
11	2	2	User
12	2	1	AuthSource
13	2	2	AuthSource
14	2	3	AuthSource
15	1	1	ProvisioningTemplate
16	2	1	ProvisioningTemplate
17	1	2	ProvisioningTemplate
18	2	2	ProvisioningTemplate
19	1	3	ProvisioningTemplate
20	2	3	ProvisioningTemplate
21	1	4	ProvisioningTemplate
22	2	4	ProvisioningTemplate
23	1	5	ProvisioningTemplate
24	2	5	ProvisioningTemplate
25	1	6	ProvisioningTemplate
26	2	6	ProvisioningTemplate
27	1	7	ProvisioningTemplate
28	2	7	ProvisioningTemplate
29	1	8	ProvisioningTemplate
30	2	8	ProvisioningTemplate
31	1	9	ProvisioningTemplate
32	2	9	ProvisioningTemplate
33	1	10	ProvisioningTemplate
34	2	10	ProvisioningTemplate
35	1	11	ProvisioningTemplate
36	2	11	ProvisioningTemplate
37	1	12	ProvisioningTemplate
38	2	12	ProvisioningTemplate
39	1	13	ProvisioningTemplate
40	2	13	ProvisioningTemplate
41	1	14	ProvisioningTemplate
42	2	14	ProvisioningTemplate
43	1	15	ProvisioningTemplate
44	2	15	ProvisioningTemplate
45	1	16	ProvisioningTemplate
46	2	16	ProvisioningTemplate
47	1	17	ProvisioningTemplate
48	2	17	ProvisioningTemplate
49	1	18	ProvisioningTemplate
50	2	18	ProvisioningTemplate
51	1	19	ProvisioningTemplate
52	2	19	ProvisioningTemplate
53	1	20	ProvisioningTemplate
54	2	20	ProvisioningTemplate
55	1	21	ProvisioningTemplate
56	2	21	ProvisioningTemplate
57	1	22	ProvisioningTemplate
58	2	22	ProvisioningTemplate
59	1	23	ProvisioningTemplate
60	2	23	ProvisioningTemplate
61	1	24	ProvisioningTemplate
62	2	24	ProvisioningTemplate
63	1	25	ProvisioningTemplate
64	2	25	ProvisioningTemplate
65	1	26	ProvisioningTemplate
66	2	26	ProvisioningTemplate
67	1	27	ProvisioningTemplate
68	2	27	ProvisioningTemplate
69	1	28	ProvisioningTemplate
70	2	28	ProvisioningTemplate
71	1	29	ProvisioningTemplate
72	2	29	ProvisioningTemplate
73	1	30	ProvisioningTemplate
74	2	30	ProvisioningTemplate
75	1	31	ProvisioningTemplate
76	2	31	ProvisioningTemplate
77	1	32	ProvisioningTemplate
78	2	32	ProvisioningTemplate
79	1	33	ProvisioningTemplate
80	2	33	ProvisioningTemplate
81	1	34	ProvisioningTemplate
82	2	34	ProvisioningTemplate
83	1	35	ProvisioningTemplate
84	2	35	ProvisioningTemplate
85	1	36	ProvisioningTemplate
86	2	36	ProvisioningTemplate
87	1	37	ProvisioningTemplate
88	2	37	ProvisioningTemplate
89	1	38	ProvisioningTemplate
90	2	38	ProvisioningTemplate
91	1	39	ProvisioningTemplate
92	2	39	ProvisioningTemplate
93	1	40	ProvisioningTemplate
94	2	40	ProvisioningTemplate
95	1	41	ProvisioningTemplate
96	2	41	ProvisioningTemplate
97	1	42	ProvisioningTemplate
98	2	42	ProvisioningTemplate
99	1	43	ProvisioningTemplate
100	2	43	ProvisioningTemplate
101	1	44	ProvisioningTemplate
102	2	44	ProvisioningTemplate
103	1	45	ProvisioningTemplate
104	2	45	ProvisioningTemplate
105	1	46	ProvisioningTemplate
106	2	46	ProvisioningTemplate
107	1	47	ProvisioningTemplate
108	2	47	ProvisioningTemplate
109	1	48	ProvisioningTemplate
110	2	48	ProvisioningTemplate
111	1	49	ProvisioningTemplate
112	2	49	ProvisioningTemplate
113	1	50	ProvisioningTemplate
114	2	50	ProvisioningTemplate
115	1	51	ProvisioningTemplate
116	2	51	ProvisioningTemplate
117	1	52	ProvisioningTemplate
118	2	52	ProvisioningTemplate
119	1	53	ProvisioningTemplate
120	2	53	ProvisioningTemplate
121	1	54	ProvisioningTemplate
122	2	54	ProvisioningTemplate
123	1	55	ProvisioningTemplate
124	2	55	ProvisioningTemplate
125	1	56	ProvisioningTemplate
126	2	56	ProvisioningTemplate
127	1	57	ProvisioningTemplate
128	2	57	ProvisioningTemplate
129	1	58	ProvisioningTemplate
130	2	58	ProvisioningTemplate
131	1	59	ProvisioningTemplate
132	2	59	ProvisioningTemplate
133	1	60	ProvisioningTemplate
134	2	60	ProvisioningTemplate
135	1	61	ProvisioningTemplate
136	2	61	ProvisioningTemplate
137	1	62	ProvisioningTemplate
138	2	62	ProvisioningTemplate
139	1	63	ProvisioningTemplate
140	2	63	ProvisioningTemplate
141	1	64	ProvisioningTemplate
142	2	64	ProvisioningTemplate
143	1	65	ProvisioningTemplate
144	2	65	ProvisioningTemplate
145	1	66	ProvisioningTemplate
146	2	66	ProvisioningTemplate
147	1	67	ProvisioningTemplate
148	2	67	ProvisioningTemplate
149	1	68	ProvisioningTemplate
150	2	68	ProvisioningTemplate
151	1	69	ProvisioningTemplate
152	2	69	ProvisioningTemplate
153	1	70	ProvisioningTemplate
154	2	70	ProvisioningTemplate
155	1	71	ProvisioningTemplate
156	2	71	ProvisioningTemplate
157	1	72	ProvisioningTemplate
158	2	72	ProvisioningTemplate
159	1	73	ProvisioningTemplate
160	2	73	ProvisioningTemplate
161	1	74	ProvisioningTemplate
162	2	74	ProvisioningTemplate
163	1	75	ProvisioningTemplate
164	2	75	ProvisioningTemplate
165	1	76	ProvisioningTemplate
166	2	76	ProvisioningTemplate
167	1	77	ProvisioningTemplate
168	2	77	ProvisioningTemplate
169	1	78	ProvisioningTemplate
170	2	78	ProvisioningTemplate
171	1	79	ProvisioningTemplate
172	2	79	ProvisioningTemplate
173	1	80	ProvisioningTemplate
174	2	80	ProvisioningTemplate
175	1	81	ProvisioningTemplate
176	2	81	ProvisioningTemplate
177	1	82	ProvisioningTemplate
178	2	82	ProvisioningTemplate
179	1	83	ProvisioningTemplate
180	2	83	ProvisioningTemplate
181	1	84	ProvisioningTemplate
182	2	84	ProvisioningTemplate
183	1	85	ProvisioningTemplate
184	2	85	ProvisioningTemplate
185	1	86	ProvisioningTemplate
186	2	86	ProvisioningTemplate
187	1	87	ProvisioningTemplate
188	2	87	ProvisioningTemplate
189	1	88	ProvisioningTemplate
190	2	88	ProvisioningTemplate
191	1	89	ProvisioningTemplate
192	2	89	ProvisioningTemplate
193	1	90	ProvisioningTemplate
194	2	90	ProvisioningTemplate
195	1	91	ProvisioningTemplate
196	2	91	ProvisioningTemplate
197	1	92	ProvisioningTemplate
198	2	92	ProvisioningTemplate
199	1	93	ProvisioningTemplate
200	2	93	ProvisioningTemplate
201	1	94	ProvisioningTemplate
202	2	94	ProvisioningTemplate
203	1	95	ProvisioningTemplate
204	2	95	ProvisioningTemplate
205	1	96	ProvisioningTemplate
206	2	96	ProvisioningTemplate
207	1	97	ProvisioningTemplate
208	2	97	ProvisioningTemplate
209	1	98	ProvisioningTemplate
210	2	98	ProvisioningTemplate
211	1	99	ProvisioningTemplate
212	2	99	ProvisioningTemplate
213	1	100	ProvisioningTemplate
214	2	100	ProvisioningTemplate
215	1	101	ProvisioningTemplate
216	2	101	ProvisioningTemplate
217	1	102	ProvisioningTemplate
218	2	102	ProvisioningTemplate
219	1	103	ProvisioningTemplate
220	2	103	ProvisioningTemplate
221	1	104	ProvisioningTemplate
222	2	104	ProvisioningTemplate
223	1	105	ProvisioningTemplate
224	2	105	ProvisioningTemplate
225	1	106	ProvisioningTemplate
226	2	106	ProvisioningTemplate
227	1	107	ProvisioningTemplate
228	2	107	ProvisioningTemplate
229	1	108	ProvisioningTemplate
230	2	108	ProvisioningTemplate
231	1	109	ProvisioningTemplate
232	2	109	ProvisioningTemplate
233	1	110	ProvisioningTemplate
234	2	110	ProvisioningTemplate
235	1	111	ProvisioningTemplate
236	2	111	ProvisioningTemplate
237	1	112	ProvisioningTemplate
238	2	112	ProvisioningTemplate
239	1	113	ProvisioningTemplate
240	2	113	ProvisioningTemplate
241	1	114	ProvisioningTemplate
242	2	114	ProvisioningTemplate
243	1	115	ProvisioningTemplate
244	2	115	ProvisioningTemplate
245	1	116	ProvisioningTemplate
246	2	116	ProvisioningTemplate
247	1	117	ProvisioningTemplate
248	2	117	ProvisioningTemplate
249	1	118	ProvisioningTemplate
250	2	118	ProvisioningTemplate
251	1	119	ProvisioningTemplate
252	2	119	ProvisioningTemplate
253	1	120	ProvisioningTemplate
254	2	120	ProvisioningTemplate
255	1	121	ProvisioningTemplate
256	2	121	ProvisioningTemplate
257	1	122	ProvisioningTemplate
258	2	122	ProvisioningTemplate
259	1	123	ProvisioningTemplate
260	2	123	ProvisioningTemplate
261	1	124	ProvisioningTemplate
262	2	124	ProvisioningTemplate
263	1	125	ProvisioningTemplate
264	2	125	ProvisioningTemplate
265	1	126	ProvisioningTemplate
266	2	126	ProvisioningTemplate
267	1	127	ProvisioningTemplate
268	2	127	ProvisioningTemplate
269	1	128	ProvisioningTemplate
270	2	128	ProvisioningTemplate
271	1	129	ProvisioningTemplate
272	2	129	ProvisioningTemplate
273	1	130	ProvisioningTemplate
274	2	130	ProvisioningTemplate
275	1	131	ProvisioningTemplate
276	2	131	ProvisioningTemplate
277	1	132	ProvisioningTemplate
278	2	132	ProvisioningTemplate
279	1	133	ProvisioningTemplate
280	2	133	ProvisioningTemplate
281	1	134	ProvisioningTemplate
282	2	134	ProvisioningTemplate
283	1	135	Ptable
284	2	135	Ptable
285	1	136	Ptable
286	2	136	Ptable
287	1	137	Ptable
288	2	137	Ptable
289	1	138	Ptable
290	2	138	Ptable
291	1	139	Ptable
292	2	139	Ptable
293	1	140	Ptable
294	2	140	Ptable
295	1	141	Ptable
296	2	141	Ptable
297	1	142	Ptable
298	2	142	Ptable
299	1	143	Ptable
300	2	143	Ptable
301	1	144	Ptable
302	2	144	Ptable
303	1	145	Ptable
304	2	145	Ptable
305	1	146	Ptable
306	2	146	Ptable
307	1	147	Ptable
308	2	147	Ptable
309	1	148	Ptable
310	2	148	Ptable
311	1	149	Ptable
312	2	149	Ptable
313	1	150	Ptable
314	2	150	Ptable
315	1	151	Ptable
316	2	151	Ptable
317	1	152	Ptable
318	2	152	Ptable
319	1	153	Ptable
320	2	153	Ptable
321	1	154	Ptable
322	2	154	Ptable
323	1	155	Ptable
324	2	155	Ptable
325	1	156	Ptable
326	2	156	Ptable
327	1	157	ReportTemplate
328	2	157	ReportTemplate
329	1	158	ReportTemplate
330	2	158	ReportTemplate
331	1	159	ReportTemplate
332	2	159	ReportTemplate
333	1	160	ReportTemplate
334	2	160	ReportTemplate
335	1	1	Medium
336	2	1	Medium
337	1	2	Medium
338	2	2	Medium
339	1	3	Medium
340	2	3	Medium
341	1	4	Medium
342	2	4	Medium
343	1	5	Medium
344	2	5	Medium
345	1	6	Medium
346	2	6	Medium
347	1	7	Medium
348	2	7	Medium
349	1	8	Medium
350	2	8	Medium
351	1	9	Medium
352	2	9	Medium
353	1	10	Medium
354	2	10	Medium
355	1	11	Medium
356	2	11	Medium
357	1	12	Medium
358	2	12	Medium
359	1	13	Medium
360	2	13	Medium
361	1	14	Medium
362	2	14	Medium
363	1	15	Medium
364	2	15	Medium
365	1	161	JobTemplate
366	2	161	JobTemplate
367	1	162	JobTemplate
368	2	162	JobTemplate
369	1	163	JobTemplate
370	2	163	JobTemplate
371	1	164	JobTemplate
372	2	164	JobTemplate
373	1	165	JobTemplate
374	2	165	JobTemplate
375	1	166	JobTemplate
376	2	166	JobTemplate
377	1	167	JobTemplate
378	2	167	JobTemplate
379	1	168	JobTemplate
380	2	168	JobTemplate
381	1	169	JobTemplate
382	2	169	JobTemplate
383	1	170	JobTemplate
384	2	170	JobTemplate
385	1	171	JobTemplate
386	2	171	JobTemplate
387	1	172	JobTemplate
388	2	172	JobTemplate
389	1	173	JobTemplate
390	2	173	JobTemplate
391	1	174	JobTemplate
392	2	174	JobTemplate
393	1	175	JobTemplate
394	2	175	JobTemplate
395	1	176	JobTemplate
396	2	176	JobTemplate
397	1	177	JobTemplate
398	2	177	JobTemplate
399	1	178	JobTemplate
400	2	178	JobTemplate
401	1	179	JobTemplate
402	2	179	JobTemplate
403	1	180	JobTemplate
404	2	180	JobTemplate
405	1	181	JobTemplate
406	2	181	JobTemplate
407	1	182	JobTemplate
408	2	182	JobTemplate
409	1	183	JobTemplate
410	2	183	JobTemplate
411	1	184	JobTemplate
412	2	184	JobTemplate
413	1	185	JobTemplate
414	2	185	JobTemplate
415	1	186	JobTemplate
416	2	186	JobTemplate
417	1	187	JobTemplate
418	2	187	JobTemplate
419	1	188	JobTemplate
420	2	188	JobTemplate
421	1	189	JobTemplate
422	2	189	JobTemplate
423	1	190	JobTemplate
424	2	190	JobTemplate
425	1	191	WebhookTemplate
426	2	191	WebhookTemplate
427	1	192	WebhookTemplate
428	2	192	WebhookTemplate
429	1	193	WebhookTemplate
430	2	193	WebhookTemplate
431	1	194	WebhookTemplate
432	2	194	WebhookTemplate
433	1	195	WebhookTemplate
434	2	195	WebhookTemplate
435	1	196	WebhookTemplate
436	2	196	WebhookTemplate
437	1	197	WebhookTemplate
438	2	197	WebhookTemplate
439	1	198	WebhookTemplate
440	2	198	WebhookTemplate
\.


--
-- TOC entry 4745 (class 0 OID 16942)
-- Dependencies: 303
-- Data for Name: taxonomies; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.taxonomies (id, name, type, created_at, updated_at, ignore_types, ancestry, title, description) FROM stdin;
1	Optimum	Organization	2025-01-19 19:42:37.103943	2025-01-19 19:42:37.103943	\N	\N	Optimum	\N
2	Moscow	Location	2025-01-19 19:42:37.18116	2025-01-19 19:42:37.18116	\N	\N	Moscow	\N
\.


--
-- TOC entry 4718 (class 0 OID 16775)
-- Dependencies: 276
-- Data for Name: template_combinations; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.template_combinations (id, provisioning_template_id, hostgroup_id, created_at, updated_at, environment_id) FROM stdin;
\.


--
-- TOC entry 4792 (class 0 OID 17796)
-- Dependencies: 350
-- Data for Name: template_inputs; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.template_inputs (id, name, required, input_type, fact_name, variable_name, puppet_class_name, puppet_parameter_name, description, template_id, created_at, updated_at, options, advanced, value_type, resource_type, "default", hidden_value) FROM stdin;
1	Organization	t	user	\N	\N	\N	\N	Whether should be Organization included.	157	2025-01-19 19:42:38.706955	2025-01-19 19:42:38.706955	yes\r\nno	f	plain	\N	yes	f
2	Location	t	user	\N	\N	\N	\N	Whether should be Location included.	157	2025-01-19 19:42:38.707569	2025-01-19 19:42:38.707569	yes\r\nno	f	plain	\N	yes	f
3	Host Group	t	user	\N	\N	\N	\N	Whether should be Host Group included.	157	2025-01-19 19:42:38.70801	2025-01-19 19:42:38.70801	yes\r\nno	f	plain	\N	yes	f
4	Host Collections	t	user	\N	\N	\N	\N	Whether should be Host Collections included. Ignored when Katello is not available.	157	2025-01-19 19:42:38.708433	2025-01-19 19:42:38.708433	yes\r\nno	f	plain	\N	yes	f
5	Host Parameters	t	user	\N	\N	\N	\N	Whether should be Host Parameters included.	157	2025-01-19 19:42:38.708945	2025-01-19 19:42:38.708945	yes\r\nno	f	plain	\N	no	f
6	IPv4	t	user	\N	\N	\N	\N	Whether should be IPv4 included.	157	2025-01-19 19:42:38.709359	2025-01-19 19:42:38.709359	yes\r\nno	f	plain	\N	yes	f
7	IPv6	t	user	\N	\N	\N	\N	Whether should be IPv6 included.	157	2025-01-19 19:42:38.709771	2025-01-19 19:42:38.709771	yes\r\nno	f	plain	\N	no	f
8	Subnet	t	user	\N	\N	\N	\N	Whether should be Subnet included.	157	2025-01-19 19:42:38.710166	2025-01-19 19:42:38.710166	yes\r\nno	f	plain	\N	yes	f
9	Subnet v6	t	user	\N	\N	\N	\N	Whether should be Subnet v6 included.	157	2025-01-19 19:42:38.710567	2025-01-19 19:42:38.710567	yes\r\nno	f	plain	\N	no	f
10	Smart Proxies	t	user	\N	\N	\N	\N	Whether should be Smart Proxies included.	157	2025-01-19 19:42:38.71096	2025-01-19 19:42:38.71096	yes\r\nno	f	plain	\N	yes	f
11	Content Attributes	t	user	\N	\N	\N	\N	Whether should be Content Attributes included. Ignored when Katello is not available.	157	2025-01-19 19:42:38.71135	2025-01-19 19:42:38.71135	yes\r\nno	f	plain	\N	no	f
12	Facts	t	user	\N	\N	\N	\N	Whether should be Facts included.	157	2025-01-19 19:42:38.711831	2025-01-19 19:42:38.711831	yes\r\nno	f	plain	\N	no	f
13	Hosts	f	user	\N	\N	\N	\N	Limit the report only on hosts found by this search query. Keep empty for report on all available hosts.	157	2025-01-19 19:42:38.712237	2025-01-19 19:42:38.712237	\N	f	search	Host	\N	f
14	hosts	f	user	\N	\N	\N	\N	Limit the report only on hosts found by this search query. Keep empty for report on all available hosts.	158	2025-01-19 19:42:38.727772	2025-01-19 19:42:38.727772	\N	f	search	Host	\N	f
15	Output style	f	user	\N	\N	\N	\N	Select 'Human-readable' to show statuses as they would appear in the web UI, or 'Machine-readable' to show numeric statuses.	158	2025-01-19 19:42:38.728183	2025-01-19 19:42:38.728183	Human-readable\r\nMachine-readable	f	plain	\N	Human-readable	f
16	job_id	t	user	\N	\N	\N	\N	Id of job invocation to report	159	2025-01-19 19:42:38.737883	2025-01-19 19:42:38.737883	\N	f	plain	JobInvocation	\N	f
17	hosts	f	user	\N	\N	\N	\N	Field for filter hosts of job invocation. Leave blank for all hosts.	159	2025-01-19 19:42:38.738294	2025-01-19 19:42:38.738294	\N	f	search	Host	\N	f
18	Users filter	f	user	\N	\N	\N	\N	Limit the report only on users found by this search query. Keep empty for report on all available users.	160	2025-01-19 19:42:38.747704	2025-01-19 19:42:38.747704	\N	f	search	User	\N	f
19	pre_script	f	user	\N	\N	\N	\N	A script to run prior to the module action	163	2025-01-19 19:42:39.188414	2025-01-19 19:42:39.188414	\N	t	plain	\N	\N	f
20	action	t	user	\N	\N	\N	\N	The module action enable, install etc.	163	2025-01-19 19:42:39.188945	2025-01-19 19:42:39.188945	list\ninfo\nenable\ndisable\ninstall\nupdate\nremove\nprovides\nreset	f	plain	\N	\N	f
21	module_spec	f	user	\N	\N	\N	\N	The module specification. module:stream/profile	163	2025-01-19 19:42:39.189349	2025-01-19 19:42:39.189349	\N	f	plain	\N	\N	f
22	options	f	user	\N	\N	\N	\N	Other optional flags for the action	163	2025-01-19 19:42:39.189732	2025-01-19 19:42:39.189732	\N	f	plain	\N	\N	f
23	post_script	f	user	\N	\N	\N	\N	A script to run after the module action	163	2025-01-19 19:42:39.190114	2025-01-19 19:42:39.190114	\N	t	plain	\N	\N	f
24	pre_script	f	user	\N	\N	\N	\N	A script to run prior to the package action	164	2025-01-19 19:42:39.200481	2025-01-19 19:42:39.200481	\N	t	plain	\N	\N	f
25	refresh_subscription	f	user	\N	\N	\N	\N	Refresh subscription-manager state. Default is "false".	164	2025-01-19 19:42:39.200899	2025-01-19 19:42:39.200899	false\r\ntrue	t	plain	\N	\N	f
26	action	t	user	\N	\N	\N	\N	The package action: install, update, or remove	164	2025-01-19 19:42:39.201386	2025-01-19 19:42:39.201386	install\nupdate\nremove\ngroup install\ngroup remove	f	plain	\N	\N	f
27	options	f	user	\N	\N	\N	\N	Additional options for the package manager	164	2025-01-19 19:42:39.201786	2025-01-19 19:42:39.201786	\N	t	plain	\N	\N	f
28	package	f	user	\N	\N	\N	\N	The name of the package, if any	164	2025-01-19 19:42:39.202175	2025-01-19 19:42:39.202175	\N	f	plain	\N	\N	f
29	post_script	f	user	\N	\N	\N	\N	A script to run after the package action	164	2025-01-19 19:42:39.202573	2025-01-19 19:42:39.202573	\N	t	plain	\N	\N	f
30	action	t	user	\N	\N	\N	\N	Action to perform on the service	165	2025-01-19 19:42:39.21025	2025-01-19 19:42:39.21025	restart\nshutdown	f	plain	\N	\N	f
31	comment	f	user	\N	\N	\N	\N	Reason for disabling the Puppet agent	166	2025-01-19 19:42:39.218081	2025-01-19 19:42:39.218081	\N	f	plain	\N	\N	f
32	puppet_module	t	user	\N	\N	\N	\N	Full name of the module, e.g. "puppetlabs-stdlib".	168	2025-01-19 19:42:39.234315	2025-01-19 19:42:39.234315	\N	f	plain	\N	\N	f
33	target_dir	f	user	\N	\N	\N	\N	The directory into which modules are installed, defaults to production environment.	168	2025-01-19 19:42:39.234747	2025-01-19 19:42:39.234747	\N	f	plain	\N	\N	f
34	version	f	user	\N	\N	\N	\N	Module version to install.	168	2025-01-19 19:42:39.235174	2025-01-19 19:42:39.235174	\N	t	plain	\N	\N	f
35	force	f	user	\N	\N	\N	\N	Force overwrite of existing module, if any. Type "true" to force.	168	2025-01-19 19:42:39.235574	2025-01-19 19:42:39.235574	\N	t	plain	\N	\N	f
36	ignore_dependencies	f	user	\N	\N	\N	\N	Do not attempt to install dependencies. Type "true" to ignore dependencies.	168	2025-01-19 19:42:39.235968	2025-01-19 19:42:39.235968	\N	t	plain	\N	\N	f
37	git_repository	t	user	\N	\N	\N	\N	URL to the git repository containing the module, e.g:\r\nhttps://github.com/theforeman/puppet-puppet	169	2025-01-19 19:42:39.244033	2025-01-19 19:42:39.244033	\N	f	plain	\N	\N	f
38	target_dir	t	user	\N	\N	\N	\N	For example, '/etc/puppetlabs/code/environments/production/modules/puppet'.	169	2025-01-19 19:42:39.244439	2025-01-19 19:42:39.244439	\N	f	plain	\N	\N	f
39	puppet_options	f	user	\N	\N	\N	\N	Additional options to pass to puppet	170	2025-01-19 19:42:39.254535	2025-01-19 19:42:39.254535	\N	f	plain	\N	\N	f
40	command	t	user	\N	\N	\N	\N	Command to run on the host	171	2025-01-19 19:42:39.27347	2025-01-19 19:42:39.27347	\N	f	plain	\N	\N	f
41	url	t	user	\N	\N	\N	\N	URL of the script to download and execute	172	2025-01-19 19:42:39.284715	2025-01-19 19:42:39.284715	\N	f	plain	\N	\N	f
42	action	t	user	\N	\N	\N	\N	Action to perform on the service	173	2025-01-19 19:42:39.293185	2025-01-19 19:42:39.293185	restart\nstart\nstop\nstatus\nreload\nenable\ndisable	f	plain	\N	\N	f
43	service	t	user	\N	\N	\N	\N	Name of the service	173	2025-01-19 19:42:39.293599	2025-01-19 19:42:39.293599	\N	f	plain	\N	\N	f
44	ansible_collections_list	t	user	\N	\N	\N	\N	List of collections in Ansible Galaxy to install, separated by commas, e.g: mysql,nginx\r\n\r\nThe default collections_paths is configured in /etc/ansible/ansible.cfg, you may override it by filling the 'collections_path' input. Click on "Advanced" to see it.	174	2025-01-19 19:42:39.309089	2025-01-19 19:42:39.309089	\N	f	plain	\N	\N	f
45	collections_path	f	user	\N	\N	\N	\N	A particular directory where you want the downloaded collections to be placed.	174	2025-01-19 19:42:39.309494	2025-01-19 19:42:39.309494	\N	t	plain	\N	\N	f
46	ansible_roles_list	t	user	\N	\N	\N	\N	List of roles in Ansible Galaxy to install, separated by commas, e.g: "mysql, nginx"\r\n\r\nThe default location is the 'roles_path' configured on /etc/ansible/ansible.cfg, you may override it by filling the 'location' input. Click on "Advanced" to see it.	176	2025-01-19 19:42:39.326539	2025-01-19 19:42:39.326539	\N	f	plain	\N	\N	f
47	location	f	user	\N	\N	\N	\N	A particular directory where you want the downloaded roles to be placed.	176	2025-01-19 19:42:39.326951	2025-01-19 19:42:39.326951	\N	t	plain	\N	\N	f
48	git_repository	t	user	\N	\N	\N	\N	URL to the git repository containing the roles, e.g:\r\nhttps://github.com/theforeman/foreman_role_1	177	2025-01-19 19:42:39.335129	2025-01-19 19:42:39.335129	\N	f	plain	\N	\N	f
49	location	t	user	\N	\N	\N	\N	For example, '/etc/ansible/roles/foobar' . Look at '/etc/ansible/ansible.cfg' roles_path option to find what is your roles_path	177	2025-01-19 19:42:39.335537	2025-01-19 19:42:39.335537	\N	f	plain	\N	\N	f
82	whitelist_options	f	user	\N	\N	\N	\N	\N	190	2025-01-19 19:42:39.457028	2025-01-19 19:42:39.457028	\N	f	plain	\N	\N	f
50	reject_list	f	user	\N	\N	\N	\N	A list of update titles or KB numbers that can be used to specify which updates are to be excluded from installation.\r\nIf an available update does match one of the entries, then it is skipped and not installed.\r\nEach entry can either be the KB article or Update title as a regex according to the PowerShell regex rules.	178	2025-01-19 19:42:39.347412	2025-01-19 19:42:39.347412	\N	f	plain	\N	\N	f
51	category_names	f	user	\N	\N	\N	\N	A scalar or list of categories to install updates from. To get the list of categories, run the module with state=searched. The category must be the full category string, but is case insensitive.\r\nSome possible categories are Application, Connectors, Critical Updates, Definition Updates, Developer Kits, Feature Packs, Guidance, Security Updates, Service Packs, Tools, Update Rollups and Updates.\r\n\r\nDefault is '["CriticalUpdates", "SecurityUpdates", "UpdateRollups"]'	178	2025-01-19 19:42:39.347934	2025-01-19 19:42:39.347934	\N	f	plain	\N	\N	f
52	log_path	f	user	\N	\N	\N	\N	If set, win_updates will append update progress to the specified file. The directory must already exist.	178	2025-01-19 19:42:39.348369	2025-01-19 19:42:39.348369	\N	f	plain	\N	\N	f
53	reboot	f	user	\N	\N	\N	\N	Ansible will automatically reboot the remote host if it is required and continue to install updates after the reboot.\r\nThis can be used instead of using a win_reboot task after this one and ensures all updates for that category is installed in one go.\r\nAsync does not work when reboot=true.\r\n\r\nDefault is 'false'	178	2025-01-19 19:42:39.348749	2025-01-19 19:42:39.348749	false\r\ntrue	f	plain	\N	\N	f
54	reboot_timeout	f	user	\N	\N	\N	\N	The time in seconds to wait until the host is back online from a reboot.\r\nThis is only used if reboot=true and a reboot is required.\r\n\r\nDefault is '1200'	178	2025-01-19 19:42:39.349132	2025-01-19 19:42:39.349132	\N	f	plain	\N	\N	f
55	server_selection	f	user	\N	\N	\N	\N	Defines the Windows Update source catalog.\r\ndefault Use the default search source. For many systems default is set to the Microsoft Windows Update catalog. Systems participating in Windows Server Update Services (WSUS), Systems Center Configuration Manager (SCCM), or similar corporate update server environments may default to those managed update sources instead of the Windows Update catalog.\r\nmanaged_server Use a managed server catalog. For environments utilizing Windows Server Update Services (WSUS), Systems Center Configuration Manager (SCCM), or similar corporate update servers, this option selects the defined corporate update source.\r\nwindows_update Use the Microsoft Windows Update catalog.\r\n\r\nDefault is 'default'	178	2025-01-19 19:42:39.34951	2025-01-19 19:42:39.34951	default\r\nmanaged_server\r\nwindows_update	f	plain	\N	\N	f
56	state	f	user	\N	\N	\N	\N	Controls whether found updates are downloaded or installed or listed\r\nThis module also supports Ansible check mode, which has the same effect as setting state=searched\r\n\r\nDefault is 'searched'	178	2025-01-19 19:42:39.349893	2025-01-19 19:42:39.349893	installed\r\nsearched\r\ndownloaded	f	plain	\N	\N	f
57	use_scheduled_task	f	user	\N	\N	\N	\N	Will not auto elevate the remote process with become and use a scheduled task instead.\r\nSet this to true when using this module with async on Server 2008, 2008 R2, or Windows 7, or on Server 2008 that is not authenticated with basic or credssp.\r\nCan also be set to true on newer hosts where become does not work due to further privilege restrictions from the OS defaults.	178	2025-01-19 19:42:39.350274	2025-01-19 19:42:39.350274	false\r\ntrue	f	plain	\N	\N	f
58	whitelist	f	user	\N	\N	\N	\N	A list of update titles or KB numbers that can be used to specify which updates are to be searched or installed.\r\nIf an available update does not match one of the entries, then it is skipped and not installed.\r\nEach entry can either be the KB article or Update title as a regex according to the PowerShell regex rules.\r\nThe whitelist is only validated on updates that were found based on category_names. It will not force the module to install an update if it was not in the category specified.	178	2025-01-19 19:42:39.35067	2025-01-19 19:42:39.35067	\N	f	plain	\N	\N	f
59	Activation Key	t	user	\N	\N	\N	\N	Set the activation key to assign the desired RHEL subscription and life cycle environment to the converted machine at the registration step.	179	2025-01-19 19:42:39.359315	2025-01-19 19:42:39.359315	\N	f	resource	Katello::ActivationKey	\N	f
60	Restart	t	user	\N	\N	\N	\N	Restart the system when it is successfully converted to RHEL to boot the new RHEL kernel.	179	2025-01-19 19:42:39.359727	2025-01-19 19:42:39.359727	yes\r\nno	f	plain	\N	\N	f
61	url	t	user	\N	\N	\N	\N	URL of the script to download e.g: http://example.com/unattended/anonymous/my_script	180	2025-01-19 19:42:39.367326	2025-01-19 19:42:39.367326	\N	f	plain	\N	\N	f
62	pre_script	f	user	\N	\N	\N	\N	A script to run prior to the module action	181	2025-01-19 19:42:39.376959	2025-01-19 19:42:39.376959	\N	t	plain	\N	\N	f
63	action	t	user	\N	\N	\N	\N	The module action enable, install etc	181	2025-01-19 19:42:39.377356	2025-01-19 19:42:39.377356	list\ninfo\nenable\ndisable\ninstall\nupdate\nremove\nprovides\nreset	f	plain	\N	\N	f
64	module_spec	f	user	\N	\N	\N	\N	The module specification. module:stream/profile	181	2025-01-19 19:42:39.377753	2025-01-19 19:42:39.377753	\N	f	plain	\N	\N	f
65	options	f	user	\N	\N	\N	\N	Other optional flags for the action	181	2025-01-19 19:42:39.378173	2025-01-19 19:42:39.378173	\N	f	plain	\N	\N	f
66	post_script	f	user	\N	\N	\N	\N	A script to run after the module action	181	2025-01-19 19:42:39.378569	2025-01-19 19:42:39.378569	\N	t	plain	\N	\N	f
67	state	t	user	\N	\N	\N	\N	Whether to install (present, latest), or remove (absent) a package.	182	2025-01-19 19:42:39.387618	2025-01-19 19:42:39.387618	present\r\nabsent\r\nlatest	f	plain	\N	\N	f
68	name	t	user	\N	\N	\N	\N	Package name, or package specifier with version, like name-1.0.\r\nBe aware that packages are not always named the same and this module will not 'translate' them per distro.	182	2025-01-19 19:42:39.388015	2025-01-19 19:42:39.388015	\N	f	plain	\N	\N	f
69	pre_script	f	user	\N	\N	\N	\N	A script to run prior to the package action	182	2025-01-19 19:42:39.388398	2025-01-19 19:42:39.388398	\N	t	plain	\N	\N	f
70	post_script	f	user	\N	\N	\N	\N	A script to run after the package action	182	2025-01-19 19:42:39.388769	2025-01-19 19:42:39.388769	\N	t	plain	\N	\N	f
71	action	t	user	\N	\N	\N	\N	Action to perform on the service	183	2025-01-19 19:42:39.396358	2025-01-19 19:42:39.396358	restart\r\nshutdown	f	plain	\N	\N	f
72	puppet_options	f	user	\N	\N	\N	\N	Additional options to pass to Puppet	184	2025-01-19 19:42:39.403881	2025-01-19 19:42:39.403881	\N	f	plain	\N	\N	f
73	command	t	user	\N	\N	\N	\N	Command to run on the host, e.g: \r\n\r\nmkdir helloworld	185	2025-01-19 19:42:39.411369	2025-01-19 19:42:39.411369	\N	f	plain	\N	\N	f
74	playbook	t	user	\N	\N	\N	\N	The playbook to run against given hosts	187	2025-01-19 19:42:39.426035	2025-01-19 19:42:39.426035	\N	f	plain	\N	\N	f
75	state	t	user	\N	\N	\N	\N	started/stopped are idempotent actions that will not run commands unless necessary. restarted will always bounce the service. reloaded will always reload. At least one of state and enabled are required. Note that reloaded will start the service if it is not already started, even if your chosen init system wouldn't normally.	188	2025-01-19 19:42:39.437488	2025-01-19 19:42:39.437488	started\r\nstopped\r\nrestarted\r\nreloaded	f	plain	\N	\N	f
76	name	t	user	\N	\N	\N	\N	Name of the service.	188	2025-01-19 19:42:39.437898	2025-01-19 19:42:39.437898	\N	f	plain	\N	\N	f
77	pattern	f	user	\N	\N	\N	\N	If the service does not respond to the status command, name a substring to look for as would be found in the output of the ps command as a stand-in for a status result. If the string is found, the service will be assumed to be running.	188	2025-01-19 19:42:39.438278	2025-01-19 19:42:39.438278	\N	t	plain	\N	\N	f
78	sleep	f	user	\N	\N	\N	\N	If the service is being restarted then sleep this many seconds between the stop and start command. This helps to workaround badly behaving init scripts that exit immediately after signaling a process to stop.	188	2025-01-19 19:42:39.438675	2025-01-19 19:42:39.438675	\N	t	plain	\N	\N	f
79	enabled	f	user	\N	\N	\N	\N	Whether the service should start on boot.	188	2025-01-19 19:42:39.439051	2025-01-19 19:42:39.439051	\N	t	plain	\N	\N	f
80	args	f	user	\N	\N	\N	\N	Additional arguments provided on the command line	188	2025-01-19 19:42:39.439425	2025-01-19 19:42:39.439425	\N	t	plain	\N	\N	f
81	target_version	f	user	\N	\N	\N	\N	\N	190	2025-01-19 19:42:39.456633	2025-01-19 19:42:39.456633	\N	f	plain	\N	\N	f
\.


--
-- TOC entry 4869 (class 0 OID 18744)
-- Dependencies: 427
-- Data for Name: template_invocation_events; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.template_invocation_events (id, template_invocation_id, "timestamp", event_type, event, meta, sequence_id) FROM stdin;
\.


--
-- TOC entry 4802 (class 0 OID 17884)
-- Dependencies: 360
-- Data for Name: template_invocation_input_values; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.template_invocation_input_values (id, template_invocation_id, template_input_id, value) FROM stdin;
\.


--
-- TOC entry 4800 (class 0 OID 17866)
-- Dependencies: 358
-- Data for Name: template_invocations; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.template_invocations (id, template_id, job_invocation_id, effective_user, host_id, run_host_job_task_id, smart_proxy_id) FROM stdin;
\.


--
-- TOC entry 4721 (class 0 OID 16790)
-- Dependencies: 279
-- Data for Name: template_kinds; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.template_kinds (id, name, created_at, updated_at, description) FROM stdin;
2	PXELinux	2025-01-19 19:42:37.228347	2025-01-19 19:42:37.229136	Used when PXELinux loader is set, loads pxelinux.0 which loads content generated by this template.
3	PXEGrub	2025-01-19 19:42:37.230148	2025-01-19 19:42:37.230824	Used when Grub2 loader is set, loads grub/bootx64.efi which loads content generated by this template.
4	PXEGrub2	2025-01-19 19:42:37.231655	2025-01-19 19:42:37.232444	Used when PXELinux loader is set, loads grub/grubx64.efi which loads content generated by this template.
5	iPXE	2025-01-19 19:42:37.233273	2025-01-19 19:42:37.233927	Used in iPXE environments.
6	provision	2025-01-19 19:42:37.234873	2025-01-19 19:42:37.235533	Template for OS installer, for example kickstart, preseed or jumpstart. Depends on the operating system.
7	finish	2025-01-19 19:42:37.236347	2025-01-19 19:42:37.236994	Post-install script for preseed-based or cloud instance. Connection is made via SSH, credentials or key must exist and inventory IP address must match. Only used when 'user data' is not set.
8	script	2025-01-19 19:42:37.237905	2025-01-19 19:42:37.238567	An arbitrary script, must be manually downloaded using wget/curl.
9	user_data	2025-01-19 19:42:37.239367	2025-01-19 19:42:37.240158	Template with seed data for virtual or cloud instances when 'user data' flag is set, typically cloud-init or ignition format.
10	ZTP	2025-01-19 19:42:37.240964	2025-01-19 19:42:37.241606	Provisioning Junos devices (Junos 12.2+).
11	POAP	2025-01-19 19:42:37.24241	2025-01-19 19:42:37.243194	Provisioning for switches running NX-OS.
12	cloud-init	2025-01-19 19:42:37.243995	2025-01-19 19:42:37.244643	Template for cloud-init unattended endpoint.
1	host_init_config	2025-01-19 19:42:24.285675	2025-01-19 19:42:37.245612	Contains the instructions in form of a bash script for the initial host configuration, after the host is registered in Foreman
13	registration	2025-01-19 19:42:37.246437	2025-01-19 19:42:37.246437	\N
14	kexec	2025-01-19 19:42:37.247764	2025-01-19 19:42:37.247764	\N
15	Bootdisk	2025-01-19 19:42:37.24899	2025-01-19 19:42:37.24899	\N
16	public	2025-01-19 19:42:37.250336	2025-01-19 19:42:37.250996	Templates from this category can be accessed publicly using the /unattended endpoint.
\.


--
-- TOC entry 4716 (class 0 OID 16766)
-- Dependencies: 274
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.templates (id, name, template, snippet, template_kind_id, created_at, updated_at, locked, "default", vendor, type, os_family, job_category, provider_type, description_format, execution_timeout_interval, description, ansible_callback_enabled, cloned_from_id) FROM stdin;
1	NX-OS default POAP setup	<%#\nkind: POAP\nname: NX-OS default POAP setup\nmodel: ProvisioningTemplate\noses:\n- NX-OS\ndescription: |\n  This is a placeholder template that must be replaced with the actual template\n  that renders the POAP script. DHCP options must be configured to point NX-OS to\n  download the POAP from Foreman. For more details, see https://projects.theforeman.org/issues/10526\n-%>\n# This template file is only a placeholder. Cisco provides sample Python\n# scripts for POAP, but they are only distributed through their support site.\n# You will need to provide your own POAP scripts or download one from Cisco.\n	f	11	2025-01-19 19:42:37.27169	2025-01-19 19:42:37.27169	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This is a placeholder template that must be replaced with the actual template\nthat renders the POAP script. DHCP options must be configured to point NX-OS to\ndownload the POAP from Foreman. For more details, see https://projects.theforeman.org/issues/10526	f	\N
2	AutoYaST default PXEGrub	<%#\nkind: PXEGrub\nname: AutoYaST default PXEGrub\nmodel: ProvisioningTemplate\noses:\n- SLES\n- OpenSUSE\ndescription: |\n  The template to render PXEGrub bootloader configuration for AutoYaST based distributions.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\n# This file was deployed via '<%= template_name %>' template\n\ndefault=0\ntimeout=<%= host_param('loader_timeout') || 10 %>\n\n<% if host_param('http-proxy') -%>\n  <% if host_param('http-proxy-port') -%>\n    <% http_proxy_string = "proxy=http://" + host_param('http-proxy') + ":" + host_param('http-proxy-port') -%>\n  <% else -%>\n    <% http_proxy_string = "proxy=http://" + host_param('http-proxy') -%>\n  <% end -%>\n<% else -%>\n  <% http_proxy_string = '' -%>\n<% end -%>\n\ntitle <%= template_name %>\n  root (nd)\n  kernel (nd)/../<%= @kernel %> ramdisk_size=65536 install=<%= @mediapath %> autoyast=<%= foreman_url('provision') %> textmode=1 <%= http_proxy_string %>\n  initrd (nd)/../<%= @initrd %>\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n	f	3	2025-01-19 19:42:37.281004	2025-01-19 19:42:37.281004	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXEGrub bootloader configuration for AutoYaST based distributions.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
3	Jumpstart default PXEGrub	<%#\nkind: PXEGrub\nname: Jumpstart default PXEGrub\nmodel: ProvisioningTemplate\noses:\n- Solaris\ndescription: |\n  The template to render Grub bootloader configuration for Solaris.\n  The output is deployed on the host's subnet TFTP proxy.\n  This template is for legacy Grub 1.x, you are probably looking for Grub2.\n-%>\ndefault=0\ntimeout=10\ntitle Solaris_10 Jumpstart\n        kernel <%= @host.multiboot %> kernel/unix - install dhcp nowin -B install_config=<%= @host.jumpstart_path %>,sysid_config=<%= @host.jumpstart_path %>/sysidcfg/sysidcfg_primary,install_media=<%= @host.install_path %>,install_boot=<%= @host.install_path %>/boot\n        module <%= @host.miniroot %>\ntitle Solaris 10\n        findroot (rootfs0,0,a)\n        kernel$ /platform/i86pc/multiboot\n        module /platform/i86pc/boot_archive\n	f	3	2025-01-19 19:42:37.289904	2025-01-19 19:42:37.289904	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render Grub bootloader configuration for Solaris.\nThe output is deployed on the host's subnet TFTP proxy.\nThis template is for legacy Grub 1.x, you are probably looking for Grub2.	f	\N
4	Kickstart default PXEGrub	<%#\nkind: PXEGrub\nname: Kickstart default PXEGrub\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\ndescription: |\n  The template to render Grub bootloader configuration for kickstart based distributions.\n  The output is deployed on the host's subnet TFTP proxy.\n  This template is for legacy Grub 1.x, you are probably looking for Grub2.\ntest_on:\n- host4dhcp\n- host6dhcp\n- host4and6dhcp\n- host4static\n- host6static\n-%>\n# This file was deployed via '<%= template_name %>' template\n\ndefault=0\ntimeout=<%= host_param('loader_timeout') || 10 %>\n\ntitle <%= template_name %>\n  root (nd)\n  kernel (nd)/../<%= @kernel %> <%= pxe_kernel_options %> <%= snippet("kickstart_kernel_options").strip %>\n  initrd (nd)/../<%= @initrd %>\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n	f	3	2025-01-19 19:42:37.298631	2025-01-19 19:42:37.298631	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render Grub bootloader configuration for kickstart based distributions.\nThe output is deployed on the host's subnet TFTP proxy.\nThis template is for legacy Grub 1.x, you are probably looking for Grub2.	f	\N
5	PXEGrub default local boot	<%#\nkind: PXEGrub\nname: PXEGrub default local boot\nmodel: ProvisioningTemplate\ndescription: |\n  The template to render Grub bootloader configuration for provisioned hosts,\n  that still boot from the network.\n  Hosts are instructed to boot from the first local medium.\n  Do not associate or change the name.\n  This template is for legacy Grub 1.x, you are probably looking for Grub2.\n-%>\n<%\n  # Grub1 only supports numeric default statement, this allows conversion to number. First define\n  # array of directories we will search for EFI booloaders:\n  paths = ["fedora", "redhat", "centos", "rocky", "almalinux", "debian", "ubuntu", "sles", "opensuse", "Microsoft", "EFI"]\n  # Add remaining entries to it and use this to convert to number:\n  items = paths.push("local_chain_hd0")\n  # Read default setting but since "local" is missing, use the first path available.\n  default_setting = global_setting("default_pxe_item_local", paths.first)\n  default_setting = paths.first if default_setting == 'local'\n  default_item = items.index(default_setting) || 0\n%>\ndefault=<%= default_item %>\ntimeout=20\n\n<%= snippet "pxegrub_chainload", variables: {paths: paths} %>\n	f	3	2025-01-19 19:42:37.306897	2025-01-19 19:42:37.306897	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render Grub bootloader configuration for provisioned hosts,\nthat still boot from the network.\nHosts are instructed to boot from the first local medium.\nDo not associate or change the name.\nThis template is for legacy Grub 1.x, you are probably looking for Grub2.	f	\N
6	PXEGrub global default	<%#\nkind: PXEGrub\nname: PXEGrub global default\nmodel: ProvisioningTemplate\ndescription: |\n  The template to render Grub bootloader configuration for unknown hosts.\n  The output is deployed on the host's subnet TFTP proxy.\n  Do not associate or change the name.\n  This template is for legacy Grub 1.x, you are probably looking for Grub2.\n-%>\n<%\n  # Grub1 only supports numeric default statement, this allows conversion to number. First define\n  # array of directories we will search for EFI booloaders:\n  paths = ["fedora", "redhat", "centos", "rocky", "almalinux", "debian", "ubuntu", "sles", "opensuse", "Microsoft", "EFI"]\n  # Add remaining entries to it and use this to convert to number:\n  items = paths.push("local_chain_hd0", "discovery")\n  # Read default setting but since "local" is missing, use the first path available.\n  default_setting = global_setting("default_pxe_item_global", paths.first)\n  default_setting = paths.first if default_setting == 'local'\n  default_item = items.index(default_setting) || 0\n%>\ndefault=<%= default_item %>\ntimeout=20\n\n<%= snippet "pxegrub_chainload", variables: {paths: paths} %>\n\n<%= snippet "pxegrub_discovery" %>\n\n<% unless @profiles.nil? -%>\n<% for profile in @profiles\n  url = default_template_url(profile[:template], profile[:hostgroup])\n  case profile[:pxe_type]\n  when 'kickstart'\n    append = "inst.ks=#{url} ksdevice=bootif network inst.ks.sendmac"\n  when 'preseed'\n    locale = profile[:hostgroup].params['lang'] || 'en_US'\n    append = "interface=auto url=#{url} ramdisk_size=10800 root=/dev/rd/0 rw auto hostname=unassigned-hostname locale=#{locale} console-setup/ask_detect=false console-setup/layout=USA console-setup/variant=USA"\n  else\n    raise("PXE type #{profile[:pxe_type]} not supported by template #{template_name}")\n  end %>\ntitle <%= "#{profile[:hostgroup]} - #{profile[:template]}" %>\n  kernel <%= profile[:kernel] %> <%= append %>\n  initrd <%= profile[:initrd] %>\n<% end %>\n<% end -%>\n	f	3	2025-01-19 19:42:37.314969	2025-01-19 19:42:37.314969	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render Grub bootloader configuration for unknown hosts.\nThe output is deployed on the host's subnet TFTP proxy.\nDo not associate or change the name.\nThis template is for legacy Grub 1.x, you are probably looking for Grub2.	f	\N
7	AutoYaST default PXEGrub2	<%#\nkind: PXEGrub2\nname: AutoYaST default PXEGrub2\nmodel: ProvisioningTemplate\noses:\n- SLES\n- OpenSUSE\ndescription: |\n  The template to render PXEGrub2 bootloader configuration for AutoYaST based distributions.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\n# This file was deployed via '<%= template_name %>' template\n<%\n  if !@host.pxe_loader_efi?\n    linuxcmd = "linux"\n    initrdcmd = "initrd"\n  else\n    linuxcmd = "linuxefi"\n    initrdcmd = "initrdefi"\n  end\n\n  if host_param('http-proxy')\n    if host_param('http-proxy-port')\n      http_proxy_string = "proxy=http://" + host_param('http-proxy') + ":" + host_param('http-proxy-port')\n    else\n      http_proxy_string = "proxy=http://" + host_param('http-proxy')\n    end\n  else\n    http_proxy_string = ''\n  end\n\n  kernel_options = "ramdisk_size=65536 install=#{@mediapath} autoyast=#{foreman_url('provision')} textmode=1 #{http_proxy_string}"\n-%>\n\nset default=<%= host_param('default_grub_install_entry') || 0 %>\nset timeout=<%= host_param('loader_timeout') || 10 %>\n\nmenuentry '<%= template_name %>' {\n  <%= linuxcmd %> <%= @kernel %> <%= kernel_options %>\n  <%= initrdcmd %> <%= @initrd %>\n}\n\n<%\n# Workaround for https://bugzilla.redhat.com/show_bug.cgi?id=1811561 and https://bugzilla.redhat.com/show_bug.cgi?id=1842893\nsubnet = @host.provision_interface.subnet || @host.provision_interface.subnet6\nif subnet && subnet.httpboot\n  proxy_http_port = subnet.httpboot.httpboot_http_port\n  proxy_https_port = subnet.httpboot.httpboot_https_port\n  # Workaround for "no DNS server configured" https://bugzilla.redhat.com/show_bug.cgi?id=1842509\n  proxy_host = dns_lookup(subnet.httpboot.hostname)\n-%>\n<% if proxy_http_port -%>\nmenuentry '<%= template_name %> EFI HTTP' --id efi_http {\n  <%= linuxcmd %> (http,<%= proxy_host %>:<%= proxy_http_port %>)/httpboot/<%= @kernel %> <%= kernel_options %>\n  <%= initrdcmd %> (http,<%= proxy_host %>:<%= proxy_http_port %>)/httpboot/<%= @initrd %>\n}\n<% else -%>\n# Smart proxy does not have HTTPBoot feature with HTTP port enabled, skipping EFI HTTP boot menu entry\n<% end -%>\n\n<% if proxy_https_port -%>\nmenuentry '<%= template_name %> EFI HTTPS' --id efi_https {\n  <%= linuxcmd %> (https,<%= proxy_host %>:<%= proxy_https_port %>)/httpboot/<%= @kernel %> <%= kernel_options %>\n  <%= initrdcmd %> (https,<%= proxy_host %>:<%= proxy_https_port %>)/httpboot/<%= @initrd %>\n}\n<% else -%>\n# Smart proxy does not have HTTPBoot feature with HTTPS port enabled, skipping EFI HTTPS boot menu entry\n<% end -%>\n\n<% end %>\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n	f	4	2025-01-19 19:42:37.32385	2025-01-19 19:42:37.32385	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXEGrub2 bootloader configuration for AutoYaST based distributions.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
8	Kickstart default PXEGrub2	<%#\nkind: PXEGrub2\nname: Kickstart default PXEGrub2\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\ndescription: |\n  The template to render Grub2 bootloader configuration for kickstart based distributions.\n  The output is deployed on the host's subnet TFTP proxy.\ntest_on:\n- host4dhcp\n- host6dhcp\n- host4and6dhcp\n- host4static\n- host6static\n-%>\n# This file was deployed via '<%= template_name %>' template\n<%\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  os_major = @host.operatingsystem.major.to_i\n\n  if rhel_compatible && os_major == 7 && ['i386','x86_64'].include?(@host.architecture.to_s) && @host.pxe_loader_efi?\n    #\n    # The linuxefi and initrdefi commands, despite their names, are specific to\n    # x86 and its "EFI Handover Protocol." They do not exist in upstream Grub\n    # and have been added to Fedora's since Fedora 17.\n    #\n    # https://docs.kernel.org/arch/x86/boot.html#efi-handover-protocol-deprecated\n    # https://src.fedoraproject.org/rpms/grub2/blob/f39/f/0004-Add-support-for-Linux-EFI-stub-loading.patch\n    #\n    # EL6's kernel did not support EFI Handover ("kernel too old"). EL7's does,\n    # and its Grubby generates {linux,initrd}efi commands (excluding aarch64),\n    # but that ends in EL8's BLS support.\n    #\n    # https://projects.theforeman.org/issues/24026\n    # https://git.centos.org/rpms/grubby/blob/c7/f/SOURCES/0008-Use-the-correct-load-commands-for-aarch64-efi.patch\n    # https://git.centos.org/rpms/grub2/blob/c8s/f/SOURCES/0207-blscfg-Get-rid-of-the-linuxefi-linux16-linux-distinc.patch\n    #\n    linuxcmd = "linuxefi"\n    initrdcmd = "initrdefi"\n  else\n    linuxcmd = "linux"\n    initrdcmd = "initrd"\n  end\n-%>\n\nset default=<%= host_param('default_grub_install_entry') || 0 %>\nset timeout=<%= host_param('loader_timeout') || 10 %>\n\nmenuentry '<%= template_name %>' {\n  <%= linuxcmd %> <%= @kernel %> <%= pxe_kernel_options %> <%= snippet("kickstart_kernel_options").strip %>\n  <%= initrdcmd %> <%= @initrd %>\n}\n\n<%\n# Workaround for https://bugzilla.redhat.com/show_bug.cgi?id=1811561 and https://bugzilla.redhat.com/show_bug.cgi?id=1842893\nsubnet = @host.provision_interface.subnet || @host.provision_interface.subnet6\nif subnet && subnet.httpboot\n  proxy_http_port = subnet.httpboot.httpboot_http_port\n  proxy_https_port = subnet.httpboot.httpboot_https_port\n  # Workaround for "no DNS server configured" https://bugzilla.redhat.com/show_bug.cgi?id=1842509\n  proxy_host = dns_lookup(subnet.httpboot.hostname)\n-%>\n<% if proxy_http_port -%>\nmenuentry '<%= template_name %> EFI HTTP' --id efi_http {\n  <%= linuxcmd %> (http,<%= proxy_host %>:<%= proxy_http_port %>)/httpboot/<%= @kernel %> <%= pxe_kernel_options %> <%= snippet("kickstart_kernel_options").strip %>\n  <%= initrdcmd %> (http,<%= proxy_host %>:<%= proxy_http_port %>)/httpboot/<%= @initrd %>\n}\n<% else -%>\n# Smart proxy does not have HTTPBoot feature with HTTP port enabled, skipping EFI HTTP boot menu entry\n<% end -%>\n\n<% if proxy_https_port -%>\nmenuentry '<%= template_name %> EFI HTTPS' --id efi_https {\n  <%= linuxcmd %> (https,<%= proxy_host %>:<%= proxy_https_port %>)/httpboot/<%= @kernel %> <%= pxe_kernel_options %> <%= snippet("kickstart_kernel_options").strip %>\n  <%= initrdcmd %> (https,<%= proxy_host %>:<%= proxy_https_port %>)/httpboot/<%= @initrd %>\n}\n<% else -%>\n# Smart proxy does not have HTTPBoot feature with HTTPS port enabled, skipping EFI HTTPS boot menu entry\n<% end -%>\n\n<% end %>\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n	f	4	2025-01-19 19:42:37.332848	2025-01-19 19:42:37.332848	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render Grub2 bootloader configuration for kickstart based distributions.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
9	Preseed default PXEGrub2	<%#\nkind: PXEGrub2\nname: Preseed default PXEGrub2\nmodel: ProvisioningTemplate\noses:\n- Debian\n- Ubuntu\ntest_on:\n- debian4dhcp\n- ubuntu4dhcp\ndescription: |\n  The template to render Grub2 bootloader configuration for preseed based distributions.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\n#\n# This file was deployed via '<%= template_name %>' template\n\n<%\n  os_major = @host.operatingsystem.major.to_i\n  os_name  = @host.operatingsystem.name\n\n  if (os_name == 'Ubuntu' && os_major > 12) || (os_name == 'Debian' && os_major > 8)\n    efi_suffix = 'efi'\n  else\n    efi_suffix = ''\n  end\n-%>\nset default=0\nset timeout=<%= host_param('loader_timeout') || 10 %>\n\nmenuentry '<%= template_name %>' {\n  linux<%= efi_suffix %>  <%= @kernel %> interface=auto url=<%= foreman_url('provision')%> ramdisk_size=10800 root=/dev/rd/0 rw auto <%= snippet("preseed_kernel_options").strip %>\n  initrd<%= efi_suffix %> <%= @initrd %>\n}\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n	f	4	2025-01-19 19:42:37.341732	2025-01-19 19:42:37.341732	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render Grub2 bootloader configuration for preseed based distributions.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
10	Preseed default PXEGrub2 Autoinstall	<%#\nkind: PXEGrub2\nname: Preseed default PXEGrub2 Autoinstall\nmodel: ProvisioningTemplate\noses:\n- Ubuntu\ntest_on:\n- ubuntu_autoinst4dhcp\n%>\n#\n# This file was deployed via '<%= template_name %>' template\n#\n# Supported host/hostgroup parameters:\n#\n# blacklist = module1, module2\n#   Blacklisted kernel modules\n#\n# lang = en_US\n#   System locale\n#\n<%\n  efi_suffix = 'efi'\n-%>\n\nset default=0\nset timeout=<%= host_param('loader_timeout') || 10 %>\n\nmenuentry '<%= template_name %>' {\n  linux<%= efi_suffix %> <%= @kernel %> root=/dev/rd/0 rw auto <%= snippet('preseed_kernel_options_autoinstall', variables: {add_userdata_quotes: true}).strip %>\n  initrd<%= efi_suffix %> <%= @initrd %>\n}\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n\n	f	4	2025-01-19 19:42:37.350291	2025-01-19 19:42:37.350291	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	\N	f	\N
11	PXEGrub2 default local boot	<%#\nkind: PXEGrub2\nname: PXEGrub2 default local boot\nmodel: ProvisioningTemplate\ndescription: |\n  The template to render Grub2 bootloader configuration for provisioned hosts,\n  that still boot from the network.\n  Hosts are instructed to boot from the first local medium.\n  Do not associate or change the name.\n-%>\nset default=<%= global_setting("default_pxe_item_local", "local") %>\nset timeout=20\necho Default PXE local template entry is set to '<%= global_setting("default_pxe_item_local", "local") %>'\n\n<%= snippet "pxegrub2_chainload" %>\n<%= snippet "pxegrub2_discovery" %>\n	f	4	2025-01-19 19:42:37.358476	2025-01-19 19:42:37.358476	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render Grub2 bootloader configuration for provisioned hosts,\nthat still boot from the network.\nHosts are instructed to boot from the first local medium.\nDo not associate or change the name.	f	\N
12	PXEGrub2 global default	<%#\nkind: PXEGrub2\nname: PXEGrub2 global default\nmodel: ProvisioningTemplate\ndescription: |\n  The template to render Grub2 bootloader configuration for unknown hosts.\n  The output is deployed on the host's subnet TFTP proxy.\n  Do not associate or change the name.\n-%>\ndefault=<%= global_setting("default_pxe_item_global", "local") %>\ntimeout=20\necho Default PXE global template entry is set to '<%= global_setting("default_pxe_item_global", "local") %>'\n\n<%= snippet "pxegrub2_mac" %>\n<%= snippet "pxegrub2_chainload" %>\n<%= snippet "pxegrub2_discovery" %>\n\n<% unless @profiles.nil? -%>\n<% for profile in @profiles\n  url = default_template_url(profile[:template], profile[:hostgroup])\n  case profile[:pxe_type]\n  when 'kickstart'\n    append = "inst.ks=#{url} ksdevice=bootif network inst.ks.sendmac"\n  when 'preseed'\n    locale = profile[:hostgroup].params['lang'] || 'en_US'\n    append = "interface=auto url=#{url} ramdisk_size=10800 root=/dev/rd/0 rw auto hostname=unassigned-hostname locale=#{locale} console-setup/ask_detect=false console-setup/layout=USA console-setup/variant=USA"\n  else\n    raise("PXE type #{profile[:pxe_type]} not supported by template #{template_name}")\n  end %>\nmenuentry '<%= "#{profile[:hostgroup]} - #{profile[:template]}" %>' {\n  linuxefi <%= profile[:kernel] %> <%= append %>\n  initrdefi <%= profile[:initrd] %>\n}\n<% end %>\n<% end -%>\n	f	4	2025-01-19 19:42:37.366418	2025-01-19 19:42:37.366418	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render Grub2 bootloader configuration for unknown hosts.\nThe output is deployed on the host's subnet TFTP proxy.\nDo not associate or change the name.	f	\N
13	Alterator default PXELinux	<%#\nkind: PXELinux\nname: Alterator default PXELinux\nmodel: ProvisioningTemplate\noses:\n- ALTLinux p6\n- ALTLinux p7\ndescription: |\n  The template to render PXELinux bootloader configuration for ALTLinux distributions.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\n<%\n    metadata    = @host.token.nil? ? '?metadata=' : '&metadata='\n    os          = @host.operatingsystem\n    mediumpath  = os.mediumpath(medium_provider)\n-%>\nDEFAULT linux\n\nLABEL linux\n    KERNEL <%= @kernel %>\n    APPEND initrd=<%= @initrd %> stagename=altunat showopts ramdisk_size=150000 automatic=<%= mediumpath %>,directory:/altlinux/p<%= @host.operatingsystem.major %>/<%= @host.architecture %> ai curl=<%= foreman_url('provision')%><%= metadata %>\n	f	2	2025-01-19 19:42:37.374999	2025-01-19 19:42:37.374999	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for ALTLinux distributions.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
14	AutoYaST default PXELinux	<%#\nkind: PXELinux\nname: AutoYaST default PXELinux\nmodel: ProvisioningTemplate\noses:\n- SLES\n- OpenSUSE\ndescription: |\n  The template to render PXELinux bootloader configuration for SLES and OpenSUSE distributions.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\n<%\nextra_args = []\nif host_param('http-proxy') && host_param('http-proxy-port')\n  extra_args << "proxy=http://" + host_param('http-proxy') + ":" + host_param('http-proxy-port')\nelsif host_param('http-proxy')\n  extra_args << "proxy=http://" + host_param('http-proxy')\nend\nsubnet = @host.subnet\nunless subnet.respond_to?(:dhcp_boot_mode?) and subnet.dhcp_boot_mode?\n  extra_args << "useDHCP=0"\n  extra_args << "netsetup=-dhcp"\n  extra_args << "ifcfg=*=#{@host.primary_interface.ip}/#{@host.primary_interface.subnet.cidr},#{@host.primary_interface.subnet.gateway},#{@host.primary_interface.subnet.dns_primary},#{@host.domain}"\nend\n-%>\nDEFAULT linux\n\nLABEL linux\n    KERNEL <%= @kernel %>\n    APPEND initrd=<%= @initrd %> ramdisk_size=65536 install=<%= @mediapath %> autoyast=<%= foreman_url('provision') %> textmode=1 <%= extra_args.join(' ') %>\n	f	2	2025-01-19 19:42:37.383685	2025-01-19 19:42:37.383685	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for SLES and OpenSUSE distributions.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
15	CoreOS PXELinux	<%#\nkind: PXELinux\nname: CoreOS PXELinux\nmodel: ProvisioningTemplate\noses:\n- CoreOS\ndescription: |\n  The template to render PXELinux bootloader configuration for CoreOS Container Linux distribution.\n  This does not work for Fedora CoreOS or Flatcar Container Linux, which use Ignition instead\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\nDEFAULT coreos\n\nLABEL coreos\n    KERNEL <%= @kernel %>\n    APPEND initrd=<%= @initrd %> cloud-config-url=<%= foreman_url('provision')%>\n	f	2	2025-01-19 19:42:37.392387	2025-01-19 19:42:37.392387	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for CoreOS Container Linux distribution.\nThis does not work for Fedora CoreOS or Flatcar Container Linux, which use Ignition instead\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
16	FreeBSD (mfsBSD) PXELinux	<%#\nkind: PXELinux\nname: FreeBSD (mfsBSD) PXELinux\nmodel: ProvisioningTemplate\noses:\n- FreeBSD\ndescription: |\n  The template to render PXELinux bootloader configuration for FreeBSD.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\n# foreman_url=<%= foreman_url('provision') %>\nDEFAULT freebsd\n\nLABEL freebsd\n    KERNEL memdisk\n    APPEND initrd=<%= @initrd %> harddisk raw\n	f	2	2025-01-19 19:42:37.401045	2025-01-19 19:42:37.401045	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for FreeBSD.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
17	Kickstart default PXELinux	<%#\nkind: PXELinux\nname: Kickstart default PXELinux\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\ndescription: |\n  The template to render PXELinux bootloader configuration for kickstart based distributions.\n  The output is deployed on the host's subnet TFTP proxy.\ntest_on:\n- host4dhcp\n- host6dhcp\n- host4and6dhcp\n- host4static\n- host6static\n-%>\n# This file was deployed via '<%= template_name %>' template\n<%\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  os_major = @host.operatingsystem.major.to_i\n  os_minor = @host.operatingsystem.minor.to_i\n  timeout = host_param('loader_timeout').to_i * 10\n  timeout = 100 if timeout.nil? || timeout <= 0\n-%>\nDEFAULT menu\nMENU TITLE Booting into OS installer (ESC to stop)\nTIMEOUT <%= timeout %>\nONTIMEOUT installer\n\nLABEL installer\nMENU LABEL <%= template_name %>\nKERNEL <%= @kernel %>\nAPPEND initrd=<%= @initrd %> <%= pxe_kernel_options %> <%= snippet("kickstart_kernel_options").strip %>\n<% if @host.architecture.to_s.match(/s390x?/i) %>\nINITRD <%= @initrd %>\n<% end %>\nIPAPPEND 2\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n	f	2	2025-01-19 19:42:37.409622	2025-01-19 19:42:37.409622	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for kickstart based distributions.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
18	Kickstart oVirt-RHVH PXELinux	<%#\nkind: PXELinux\nname: Kickstart oVirt-RHVH PXELinux\nmodel: ProvisioningTemplate\noses:\n- oVirt\n- RHVH\ndescription: |\n  The template to render PXELinux bootloader configuration for oVirt Node or Red Hat Virtualization Host.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\nDEFAULT rhvh\n\nLABEL rhvh\nKERNEL <%= @kernel %>\nAPPEND initrd=<%= @initrd %> inst.ks=<%= foreman_url("provision") %> inst.stage2=<%= medium_uri %> local_boot_trigger=<%= foreman_url("built") %> intel_iommu=on\nIPAPPEND 2\n	f	2	2025-01-19 19:42:37.418275	2025-01-19 19:42:37.418275	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for oVirt Node or Red Hat Virtualization Host.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
19	Preseed default PXELinux	<%#\nkind: PXELinux\nname: Preseed default PXELinux\nmodel: ProvisioningTemplate\noses:\n- Debian\n- Ubuntu\ntest_on:\n- debian4dhcp\n- ubuntu4dhcp\ndescription: |\n  The template to render PXELinux bootloader configuration for preseed based distributions.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\n#\n# This file was deployed via '<%= template_name %>' template\n\nDEFAULT linux\nLABEL linux\n    KERNEL <%= @kernel %>\n    APPEND initrd=<%= @initrd %> interface=auto url=<%= foreman_url('provision')%> ramdisk_size=10800 root=/dev/rd/0 rw auto <%= snippet("preseed_kernel_options").strip %>\n    IPAPPEND 2\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n	f	2	2025-01-19 19:42:37.426966	2025-01-19 19:42:37.426966	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for preseed based distributions.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
20	Preseed default PXELinux Autoinstall	<%#\nkind: PXELinux\nname: Preseed default PXELinux Autoinstall\nmodel: ProvisioningTemplate\noses:\n- ubuntu\ntest_on:\n- ubuntu_autoinst4dhcp\n-%>\n#\n# This file was deployed via '<%= template_name %>' template\n#\n# Supported host/hostgroup parameters:\n#\n# blacklist = module1, module2\n#   Blacklisted kernel modules\n#\n# lang = en_US\n#   System locale\n#\n# WARNING\n#\n# Foreman will not download the kernel/initramdisk to PXE automatically. Please follow\n# the official Ubuntu documentation and extract the files from the LiveCD (DVD) manually\n# and optionally update the KERNEL and INITRD lines in this template.\n#\nDEFAULT linux cloud-init autoinstall\nLABEL linux cloud-init autoinstall\n    KERNEL <%= @kernel %>\n    INITRD <%= @initrd %>\n    APPEND root=/dev/ram0 <%= snippet('preseed_kernel_options_autoinstall').strip %>\n\n<%= snippet_if_exists(template_name + " custom menu") %>\n	f	2	2025-01-19 19:42:37.435551	2025-01-19 19:42:37.435551	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	\N	f	\N
27	WAIK default PXELinux	<%#\nkind: PXELinux\nname: WAIK default PXELinux\nmodel: ProvisioningTemplate\noses:\n- Windows\ndescription: |\n  The template to render PXELinux bootloader configuration for Windows.\n  It is used to boot the Windows PE that is then used to install Windows.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\nDEFAULT winPE\n\nLABEL winPE\n    KERNEL /Boot/startrom.0\n	f	2	2025-01-19 19:42:37.49312	2025-01-19 19:42:37.49312	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for Windows.\nIt is used to boot the Windows PE that is then used to install Windows.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
21	PXELinux chain iPXE	<%#\nkind: PXELinux\nname: PXELinux chain iPXE\nmodel: ProvisioningTemplate\ndescription: |\n  Chainboots iPXE/gPXE from PXELinux. Make sure the OS has iPXE template\n  associated and file ipxe.lkrn was copied in the TFTP directory (e.g. from\n  /usr/share/ipxe/ipxe.lkrn or iPXE project web site).\n\n  For more info visit:\n  https://docs.theforeman.org/nightly/Provisioning_Guide/index-foreman-el.html#Configuring_Networking-Configuring_gPXE_to_Reduce_Provisioning_Times\n-%>\nDEFAULT linux\nLABEL linux\nKERNEL ipxe.lkrn\nAPPEND dhcp && chain <%= foreman_url('iPXE') %>\nIPAPPEND 2\n	f	2	2025-01-19 19:42:37.443528	2025-01-19 19:42:37.443528	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Chainboots iPXE/gPXE from PXELinux. Make sure the OS has iPXE template\nassociated and file ipxe.lkrn was copied in the TFTP directory (e.g. from\n/usr/share/ipxe/ipxe.lkrn or iPXE project web site).\n\nFor more info visit:\nhttps://docs.theforeman.org/nightly/Provisioning_Guide/index-foreman-el.html#Configuring_Networking-Configuring_gPXE_to_Reduce_Provisioning_Times	f	\N
22	PXELinux chain iPXE UNDI	<%#\nkind: PXELinux\nname: PXELinux chain iPXE UNDI\nmodel: ProvisioningTemplate\ndescription: |\n  Chainboots iPXE/gPXE from PXELinux via UNDI. Make sure the OS has an iPXE\n  template associated and the file undionly.kpxe was copied into the TFTP\n  directory as undionly-ipxe.0 (e.g. from /usr/share/ipxe/undionly.kpxe or\n  the iPXE project web site). Changes need to be made in the DHCP\n  configuration to prevent an endless loop to happen.\n\n  For more info visit:\n  https://docs.theforeman.org/nightly/Provisioning_Guide/index-foreman-el.html#Configuring_Networking-Configuring_gPXE_to_Reduce_Provisioning_Times\n-%>\nDEFAULT linux\nLABEL linux\nKERNEL undionly-ipxe.0\nIPAPPEND 2\n	f	2	2025-01-19 19:42:37.45159	2025-01-19 19:42:37.45159	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Chainboots iPXE/gPXE from PXELinux via UNDI. Make sure the OS has an iPXE\ntemplate associated and the file undionly.kpxe was copied into the TFTP\ndirectory as undionly-ipxe.0 (e.g. from /usr/share/ipxe/undionly.kpxe or\nthe iPXE project web site). Changes need to be made in the DHCP\nconfiguration to prevent an endless loop to happen.\n\nFor more info visit:\nhttps://docs.theforeman.org/nightly/Provisioning_Guide/index-foreman-el.html#Configuring_Networking-Configuring_gPXE_to_Reduce_Provisioning_Times	f	\N
23	PXELinux default local boot	<%#\nkind: PXELinux\nname: PXELinux default local boot\nmodel: ProvisioningTemplate\ndescription: |\n  The template to render PXELinux bootloader configuration for provisioned hosts,\n  that still boot from the network.\n  Hosts are instructed to boot from the first local medium.\n  Do not associate or change the name.\n-%>\n<% if @host.architecture.to_s.match(/s390x?/i) -%>\n# pxelinux\n# Reboot dracut image must be manually built and copied over to the TFTP\n# https://github.com/lzap/dracut-reboot-s390x\ndefault reboot\nlabel reboot\nkernel kernel-reboot.img\ninitrd initrd-reboot.img\n# Uncomment to customize chreipl arguments\n#append rd.shell rd.chreipl=ccw rd.chreipl=0.0.0000XXX\n<% else -%>\nUI menu.c32\nMENU TITLE Booting local disk (ESC to stop)\nTIMEOUT 200\nONTIMEOUT <%= global_setting("default_pxe_item_local", "local_chain_hd0") %>\nDEFAULT <%= global_setting("default_pxe_item_local", "local_chain_hd0") %>\n\n<%= snippet "pxelinux_chainload" %>\n<% end -%>\n	f	2	2025-01-19 19:42:37.459628	2025-01-19 19:42:37.459628	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for provisioned hosts,\nthat still boot from the network.\nHosts are instructed to boot from the first local medium.\nDo not associate or change the name.	f	\N
24	PXELinux default memdisk	<%#\nkind: PXELinux\nname: PXELinux default memdisk\nmodel: ProvisioningTemplate\noses:\n- FreeBSD (memdisk image)\ndescription: |\n  The template to render PXELinux bootloader configuration for FreeBSD.\n  The output is deployed on the host's subnet TFTP proxy. It boots the memdisk.\n  Memdisk is meant to allow booting legacy operating systems. Memdisk can boot\n  floppy images, hard disk images and some ISO images.\n\n  This template does not store the foreman_url in the comment (see freebsd (mfsbsd) pxelinux\n  template)\n-%>\nDEFAULT memdisk\n\nLABEL memdisk\n    KERNEL memdisk\n    APPEND initrd=<%= @initrd %> harddisk raw\n	f	2	2025-01-19 19:42:37.468142	2025-01-19 19:42:37.468142	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for FreeBSD.\nThe output is deployed on the host's subnet TFTP proxy. It boots the memdisk.\nMemdisk is meant to allow booting legacy operating systems. Memdisk can boot\nfloppy images, hard disk images and some ISO images.\n\nThis template does not store the foreman_url in the comment (see freebsd (mfsbsd) pxelinux\ntemplate)	f	\N
25	PXELinux global default	<%#\nkind: PXELinux\nname: PXELinux global default\nmodel: ProvisioningTemplate\ndescription: |\n  The template to render PXELinux bootloader configuration for unknown hosts.\n  The output is deployed on the host's subnet TFTP proxy.\n  Do not associate or change the name.\n-%>\n\nUI menu.c32\nMENU TITLE Booting unknown host (ESC to stop)\nTIMEOUT 200\nONTIMEOUT <%= global_setting("default_pxe_item_global", "local") %>\nDEFAULT <%= global_setting("default_pxe_item_global", "local") %>\n\n<%= snippet "pxelinux_chainload" %>\n\n<%= snippet "pxelinux_discovery" %>\n\n<% unless @profiles.nil? -%>\n<% for profile in @profiles\n  url = default_template_url(profile[:template], profile[:hostgroup])\n  case profile[:pxe_type]\n  when 'kickstart'\n    append = "inst.ks=#{url} ksdevice=bootif network inst.ks.sendmac"\n  when 'preseed'\n    locale = profile[:hostgroup].params['lang'] || 'en_US'\n    append = "interface=auto url=#{url} ramdisk_size=10800 root=/dev/rd/0 rw auto hostname=unassigned-hostname locale=#{locale} console-setup/ask_detect=false console-setup/layout=USA console-setup/variant=USA"\n  else\n    raise("PXE type #{profile[:pxe_type]} not supported by template #{template_name}")\n  end %>\nLABEL <%= "#{profile[:hostgroup]} - #{profile[:template]}" %>\n  KERNEL <%= profile[:kernel] %>\n  APPEND initrd=<%= profile[:initrd] %> <%= append %>\n<% end %>\n<% end -%>\n	f	2	2025-01-19 19:42:37.476166	2025-01-19 19:42:37.476166	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for unknown hosts.\nThe output is deployed on the host's subnet TFTP proxy.\nDo not associate or change the name.	f	\N
26	RancherOS PXELinux	<%#\nkind: PXELinux\nname: RancherOS PXELinux\nmodel: ProvisioningTemplate\noses:\n- RancherOS\ndescription: |\n  The template to render PXELinux bootloader configuration for RancherOS.\n  This does not work with k3os, a successor of the RancherOS 1.x and 2.x\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\nDEFAULT rancheros\n\nLABEL rancheros\n    KERNEL <%= @kernel %>\n    APPEND rancher.state.dev=LABEL=RANCHER_STATE rancher.state.autoformat=[<%= host_param('install-disk') || '/dev/sda' %>] rancher.cloud_init.datasources=['url:<%= foreman_url('provision')-%>']\n    INITRD <%= @initrd -%>\n	f	2	2025-01-19 19:42:37.484701	2025-01-19 19:42:37.484701	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for RancherOS.\nThis does not work with k3os, a successor of the RancherOS 1.x and 2.x\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
139	Empty	<%#\nkind: ptable\nname: Empty\nmodel: Ptable\noses:\n- RancherOS\n-%>\n	f	\N	2025-01-19 19:42:38.528712	2025-01-19 19:42:38.528712	t	t	Foreman	Ptable	Rancheros	Miscellaneous	\N	\N	\N	\N	f	\N
140	FreeBSD default fake	<%#\nkind: ptable\nname: FreeBSD default fake\nmodel: Ptable\noses:\n- FreeBSD\n%>\n# Not supported with zfsinstall\n	f	\N	2025-01-19 19:42:38.537121	2025-01-19 19:42:38.537121	t	t	Foreman	Ptable	Freebsd	Miscellaneous	\N	\N	\N	\N	f	\N
28	Windows default PXELinux	<%#\nkind: PXELinux\nname: Windows default PXELinux\nmodel: ProvisioningTemplate\noses:\n- Windows\ndescription: |\n  A template to render a PXELinux configuration for Windows installations.\n  It injects the actual installation script from Foreman to give a highly customizable installation.\n  Note that this does rely on HTTP support inside your PXE environment. If this is not supported, please chain this using iPXE instead.\n  After this has been injected, it starts wimboot which in turn starts the actual WinPE image\n-%>\nDEFAULT menu\nLABEL menu\n     COM32 linux.c32 <%= @host.operatingsystem.bootfile(medium_provider,:kernel) %>\n     APPEND initrdfile=<%= foreman_url('script') %>@peSetup.cmd,<%= @host.operatingsystem.bootfile(medium_provider,:bcd) %>,<%= @host.operatingsystem.bootfile(medium_provider,:bootsdi) %>,<%= @host.operatingsystem.bootfile(medium_provider,:bootwim) %>\n	f	2	2025-01-19 19:42:37.501624	2025-01-19 19:42:37.501624	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	A template to render a PXELinux configuration for Windows installations.\nIt injects the actual installation script from Foreman to give a highly customizable installation.\nNote that this does rely on HTTP support inside your PXE environment. If this is not supported, please chain this using iPXE instead.\nAfter this has been injected, it starts wimboot which in turn starts the actual WinPE image	f	\N
29	XenServer default PXELinux	<%#\nkind: PXELinux\nname: XenServer default PXELinux\nmodel: ProvisioningTemplate\noses:\n- XenServer\ndescription: |\n  The template to render PXELinux bootloader configuration for XenServer or Citrix Hypervisor.\n  The output is deployed on the host's subnet TFTP proxy.\n-%>\ndefault xenserver\nlabel xenserver\nkernel mboot.c32\nappend <%= @xen %> dom0_max_vcpus=1-2 dom0_mem=752M,max:752M com1=115200,8n1 console=com1,vga --- <%= @kernel -%> xencons=hvc console=hvc0 console=tty0 answerfile=<%= foreman_url('provision')%> install --- <%= @initrd %>\nIPAPPEND 2\n	f	2	2025-01-19 19:42:37.51009	2025-01-19 19:42:37.51009	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render PXELinux bootloader configuration for XenServer or Citrix Hypervisor.\nThe output is deployed on the host's subnet TFTP proxy.	f	\N
30	Junos default ZTP config	<%#\nkind: ZTP\nname: Junos default ZTP config\nmodel: ProvisioningTemplate\noses:\n- Junos\ndescription: |\n  Generates a Junos OS configuration file. That can be used by ZTP on Juniper\n  network devices. For more information, see https://projects.theforeman.org/issues/3906\n-%>\nsystem {\n    host-name <%= @host.shortname %>;\n    root-authentication {\n      encrypted-password "<%= root_pass %>"; ## SECRET-DATA\n    }\n    services {\n        ssh;\n        netconf {\n            ssh;\n        }\n    }\n    syslog {\n        user * {\n            any emergency;\n            user info;\n        }\n        file messages {\n            any notice;\n            authorization info;\n        }\n        console {\n            user info;\n        }\n    }\n}\ninterfaces {\n    vme {\n        unit 0 {\n            family inet {\n                dhcp;\n            }\n        }\n    }\n}\nevent-options {\n    generate-event {\n        fmztp time-interval 90;\n    }\n    policy fmztp {\n        events fmztp;\n        then {\n            execute-commands {\n                commands {\n                    "op url <%= foreman_url('provision')%>.slax";\n                }\n            }\n        }\n    }\n}\nprotocols {\n    igmp-snooping {\n        vlan all;\n    }\n    rstp;\n    lldp {\n        interface all;\n    }\n    lldp-med {\n        interface all;\n    }\n}\nethernet-switching-options {\n    storm-control {\n        interface all;\n    }\n}\n	f	10	2025-01-19 19:42:37.51861	2025-01-19 19:42:37.51861	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates a Junos OS configuration file. That can be used by ZTP on Juniper\nnetwork devices. For more information, see https://projects.theforeman.org/issues/3906	f	\N
31	CloudInit default	<%#\nkind: cloud-init\nname: CloudInit default\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- Rocky\n- Debian\n- Ubuntu\ntest_on:\n- host4dhcp\n- debian4dhcp\n- ubuntu4dhcp\ndescription: |\n  This template is used during image based provisioning, when the image is configured to use user-data.\n  The output is a list of cloud-init directives that cloud-init parses and uses to configures the VM\n  booted from the image. The image must have cloud-init installed in order for this to work.\n  This template accepts the following parameters:\n  - force-puppet: boolean (default=false)\n  - enable-puppetlabs-repo: boolean (default=false)\n  - enable-puppetlabs-puppet5-repo: boolean (default=false)\n  - enable-puppetlabs-puppet6-repo: boolean (default=false)\n  - enable-official-puppet7-repo: boolean (default=false)\n  - enable-official-puppet8-repo: boolean (default=false)\n  - skip-puppet-setup: boolean (default=false)\n-%>\n<%\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  proxy_uri = host_param('http-proxy') ? "http://#{host_param('http-proxy')}:#{host_param('http-proxy-port')}" : nil\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  chef_enabled = @host.respond_to?(:chef_proxy) && @host.chef_proxy\n-%>\n\n#cloud-config\nhostname: <%= @host.name %>\nfqdn: <%= @host %>\nmanage_etc_hosts: true\nusers: {}\nruncmd:\n- |\n<%= indent(2) { snippet 'fix_hosts' } -%>\n- |\n<%= indent(2) { snippet 'yum_proxy' } -%>\n- |\n<%= indent(2) { snippet 'ntp' } -%>\n<% if rhel_compatible -%>\n<% if host_param_true?('enable-epel') -%>\n- |\n<%= indent(2) { snippet 'epel' } -%>\n<% end -%>\n- |\n<%= indent(2) { snippet 'redhat_register' } -%>\n<% end -%>\n<% if host_enc['parameters']['realm'] && @host.realm && (@host.realm.realm_type == 'FreeIPA' || @host.realm.realm_type == 'Red Hat Identity Management') -%>\n- |\n<%= indent(2) { snippet 'freeipa_register' } %>\n<% end -%>\n- |\n<%= indent(2) { snippet 'remote_execution_ssh_keys' } %>\n- |\n<%= indent(2) { snippet 'blacklist_kernel_modules' } %>\n<% if chef_enabled -%>\n- |\n<%= indent(2) { snippet 'chef_client' } %>\n<% end -%>\n<% if puppet_enabled -%>\n- |\n<% if host_param_true?('enable-puppetlabs-repo') || host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppetlabs-puppet5-repo') -%>\n<%= indent(2) { snippet 'puppetlabs_repo' } %>\n<% end -%>\n<%= indent(2) { snippet 'puppet_setup' } %>\n<% end -%>\nphone_home:\n  url: <%= foreman_url('built') %>\n  post: []\n  tries: 10\n	f	12	2025-01-19 19:42:37.5299	2025-01-19 19:42:37.5299	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used during image based provisioning, when the image is configured to use user-data.\nThe output is a list of cloud-init directives that cloud-init parses and uses to configures the VM\nbooted from the image. The image must have cloud-init installed in order for this to work.\nThis template accepts the following parameters:\n- force-puppet: boolean (default=false)\n- enable-puppetlabs-repo: boolean (default=false)\n- enable-puppetlabs-puppet5-repo: boolean (default=false)\n- enable-puppetlabs-puppet6-repo: boolean (default=false)\n- enable-official-puppet7-repo: boolean (default=false)\n- enable-official-puppet8-repo: boolean (default=false)\n- skip-puppet-setup: boolean (default=false)	f	\N
32	Discovery Debian kexec	<%#\nkind: kexec\nname: Discovery Debian kexec\nmodel: ProvisioningTemplate\noses:\n- Debian\n- Ubuntu\ndescription: |\n  This template is used to pass command line options to kexec when reloading\n  kernel on a discovered host instead of rebooting. This is useful in PXE-less\n  environments. The template must generate JSON format with the following items\n  "kernel", "initram", "append" and "extra". The kexec command is composed in\n  the following way:\n\n  kexec --force --debug --append=$append --initrd=$initram $extra $kernel\n\n  Please read kexec(8) man page for more information about semantics.\n  Extra options like --reset-vga can be set via "extra" array.\nrequire:\n- plugin: foreman_discovery\n￼ version: 22.0.0\n-%>\n<%\n  mac = @host.facts['discovery_bootif']\n  bootif = host_param("hardware_type", "01") + '-' + mac.gsub(':', '-') if mac\n  ip_cidr = @host.facts['discovery_ip_cidr']\n  ip = @host.facts['discovery_ip']\n  mask = @host.facts['discovery_netmask']\n  gw = @host.facts['discovery_gateway']\n  dns = @host.facts['discovery_dns']\n  options = ["nomodeset", "nokaslr", "auto=true"]\n  options << @host.facts['append']\n  options << "domain=#{@host.domain}"\n  options << 'console-setup/ask_detect=false console-setup/layout=USA console-setup/variant=USA keyboard-configuration/layoutcode=us localechooser/translation/warn-light=true localechooser/translation/warn-severe=true'\n  options << "locale=#{host_param('lang') || 'en_US'}"\n  extra = []\n  extra << "--kexec-file-syscall" if @host.pxe_loader&.include?('SecureBoot')\n-%>\n{\n"kernel": "<%= @kernel_uri %>",\n"initram": "<%= @initrd_uri %>",\n"append": "url=<%= foreman_url('provision', { static: 'yes' })%> interface=<%= mac %> netcfg/get_ipaddress=<%= ip %> netcfg/get_netmask=<%= mask %> netcfg/get_gateway=<%= gw %> netcfg/get_nameservers=<%= dns %> netcfg/disable_dhcp=true netcfg/get_hostname=<%= @host.name %> BOOTIF=<%= bootif %> <%= options.compact.join(' ') %>",\n"extra": <%= extra %>\n}\n	f	14	2025-01-19 19:42:37.538527	2025-01-19 19:42:37.538527	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used to pass command line options to kexec when reloading\nkernel on a discovered host instead of rebooting. This is useful in PXE-less\nenvironments. The template must generate JSON format with the following items\n"kernel", "initram", "append" and "extra". The kexec command is composed in\nthe following way:\n\nkexec --force --debug --append=$append --initrd=$initram $extra $kernel\n\nPlease read kexec(8) man page for more information about semantics.\nExtra options like --reset-vga can be set via "extra" array.	f	\N
33	Discovery Red Hat kexec	<%#\nkind: kexec\nname: Discovery Red Hat kexec\nmodel: ProvisioningTemplate\noses:\n- CentOS 4\n- CentOS 5\n- CentOS 6\n- CentOS 7\n- Fedora 21\n- Fedora 22\n- Fedora 23\n- Fedora 24\n- RedHat 4\n- RedHat 5\n- RedHat 6\n- RedHat 7\ndescription: |\n  This template is used to pass command line options to kexec when reloading\n  kernel on a discovered host instead of rebooting. This is useful in PXE-less\n  environments. The template must generate JSON format with the following items\n  "kernel", "initram", "append" and "extra". The kexec command is composed in\n  the following way:\n\n  kexec --force --debug --append=$append --initrd=$initram $extra $kernel\n\n  Please read kexec(8) man page for more information about semantics.\n  Extra options like --reset-vga can be set via "extra" array.\nrequire:\n- plugin: foreman_discovery\n￼ version: 22.0.0\n-%>\n<%\n  mac = @host.facts['discovery_bootif']\n  bootif = host_param("hardware_type", "01") + '-' + mac.gsub(':', '-') if mac\n  ip_cidr = @host.facts['discovery_ip_cidr']\n  ip = @host.facts['discovery_ip']\n  mask = @host.facts['discovery_netmask']\n  gw = @host.facts['discovery_gateway']\n  dns = @host.facts['discovery_dns']\n  options = ["nomodeset"]\n  options << @host.facts['append']\n  if @host.operatingsystem.name != 'Fedora' && @host.operatingsystem.major.to_i >= 7 && host_param_true?('fips_enabled')\n    options.push('fips=1')\n  end\n  extra = []\n  extra << "--kexec-file-syscall" if @host.pxe_loader&.include?('SecureBoot')\n-%>\n{\n"kernel": "<%= @kernel_uri %>",\n"initram": "<%= @initrd_uri %>",\n<% if (@host.operatingsystem.name == 'Fedora' and @host.operatingsystem.major.to_i > 16) or\n  (@host.operatingsystem.name != 'Fedora' and @host.operatingsystem.major.to_i >= 7) -%>\n  "append": "inst.ks=<%= foreman_url('provision', { static: 'yes' }) %> inst.ks.sendmac <%= "ip=#{ip}::#{gw}:#{mask}:::none nameserver=#{dns} ksdevice=bootif BOOTIF=#{bootif} nomodeset nokaslr " + options.compact.join(' ') %>",\n<% else -%>\n  "append": "inst.ks=<%= foreman_url('provision', { static: 'yes' }) %> kssendmac nicdelay=5 <%= "ip=#{ip} netmask=#{mask} gateway=#{gw} dns=#{dns} ksdevice=#{mac} BOOTIF=#{bootif} nomodeset nokaslr " + options.compact.join(' ') %>",\n<% end -%>\n"extra": <%= extra %>\n}\n	f	14	2025-01-19 19:42:37.547246	2025-01-19 19:42:37.547246	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used to pass command line options to kexec when reloading\nkernel on a discovered host instead of rebooting. This is useful in PXE-less\nenvironments. The template must generate JSON format with the following items\n"kernel", "initram", "append" and "extra". The kexec command is composed in\nthe following way:\n\nkexec --force --debug --append=$append --initrd=$initram $extra $kernel\n\nPlease read kexec(8) man page for more information about semantics.\nExtra options like --reset-vga can be set via "extra" array.	f	\N
34	Discovery Ubuntu kexec Autoinstall	<%#\nkind: kexec\nname: Discovery Ubuntu kexec Autoinstall\nmodel: ProvisioningTemplate\noses:\n  - Ubuntu\ndescription: |\n  This template is used to pass command line options to kexec when reloading\n  kernel on a discovered host instead of rebooting. This is useful in PXE-less\n  environments. The template must generate JSON format with the following items\n  "kernel", "initram", "append" and "extra". The kexec command is composed in\n  the following way:\n\n  kexec --force --debug --append=$append --initrd=$initram $extra $kernel\n\n  Please read kexec(8) man page for more information about semantics.\n  Extra options like --reset-vga can be set via "extra" array.\nrequire:\n  - plugin: foreman_discovery\n    version: 19.0.1\n-%>\n<%\n  mac = @host.facts['discovery_bootif']\n  bootif = host_param("hardware_type", "01") + '-' + mac.gsub(':', '-') if mac\n  ip_cidr = @host.facts['discovery_ip_cidr']\n  ip = @host.facts['discovery_ip']\n  mask = @host.facts['discovery_netmask']\n  gw = @host.facts['discovery_gateway']\n  dns = @host.facts['discovery_dns']\n  identifier = @host.facts['discovery_identifier']\n  image_path = @preseed_path.sub(/\\/?$/, '.iso')\n  options = ["nomodeset", "nokaslr", "auto=true"]\n  options << @host.facts['append']\n  options << "domain=#{@host.domain}"\n  options << 'console-setup/ask_detect=false'\n  options << 'console-setup/layout=USA'\n  options << 'console-setup/variant=USA'\n  options << 'keyboard-configuration/layoutcode=us'\n  options << 'localechooser/translation/warn-light=true'\n  options << 'localechooser/translation/warn-severe=true'\n  options << "locale=#{host_param('lang') || 'en_US'}"\n  options << "ip=#{ip}::#{gw}:#{mask}:#{@host.name}:#{identifier}:none:#{dns}"\n  options << "BOOTIF=#{bootif}"\n  options << "url=http://#{@preseed_server}#{image_path}"\n  options << 'autoinstall'\n  options << "ds=nocloud-net;s=http://#{foreman_request_addr}/userdata/"\n  options << 'root=/dev/ram0'\n  options << 'ramdisk_size=1500000'\n  options << 'fsck.mode=skip'\n  options << 'cloud-config-url=/dev/null'\n-%>\n{\n  "kernel": "<%= @kernel_uri %>",\n  "initram": "<%= @initrd_uri %>",\n  "append": "<%= options.compact.join(' ') %>",\n  "extra": []\n}\n\n	f	14	2025-01-19 19:42:37.556086	2025-01-19 19:42:37.556086	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used to pass command line options to kexec when reloading\nkernel on a discovered host instead of rebooting. This is useful in PXE-less\nenvironments. The template must generate JSON format with the following items\n"kernel", "initram", "append" and "extra". The kexec command is composed in\nthe following way:\n\nkexec --force --debug --append=$append --initrd=$initram $extra $kernel\n\nPlease read kexec(8) man page for more information about semantics.\nExtra options like --reset-vga can be set via "extra" array.	f	\N
35	Alterator default finish	<%#\nkind: finish\nname: Alterator default finish\nmodel: ProvisioningTemplate\noses:\n- ALTLinux p6\n- ALTLinux p7\ndescription: |\n  A finish template executed at the end of a network provisioning or\n  after the image based provisioning is done using the image without user data.\n  It is only used for ALTLinux distributions. It fixes the /etc/hosts entries,\n  installs and cofigures puppet and reboots the machine.\n-%>\n#!/bin/sh\n\n<%= snippet 'fix_hosts' %>\n\napt-get update >/dev/null 2>/dev/null\napt-get -y install puppet >/dev/null 2>/dev/null\n\n\ncat > /etc/puppet/puppet.conf << EOF\n<%= snippet 'puppet.conf' -%>\nEOF\n\n/usr/bin/puppet agent --config /etc/puppet/puppet.conf -o --tags no_such_tag --server <%= host_puppet_server %> --no-daemonize\n/sbin/chkconfig puppetd on\n\n<%= snippet 'built' %>\n<%= snippet 'schedule_reboot' -%>\n\nexit 0\n	f	7	2025-01-19 19:42:37.564729	2025-01-19 19:42:37.564729	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	A finish template executed at the end of a network provisioning or\nafter the image based provisioning is done using the image without user data.\nIt is only used for ALTLinux distributions. It fixes the /etc/hosts entries,\ninstalls and cofigures puppet and reboots the machine.	f	\N
36	FreeBSD (mfsBSD) finish	<%#\nkind: finish\nname: FreeBSD (mfsBSD) finish\nmodel: ProvisioningTemplate\noses:\n- FreeBSD\ndescription: |\n  A finish template executed at the end of network provisioning or\n  after the image based provisioning is done using the image without user data.\n  It is only used for FreeBSD with mfsBSD toolset.\n  It supports deploying puppet and salt agents.\n-%>\n<%\n  # safemode renderer does not support unary negation\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  proxy_string = host_param('http-proxy') ? "http://#{host_param('http-proxy')}:#{host_param('http-proxy-port')}" : ''\n%>\n<% unless proxy_string == '' -%>\nexport http_proxy='<%= proxy_string %>'\n<% end -%>\n/bin/echo '<%= root_pass %>' | pw usermod root -H 0\ncat >> /etc/rc.conf <<EOF\nhostname="<%= @host %>"\nsshd_enable="YES"\nntpd_enable="YES"\nEOF\n\necho ifconfig_`ifconfig -l | cut -d ' ' -f 1`=DHCP >>/etc/rc.conf\n\necho 'PermitRootLogin yes' >> /etc/ssh/sshd_config\n\n/bin/hostname <%= @host.name %>\ncp /usr/share/zoneinfo/<%= host_param('time-zone') || 'UTC' %> /etc/localtime\nadjkerntz -a\nntpdate <%= host_param('ntp-server') || '0.freebsd.pool.ntp.org' %>\n\nmkdir /root/install/\nfreebsd-update fetch > /root/install/freebsd-update_fetch.txt\nfreebsd-update install > /root/install/freebsd-update_install.txt\n\nenv ASSUME_ALWAYS_YES=YES pkg bootstrap\npkg update > /root/install/pkg_update.txt\npkg upgrade -y > /root/install/pkg_upgrade.txt\n\n<% if puppet_enabled %>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if salt_enabled %>\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n<%= snippet('remote_execution_ssh_keys') %>\n\n<%= snippet 'schedule_reboot' -%>\n\nexit 0\n	f	7	2025-01-19 19:42:37.578203	2025-01-19 19:42:37.578203	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	A finish template executed at the end of network provisioning or\nafter the image based provisioning is done using the image without user data.\nIt is only used for FreeBSD with mfsBSD toolset.\nIt supports deploying puppet and salt agents.	f	\N
37	Jumpstart default finish	<%#\nkind: finish\nname: Jumpstart default finish\nmodel: ProvisioningTemplate\noses:\n- Solaris\ndescription: |\n  A finish template executed at the end of a network provisioning or\n  after the image based provisioning is done using the image without user data.\n  It is only used for Solaris.\n-%>\nlogger "Starting finish script"\n\n# Do not turn the machine off after 30 minutes. Very annoying!\n/bin/touch /noautoshutdown\n\n# Install the root password\n/usr/bin/perl -p -i -e 's/^root:[^:]+/root:<%= @host.root_pass.gsub('/', '\\/')-%>/' /etc/shadow\n\n# Root can ssh into this box. This is very useful while we rebuild this\n/usr/bin/perl -p -i -e "s/PermitRootLogin no/PermitRootLogin yes/" /etc/ssh/sshd_config\n\n# Now ensure that we have the newest puppet and facter installed\nmount /proc\n/usr/bin/cat /etc/mnttab | sed -e 's/\\/a/\\//' | sed -e 's/\\/a//' > /a/etc/mnttab\n/sbin/mount -F mntfs mnttab /etc/mnttab\n/usr/sbin/mknod /devices/pseudo/random@0:random c 190 0\n/usr/sbin/mknod /devices/pseudo/random@0:urandom c 190 1\n/usr/sbin/pkgadd -a /tmp/admin -d http://get.opencsw.org/now all\n/opt/csw/bin/pkgutil -U -y\n/opt/csw/bin/pkgutil -u -f -y CSWfacter CSWpuppet CSWwget\n\n/usr/bin/echo "Creating helper startup script to start puppet"\nONETIME=S99.enable.puppet\n/usr/bin/cat > /etc/rc3.d/$ONETIME << EOF\n#!/bin/sh\n#\n# $ONETIME\n#\n# runs once at startup and then removes itself.\n#\nPATH=/usr/bin:/usr/sbin; export PATH\n/usr/sbin/svccfg import /var/opt/csw/svc/manifest/network/cswpuppetd.xml\n/usr/sbin/svcadm enable svc:/network/cswpuppetd\nsleep 2\nrm \\$0\nEOF\n\n/usr/bin/echo "Configuring puppet"\ncat > /etc/puppet/puppet.conf << EOF\n<%= snippet 'puppet.conf' -%>\nEOF\n# The x86 version of the puppet package ignores the --config parameter. This should fix that and not hurt other installations\nif [ -f /etc/opt/csw/puppet/puppetd.conf ]\nthen\n    rm -f /etc/opt/csw/puppet/puppetd.conf\n    ln -s /etc/puppet/puppet.conf /etc/opt/csw/puppet/puppetd.conf\nfi\n/opt/csw/bin/puppet agent --config /etc/puppet/puppet.conf -o --tags no_such_tag --server <%= host_puppet_server %> --no-daemonize\n\necho "Informing Foreman that we are built"\n/opt/csw/bin/wget --no-check-certificate -O /dev/null <%= foreman_url('built') %>\n\n<%= snippet 'schedule_reboot' -%>\n\nexit 0\n	f	7	2025-01-19 19:42:37.587434	2025-01-19 19:42:37.587434	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	A finish template executed at the end of a network provisioning or\nafter the image based provisioning is done using the image without user data.\nIt is only used for Solaris.	f	\N
38	Junos default finish	<%#\nkind: finish\nname: Junos default finish\nmodel: ProvisioningTemplate\noses:\n- Junos\ndescription: |\n  Generates a Junos OS configuration file. That can be used by Autoinstallation on Juniper\n  network devices. For more information, see https://projects.theforeman.org/issues/3906\n-%>\nsystem {\n    host-name <%= @host %>;\n    time-zone <%= host_param('time-zone') || 'Etc/UTC' %>;\n    root-authentication {\n        encrypted-password "<%= root_pass %>"; ## SECRET-DATA\n    }\n    name-server {\n        <% if @host.subnet.dns_servers.empty? -%>\n        8.8.8.8;\n        <% end -%>\n        <% @host.subnet.dns_servers.each do |nameserver| -%>\n        <%= nameserver %>;\n        <% end -%>\n    }\n    ntp {\n        boot-server <%= host_param('ntp-server') || '0.pool.ntp.org' %>;\n        server <%= host_param('ntp-server') || '0.pool.ntp.org' %>;\n    }\n    login {\n        message "This device was provisioned by using The Foreman!\\nSee http://theforeman.org/ for further information.\\n";\n        class automation {\n            permissions all;\n        }\n        user puppet {\n            uid 2001;\n            class automation;\n            authentication {\n                encrypted-password "<%= root_pass %>"; ## SECRET-DATA\n            }\n            shell csh;\n        }\n    }\n    services {\n        ssh {\n            protocol-version v2;\n        }\n        netconf {\n            ssh;\n        }\n    }\n    syslog {\n        user * {\n            any emergency;\n        }\n        file messages {\n            any notice;\n            authorization info;\n        }\n        file interactive-commands {\n            interactive-commands any;\n        }\n    }\n    ntp {\n        boot-server 0.pool.ntp.org;\n        server 0.pool.ntp.org;\n        server 1.pool.ntp.org;\n    }\n    extensions {\n        providers {\n            juniper {\n                license-type juniper deployment-scope commercial;\n            }\n        }\n    }\n}\nchassis {\n    alarm {\n        management-ethernet {\n            link-down ignore;\n        }\n    }\n}\ninterfaces {\n    interface-range ACCESS-PORT {\n        member ge-0/0/0;\n        unit 0 {\n            family ethernet-switching {\n                port-mode access;\n            }\n        }\n    }\n    interface-range UPLINK-PORT {\n        member ge-0/0/47;\n        unit 0 {\n            family ethernet-switching {\n                port-mode trunk;\n                vlan {\n                    members all;\n                }\n            }\n        }\n    }\n    vlan {\n        unit 37 {\n            family inet;\n        }\n    }\n    vme {\n        unit 0 {\n            family inet {\n                dhcp;\n            }\n        }\n    }\n}\nprotocols {\n    igmp-snooping {\n        vlan all;\n    }\n    rstp;\n    lldp {\n        interface all;\n    }\n    lldp-med {\n        interface all;\n    }\n}\nethernet-switching-options {\n    storm-control {\n        interface all;\n    }\n    bpdu-block {\n        interface ACCESS-PORT;\n        disable-timeout 120;\n    }\n}\nvlans {\n    testlan {\n        vlan-id 37;\n        l3-interface vlan.37;\n    }\n}\ngroups {\n    fmztp {\n        apply-macro conf {\n            package jinstall-ex-4200-<%= @host.operatingsystem.major %>R<%= @host.operatingsystem.minor %>-domestic-signed.tgz;\n            puppet jpuppet-ex-1.0R1.1.tgz;\n        }\n    }\n}\n	f	7	2025-01-19 19:42:37.596237	2025-01-19 19:42:37.596237	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates a Junos OS configuration file. That can be used by Autoinstallation on Juniper\nnetwork devices. For more information, see https://projects.theforeman.org/issues/3906	f	\N
39	Kickstart default finish	<%#\nkind: finish\nname: Kickstart default finish\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- Rocky\ndescription: |\n  A finish template executed at the end of the image based provisioning\n  using the image without user data. Foreman connects to the VM over SSH\n  and runs the script rendered from this template. It is meant to be run\n  on RPM based distributons.\n\n  This template accepts the following parameters:\n  - bootloader-append: string (default="nofb quiet splash=quiet")\n  - force-puppet: boolean (default=false)\n  - skip-puppet-setup: boolean (default=false)\n  - use-ntp: boolean (default depends on OS release)\n  - ntp-server: string (default=undef)\n  - package_upgrade: boolean (default=true)\n  - salt_master: string (default=undef)\n  - enable-remote-execution-pull: boolean (default=false)\n-%>\n<%\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  os_major = @host.operatingsystem.major.to_i\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  chef_enabled = @host.respond_to?(:chef_proxy) && @host.chef_proxy\n%>\n\n<%= snippet_if_exists(template_name + " custom pre") -%>\n\n<% if @host.provision_method == 'image' && root_pass.present? -%>\n# Install the root password\necho 'root:<%= root_pass -%>' | /usr/sbin/chpasswd -e\n<% end -%>\n\n<%= snippet 'yum_proxy' %>\n\n<%= snippet 'ntp' %>\n\n<% if rhel_compatible && host_param_true?('enable-epel') -%>\n<%= snippet 'epel' -%>\n<% end -%>\n\n<%= snippet 'redhat_register' %>\n\n<% if host_enc['parameters']['realm'] && @host.realm && (@host.realm.realm_type == 'FreeIPA' || @host.realm.realm_type == 'Red Hat Identity Management') -%>\n<%= snippet 'freeipa_register' %>\n<% end -%>\n\n<% unless host_param_false?('package_upgrade') -%>\n# update all the base packages from the updates repository\nif [ -f /usr/bin/dnf ]; then\n  dnf -y update\nelse\n  yum -t -y update\nfi\n<% end -%>\n\n<%= snippet('remote_execution_ssh_keys') %>\n\n<% if plugin_present?('katello') && host_param_true?('enable-remote-execution-pull') -%>\n<%= save_to_file('/root/remote_execution_pull_setup.sh', snippet('remote_execution_pull_setup'), verbatim: true) %>\nchmod +x /root/remote_execution_pull_setup.sh\n/root/remote_execution_pull_setup.sh\n<% end -%>\n\n<%= snippet "blacklist_kernel_modules" %>\n\n<%= snippet_if_exists(template_name + " custom post") -%>\n<% if chef_enabled %>\n<%= snippet 'chef_client' %>\n<% end -%>\n\n<% if puppet_enabled %>\n<% if host_param_true?('enable-puppetlabs-repo') || host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppetlabs-puppet5-repo') -%>\n<%= snippet 'puppetlabs_repo' %>\n<% end -%>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if salt_enabled %>\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n\n<% if host_param_true?('ansible_tower_provisioning') -%>\n<%= save_to_file('/root/ansible_provisioning_call.sh', snippet('ansible_tower_callback_script')) %>\nchmod +x /root/ansible_provisioning_call.sh\n/root/ansible_provisioning_call.sh\n<% end -%>\n\nsync\n\n<%= snippet 'schedule_reboot' -%>\n\nexit 0\n	f	7	2025-01-19 19:42:37.605161	2025-01-19 19:42:37.605161	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	A finish template executed at the end of the image based provisioning\nusing the image without user data. Foreman connects to the VM over SSH\nand runs the script rendered from this template. It is meant to be run\non RPM based distributons.\n\nThis template accepts the following parameters:\n- bootloader-append: string (default="nofb quiet splash=quiet")\n- force-puppet: boolean (default=false)\n- skip-puppet-setup: boolean (default=false)\n- use-ntp: boolean (default depends on OS release)\n- ntp-server: string (default=undef)\n- package_upgrade: boolean (default=true)\n- salt_master: string (default=undef)\n- enable-remote-execution-pull: boolean (default=false)	f	\N
40	Preseed default finish	<%#\nkind: finish\nname: Preseed default finish\nmodel: ProvisioningTemplate\noses:\n- Debian\n- Ubuntu\ntest_on:\n- debian4dhcp\n- ubuntu4dhcp\ndescription: |\n  A finish template executed at the end of a network provisioning done using preseed based\n  installer, typically DEB based distributions. This template renders to a shell script.\n-%>\n<%\n  # safemode renderer does not support unary negation\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  chef_enabled = @host.respond_to?(:chef_proxy) && @host.chef_proxy\n-%>\n<% subnet = @host.subnet -%>\n<% if @static -%>\n  <%- dhcp = false -%>\n<% elsif subnet.nil? -%>\n  <%- dhcp = true -%>\n<% else -%>\n  <%- dhcp = subnet.dhcp_boot_mode? -%>\n<% end -%>\n<%= snippet_if_exists(template_name + " custom pre") -%>\n<% unless dhcp -%>\n# host and domain name need setting as these values may have come from dhcp if pxe booting\n/bin/sed -i "s/^search.*$/search <%= @host.domain %>/g" /etc/resolv.conf\n/bin/sed -i "s/.*dns-search.*/\\tdns-search <%= @host.domain %>/g" /etc/network/interfaces\n/bin/sed -i "s/^<%= @host.ip %>.*/<%= @host.ip %>\\t<%= @host.shortname %>.<%= @host.domain %>\\t<%= @host.shortname %>/g" /etc/hosts\n<% end -%>\n\n<% unless !(@host.operatingsystem.name == "Ubuntu" && @host.operatingsystem.major.to_i > 20 || (@host.operatingsystem.major.to_i == 20 && @host.operatingsystem.minor.to_i >= 3)) || dhcp -%>\n/bin/echo <%= @host.shortname %> > /etc/hostname\n/bin/hostname  <%= @host.shortname %>.<%= @host.domain %>\n<% end -%>\n\n<% if @host.provision_method == 'image' && root_pass.present? -%>\n# Install the root password\necho 'root:<%= root_pass -%>' | /usr/sbin/chpasswd -e\n\n<% end -%>\n<%= snippet_if_exists(template_name + " custom snippet") %>\n<% if host_enc['parameters']['realm'] && @host.realm && @host.realm.realm_type == 'FreeIPA' -%>\n<%= snippet 'freeipa_register' %>\n<% end -%>\n\n<%= snippet('remote_execution_ssh_keys') %>\n\n<%= snippet "blacklist_kernel_modules" %>\n\n<%= snippet_if_exists(template_name + " custom post") -%>\n<% unless host_param('kernel_parameters').nil? -%>\n\n# Allow overriding the default kernel parameters\n  sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=".*"/GRUB_CMDLINE_LINUX_DEFAULT="<%= host_param('kernel_parameters') %>"/g' /etc/default/grub && update-grub\n<% end -%>\n<% if chef_enabled -%>\n\n<%= snippet 'chef_client' %>\n<% end -%>\n<% if puppet_enabled -%>\n\n<% if host_param_true?('enable-puppetlabs-repo') || host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppetlabs-puppet5-repo') -%>\n<%= snippet 'puppetlabs_repo' %>\n<% end -%>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n<% if salt_enabled -%>\n\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n\n<%= snippet 'preseed_networking_setup' -%>\n<%= snippet 'ansible_provisioning_callback' -%>\n<%= snippet 'efibootmgr_netboot' -%>\n<%= snippet 'eject_cdrom' -%>\n<%= snippet 'built' -%>\n<%= snippet 'schedule_reboot' -%>\n	f	7	2025-01-19 19:42:37.614033	2025-01-19 19:42:37.614033	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	A finish template executed at the end of a network provisioning done using preseed based\ninstaller, typically DEB based distributions. This template renders to a shell script.	f	\N
41	Windows default finish	<%#\nkind: finish\nname: Windows default finish\nmodel: ProvisioningTemplate\noses:\n- Windows Server 2008\n- Windows Server 2008 R2\n- Windows Server 2012\n- Windows Server 2012 R2\n- Windows\ntest_on:\n- windows10_dhcp\ndescription: |\n  A finish template executed at the end of Windows provisioning. For more information, please\n  see https://community.theforeman.org/t/windows-provisioning-made-easy/16756\n\n  This template accepts the following parameters:\n  - windowsLicenseKey: ABCDE-ABCDE-ABCDE-ABCDE-ABCDE # Valid Windows license key\n  - windowsLicenseOwner: Company, INC # Legal owner of the Windows license key\n  - localAdminAccountDisabled: false\n  - ntpServer: time.windows.com,other.time.server\n  - domainAdminAccount: joinuser@domain.com # please do not use the domain administrator\n  - domainAdminAccountPasswd: Password for the domain Admin account\n  - computerOU: OU=Computers,CN=domain,CN=com # Place the computer account in specified Organizational Unit\n  - computerDomain: domain.com # domain to join\n  - machinePassword: used for unsecure domain join. needs precrated computer object (New-ADComputer)\n  - foremanDebug: false\n  - skip-puppet-setup: boolean (default=false)\n\n  Information about unsecure domain join\n  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/add-computer?view=powershell-5.1#example-9--add-a-computer-to-a-domain-using-predefined-computer-credentials\n-%>\n<%\n  # safemode renderer does not support unary negation\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master').present?\n  chef_enabled = @host.respond_to?(:chef_proxy) && @host.chef_proxy\n  network_location = host_param('networklocation', 'Private')\n%>\n\n@echo off\n<% unless host_param('localAdminAccountDisabled') -%>\necho Activating administrator\nnet user administrator /active:yes\n<% end -%>\n\n<% if @host.pxe_build? -%>\nset ctr=0\nset nettimeout=10\n<% end -%>\n\n<%= snippet 'windows_network' %>\n\n<% if host_param('ntpServer') -%>\necho Setting time server\nw32tm /config /manualpeerlist:<%= host_param('ntpServer') %> /syncfromflags:manual /update\n<% end -%>\n\necho Syncing time\nw32tm /resync\n\n<% if host_param('computerDomain') -%>\n<% if host_param('domainAdminAccount').present? && host_param('domainAdminAccountPasswd').present? -%>\necho Performing secure domain join\npowershell.exe -OutputFormat text -command Add-Computer -DomainName '<%= host_param('computerDomain') -%>' -Credential (New-Object -TypeName System.Management.Automation.PSCredential '<%= host_param('domainAdminAccount') -%>', (ConvertTo-SecureString -String '<%= host_param('domainAdminAccountPasswd') -%>' -AsPlainText -Force))<% if host_param('computerOU').present? -%> -OUPath '<%= host_param('computerOU') -%>'<% end -%>\n<% else -%>\n<% if host_param('machinePassword').present? -%>\necho Performing unsecure domain join\npowershell.exe -OutputFormat text -command Add-Computer -Domain '<%= host_param('computerDomain') -%>' -Options UnsecuredJoin,PasswordPass -Credential (New-Object -TypeName System.Management.Automation.PSCredential $null, (ConvertTo-SecureString -String '<%= host_param('machinePassword') -%>' -AsPlainText -Force))\n<% end -%>\n<% end -%>\n<% end -%>\n\n<% if host_param('localAdminAccountDisabled') -%>\necho Disabling %tempAdminUser%\nnet user %tempAdminUser% %tempAdminUser% /active:no\n<% end -%>\n\n<% if host_param('http-proxy').present? -%>\ncmd /C "netsh winhttp set proxy <%= host_param('http-proxy') %>:<%= host_param('http-proxy-port') %>"\n<% end -%>\n\n<% unless host_param('computerDomain') -%>\npowershell /c "Get-NetConnectionProfile -InterfaceAlias \\"Ethernet0\\" | Set-NetConnectionProfile -NetworkCategory <%= network_location %>"\n<% end -%>\n\n<% if host_param('ansible_user').present? -%>\n<% if host_param_true?('create_ansible_user') -%>\npowershell /c "set-localuser -name <%= host_param('ansible_user') %> -passwordneverexpires 1"\n<% end -%>\npowershell /c "Enable-PSRemoting"\ncmd /c "netsh advfirewall firewall add rule name="WinRM-HTTP" dir=in localport=5985 protocol=TCP action=allow"\ncmd /c winrm set winrm/config/service @{AllowUnencrypted="true"}\ncmd /c winrm set winrm/config/client/auth @{Basic="true"}\ncmd /c winrm set winrm/config/service/auth @{Basic="true"}\n<% end -%>\n\n<% if host_param('ping') -%>\ncmd /c "netsh advfirewall firewall add rule name=\\"Enable IPv4 ICMP\\" dir=in protocol=icmpv4 action=allow"\n<% end -%>\n\n<% if host_param('remote_desktop') -%>\ncmd /c "netsh advfirewall firewall set rule group=\\"remote desktop\\" new enable=Yes"\ncmd /c "netsh advfirewall firewall set rule group=\\"remotedesktop\\" new enable=Yes"\n<% end -%>\n\n<% if puppet_enabled -%>\necho Downloading Puppet installer\nwget "<%= host_param('win_puppet_source') %>" -O C:\\puppet-agent-latest.msi\necho Installing Puppet\nstart /w "" msiexec /qn /i C:\\puppet-agent-latest.msi PUPPET_AGENT_STARTUP_MODE=Manual PUPPET_SERVER=<%= host_puppet_server -%> PUPPET_CA_SERVER=<%= host_puppet_ca_server -%> PUPPET_AGENT_ACCOUNT_DOMAIN=<%= @host.domain -%> PUPPET_AGENT_ACCOUNT_USER=administrator PUPPET_AGENT_ACCOUNT_PASSWORD="<%= host_param('domainAdminAccountPasswd') -%>"\necho Setting Puppet to auto start\nsc config puppet start= auto\nsc query puppet\n<% end -%>\n\n<% if !host_param_true?('foremanDebug') -%>\necho Rebooting in 60 sec\nshutdown /r /t 60\n\necho Removing wimaging files\nrd /s /q c:\\wimaging\nsdelete.exe -accepteula -p 2 c:\\Windows\\Panther\\unattend.xml\nsdelete.exe -accepteula -p 2 C:\\Windows\\Setup\\Scripts\\SetupComplete.cmd\n\necho Removing leftover directories\nrd /s /q c:\\MININT\nrd /s /q c:\\drivers\nrd /s /q c:\\updates\n\n<% if puppet_enabled -%>\necho Removing Puppet installer\nsdelete.exe -accepteula -p 2 C:\\puppet-agent-latest.msi\n<% end -%>\n\necho Removing deploy directory\nrd /s /q c:\\deploy\n\n<% end -%>\n	f	7	2025-01-19 19:42:37.622804	2025-01-19 19:42:37.622804	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	A finish template executed at the end of Windows provisioning. For more information, please\nsee https://community.theforeman.org/t/windows-provisioning-made-easy/16756\n\nThis template accepts the following parameters:\n- windowsLicenseKey: ABCDE-ABCDE-ABCDE-ABCDE-ABCDE # Valid Windows license key\n- windowsLicenseOwner: Company, INC # Legal owner of the Windows license key\n- localAdminAccountDisabled: false\n- ntpServer: time.windows.com,other.time.server\n- domainAdminAccount: joinuser@domain.com # please do not use the domain administrator\n- domainAdminAccountPasswd: Password for the domain Admin account\n- computerOU: OU=Computers,CN=domain,CN=com # Place the computer account in specified Organizational Unit\n- computerDomain: domain.com # domain to join\n- machinePassword: used for unsecure domain join. needs precrated computer object (New-ADComputer)\n- foremanDebug: false\n- skip-puppet-setup: boolean (default=false)\n\nInformation about unsecure domain join\nhttps://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/add-computer?view=powershell-5.1#example-9--add-a-computer-to-a-domain-using-predefined-computer-credentials	f	\N
42	XenServer default finish	<%#\nkind: finish\nname: XenServer default finish\nmodel: ProvisioningTemplate\noses:\n- XenServer\ndescription: |\n  The finish template executed at the end of XenServer provisioning informing Foreman, that provisioning\n  is complete. It reboots the machine afterwards. Meant for use with XenServer or Citrix Hypervisor\n-%>\n#!/bin/bash\n<%= snippet 'built' %>\n<%= snippet 'schedule_reboot' -%>\n	f	7	2025-01-19 19:42:37.631741	2025-01-19 19:42:37.631741	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The finish template executed at the end of XenServer provisioning informing Foreman, that provisioning\nis complete. It reboots the machine afterwards. Meant for use with XenServer or Citrix Hypervisor	f	\N
43	Linux host_init_config default	<%#\nkind: host_init_config\nname: Linux host_init_config default\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- Rocky\n- SLES\n- Debian\n- Ubuntu\ndescription: |\n  This template is used during the host registration to perform the initial host configuration. After the host\n  is created by starting the registration, the registration script asks for the host init config script, that\n  is rendered based on this template. It is rendered for the specific host therefore it contains instructions\n  specific for the OS of the host. It's content can differ based on any parameters applicable for the host.\n\n  It deploys the CA certificate so any later communication with the Foreman is TLS secured. Then it\n  performs initial steps, such as puppet deployment, remote execution SSH key configuration etc. At the end\n  it informs Foreman that provisioning has finished.\n-%>\n#!/bin/bash\nset -e\n\necho "# Running [<%= @host.name %>] host initial configuration"\n\n<%= snippet_if_exists('host_init_config_pre') -%>\n\nexit_and_cancel_build() {\n  echo 'Host [<%= @host.name %>] initial configuration failed'\n\n  <%= indent(2, skip1: true, skip_content: 'EOF') { snippet('built', :variables => {\n    :endpoint => 'failed',\n    :method => 'POST',\n    :post_data => 'Host initial configuration failed, please see the registration log for more details.' }) }\n  -%>\n  exit 1\n}\n\nset +e\ntrap 'exit_and_cancel_build' ERR\n\n<% if !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet')) -%>\n<%= snippet 'puppetlabs_repo' %>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if host_param_true?('host_registration_remote_execution') -%>\n<%= snippet 'remote_execution_ssh_keys' %>\n<% end -%>\n\n<% if plugin_present?('katello') && host_param_true?('host_registration_remote_execution_pull') -%>\n<%= snippet 'remote_execution_pull_setup' %>\n<% end -%>\n\n<%= install_packages(host_param('host_packages')) -%>\n\n<% if host_param_true?('host_registration_insights') -%>\n<%= snippet 'insights' %>\n\n<% end -%>\n\n<% if plugin_present?('katello') -%>\nif command -v subscription-manager &>/dev/null; then\n  echo "Refreshing subscription data"\n  subscription-manager refresh\nfi\n\n<% if host_param_true?('redhat_install_host_tools') -%>\n<%= install_packages('katello-host-tools') -%>\n<% end -%>\n\n<% if host_param_true?('redhat_install_host_tracer_tools') -%>\n<%= install_packages('katello-host-tools-tracer') -%>\n<% end -%>\n\n<% end -%>\n<%= update_packages if host_param_true?('host_update_packages') -%>\n\n<%= snippet_if_exists('host_init_config_post') -%>\n\n# Call home to exit build mode\n\ntrap - ERR\n<%= snippet 'built' %>\n\nif [[ $? == 0 ]] ; then\n  echo "Host [<%= @host.name %>] successfully configured."\nelse\n  echo "Host [<%= @host.name %>] successfully configured, but failed to set built status."\nfi\n\n<% if plugin_present?('katello') && @host.operatingsystem.family == 'Redhat' -%>\nsubscription-manager facts --update\n<% end -%>\n\nexit 0\n	f	1	2025-01-19 19:42:37.64052	2025-01-19 19:42:37.64052	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used during the host registration to perform the initial host configuration. After the host\nis created by starting the registration, the registration script asks for the host init config script, that\nis rendered based on this template. It is rendered for the specific host therefore it contains instructions\nspecific for the OS of the host. It's content can differ based on any parameters applicable for the host.\n\nIt deploys the CA certificate so any later communication with the Foreman is TLS secured. Then it\nperforms initial steps, such as puppet deployment, remote execution SSH key configuration etc. At the end\nit informs Foreman that provisioning has finished.	f	\N
44	AutoYaST default iPXE	#!gpxe\n<%#\nkind: iPXE\nname: AutoYaST default iPXE\nmodel: ProvisioningTemplate\noses:\n- SLES\n- OpenSUSE\ndescription: |\n  The template to render iPXE installation script for SLES and OpenSUSE\n  The output is deployed on the host's subnet TFTP proxy.\n  See https://ipxe.org/scripting for more details\n-%>\n<%\nextra_args = []\nif host_param('http-proxy') && host_param('http-proxy-port')\n  extra_args << "proxy=http://" + host_param('http-proxy') + ":" + host_param('http-proxy-port')\nelsif host_param('http-proxy')\n  extra_args << "proxy=http://" + host_param('http-proxy')\nend\n-%>\necho Trying to ping Gateway: ${netX/gateway}\nping --count 1 ${netX/gateway} || echo Ping to Gateway failed or ping command not available.\necho Trying to ping DNS: ${netX/dns}\nping --count 1 ${netX/dns} || echo Ping to DNS failed or ping command not available.\n\n<% boot_files_uris = @host.operatingsystem.boot_files_uri(medium_provider) -%>\n<% kernel = boot_files_uris[0] -%>\n<% initrd = boot_files_uris[1] -%>\n\n<% subnet = @host.subnet -%>\n<% if subnet.respond_to?(:dhcp_boot_mode?) && subnet.dhcp_boot_mode? -%>\nkernel <%= kernel %> initrd=initrd.img splash=silent install=<%= medium_uri %> autoyast=<%= foreman_url('provision') %> text-mode=1 useDHCP=1 <%= extra_args.join(' ')%>\n<% else -%>\nkernel <%= kernel %> initrd=initrd.img splash=silent install=<%= medium_uri %> autoyast=<%= foreman_url('provision') %> text-mode=1 useDHCP=0 netsetup=-dhcp ifcfg=*="${netX/ip}/<%= @host.primary_interface.subnet.cidr -%>,${netX/gateway},${dns},<%= @host.domain %>" <%= extra_args.join(' ')%>\n<% end -%>\ninitrd <%= initrd %>\nboot\n	f	5	2025-01-19 19:42:37.649292	2025-01-19 19:42:37.649292	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render iPXE installation script for SLES and OpenSUSE\nThe output is deployed on the host's subnet TFTP proxy.\nSee https://ipxe.org/scripting for more details	f	\N
141	Jumpstart default	<%#\nkind: ptable\nname: Jumpstart default\nmodel: Ptable\noses:\n- Solaris\n%>\nfilesys c0t0d0s0 7000 /\nfilesys c0t0d0s1 1000 swap\nfilesys c0t0d0s3 15 unnamed\nfilesys c0t0d0s7 free /tmp2\n	f	\N	2025-01-19 19:42:38.545439	2025-01-19 19:42:38.545439	t	t	Foreman	Ptable	Solaris	Miscellaneous	\N	\N	\N	\N	f	\N
142	Jumpstart mirrored	<%#\nkind: ptable\nname: Jumpstart mirrored\nmodel: Ptable\noses:\n- Solaris\n%>\nfilesys mirror:d10 c1t0d0s0 c1t1d0s0 16000 /\nfilesys mirror:d20 c1t0d0s1 c1t1d0s1 8000 swap\nfilesys mirror:d40 c1t0d0s4 c1t1d0s4 free /var/tmp\nmetadb c1t0d0s7 size 8192 count 3\nmetadb c1t1d0s7 size 8192 count 3\n	f	\N	2025-01-19 19:42:38.553651	2025-01-19 19:42:38.553651	t	t	Foreman	Ptable	Solaris	Miscellaneous	\N	\N	\N	\N	f	\N
45	iPXE default local boot	<%#\nkind: iPXE\nmodel: ProvisioningTemplate\nname: iPXE default local boot\nsnippet: false\ndescription: |\n  The template to render iPXE bootloader configuration for provisioned hosts,\n  that still boot from the network.\n  Hosts are instructed to boot from the first local medium.\n  Do not associate or change the name.\n-%>\n#!ipxe\n\n# Skips booting from network and continues booting from next device\nexit 1\n	f	5	2025-01-19 19:42:37.657324	2025-01-19 19:42:37.657324	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render iPXE bootloader configuration for provisioned hosts,\nthat still boot from the network.\nHosts are instructed to boot from the first local medium.\nDo not associate or change the name.	f	\N
46	iPXE global default	<%#\nkind: iPXE\nmodel: ProvisioningTemplate\nname: iPXE global default\nsnippet: false\ndescription: |\n  The template to render iPXE bootloader configuration for unknown hosts.\n  The output is used for unknown hosts (typically discovery flow) and it\n  is not deployed to the TFTP proxy (unlike other default templates).\n  Do not associate or change the name.\n-%>\n#!ipxe\n\necho Opening global default menu in 15 seconds...\nsleep 15\n\nset menu-default <%= global_setting("default_pxe_item_global", "local") %>\nset menu-timeout 5000\nset port 8448\n\n:start\nmenu iPXE global boot menu\nitem --key l local     Local boot (next entry)\nitem shell             Drop into iPXE shell\nitem reboot            Reboot system\nitem\nitem --key d discovery Discovery from ${next-server}:8000 (httpboot module)\nitem discovery_custom Discovery from ${next-server}:${port} (httpboot module)\nchoose --timeout ${menu-timeout} --default ${menu-default} selected || goto cancel\nset menu-timeout 0\ngoto ${selected}\n\n:cancel\necho Menu canceled, dropping to shell\n\n:shell\necho Use the command 'exit' to return to menu\nshell\nset menu-timeout 0\ngoto start\n\n:failed\necho Boot failed, dropping to shell\ngoto shell\n\n:reboot\nreboot\n\n:local\nexit 1\n\n:discovery\ndhcp\nkernel http://${next-server}:8000/httpboot/boot/fdi-image/vmlinuz0 initrd=initrd0.img rootflags=loop root=live:/fdi.iso rootfstype=auto ro rd.live.image acpi=force rd.luks=0 rd.md=0 rd.dm=0 rd.lvm=0 rd.bootif=0 rd.neednet=0 nomodeset nokaslr proxy.url=<%= foreman_server_url %> proxy.type=foreman BOOTIF=01-${mac} fdi.initnet=bootif\ninitrd http://${next-server}:8000/httpboot/boot/fdi-image/initrd0.img\nimgstat\nsleep 2\nboot || goto failed\ngoto start\n\n:discovery_custom\ndhcp\nkernel http://${next-server}:${port}/httpboot/boot/fdi-image/vmlinuz0 initrd=initrd0.img rootflags=loop root=live:/fdi.iso rootfstype=auto ro rd.live.image acpi=force rd.luks=0 rd.md=0 rd.dm=0 rd.lvm=0 rd.bootif=0 rd.neednet=0 nomodeset nokaslr proxy.url=<%= foreman_server_url %> proxy.type=foreman BOOTIF=01-${mac} fdi.initnet=bootif\ninitrd http://${next-server}:${port}/httpboot/boot/fdi-image/initrd0.img\nimgstat\nsleep 2\nboot || goto failed\ngoto start\n	f	5	2025-01-19 19:42:37.665407	2025-01-19 19:42:37.665407	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render iPXE bootloader configuration for unknown hosts.\nThe output is used for unknown hosts (typically discovery flow) and it\nis not deployed to the TFTP proxy (unlike other default templates).\nDo not associate or change the name.	f	\N
47	iPXE intermediate script	<%#\nkind: iPXE\nmodel: ProvisioningTemplate\nname: iPXE intermediate script\nsnippet: false\ndescription: |\n  This template is returned when ?bootstrap=1 URL parameter is provided.\n  It is used in pure iPXE environment and it's purpose is to perform another iPXE template call,\n  but with MAC address(es) of the server in order to find appropriate host record in the inventory.\n  See https://docs.theforeman.org/nightly/Provisioning_Guide/index-foreman-el.html#Configuring_Networking-Configuring_gPXE_to_Reduce_Provisioning_Times\n-%>\n#!ipxe\n# Intermediate iPXE script to report MAC address to Foreman\n<% (0..32).each do |i| -%>\n\n:net<%= i %>\nisset ${net<%= i -%>/mac} || goto no_nic\ndhcp net<%= i -%> || goto net<%= i+1 %>\nchain <%= foreman_url('iPXE', {}, { mac: "${net#{i}/mac}" }) %> || goto net<%= i+1 %>\n<% end -%>\n\n:net33\ngoto no_nic\n\nexit 0\n\n:no_nic\necho Failed to chainload from any network interface\nsleep 30\nexit 1\n	f	5	2025-01-19 19:42:37.673483	2025-01-19 19:42:37.673483	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is returned when ?bootstrap=1 URL parameter is provided.\nIt is used in pure iPXE environment and it's purpose is to perform another iPXE template call,\nbut with MAC address(es) of the server in order to find appropriate host record in the inventory.\nSee https://docs.theforeman.org/nightly/Provisioning_Guide/index-foreman-el.html#Configuring_Networking-Configuring_gPXE_to_Reduce_Provisioning_Times	f	\N
48	Kickstart default iPXE	#!gpxe\n<%#\nkind: iPXE\nname: Kickstart default iPXE\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\ndescription: |\n  The template to render iPXE installation script for kickstart based distributions\n  The output is deployed on the host's subnet TFTP proxy.\n  See https://ipxe.org/scripting for more details\ntest_on:\n- host4dhcp\n- host6dhcp\n- host4and6dhcp\n- host4static\n- host6static\n-%>\n\necho Trying to ping Gateway: ${netX/gateway}\nping --count 1 ${netX/gateway} || echo Ping to Gateway failed or ping command not available.\necho Trying to ping DNS: ${netX/dns}\nping --count 1 ${netX/dns} || echo Ping to DNS failed or ping command not available.\n\nkernel <%= "#{@host.url_for_boot(:kernel)}" %> initrd=initrd.img <%= pxe_kernel_options %> <%= snippet("kickstart_kernel_options", variables: {ipxe_net: true}).strip %>\ninitrd <%= "#{@host.url_for_boot(:initrd)}" %>\nimgstat\nsleep 2\nboot\n	f	5	2025-01-19 19:42:37.682139	2025-01-19 19:42:37.682139	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render iPXE installation script for kickstart based distributions\nThe output is deployed on the host's subnet TFTP proxy.\nSee https://ipxe.org/scripting for more details	f	\N
49	Preseed default iPXE	#!gpxe\n<%#\nkind: iPXE\nname: Preseed default iPXE\nmodel: ProvisioningTemplate\noses:\n- Debian\n- Ubuntu\ntest_on:\n- debian4dhcp\n- ubuntu4dhcp\ndescription: |\n  The template to render iPXE installation script for preseed based distributions\n  The output is deployed on the host's subnet TFTP proxy.\n  See https://ipxe.org/scripting for more details\n-%>\n<%\n  iface = @host.provision_interface\n  subnet4 = iface.subnet\n  subnet6 = iface.subnet6\n\n  if subnet4 && !subnet4.dhcp_boot_mode?\n    url = foreman_url('provision', static: '1')\n  elsif subnet6 && !subnet6.dhcp_boot_mode?\n    url = foreman_url('provision', static6: '1')\n  else\n    url = foreman_url('provision')\n  end\n-%>\necho Trying to ping Gateway: ${netX/gateway}\nping --count 1 ${netX/gateway} || echo Ping to Gateway failed or ping command not available.\necho Trying to ping DNS: ${netX/dns}\nping --count 1 ${netX/dns} || echo Ping to DNS failed or ping command not available.\n\n<% boot_files_uris = @host.operatingsystem.boot_files_uri(medium_provider) -%>\n<% kernel = boot_files_uris[0] -%>\n<% initrd = boot_files_uris[1] -%>\n\nkernel <%= kernel %> initrd=initrd.img interface=auto url=<%= url %> ramdisk_size=10800 root=/dev/rd/0 rw auto <%= snippet("preseed_kernel_options", variables: {ipxe_net: true}).strip %>\n\ninitrd <%= initrd %>\n\nimgstat\nsleep 2\nboot\n	f	5	2025-01-19 19:42:37.690786	2025-01-19 19:42:37.690786	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render iPXE installation script for preseed based distributions\nThe output is deployed on the host's subnet TFTP proxy.\nSee https://ipxe.org/scripting for more details	f	\N
50	Preseed default iPXE Autoinstall	#!gpxe\n<%#\nkind: iPXE\nname: Preseed default iPXE Autoinstall\nmodel: ProvisioningTemplate\noses:\n- ubuntu\ntest_on:\n- ubuntu_autoinst4dhcp\n-%>\n#\n# This file was deployed via '<%= template_name %>' template\n#\n# Supported host/hostgroup parameters:\n#\n# blacklist = module1, module2\n#   Blacklisted kernel modules\n#\n# lang = en_US\n#   System locale\n#\n# WARNING\n#\n# Foreman will not download the kernel/initramdisk to PXE automatically. Please follow\n# the official Ubuntu documentation and extract the files from the LiveCD (DVD) manually\n# and optionally update the KERNEL and INITRD lines in this template.\n#\n\n<% boot_files_uris = @host.operatingsystem.boot_files_uri(medium_provider) -%>\n<% kernel = boot_files_uris[0] -%>\n<% initrd = boot_files_uris[1] -%>\n\nkernel <%= kernel %> initrd=initrd root=/dev/rd/0 rw auto <%= snippet('preseed_kernel_options_autoinstall').strip %>\n\ninitrd <%= initrd %>\n\nimgstat\nsleep 2\nboot\n	f	5	2025-01-19 19:42:37.699469	2025-01-19 19:42:37.699469	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	\N	f	\N
143	Junos default fake	<%#\nkind: ptable\nname: Junos default fake\nmodel: Ptable\noses:\n- Junos\n%>\n# Not required for Junos ZTP provisioning.\n	f	\N	2025-01-19 19:42:38.561903	2025-01-19 19:42:38.561903	t	t	Foreman	Ptable	Junos	Miscellaneous	\N	\N	\N	\N	f	\N
51	Windows default iPXE	<%#\nkind: iPXE\nname: Windows default iPXE\nmodel: ProvisioningTemplate\noses:\n- Windows\ndescription: |\n  The template to render iPXE installation script for Windows\n  The output is deployed on the host's subnet TFTP proxy.\n  See https://ipxe.org/scripting for more details\n-%>\n#!ipxe\n\necho Trying to ping Gateway: ${netX/gateway}\nping --count 1 ${netX/gateway} || echo Ping to Gateway failed or ping command not available.\necho Trying to ping DNS: ${netX/dns}\nping --count 1 ${netX/dns} || echo Ping to DNS failed or ping command not available.\n\nset boot-url tftp://<%= foreman_request_addr %>/\nkernel ${boot-url}<%= @host.operatingsystem.bootfile(medium_provider,:kernel) %>\n\ninitrd <%= foreman_url('script') %> peSetup.cmd\n\ninitrd ${boot-url}<%= @host.operatingsystem.bootfile(medium_provider,:bcd) %> BCD\ninitrd ${boot-url}<%= @host.operatingsystem.bootfile(medium_provider,:bootsdi) %> boot.sdi\ninitrd ${boot-url}<%= @host.operatingsystem.bootfile(medium_provider,:bootwim) %> boot.wim\n\nboot\n	f	5	2025-01-19 19:42:37.708095	2025-01-19 19:42:37.708095	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render iPXE installation script for Windows\nThe output is deployed on the host's subnet TFTP proxy.\nSee https://ipxe.org/scripting for more details	f	\N
52	Windows default iPXE httpboot	<%#\nkind: iPXE\nname: Windows default iPXE httpboot\nmodel: ProvisioningTemplate\noses:\n- Windows\ndescription: |\n  The template to render iPXE installation script for Windows\n  The output is deployed on the host's subnet TFTP proxy.\n  See https://ipxe.org/scripting for more details\n-%>\n#!ipxe\n\nset boot-url http://<%= foreman_request_addr %>/httpboot/\nkernel ${boot-url}<%= @host.operatingsystem.bootfile(medium_provider,:kernel) %>\n\ninitrd <%= foreman_url('script') %> peSetup.cmd\n\ninitrd ${boot-url}<%= @host.operatingsystem.bootfile(medium_provider,:bcd) %> BCD\ninitrd ${boot-url}<%= @host.operatingsystem.bootfile(medium_provider,:bootsdi) %> boot.sdi\ninitrd ${boot-url}<%= @host.operatingsystem.bootfile(medium_provider,:bootwim) %> boot.wim\n\nboot\n	f	5	2025-01-19 19:42:37.716719	2025-01-19 19:42:37.716719	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The template to render iPXE installation script for Windows\nThe output is deployed on the host's subnet TFTP proxy.\nSee https://ipxe.org/scripting for more details	f	\N
53	Alterator default	<%#\nkind: provision\nname: Alterator default\nmodel: ProvisioningTemplate\noses:\n- ALTLinux p6\n- ALTLinux p7\ndescription: |\n  Provisioning template for the ALTLinux installer\n  see https://projects.theforeman.org/issues/3377 for more details\n-%>\n<% if @metadata.to_s == '/vm-profile.scm' -%>\n<%= @host.diskLayout %>\n<% elsif @metadata.to_s == '/pkg-groups.tar' -%>\n<%= snippet 'alterator_pkglist' %>\n<% else -%>\n("/sysconfig-base/language" action "write" lang ("<%= host_param('lang') || 'en_US' %>"))\n("/sysconfig-base/kbd" action "write" layout "ctrl_shift_toggle")\n("/datetime-installer" action "write" commit #t name "RU" zone "Europe/Moscow" utc #t)\n("/evms/control" action "write" control open installer #t)\n("/evms/control" action "write" control update)\n("/evms/profiles/server" action apply commit #f clearall #t exclude ())\n("/evms/control" action "write" control commit)\n("/evms/control" action "write" control close)\n("/pkg-init" action "write")\n("/pkg-install" action "write" lists "<%= host_param('pkg_list') || '' %>" auto #t)\n("/preinstall" action "write")\n("/grub" action "write" language ("<%= host_param('lang') || 'en_US' %>") device "<%= host_param('device') || '/dev/sda' %>")\n("/net-eth" action "write" reset #t)\n("/net-eth" action "write" name "eth0" configuration "static" default "<%= @host.subnet.gateway %>" search "<%= @host.domain %>" dns "<%= @host.subnet.dns_servers.join(" ") %>" computer_name "<%= @host.name %>")\n("/net-eth" action "add_iface_address" name "eth0" addip "<%= @host.ip %>" addmask "<%= @host.subnet.mask %>")\n("/net-eth" action "write" commit #t)\n("/root/change_password" language (<%= host_param('lang') || 'en_US' %>") passwd_2 "123" passwd_1 "123")\n("/postinstall/firsttime" action "write" method "url" url "<%= foreman_url('finish') %>")\n<% end %>\n	f	6	2025-01-19 19:42:37.725296	2025-01-19 19:42:37.725296	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Provisioning template for the ALTLinux installer\nsee https://projects.theforeman.org/issues/3377 for more details	f	\N
54	AutoYaST default	<%#\nkind: provision\nname: AutoYaST default\nmodel: ProvisioningTemplate\noses:\n- OpenSUSE\ndescription: |\n  Provisioning template for the OpenSUSE AutoYaST installer.\n-%>\n<%\n  # safemode renderer does not support unary negation\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  os_major = @host.operatingsystem.major.to_i\n  primary_interface_identifier = @host.primary_interface.identifier.blank? ? 'eth0' : @host.primary_interface.identifier\n  primary_interface_subnet = @host.primary_interface.subnet\n-%>\n<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE profile>\n<profile xmlns="http://www.suse.com/1.0/yast2ns" xmlns:config="http://www.suse.com/1.0/configns">\n  <general>\n    <mode>\n      <confirm config:type="boolean">false</confirm>\n      <final_reboot config:type="boolean">true</final_reboot>\n    </mode>\n  </general>\n  <networking>\n    <dns>\n      <hostname><%= @host.name %></hostname>\n<% unless primary_interface_subnet.dhcp_boot_mode? -%>\n      <dhcp_hostname config:type="boolean">false</dhcp_hostname>\n      <dhcp_resolv config:type="boolean">false</dhcp_resolv>\n<% if @host.domain -%>\n      <domain><%= @host.domain -%></domain>\n<% end -%>\n<% unless primary_interface_subnet.dns_servers.empty? -%>\n      <nameservers config:type="list">\n<% primary_interface_subnet.dns_servers.each do |nameserver| -%>\n        <nameserver><%= nameserver %></nameserver>\n<% end -%>\n      </nameservers>\n<% end -%>\n<% else -%>\n      <resolv_conf_policy>auto</resolv_conf_policy>\n<% end -%>\n<% if @host.domain -%>\n      <searchlist config:type="list">\n        <search><%= @host.domain %></search>\n      </searchlist>\n<% end -%>\n    </dns>\n    <interfaces config:type="list">\n<%\n  @host.managed_interfaces.each do |interface|\n    next if !interface.managed? || interface.subnet.nil? || interface.ip.nil?\n    dhcp = interface.subnet.dhcp_boot_mode?\n-%>\n<% if dhcp -%>\n      <interface>\n        <bootproto>dhcp</bootproto>\n<% if os_major >= 15 and os_minor >= 5 -%>\n        <name><%= interface.primary ? primary_interface_identifier : interface.identifier -%></name>\n<% else -%>\n        <device><%= interface.primary ? primary_interface_identifier : interface.identifier -%></device>\n        <usercontrol>no</usercontrol>\n<% end -%>\n        <startmode>auto</startmode>\n      </interface>\n<% else -%>\n      <interface>\n        <bootproto>static</bootproto>\n<% if os_major >= 15 and os_minor >= 5 -%>\n        <name><%= interface.primary ? primary_interface_identifier : interface.identifier -%></name>\n        <ipaddr><%= interface.ip -%>/<%= interface.subnet.cidr -%></ipaddr>\n<% else -%>\n        <device><%= interface.primary ? primary_interface_identifier : interface.identifier -%></device>\n        <ipaddr><%= interface.ip -%></ipaddr>\n        <netmask><%= interface.subnet.mask -%></netmask>\n        <usercontrol>no</usercontrol>\n<% end -%>\n        <startmode>auto</startmode>\n      </interface>\n<% end -%>\n<% end -%>\n    </interfaces>\n<% unless primary_interface_subnet.dhcp_boot_mode? -%>\n    <routing>\n      <routes config:type="list">\n        <route>\n          <destination>default</destination>\n          <device><%= primary_interface_identifier -%></device>\n          <gateway><%= primary_interface_subnet.gateway -%></gateway>\n          <netmask><%= primary_interface_subnet.mask -%></netmask>\n        </route>\n      </routes>\n    </routing>\n<% end -%>\n  </networking>\n  <%# NTP client configuration has incompatible changes in Leap 15 -%>\n  <% if os_major <= 12 || os_major == 42 -%>\n  <ntp-client>\n    <configure_dhcp config:type="boolean">false</configure_dhcp>\n    <peers config:type="list">\n      <peer>\n        <address><%= host_param('ntp-server') || '0.opensuse.pool.ntp.org' %></address>\n        <initial_sync config:type="boolean">true</initial_sync>\n        <options></options>\n        <type>server</type>\n      </peer>\n    </peers>\n    <start_at_boot config:type="boolean">true</start_at_boot>\n    <start_in_chroot config:type="boolean">true</start_in_chroot>\n  </ntp-client>\n<% else -%>\n  <ntp-client>\n   <ntp_policy>auto</ntp_policy>\n   <ntp_servers config:type="list">\n    <ntp_server>\n     <iburst config:type="boolean">false</iburst>\n     <address><%= host_param('ntp-server') || '0.opensuse.pool.ntp.org' %></address>\n     <offline config:type="boolean">true</offline>\n    </ntp_server>\n   </ntp_servers>\n   <ntp_sync>systemd</ntp_sync>\n   </ntp-client>\n<% end -%>\n<% if ! @dynamic -%>\n  <%= @host.diskLayout %>\n<% end -%>\n  <runlevel>\n    <default>3</default>\n    <services config:type="list">\n      <service>\n        <service_name>sshd</service_name>\n        <service_status>enable</service_status>\n      </service>\n    </services>\n  </runlevel>\n  <software>\n    <base>default</base>\n    <patterns config:type="list">\n      <pattern>base</pattern>\n      <pattern>enhanced_base</pattern>\n      <pattern>sw_management</pattern>\n      <pattern>yast2_basis</pattern>\n    </patterns>\n    <packages config:type="list">\n      <package>lsb-release</package>\n<% if puppet_enabled -%>\n      <package>rubygem-puppet</package>\n<% end -%>\n<% if host_param('additional-packages').present? -%>\n      <%= host_param('additional-packages').split(" ").collect{|x| "<package>#{x}</package>" }.join("\\n") %>\n<% end -%>\n    </packages>\n  </software>\n  <users config:type="list">\n    <user>\n      <username>root</username>\n      <encrypted config:type="boolean">true</encrypted>\n      <fullname>root</fullname>\n      <gid>0</gid>\n      <home>/root</home>\n      <shell>/bin/bash</shell>\n      <uid>0</uid>\n      <user_password><%= root_pass %></user_password>\n    </user>\n  </users>\n  <scripts>\n<% if @dynamic -%>\n    <pre-scripts config:type="list">\n      <script>\n        <debug config:type="boolean">true</debug>\n        <filename>pre_disklayout</filename>\n        <interpreter>shell</interpreter>\n        <source><![CDATA[\n<%= @host.diskLayout %>\n]]>\n        </source>\n      </script>\n    </pre-scripts>\n<% end -%>\n    <chroot-scripts config:type="list">\n      <script>\n        <filename>cp-resolv.sh</filename>\n        <chrooted config:type="boolean">false</chrooted>\n        <interpreter>shell</interpreter>\n        <notification>Copying resolv.conf into chroot ...</notification>\n        <source><![CDATA[\ncp /etc/resolv.conf /mnt/etc\n]]>\n        </source>\n      </script>\n      <script>\n        <filename>foreman.sh</filename>\n        <chrooted config:type="boolean">true</chrooted>\n        <interpreter>shell</interpreter>\n        <notification>Setting up Puppet / Foreman ...</notification>\n        <source><![CDATA[\n/bin/hostname <%= @host.name %>\n\n<%= snippet_if_exists(template_name + " custom pre") -%>\n\n<%= snippet('remote_execution_ssh_keys') %>\n\n<%= snippet "blacklist_kernel_modules" %>\n\n<% if puppet_enabled -%>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if salt_enabled %>\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n\n<%= snippet_if_exists(template_name + " custom post") -%>\n\n<%= snippet 'eject_cdrom' -%>\n<%= snippet 'built' -%>\n\nrm /etc/resolv.conf\n]]>\n        </source>\n      </script>\n    </chroot-scripts>\n  </scripts>\n  <keyboard>\n    <keymap>english-us</keymap>\n  </keyboard>\n  <timezone>\n    <hwclock>UTC</hwclock>\n    <timezone><%= host_param('time-zone') || 'Etc/UTC' %></timezone>\n  </timezone>\n</profile>\n	f	6	2025-01-19 19:42:37.733802	2025-01-19 19:42:37.733802	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Provisioning template for the OpenSUSE AutoYaST installer.	f	\N
55	AutoYaST SLES default	<%#\nkind: provision\nname: AutoYaST SLES default\nmodel: ProvisioningTemplate\noses:\n- SLES\ndescription: |\n  Provisioning template for the SLES AutoYaST installer.\n-%>\n<%\n  os_major = @host.operatingsystem.major.to_i\n  os_minor = @host.operatingsystem.minor.to_i\n  # safemode renderer does not support unary negation\n  aio_enabled = host_param_true?('enable-puppetlabs-puppet5-repo') || host_param_true?('enable-puppet5')\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  sles_minor_string = (os_minor == 0) ? '' : "_SP#{os_minor}"\n  spacewalk_enabled = host_param('spacewalk_host') ? true : false\n\n  primary_interface_identifier = @host.primary_interface.identifier.blank? ? 'eth0' : @host.primary_interface.identifier\n  primary_interface_subnet = @host.primary_interface.subnet\n-%>\n<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE profile>\n<profile xmlns="http://www.suse.com/1.0/yast2ns" xmlns:config="http://www.suse.com/1.0/configns">\n  <general>\n    <mode>\n      <confirm config:type="boolean">false</confirm>\n      <final_reboot config:type="boolean">true</final_reboot>\n    </mode>\n  </general>\n  <networking>\n    <dns>\n      <hostname><%= @host.name %></hostname>\n<% unless primary_interface_subnet.dhcp_boot_mode? -%>\n      <dhcp_hostname config:type="boolean">false</dhcp_hostname>\n<% if os_major < 12 -%>\n      <dhcp_resolv config:type="boolean">false</dhcp_resolv>\n<% end -%>\n<% if @host.domain -%>\n      <domain><%= @host.domain -%></domain>\n<% end -%>\n<% unless primary_interface_subnet.dns_servers.empty? -%>\n      <nameservers config:type="list">\n<% primary_interface_subnet.dns_servers.each do |nameserver| -%>\n        <nameserver><%= nameserver %></nameserver>\n<% end -%>\n      </nameservers>\n<% end -%>\n<% else -%>\n      <resolv_conf_policy>auto</resolv_conf_policy>\n<% end -%>\n<% if @host.domain -%>\n      <searchlist config:type="list">\n        <search><%= @host.domain %></search>\n      </searchlist>\n<% end -%>\n    </dns>\n    <interfaces config:type="list">\n<%\n  @host.managed_interfaces.each do |interface|\n    next if !interface.managed? || interface.subnet.nil? || interface.ip.nil?\n    dhcp = interface.subnet.dhcp_boot_mode?\n-%>\n<% if dhcp -%>\n      <interface>\n        <bootproto>dhcp</bootproto>\n<% if os_major >= 15 and os_minor >= 5 -%>\n        <name><%= interface.primary ? primary_interface_identifier : interface.identifier -%></name>\n<% else -%>\n        <device><%= interface.primary ? primary_interface_identifier : interface.identifier -%></device>\n        <usercontrol>no</usercontrol>\n<% end -%>\n        <startmode>auto</startmode>\n      </interface>\n<% else -%>\n      <interface>\n        <bootproto>static</bootproto>\n<% if os_major >= 15 and os_minor >= 5 -%>\n        <name><%= interface.primary ? primary_interface_identifier : interface.identifier -%></name>\n        <ipaddr><%= interface.ip -%>/<%= interface.subnet.cidr -%></ipaddr>\n<% else -%>\n        <device><%= interface.primary ? primary_interface_identifier : interface.identifier -%></device>\n        <ipaddr><%= interface.ip -%></ipaddr>\n        <netmask><%= interface.subnet.mask -%></netmask>\n        <usercontrol>no</usercontrol>\n<% end -%>\n        <startmode>auto</startmode>\n      </interface>\n<% end -%>\n<% end -%>\n    </interfaces>\n<% unless primary_interface_subnet.dhcp_boot_mode? -%>\n    <routing>\n      <routes config:type="list">\n        <route>\n          <destination>default</destination>\n          <device><%= primary_interface_identifier -%></device>\n          <gateway><%= primary_interface_subnet.gateway -%></gateway>\n          <netmask><%= primary_interface_subnet.mask -%></netmask>\n        </route>\n      </routes>\n    </routing>\n<% end -%>\n  </networking>\n<% if os_major >= 15 -%>\n  <ntp-client>\n    <ntp_policy>auto</ntp_policy>\n    <ntp_servers config:type="list">\n      <ntp_server>\n        <address><%= host_param('ntp-server') || '0.opensuse.pool.ntp.org' %></address>\n        <iburst config:type="boolean">false</iburst>\n        <offline config:type="boolean">true</offline>\n      </ntp_server>\n    </ntp_servers>\n    <ntp_sync>15</ntp_sync>\n  </ntp-client>\n<% else -%>\n  <ntp-client>\n    <configure_dhcp config:type="boolean">false</configure_dhcp>\n    <peers config:type="list">\n      <peer>\n        <address><%= host_param('ntp-server') || '0.opensuse.pool.ntp.org' %></address>\n        <initial_sync config:type="boolean">true</initial_sync>\n        <options></options>\n        <type>server</type>\n      </peer>\n    </peers>\n    <start_at_boot config:type="boolean">true</start_at_boot>\n    <start_in_chroot config:type="boolean">true</start_in_chroot>\n  </ntp-client>\n<% end -%>\n<% if ! @dynamic -%>\n  <%= @host.diskLayout %>\n<% end -%>\n<% if os_major >= 15 -%>\n  <services-manager>\n  <default_target>multi-user</default_target>\n  <services>\n    <enable config:type="list">\n      <service>sshd</service>\n    </enable>\n  </services>\n  </services-manager>\n<% else -%>\n  <runlevel>\n    <default>3</default>\n    <services config:type="list">\n      <service>\n        <service_name>sshd</service_name>\n        <service_status>enable</service_status>\n      </service>\n    </services>\n  </runlevel>\n<% end -%>\n  <software>\n<% if os_major >= 15 -%>\n    <products config:type="list">\n      <product>SLES</product>\n    </products>\n    <patterns config:type="list">\n      <pattern>enhanced_base</pattern>\n    </patterns>\n<% else -%>\n    <patterns config:type="list">\n      <pattern>Minimal</pattern>\n    </patterns>\n<% end -%>\n    <packages config:type="list">\n      <package>lsb-release</package>\n      <package>openssh</package>\n<% if puppet_enabled -%>\n<% if aio_enabled -%>\n      <package>puppet-agent</package>\n<% else -%>\n      <package>rubygem-puppet</package>\n<% end -%>\n<% end -%>\n<% if spacewalk_enabled -%>\n      <package>rhn-setup</package>\n<% end -%>\n<% if host_param('additional-packages').present? -%>\n      <%= host_param('additional-packages').split(" ").collect{|x| "<package>#{x}</package>" }.join("\\n") %>\n<% end -%>\n    </packages>\n  </software>\n  <users config:type="list">\n    <user>\n      <username>root</username>\n      <encrypted config:type="boolean">true</encrypted>\n      <fullname>root</fullname>\n      <gid>0</gid>\n      <home>/root</home>\n      <shell>/bin/bash</shell>\n      <uid>0</uid>\n      <user_password><%= root_pass %></user_password>\n    </user>\n  </users>\n  <scripts>\n<% if @dynamic -%>\n    <pre-scripts config:type="list">\n      <script>\n        <debug config:type="boolean">true</debug>\n        <filename>pre_disklayout</filename>\n        <interpreter>shell</interpreter>\n        <source><![CDATA[\n<%= @host.diskLayout %>\n]]>\n        </source>\n      </script>\n    </pre-scripts>\n<% end -%>\n    <chroot-scripts config:type="list">\n      <script>\n        <filename>cp-resolv.sh</filename>\n        <chrooted config:type="boolean">false</chrooted>\n        <interpreter>shell</interpreter>\n        <notification>Copying resolv.conf into chroot ...</notification>\n        <source><![CDATA[\ncp /etc/resolv.conf /mnt/etc\n]]>\n        </source>\n      </script>\n      <script>\n        <filename>foreman.sh</filename>\n        <chrooted config:type="boolean">true</chrooted>\n        <interpreter>shell</interpreter>\n        <notification>Setting up Puppet / Foreman ...</notification>\n        <source><![CDATA[\n/bin/hostname <%= @host.name %>\n\n<%= snippet_if_exists(template_name + " custom pre") -%>\n\n<%= snippet('remote_execution_ssh_keys') %>\n\n<%= snippet "blacklist_kernel_modules" %>\n\n<% if spacewalk_enabled -%>\n<%= snippet 'redhat_register' %>\n<% end -%>\n\n<% if puppet_enabled -%>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if salt_enabled %>\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n\n<%= snippet_if_exists(template_name + " custom post") -%>\n\n<%= snippet 'eject_cdrom' -%>\n<%= snippet 'built' -%>\n\nrm /etc/resolv.conf\n]]>\n        </source>\n      </script>\n    </chroot-scripts>\n  </scripts>\n<% if os_major >= 15 -%>\n  <firewall>\n    <enable_firewall config:type="boolean">true</enable_firewall>\n    <log_denied_packets>off</log_denied_packets>\n    <default_zone>public</default_zone>\n    <zones config:type="list">\n      <zone>\n        <name>public</name>\n        <services config:type="list">\n          <service>ssh</service>\n          <service>dhcpv6-client</service>\n        </services>\n      </zone>\n    </zones>\n  </firewall>\n<% end -%>\n  <keyboard>\n    <keymap>english-us</keymap>\n  </keyboard>\n  <timezone>\n    <hwclock>UTC</hwclock>\n    <timezone><%= host_param('time-zone') || 'Etc/UTC' %></timezone>\n  </timezone>\n  <add-on>\n    <add_on_products config:type="list">\n<% if os_major >= 15 && host_param('sle-module-basesystem-url') -%>\n      <listentry>\n        <media_url><%= host_param('sle-module-basesystem-url') %></media_url>\n        <product_dir>/Module-Basesystem</product_dir>\n        <product>sle-module-basesystem</product>\n      </listentry>\n  <% if os_minor >= 1 && os_minor < 4 && host_param('sle-module-basesystem-url') -%>\n      <listentry>\n        <media_url><%= host_param('sle-module-basesystem-url') %></media_url>\n        <product_dir>/Module-Python2</product_dir>\n        <product>sle-module-python2</product>\n      </listentry>\n  <% end -%>\n<% end -%>\n<% if puppet_enabled -%>\n<% if host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppetlabs-puppet5-repo') -%>\n<%\n  puppet_repo_url_base = 'http://yum.puppet.com'\n  if host_param_true?('enable-official-puppet8-repo')\n    puppet_repo_url = "#{puppet_repo_url_base}/puppet7/sles/#{os_major}/#{@host.architecture}/"\n  elsif host_param_true?('enable-official-puppet7-repo')\n    puppet_repo_url = "#{puppet_repo_url_base}/puppet7/sles/#{os_major}/#{@host.architecture}/"\n  elsif host_param_true?('enable-puppetlabs-puppet6-repo')\n    puppet_repo_url = "#{puppet_repo_url_base}/puppet6/sles/#{os_major}/#{@host.architecture}/"\n  elsif host_param_true?('enable-puppetlabs-puppet5-repo')\n    puppet_repo_url = "#{puppet_repo_url_base}/puppet5/sles/#{os_major}/#{@host.architecture}/"\n  end\n%>\n    <listentry>\n        <media_url><![CDATA[<%= puppet_repo_url %>]]></media_url>\n        <name>puppet</name>\n        <product>puppet</product>\n        <product_dir>/</product_dir>\n        <signature-handling>\n          <accept_non_trusted_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>7F438280EF8D349F</keyid>\n            </keys>\n          </accept_non_trusted_gpg_key>\n          <import_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>7F438280EF8D349F</keyid>\n            </keys>\n          </import_gpg_key>\n        </signature-handling>\n      </listentry>\n<% else -%>\n      <listentry>\n        <media_url><![CDATA[http://download.opensuse.org/repositories/systemsmanagement:/puppet/SLE_<%= os_major %><%= sles_minor_string %>/]]></media_url>\n        <name>systemsmanagement_puppet</name>\n        <product>systemsmanagement_puppet</product>\n        <product_dir>/</product_dir>\n        <signature-handling>\n          <accept_non_trusted_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>2ABFA143A0E46E11</keyid>\n            </keys>\n          </accept_non_trusted_gpg_key>\n          <import_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>2ABFA143A0E46E11</keyid>\n            </keys>\n          </import_gpg_key>\n        </signature-handling>\n      </listentry>\n<% if os_major < 12 -%>\n      <listentry>\n        <media_url><![CDATA[http://download.opensuse.org/repositories/devel:languages:ruby:backports/SLE_<%= os_major %><%= sles_minor_string %>/]]></media_url>\n        <name>devel_languages_ruby_backports</name>\n        <product>devel_languages_ruby_backports</product>\n        <product_dir>/</product_dir>\n        <signature-handling>\n          <accept_non_trusted_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>9AF0C9A20E9AF123</keyid>\n            </keys>\n          </accept_non_trusted_gpg_key>\n          <import_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>9AF0C9A20E9AF123</keyid>\n            </keys>\n          </import_gpg_key>\n        </signature-handling>\n      </listentry>\n      <listentry>\n<!-- you have to update the next line with the actual URL of your SDK -->\n        <media_url>http://<your_server_here>/iso/suse/SDK/<%= os_major %>.<%= os_minor %>/<%= @host.architecture %>/</media_url>\n        <product>SuSE-Linux-SDK</product>\n        <product_dir>/</product_dir>\n        <name>SuSE-Linux-SDK</name>\n      </listentry>\n<% end -%>\n<% end -%>\n<% end -%>\n<% if salt_enabled -%>\n      <listentry>\n        <media_url><![CDATA[http://download.opensuse.org/repositories/devel:languages:python/SLE_<%= os_major %><%= sles_minor_string %>/]]></media_url>\n        <name>devel_languages_python</name>\n        <product>devel_languages_python</product>\n        <product_dir>/</product_dir>\n        <signature-handling>\n          <accept_non_trusted_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>27163A4EEDF0D733</keyid>\n            </keys>\n          </accept_non_trusted_gpg_key>\n          <import_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>27163A4EEDF0D733</keyid>\n            </keys>\n          </import_gpg_key>\n        </signature-handling>\n      </listentry>\n<% end -%>\n<% if spacewalk_enabled -%>\n      <listentry>\n        <media_url><![CDATA[http://download.opensuse.org/repositories/systemsmanagement:/spacewalk/SLE_<%= os_major %><%= sles_minor_string %>/]]></media_url>\n        <name>systemsmanagement_spacewalk</name>\n        <product>systemsmanagement_spacewalk</product>\n        <product_dir>/</product_dir>\n        <signature-handling>\n          <accept_non_trusted_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>2ABFA143A0E46E11</keyid>\n            </keys>\n          </accept_non_trusted_gpg_key>\n          <import_gpg_key>\n            <all config:type="boolean">false</all>\n            <keys config:type="list">\n              <keyid>2ABFA143A0E46E11</keyid>\n            </keys>\n          </import_gpg_key>\n        </signature-handling>\n      </listentry>\n<% end -%>\n    </add_on_products>\n  </add-on>\n</profile>\n	f	6	2025-01-19 19:42:37.742557	2025-01-19 19:42:37.742557	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Provisioning template for the SLES AutoYaST installer.	f	\N
56	CoreOS provision	<%#\nkind: provision\nname: CoreOS provision\nmodel: ProvisioningTemplate\noses:\n- CoreOS\n- RedHatCoreOS\n- FedoraCoreOS\n- Flatcar\ndescription: |\n  Provisioning template for the CoreOS Container Linux distribution.\n  This does not work for Fedora CoreOS or Flatcar Container Linux, which use Ignition instead.\n-%>\n<%- if host_param('ignition_template') -%>\n<%= host_param('ignition_template') %>\n<%- else -%>\n<%-\n    if @host.operatingsystem.name.downcase.include?("flatcar")\n      installer_cmd = "flatcar-install"\n    else\n      installer_cmd = "coreos-install"\n    end\n    config = <<EOS\n---\npasswd:\n  #{indent(2) { snippet_if_exists('CoreOS provision custom passwd') }}\n  users:\n    - name: core\n      passwd: #{root_pass}\n      ssh_authorized_keys: #{@host.ssh_authorized_keys}\nsystemd:\n  #{indent(2) { snippet_if_exists('CoreOS provision custom systemd') }}\n  units:\n    - name: os-install.service\n      enabled: true\n      contents: |\n        [Unit]\n        Description=Install to disk\n        Requires=network-online.target\n        After=network-online.target\n        [Service]\n        Type=oneshot\n        ExecStart=/usr/bin/#{installer_cmd} -v \\\n          -C #{@host.operatingsystem.release_name} \\\n          -d #{@host.params['install-disk'] || '/dev/sda'} \\\n          -i /home/core/ignition.json -b #{@mediapath} \\\n          #{@host.provider == 'VMware' ? '-o vmware_raw ' : ''} \\\n          -V #{@host.operatingsystem.release}\n        ExecStartPost=/home/core/post_install\n        [Install]\n        WantedBy=multi-user.target\nstorage:\n  #{indent(2) { snippet_if_exists('CoreOS provision custom storage') }}\n  files:\n    - filesystem: 'root'\n      path: '/home/core/post_install'\n      mode: 775\n      contents:\n        inline: |\n          #{indent(10) { snippet_if_exists('CoreOS provision post') }}\n#{snippet_if_exists('CoreOS provision custom')}\nEOS\n-%>\n<%= transpile_coreos_linux_config(config) %>\n<%- end -%>\n	f	6	2025-01-19 19:42:37.751594	2025-01-19 19:42:37.751594	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Provisioning template for the CoreOS Container Linux distribution.\nThis does not work for Fedora CoreOS or Flatcar Container Linux, which use Ignition instead.	f	\N
57	FreeBSD (mfsBSD) provision	<%#\nkind: provision\nname: FreeBSD (mfsBSD) provision\nmodel: ProvisioningTemplate\noses:\n- FreeBSD\ndescription: |\n  Provisioning template for the FreeBSD.\n  It prepares the environment and deploys and runs the Finish template.\n  See FreeBSD (mfsbsd) finish template for more details.\n-%>\n<%\nproxy_string = host_param('http-proxy') ? "http://#{host_param('http-proxy')}:#{host_param('http-proxy-port')}" : ''\n%>\n<% unless proxy_string == '' -%>\nexport http_proxy='<%= proxy_string %>'\n<% end -%>\n\n# Get the disk layout, and the first disk connected to the system\ndisk_layout=`/sbin/sysctl -n kern.disks | /usr/bin/sed 's/cd[0-9]//g'`\nfirst_disk="`echo ${disk_layout##*[1-9]} | /usr/bin/cut -d' ' -f1`"\ntest -z "$first_disk" || echo "First disk: $first_disk"\n\n/root/bin/destroygeom -d <%= host_param('install-disk') || '$first_disk' %> || exit 1\n/root/bin/zfsinstall -d <%= host_param('install-disk') || '$first_disk' %> -s 2G -u <%= @mediapath %> || exit 1\n\ncp /etc/resolv.conf /mnt/etc/resolv.conf\nmount -t devfs devfs /mnt/dev\nfetch -q --no-verify-hostname --no-verify-peer -o /mnt/tmp/finish.sh -d <%= foreman_url('finish') %>\nchroot /mnt /bin/sh /tmp/finish.sh\nrm /mnt/tmp/finish.sh\n\nfetch -q --no-verify-hostname --no-verify-peer -o /dev/null -d <%= foreman_url('built') %>\nsleep 5\nreboot\n	f	6	2025-01-19 19:42:37.76011	2025-01-19 19:42:37.76011	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Provisioning template for the FreeBSD.\nIt prepares the environment and deploys and runs the Finish template.\nSee FreeBSD (mfsbsd) finish template for more details.	f	\N
58	Jumpstart default	<%#\nkind: provision\nname: Jumpstart default\nmodel: ProvisioningTemplate\noses:\n- Solaris\ndescription: |\n  Provisioning template for the Solaris installer\n-%>\ninstall_type <%= @install_type %>\npartitioning explicit\n<%= @disk %>\n<% if @host.use_image  -%>\narchive_location nfs <%=@archive_location%>\n<% else -%>\nsystem_type <%= @system_type %>\npackage <%= @packages %> add\ncluster <%= @cluster %>\n<% end -%>\n	f	6	2025-01-19 19:42:37.768685	2025-01-19 19:42:37.768685	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Provisioning template for the Solaris installer	f	\N
59	Junos default SLAX	<%#\nkind: provision\nname: Junos default SLAX\nmodel: ProvisioningTemplate\noses:\n- Junos\ndescription: |\n  Provisioning template for the Junos OS, used on Juniper network devices.\n  It fetches the config file based on the Juniper Finish template and deploys\n  it if it differs from the current version.\n-%>\nversion 1.0;\n\n/* ------------------------------------------------------------------\n * LICENSE\n * ------------------------------------------------------------------\n *\n * Copyright (c) 2013, Juniper Networks\n *\n * All rights reserved.\n *\n * Redistribution and use in source and binary forms, with or without\n * modification, are permitted provided that the following conditions are met: \n *\n * (1) Redistributions of source code must retain the above copyright notice, this \n * list of conditions and the following disclaimer. \n *\n * (2) Redistributions in binary form must reproduce the above copyright notice,\n * this list of conditions and the following disclaimer in the documentation\n * and/or other materials provided with the distribution. \n *\n * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND\n * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED\n * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE\n * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR\n * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES\n * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;\n * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND\n * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT\n * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS\n * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\n *\n * The views and conclusions contained in the software and documentation are those\n * of the authors and should not be interpreted as representing official policies, \n * either expressed or implied, of Juniper Networks.\n * \n *\n * ------------------------------------------------------------------\n * AUTHORS AND CONTRIBUTORS\n * ------------------------------------------------------------------\n *\n * Jeremy Schulman, Juniper Networks\n * - initial release (https://github.com/jeremyschulman/jctyztp/)\n *\n * Frank Wall, noris network AG\n * - adapt for integration in The Foreman\n * - fix compatibility with older Junos releases\n * \n *\n * ------------------------------------------------------------------\n * LIMITATIONS\n * ------------------------------------------------------------------\n *\n * To maintain backwards compatibility with JunOS 11.x (and maybe \n * even 10.x) you MUST AVOID all of these:\n * - global variable $junos-context (introduced with Junos 11.1)\n * - mutable variables (introduced with JunOS 12.2 -> SLAX 1.1)\n * - native functions (introduced with JunOS 12.2 -> SLAX 1.1)\n *\n * ------------------------------------------------------------------\n */\n\n/* ------------------------------------------------------------------ */\n/* XML namespaces                                                     */\n/* ------------------------------------------------------------------ */\n\n/* Juniper */\nns junos = "http://xml.juniper.net/junos/*/junos";\nns xnm = "http://xml.juniper.net/xnm/1.1/xnm";\nns jcs = "http://xml.juniper.net/junos/commit-scripts/1.0";\nns ztp = "http://xml.juniper.net/junos/ztp";\n\n/* EXSLT */\nns exsl extension = "http://exslt.org/common";\nns func extension = "http://exslt.org/functions";\nns str extension = "http://exslt.org/strings";\n\n/* private namespace for this script */\nns jctyztp = "http://xml.juniper.com/jctyztp/1.0";\nns fmztp = "http://xml.juniper.com/fmztp/1.0";\n\n/* depending on Junos version relative path may be broken */\n/* import '../import/junos.xsl'; */\nimport '/usr/libdata/cscript/import/junos.xsl';\n\n/* ------------------------------------------------------------------ */\n/* Script parameters                                                  */\n/* ------------------------------------------------------------------ */\n\nparam $server = 'ztpserver';\nparam $mediapath = '<%= @mediapath %>';\n\n/* ------------------------------------------------------------------ */\n/* Constants                                                          */\n/* ------------------------------------------------------------------ */\n\nvar $APPNAME = 'foreman-ztp';\nvar $SYSLOG = 'user.info';\nvar $TMPDIR = '/var/tmp';\nvar $JUNOS_CONF = '/var/tmp/junos.conf';\n\nvar $ZTP_GROUP_NAME = "fmztp";\nvar $ZTP_MACRO_NAME = "conf";\nvar $ZTP_LOCKFILE = '/tmp/fmztp.lock';\n\n/* ------------------------------------------------------------------ */\n/* Global variables                                                   */\n/* ------------------------------------------------------------------ */\n\n/* Open a connection to the device API */\nvar $jnx = jcs:open();\n\n/* ------------------------------------------------------------------ */\n/*                                MAIN                                */ \n/* ------------------------------------------------------------------ */\n\nmatch / {\n\n  /* Terminate on connection error */\n  if(not( $jnx )) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ":ERROR: unable to connect to Junos API");\n    expr fmztp:terminate();\n  }\n  \n  var $running = fmztp:only_once();\n  if( $running ) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": start op script: already running, exiting..." );\n    <xsl:message terminate="yes">;\n  }\n  \n  /* if the $JUNOS_CONF file is not on the device, then */\n  /* download it from the server */\n  if(not( fmztp:file-exists( $JUNOS_CONF ))) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": obtaining device config file");\n    var $cp = fmztp:dl_junos_conf();\n  }\n  \n  /* now load $JUNOS_CONF into the candidate configuration so we can */\n  /* extract the ZTP config */\n  var $ztp_conf = fmztp:ld_junos_conf();\n  var $has_version = $ztp_conf/has_version;\n  var $new_package = $ztp_conf/package;\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": preparing update from ", $has_version, " to ", $new_package );\n  \n  /* if we have a version difference, then we will install the new OS */\n  /* and reboot the device.  the $JUNOS_CONF file will be loaded on */\n  /* after the install process completes */\n  if( $ztp_conf/install ) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": Junos install required" );\n    var $os = fmztp:install_os( $ztp_conf );\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": rebooting in 60 seconds" );\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": SCRIPT-END");\n    expr fmztp:reboot( 1 );\n    expr jcs:close( $jnx );\n  }\n  else {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": no Junos install required" );\n    /* puppet agent is only supported on Junos 12.3R2.5 */\n    if( jcs:regex( "12.3R2.5", $ztp_conf/has_version )) {\n\texpr jcs:syslog( $SYSLOG, $APPNAME, ": puppet agent install required" );\n\tvar $puppet = fmztp:install_puppet( $ztp_conf );\n    }\n    else {\n\texpr jcs:syslog( $SYSLOG, $APPNAME, ": os version is ", $has_version, ", but puppet agent is only available on 12.3R2.5" );\n    }\n    var $fini = fmztp:finalize();\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": SCRIPT-END");\n    expr jcs:close( $jnx );\n  }\n}\n\n/* ------------------------------------------------------------------ */\n/* HTTP Junos configuration file onto the device                      */\n/* ------------------------------------------------------------------ */\n\n<func:function name="fmztp:dl_junos_conf">\n{\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": downloading new Junos conf...");\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": URL: ", '<%= foreman_url('finish') %>');\n\n  var $get = <file-copy> {\n    <source> '<%= foreman_url('finish') %>';\n    <destination> $JUNOS_CONF;\n    <staging-directory> $TMPDIR;\n  };\n\n  var $got = jcs:execute( $jnx, $get );\n\n  if(not( fmztp:file-exists( $JUNOS_CONF ))) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ":ERROR: unable to find new Junos conf at ", $JUNOS_CONF);\n    expr fmztp:terminate();\n  }\n\n  <func:result select="true()">;\n}\n\n/* ------------------------------------------------------------------ */\n/* Load the $JUNOS_CONF file into the candidate config and extract    */\n/* the ZTP config from the [edit groups] area.  Do *NOT* commit       */\n/* this configuration yet, since we may need to install the OS first  */\n/* ------------------------------------------------------------------ */\n\n<func:function name="fmztp:ld_junos_conf">\n{\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": loading new Junos conf...");\n\n  /* get the current version from the configuration file */\n  \n  var $get_cur_ver = <get-configuration database='committed'> { <configuration> { <version>; }};\n  var $got_cur_ver = jcs:execute( $jnx, $get_cur_ver );\n\n  /* now load the configuration file we got from the ztp server */\n  var $do_load = <load-configuration action="override" url=$JUNOS_CONF format="text">;\n  var $did_load = jcs:execute( $jnx, $do_load );\n  if(not( $did_load/load-success )) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ":ERROR: unable to load config ", $JUNOS_CONF );\n    expr fmztp:terminate();\n  }\n  \n  expr jcs:syslog( $SYSLOG, $APPNAME, ": extracting Junos config parameters...");\n  var $get = <get-configuration> { <configuration> {\n    <version>;\n    <groups> { <name> $ZTP_GROUP_NAME;\n      <apply-macro> { <name> $ZTP_MACRO_NAME;\n      }\n    }\n  }};\n  \n  var $got = jcs:execute( $jnx, $get );\n\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": package: ", $got//data[name = 'package']/value);\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": URL: ", $mediapath);\n\n  /* create a node-set to store the following elements             */\n  /* has_version = current Junos version string                    */\n  /* package = filename of Junos package (*.tgz)                   */\n  /* mediapath = URL where package is obtained from                */\n  /* install = present if a install is requeired                   */\n  var $ver = $got_cur_ver/version;\n  var $package = $got//data[name = 'package']/value;\n  var $puppet = $got//data[name = 'puppet']/value;\n  var $conf := {\n    <has_version> $ver; \n    <package> $package;\n    <puppet> $puppet;\n    <url> $mediapath;\n    if(not( jcs:regex( $ver, $package ))) {\n      <install>;\n    }\n  }\n\n  /* @@@ should put some trap here on ensuring that the config */\n  /* @@@ file actually had the correct group/macro defined */\n    \n  <func:result select="$conf">;\n}\n\n/* ------------------------------------------------------------------ */\n/* Junos Software Installation - download the software from the HTTP  */\n/* server and perform the 'request system software add' operation     */\n/* ------------------------------------------------------------------ */\n\n<func:function name="fmztp:install_os">\n{\n  param $ztp_conf;\n\n  var $local_image = $TMPDIR _ "/" _ $ztp_conf/package;\n  \n  if( fmztp:file-exists( $local_image )) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": junos image exists, no download needed" );\n  }\n  else {\n  \n    /* request system storage cleanup */\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": cleaning filesystem" );\n    var $clean = jcs:execute( $jnx, 'request-system-storage-cleanup' ); \n\n    /* file copy .... */\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": downloading junos image..." );    \n    expr jcs:syslog( $SYSLOG, $APPNAME, ": URL: ", $ztp_conf/url, $ztp_conf/package );\n    var $do_copy = <file-copy> {\n      <source> $ztp_conf/url _ $ztp_conf/package;\n      <destination> $TMPDIR;\n      <staging-directory> $TMPDIR;\n    };\n    var $did_copy = jcs:execute( $jnx, $do_copy );\n    \n    /* trap error here */\n    if( not(fmztp:file-exists( $local_image )) ) {\n        expr jcs:syslog( $SYSLOG, $APPNAME, ": ERROR: unable to download junos image" );\n        expr fmztp:terminate();\n    }\n  }\n  \n  /* request system software add ... */\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": installing junos image" );    \n  var $do_install = <request-package-add> {\n    <no-validate>;\n    <package-name> $local_image;\n  };\n  var $did_install = jcs:execute( $jnx, $do_install );\n  /* @@@ need to trap error here on $did_install */\n  \n  expr jcs:syslog( $SYSLOG, $APPNAME, ": completed installing junos image" );\n   \n  <func:result select="true()">;\n}\n\n/* ------------------------------------------------------------------ */\n/* Reboot the device given a delay, in minutes                        */\n/* ------------------------------------------------------------------ */\n\n<func:function name="fmztp:reboot">\n{\n  param $in_min;\n\n  var $do_reboot = <request-reboot> { <in> $in_min; };\n  var $did_reboot = jcs:execute( $jnx, $do_reboot );\n  <func:result select="true()">;\n}\n\n/* ------------------------------------------------------------------ */\n/* Puppet Agent Installation - download the software from the HTTP    */\n/* server and perform the 'request system software add' operation     */\n/* ------------------------------------------------------------------ */\n\n<func:function name="fmztp:install_puppet">\n{\n  param $ztp_conf;\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": starting puppet installation..." );\n\n  if (fmztp:is-installed("puppet")) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": package puppet is already installed" );\n    <func:result select="true()">;\n  }\n\n  var $local_image = $TMPDIR _ "/" _ $ztp_conf/puppet;\n  \n  if( fmztp:file-exists( $local_image )) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": package puppet exists, no download needed" );\n  }\n  else {\n  \n    /* request system storage cleanup */\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": cleaning filesystem" );\n    var $clean = jcs:execute( $jnx, 'request-system-storage-cleanup' ); \n\n    /* file copy .... */\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": downloading puppet image..." );    \n    expr jcs:syslog( $SYSLOG, $APPNAME, ": URL: ", $ztp_conf/url, $ztp_conf/puppet );    \n    var $do_copy = <file-copy> {\n      <source> $ztp_conf/url _ $ztp_conf/puppet;\n      <destination> $TMPDIR;\n      <staging-directory> $TMPDIR;\n    };\n    var $did_copy = jcs:execute( $jnx, $do_copy );\n    \n    /* trap error on $did_copy */\n    if( not(fmztp:file-exists( $local_image )) ) {\n      expr jcs:syslog( $SYSLOG, $APPNAME, ": ERROR: failed to download puppet image" );\n      expr fmztp:terminate();\n    }\n  }\n\n  /* request system software add ... */\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": installing puppet image" );    \n  var $do_install = <request-package-add> {\n    <no-validate>;\n    <package-name> $local_image;\n  };\n  var $did_install = jcs:execute( $jnx, $do_install );\n  \n  /* NOTE: To complete the puppet installation you need to take manual steps, see:\n   *       http://www.juniper.net/techpubs/en_US/release-independent/junos-puppet/information-products/pathway-pages/index.html\n   */\n\n  /* validate installation */\n  if (not(fmztp:is-installed("puppet"))) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": ERROR: failed to install package puppet" );\n    expr fmztp:terminate();\n  }\n\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": completed installing puppet image" );\n   \n  <func:result select="true()">;\n}\n\n/* ------------------------------------------------------------------ */\n/* Finalize the ZTP process; i.e. after the OS is correct.  Remove    */\n/* the $JUNOS_CONF file and committing the configuration to make      */\n/* it active.                                                         */\n/* ------------------------------------------------------------------ */\n\n<func:function name="fmztp:finalize">\n{\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": deleting temp config file...");  \n  var $rm1 = fmztp:file-delete( $JUNOS_CONF );\n\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": sending finish signal to foreman...");  \n  var $do_foreman = <file-copy> {\n      <source> '<%= foreman_url('provision') %>';\n      <destination> "/tmp";\n      <staging-directory> "/tmp";\n  };\n  var $did_foreman = jcs:execute( $jnx, $do_foreman );\n\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": deleting ztp lock file...");  \n  var $rm2 = fmztp:file-delete( $ZTP_LOCKFILE );\n\n  /* commit the configuration that was previously loaded */  \n  expr jcs:syslog( $SYSLOG, $APPNAME, ": committing configuration...");  \n  var $commit = jcs:execute( $jnx, 'commit-configuration' );\n  if( $commit//self::xnm:error ) {\n    expr jcs:syslog( $SYSLOG, $APPNAME, ":ERROR: unable to commit configuration: ", $commit//self::xnm:error/message );\n    var $die = fmztp:terminate();\n  }\n\n  <func:result select="true()">;\n}\n\n/* ------------------------------------------------------------------ */\n/* Helper routine: check to see if a file exists on the device,       */\n/* returns [ true | false ]                                           */\n/* ------------------------------------------------------------------ */\n\n<func:function name="fmztp:file-exists">\n{\n  param $filename;\n  var $ls_file = <file-list> { <path> $filename; };\n  var $ls_got = jcs:execute( $jnx, $ls_file );\n  var $retval = boolean( $ls_got//file-information );\n\n  <func:result select="$retval">;\n}\n\n<func:function name="fmztp:file-delete">\n{\n  param $filename;\n  var $do_rm = <file-delete> { <path> $filename; };\n  var $did_rm = jcs:execute( $jnx, $do_rm );\n  /* @@@ trap error */\n  \n  <func:result select="true()">;\n}\n\n/* ------------------------------------------------------------------ */\n/* Helper routine: create a lockfile to make sure the script only     */\n/* runs once, and terminate if it is already running.                 */\n/* returns [ true | false ]                                           */\n/* ------------------------------------------------------------------ */\n\n<func:function name="fmztp:only_once">\n{\n  if( fmztp:file-exists( $ZTP_LOCKFILE )) {\n    <func:result select="true()">;\n  }\n  else {\n    var $do_lock = <file-put> {\n      <filename> $ZTP_LOCKFILE;\n      <encoding> 'ascii';\n      <file-contents> 'locked';\n    };\n    var $did_lock = jcs:execute( $jnx, $do_lock );\n    <func:result select="false()">;\n  }\n}\n\n<func:function name="fmztp:terminate">\n{\n  expr jcs:syslog( $SYSLOG, $APPNAME, ": SCRIPT-FAILED" );\n  var $rm_lock = fmztp:file-delete( $ZTP_LOCKFILE );\n  <xsl:message terminate="yes">;\n}\n\n/* ------------------------------------------------- */\n/* check if software package is installed            */\n/* ------------------------------------------------- */\n<func:function name="fmztp:is-installed">\n{\n  param $string;\n\n  var $do_query = <get-software-information>;\n  var $did_query = jcs:execute( $jnx, $do_query );\n\n  if( jcs:regex( $string, $did_query )) {\n    expr jcs:output("package found: ", $string);\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": package found: ", $string);\n    <func:result select="true()">;\n  }\n  else {\n    expr jcs:output("package NOT found: ", $string);\n    expr jcs:syslog( $SYSLOG, $APPNAME, ": package NOT found: ", $string);\n    <func:result select="false()">;\n  }\n}\n	f	6	2025-01-19 19:42:37.777301	2025-01-19 19:42:37.777301	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Provisioning template for the Junos OS, used on Juniper network devices.\nIt fetches the config file based on the Juniper Finish template and deploys\nit if it differs from the current version.	f	\N
60	Kickstart default	<%#\nkind: provision\nname: Kickstart default\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\ntest_on:\n- host4dhcp\n- host6dhcp\n- host4and6dhcp\n- host4static\n- host6static\n- rhel9_dhcp\n- rocky8_dhcp\n- rocky9_dhcp\ndescription: |\n  The provisioning template for kickstart based distributions. The output is fetched by Anaconda installer during\n  the network based installation. To customize the installation, modify the host parameters.\n\n  This template accepts the following parameters:\n  - lang: string (default="en_US.UTF-8")\n  - selinux-mode: string (default="enforcing")\n  - keyboard: string (default="us")\n  - time-zone: string (default="UTC")\n  - http-proxy: string (default="")\n  - http-proxy-port: string (default="")\n  - force-puppet: boolean (default=false)\n  - enable-epel: boolean (default=false)\n  - enable-puppetlabs-repo: boolean (default=false)\n  - enable-puppetlabs-puppet5-repo: boolean (default=false)\n  - enable-puppetlabs-puppet6-repo: boolean (default=false)\n  - enable-official-puppet7-repo: boolean (default=false)\n  - enable-official-puppet8-repo: boolean (default=false)\n  - skip-puppet-setup: boolean (default=false)\n  - salt_master: string (default=undef)\n  - ntp-server: string (default=undef)\n  - bootloader-append: string (default="nofb quiet splash=quiet")\n  - disable-firewall: boolean (default=false)\n  - package_upgrade: boolean (default=true)\n  - disable-uek: boolean (default=false)\n  - use-ntp: boolean (default depends on OS release)\n  - fips_enabled: boolean (default=false)\n  - encrypt_grub: boolean (default=false)\n  - use_graphical_installer: boolean (default=false)\n  - enable-remote-execution-pull: boolean (default=false)\n  - additional-packages: string (default=undef)\n\n  Reference links:\n  - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s1-kickstart2-options\n  - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-kickstart-syntax\n  - https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/performing_an_advanced_rhel_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user\n-%>\n<%\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  is_fedora = @host.operatingsystem.name == 'Fedora'\n  os_major = @host.operatingsystem.major.to_i\n  os_minor = @host.operatingsystem.minor.to_i\n  realm_compatible = (@host.operatingsystem.name == 'Fedora' && os_major >= 20) || (rhel_compatible && os_major >= 7)\n  # safemode renderer does not support unary negation\n  proxy_uri = host_param('http-proxy') ? "http://#{host_param('http-proxy')}:#{host_param('http-proxy-port')}" : nil\n  proxy_string = proxy_uri ? " --proxy=#{proxy_uri}" : ''\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  chef_enabled = @host.respond_to?(:chef_proxy) && @host.chef_proxy\n  section_end = (rhel_compatible && os_major <= 5) ? '' : '%end'\n  use_ntp = host_param_true?('use-ntp', (is_fedora && os_major < 16) || (rhel_compatible && os_major <= 6))\n  iface = @host.provision_interface\n  appstream_present = false\n  use_rhsm = (@host.operatingsystem.name == 'RedHat' || @host.operatingsystem.name == 'RHEL') && os_major >= 9\n-%>\n# This kickstart file was rendered from the Foreman provisioning template "<%= @template_name %>".\n# for <%= @host %> running <%= @host.operatingsystem.name %> <%= os_major %> <%= @arch %>\n# Organization: <%= @host.organization %>\n# Location: <%= @host.location %>\n<%\nif plugin_present?('katello')\n-%>\n# Lifecycle environment: <%= @host.single_lifecycle_environment %>\n# Content View: <%= @host.single_content_view %>\n# Content Source: <%= @host.content_source %>\n<% end -%>\n\n<% if (is_fedora && os_major < 29) || (rhel_compatible && os_major <= 7) -%>\ninstall\n<% end -%>\n<%\nif host_param('kickstart_liveimg')\n  img_name = host_param('kickstart_liveimg')\n  liveimg_url = if host_param('kt_activation_keys')\n    repository_url(img_name, 'isos')\n  else\n    if img_name.match(%r|^([\\w\\-\\+]+)://|)\n      img_name\n    else\n      "#{medium_uri}/#{img_name}"\n    end\n  end\n%>\nliveimg --url=<%= liveimg_url %> <%= proxy_string %>\n<% else %>\n<%= @mediapath %><%= proxy_string %>\n<% @additional_media.each do |medium| -%>\nrepo --name <%= medium[:name] %> --baseurl <%= medium[:url] %> <%= medium[:install] ? ' --install' : '' %><%= proxy_string %>\n<% end -%>\n<%= snippet_if_exists(template_name + " custom repositories") %>\n<% end %>\nlang <%= host_param('lang') || 'en_US.UTF-8' %>\nselinux --<%= host_param('selinux-mode') || host_param('selinux') || 'enforcing' %>\nkeyboard <%= host_param('keyboard') || 'us' %>\n\n<%\n# start with provisioning interface, then other non-bond non-bridge interfaces and the bonds + bridges at the end\n@host.interfaces.reject{ |iface| iface.bmc? }.sort_by { |iface| (iface.bond? || iface.bridge?) ? 0 : iface.provision? ? 20 : 10 }.each do |iface|\n-%>\n<%= snippet(\n      'kickstart_network_interface',\n      variables: {\n        iface: iface,\n        host: @host,\n        use_slaac: host_param_true?('use-slaac'),\n        static: @static,\n        static6: @static6\n      }\n    ) -%>\n<%\nend\n-%>\n\nrootpw --iscrypted <%= root_pass %>\n<% if host_param_true?('disable-firewall') -%>\nfirewall --disable\n<% else -%>\nfirewall --<%= os_major >= 6 ? 'service=' : '' %>ssh\n<% end -%>\n<% if (is_fedora && os_major >= 28) || (rhel_compatible && os_major > 7) -%>\nauthselect --useshadow --passalgo=<%= @host.operatingsystem.password_hash.downcase || 'sha256' %> --kickstart\n<% else -%>\nauthconfig --useshadow --passalgo=<%= @host.operatingsystem.password_hash.downcase || 'sha256' %> --kickstart\n<% end -%>\n<% if rhel_compatible && os_major < 9 -%>\ntimezone --utc <%= host_param('time-zone') || 'UTC' %> <%= host_param('ntp-server') ? "--ntpservers #{host_param('ntp-server')}" : '' %>\n<% else -%>\ntimezone --utc <%= host_param('time-zone') || 'UTC' %>\n<% if host_param('ntp-server') -%>\ntimesource --ntp-server <%= host_param('ntp-server') %>\n<% end -%>\n<% end -%>\n\n<% if rhel_compatible -%>\nservices --disabled gpm,sendmail,cups,pcmcia,isdn,rawdevices,hpoj,bluetooth,openibd,avahi-daemon,avahi-dnsconfd,hidd,hplip,pcscd\n<% end -%>\n\n<% if realm_compatible && host_enc['parameters']['realm'] && @host.realm && @host.realm.realm_type == 'Active Directory' -%>\n# One-time password will be requested at install time. Otherwise, $HOST[OTP] is used as a placeholder value.\nrealm join --one-time-password='<%= @host.otp || "$HOST[OTP]" %>' <%= @host.realm %>\n<% end -%>\n\n<% if @host.operatingsystem.name == 'OracleLinux' && os_major == 7 && os_minor < 5 -%>\nrepo --name="Server-Mysql"\n<% end -%>\n\n<% if @host.operatingsystem.name == 'Fedora' && os_major <= 16 -%>\n# Bootloader exception for Fedora 16:\nbootloader --append="<%= host_param('bootloader-append') || 'nofb quiet splash=quiet' %> <%= ks_console %>" <%= grub_pass %>\npart biosboot --fstype=biosboot --size=1\n<% else -%>\nbootloader --location=mbr --append="<%= host_param('bootloader-append') || 'nofb quiet splash=quiet' %>" <%= grub_pass %>\n<% if os_major == 5 -%>\nkey --skip\n<% end -%>\n<% end -%>\n\n<% if @dynamic -%>\n%include /tmp/diskpart.cfg\n<% else -%>\n<%= @host.diskLayout %>\n<% end -%>\n<%= snippet('kickstart_rhsm') if use_rhsm -%>\n\n<% if host_param_true?('use_graphical_installer') -%>\ngraphical\n<% else -%>\nskipx\ntext\n<% end -%>\nreboot<% if host_param_true?('install_reboot_kexec') %> --kexec<% end %>\n\n%packages\n<%= snippet_if_exists(template_name + " custom packages") %>\nyum\n<% if os_major < 8 -%>\ndhclient\n<% end -%>\n<% if use_ntp -%>\nntp\n-chrony\n<% else -%>\nchrony\n-ntp\n<% end -%>\n<% if rhel_compatible && os_major < 9 -%>\nwget\n<% end -%>\n<% if host_param_true?('fips_enabled') -%>\n<%=   snippet 'fips_packages' %>\n<% end -%>\n<% if host_param('additional-packages').present? -%>\n<%= host_param('additional-packages').split(" ").join("\\n") %>\n<% end -%>\n<%= section_end %>\n\n<% if @dynamic -%>\n%pre --log=/tmp/install.pre.dynamic.log\n<%= snippet_if_exists(template_name + " custom pre") %>\n<%= @host.diskLayout %>\n<%= section_end %>\n<% end -%>\n\n%post --nochroot\nexec < /dev/tty3 > /dev/tty3\nchvt 3\n(\n\n<% if host_param_false?('no-resolv-override') -%>\ncp -va /etc/resolv.conf /mnt/sysimage/etc/resolv.conf\n<% end -%>\n\n<%= snippet_if_exists(template_name + " custom postnochroot") -%>\n\nchvt 1\n) 2>&1 | tee /mnt/sysimage/root/install.postnochroot.log\n<%= section_end %>\n\n<%#\nMain post script, if it fails the last post is still executed.\n%>\n%post\nexec < /dev/tty3 > /dev/tty3\nchvt 3\n(\nlogger "Starting anaconda <%= @host %> postinstall"\n<%= snippet 'ntp' %>\n\n<%= snippet 'yum_proxy' %>\n\n<% if rhel_compatible && host_param_true?('enable-epel') -%>\n<%= snippet 'epel' -%>\n<% end -%>\n\n<%= snippet 'redhat_register' if rhel_compatible && !use_rhsm -%>\n\n<% if host_enc['parameters']['realm'] && @host.realm && (@host.realm.realm_type == 'FreeIPA' || @host.realm.realm_type == 'Red Hat Identity Management') -%>\n<%= snippet 'freeipa_register' %>\n<% end -%>\n\n<% unless host_param_false?('package_upgrade') -%>\n# update all the base packages from the updates repository\nif [ -f /usr/bin/dnf ]; then\n  dnf -y update\nelse\n  yum -t -y update\nfi\n<% end -%>\n\n<%= snippet('remote_execution_ssh_keys') %>\n\n<% if plugin_present?('katello') && host_param_true?('enable-remote-execution-pull') -%>\n<%= save_to_file('/root/remote_execution_pull_setup.sh', snippet('remote_execution_pull_setup'), verbatim: true) %>\nchmod +x /root/remote_execution_pull_setup.sh\n/root/remote_execution_pull_setup.sh\n<% end -%>\n\n<%= snippet "blacklist_kernel_modules" %>\n\n<% if chef_enabled %>\n<%= snippet 'chef_client' %>\n<% end -%>\n\n<% if puppet_enabled %>\n<% if host_param_true?('enable-puppetlabs-repo') || host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo')|| host_param_true?('enable-puppetlabs-puppet5-repo') -%>\n<%= snippet 'puppetlabs_repo' %>\n<% end -%>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if salt_enabled %>\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n\n<% if @host.operatingsystem.name == 'OracleLinux' && host_param_true?('disable-uek') -%>\n# Uninstall the Oracle Unbreakable Kernel packages\nyum -t -y remove kernel-uek*\nsed -e 's/DEFAULTKERNEL=kernel-uek/DEFAULTKERNEL=kernel/g' -i /etc/sysconfig/kernel\n<% end -%>\n\n<%= snippet('ansible_provisioning_callback') %>\n\n<%= snippet 'efibootmgr_netboot' %>\n\n<%= snippet_if_exists(template_name + " custom post") %>\n\n<%= snippet 'insights' if host_param_true?('host_registration_insights') && os_major < 9 -%>\n<%= snippet 'disk_enc_clevis_tang' if host_param('disk_enc_tang_servers') -%>\n\ntouch /tmp/foreman_built\n\n<% if host_param_true?('use_graphical_installer') -%>\nchvt 6\n<% else -%>\nchvt 1\n<% end -%>\n) 2>&1 | tee /root/install.post.log\n<%= section_end %>\n\n# copy %pre log files into chroot\n%post --nochroot\ncp -vf /tmp/*.pre.*.log /mnt/sysimage/root/\n<%= section_end %>\n\n<%#\nThe last post section halts Anaconda to prevent endless loop in case HTTP request fails\n%>\n<% if (is_fedora && os_major < 20) || (rhel_compatible && os_major < 7) -%>\n%post\n<% else -%>\n%post --erroronfail --log=/root/install-callhome.post.log\n<% end -%>\n\n<%= snippet 'eject_cdrom' -%>\n\nif test -f /tmp/foreman_built; then\n  echo "calling home: build is done!"\n  <%= indent(2, skip1: true, skip_content: 'EOF') { snippet('built', :variables => { :endpoint => 'built', :method => 'POST', :body_file => '/root/install.post.log' }) } -%>\nelse\n  echo "calling home: build failed!"\n  <%= indent(2, skip1: true, skip_content: 'EOF') { snippet('built', :variables => { :endpoint => 'failed', :method => 'POST', :body_file => '/root/install.post.log' }) } -%>\nfi\n\nsync\n<%= section_end %>\n	f	6	2025-01-19 19:42:37.786301	2025-01-19 19:42:37.786301	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The provisioning template for kickstart based distributions. The output is fetched by Anaconda installer during\nthe network based installation. To customize the installation, modify the host parameters.\n\nThis template accepts the following parameters:\n- lang: string (default="en_US.UTF-8")\n- selinux-mode: string (default="enforcing")\n- keyboard: string (default="us")\n- time-zone: string (default="UTC")\n- http-proxy: string (default="")\n- http-proxy-port: string (default="")\n- force-puppet: boolean (default=false)\n- enable-epel: boolean (default=false)\n- enable-puppetlabs-repo: boolean (default=false)\n- enable-puppetlabs-puppet5-repo: boolean (default=false)\n- enable-puppetlabs-puppet6-repo: boolean (default=false)\n- enable-official-puppet7-repo: boolean (default=false)\n- enable-official-puppet8-repo: boolean (default=false)\n- skip-puppet-setup: boolean (default=false)\n- salt_master: string (default=undef)\n- ntp-server: string (default=undef)\n- bootloader-append: string (default="nofb quiet splash=quiet")\n- disable-firewall: boolean (default=false)\n- package_upgrade: boolean (default=true)\n- disable-uek: boolean (default=false)\n- use-ntp: boolean (default depends on OS release)\n- fips_enabled: boolean (default=false)\n- encrypt_grub: boolean (default=false)\n- use_graphical_installer: boolean (default=false)\n- enable-remote-execution-pull: boolean (default=false)\n- additional-packages: string (default=undef)\n\nReference links:\n- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s1-kickstart2-options\n- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-kickstart-syntax\n- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/performing_an_advanced_rhel_installation/kickstart-commands-and-options-reference_installing-rhel-as-an-experienced-user	f	\N
61	Kickstart oVirt-RHVH	<%#\nkind: provision\nname: Kickstart oVirt-RHVH\nmodel: ProvisioningTemplate\noses:\n- oVirt\n- RHVH\ndescription: |\n  Provisioning template for oVirt Node and Red Hat Virtualization Host. It renders the kickstart\n  file.\n\n  This template accepts the following parameters:\n  - liveimg_name: string (default=squashfs.img)\n  - lang: string (default="en_US.UTF-8")\n  - selinux-mode: string (default="enforcing")\n  - keyboard: string (default="us")\n  - time-zone: string (default="UTC")\n  - ntp-server: string (default="0.fedora.pool.ntp.org")\n  - disable-firewall: boolean (default=false)\n\n  This kickstart will only work with LVM THIN partitioning ('Kickstart default thin')\n  and it requires the installation URL to have squashfs.img image extracted in the\n  root folder (or specified via 'liveimg_name' parameter). See oVirt Node documentation\n  or RHV Installation Manual, section 5.2. Advanced installation.\n\n  By default, the template expects the squashfs.img to be present inside\n  the installation media. When using Katello for content management (the\n  kt_activation_key parameter is set), the liveimg_name is used to\n  specify relative path to the file and the template use repository_url\n  helper to generate an absolute path to the file (taking into account\n  also info about the content proxy relevant for the host)\n\n  For example, in case the squashfs.img is uploaded inside custom\n  product named 'oVirt' and repository 'hypervisor', the\n  liveimg_name would be 'custom/ovirt/hypervisor/squashfs.img'.\n  In this case, this repository would need to be part of the content\n  view the host is assigned to. It's also possible to provide full url,\n  in which case it would be used without a change.\n-%>\n# This kickstart file was rendered from the Foreman provisioning template "<%= @template_name %>".\n\ninstall\n<%\nliveimg_name = host_param('liveimg_name') || 'squashfs.img'\nif host_param('kt_activation_keys')\n  liveimg_url = repository_url(liveimg_name, 'isos')\nelse\n  liveimg_url = "#{medium_uri}/#{liveimg_name}"\nend\n%>\n\nliveimg --url=<%= liveimg_url %>\n\n<%\n# start with provisioning interface, then other non-bond interfaces and the bonds at the end\n@host.managed_interfaces.sort_by { |iface| (iface.bond? || iface.bridge?) 0 : iface.provision? 20 : 10 }.each |iface| do\n%>\n  <%= snippet(\n        'kickstart_network_interface',\n        variables: {\n          iface: iface,\n          host: @host,\n          use_slaac: false,\n          static: @static,\n          static6: @static6\n          }\n      ) -%>\n<%\nend\n-%>\n\n\nrootpw --iscrypted <%= root_pass %>\n<% if host_param_true?('disable-firewall') -%>\nfirewall --disable\n<% else -%>\nfirewall --service=ssh\n<% end -%>\nlang <%= host_param('lang') || 'en_US.UTF-8' %>\ntimezone --utc <%= host_param('time-zone') || 'UTC' %>\nselinux --<%= host_param('selinux-mode') || host_param('selinux') || 'enforcing' %>\nkeyboard <%= host_param('keyboard') || 'us' %>\nservices --enabled=sshd\ntext\nreboot\n<%= @host.diskLayout %>\n\n%post --log=/root/ks.post.log --erroronfail\nnodectl init\n<%= snippet 'redhat_register' %>\n<%= snippet 'efibootmgr_netboot' %>\n<% if host_param_true?('host_registration_insights') -%>\n<%= snippet 'insights' -%>\n<% end -%>\n\n/usr/sbin/ntpdate -sub <%= host_param('ntp-server') || '0.fedora.pool.ntp.org' %>\n/usr/sbin/hwclock --systohc\n\n/usr/bin/curl <%= foreman_url('built') %>\nsync\nsystemctl reboot\n%end\n	f	6	2025-01-19 19:42:37.795257	2025-01-19 19:42:37.795257	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Provisioning template for oVirt Node and Red Hat Virtualization Host. It renders the kickstart\nfile.\n\nThis template accepts the following parameters:\n- liveimg_name: string (default=squashfs.img)\n- lang: string (default="en_US.UTF-8")\n- selinux-mode: string (default="enforcing")\n- keyboard: string (default="us")\n- time-zone: string (default="UTC")\n- ntp-server: string (default="0.fedora.pool.ntp.org")\n- disable-firewall: boolean (default=false)\n\nThis kickstart will only work with LVM THIN partitioning ('Kickstart default thin')\nand it requires the installation URL to have squashfs.img image extracted in the\nroot folder (or specified via 'liveimg_name' parameter). See oVirt Node documentation\nor RHV Installation Manual, section 5.2. Advanced installation.\n\nBy default, the template expects the squashfs.img to be present inside\nthe installation media. When using Katello for content management (the\nkt_activation_key parameter is set), the liveimg_name is used to\nspecify relative path to the file and the template use repository_url\nhelper to generate an absolute path to the file (taking into account\nalso info about the content proxy relevant for the host)\n\nFor example, in case the squashfs.img is uploaded inside custom\nproduct named 'oVirt' and repository 'hypervisor', the\nliveimg_name would be 'custom/ovirt/hypervisor/squashfs.img'.\nIn this case, this repository would need to be part of the content\nview the host is assigned to. It's also possible to provide full url,\nin which case it would be used without a change.	f	\N
62	Preseed default	<%#\nkind: provision\nname: Preseed default\nmodel: ProvisioningTemplate\noses:\n- Debian\n- Ubuntu\ntest_on:\n- debian4dhcp\n- ubuntu4dhcp\ndescription: |\n  The provisioning template for preseed based distributions. The output is fetched by the installer during\n  the network based installation. To customize the installation, modify the host parameters.\n-%>\n<%\n  proxy_string = host_param('http-proxy') ? " http://#{host_param('http-proxy')}:#{host_param('http-proxy-port')}" : ''\n  ansible_enabled = plugin_present?('foreman_ansible')\n  salt_enabled = host_param('salt_master') ? true : false\n  os_major = @host.operatingsystem.major.to_i\n  squeeze_or_older = (@host.operatingsystem.name == 'Debian' && os_major <= 6)\n  python_package = case\n                   when (@host.operatingsystem.name == 'Ubuntu' && os_major < 20) then 'python'\n                   when (@host.operatingsystem.name == 'Debian' && os_major < 11) then 'python'\n                   else 'python3'\n                   end\n\n  additional_packages = ['lsb-release', 'wget']\n  additional_packages << host_param('additional-packages')\n  additional_packages << python_package if ansible_enabled\n  additional_packages << 'eject' if @host.respond_to?(:bootdisk_build?) && @host.bootdisk_build?\n  additional_packages = additional_packages.join(" ").split().uniq().join(" ")\n%>\n# This preseed file was rendered from the Foreman provisioning template "<%= @template_name %>".\n# for <%= @host %> running <%= @host.operatingsystem.name %> <%= os_major %> <%= @arch %>\n# Organization: <%= @host.organization %>\n# Location: <%= @host.location %>\n\n<%= snippet_if_exists(template_name + " custom pre") -%>\n\n# Locale\nd-i debian-installer/locale string <%= host_param('lang') || 'en_US' %>\n# country and keyboard settings are automatic. Keep them ...\n# ... for wheezy and newer:\nd-i keyboard-configuration/xkb-keymap seen true\n<% if squeeze_or_older -%>\n# ... for squeeze and older:\nd-i console-keymaps-at/keymap seen true\n<% end -%>\n\n<% subnet = @host.subnet -%>\n<% if @static -%>\n  <%- dhcp = false -%>\n<% elsif subnet.nil? -%>\n  <%- dhcp = true -%>\n<% else -%>\n  <%- dhcp = subnet.dhcp_boot_mode? -%>\n<% end -%>\n<% unless dhcp -%>\n# Static network configuration.\nd-i preseed/early_command string /bin/killall.sh; /bin/netcfg\nd-i netcfg/disable_autoconfig boolean true\nd-i netcfg/dhcp_failed note\nd-i netcfg/dhcp_options select Configure network manually\nd-i netcfg/disable_dhcp boolean true\nd-i netcfg/get_ipaddress string <%= @host.ip %>\nd-i netcfg/get_netmask string <%= subnet.mask %>\nd-i netcfg/get_nameservers string <%= subnet.dns_servers.join(' ') %>\nd-i netcfg/get_gateway string <%= subnet.gateway %>\nd-i netcfg/confirm_static boolean true\n<% end -%>\n\n# Network configuration\nd-i netcfg/choose_interface select auto\nd-i netcfg/get_hostname string <%= @host %>\nd-i netcfg/get_domain string <%= @host.domain %>\nd-i netcfg/wireless_wep string\n\nd-i hw-detect/load_firmware boolean true\n\n<% if host_param_true?('preseed-live-installer') -%>\n# Offline live-installer location\nd-i live-installer/net-image string http://<%= @preseed_server %><%= @preseed_path %>/install/filesystem.squashfs\n<% end -%>\n\n# Mirror settings\nd-i mirror/country string manual\nd-i mirror/http/hostname string <%= @preseed_server %>\nd-i mirror/http/directory string <%= @preseed_path %>\nd-i mirror/http/proxy string<%= proxy_string %>\nd-i mirror/codename string <%= @host.operatingsystem.release_name %>\nd-i mirror/suite string <%= @host.operatingsystem.release_name %>\nd-i mirror/udeb/suite string <%= @host.operatingsystem.release_name %>\n\n# Time settings\nd-i clock-setup/utc boolean true\nd-i time/zone string <%= host_param('time-zone') || 'UTC' %>\n\n# NTP\nd-i clock-setup/ntp boolean true\nd-i clock-setup/ntp-server string <%= host_param('ntp-server') || '0.debian.pool.ntp.org' %>\n\n# Set alignment for automatic partitioning\n# Choices: cylinder, minimal, optimal\n#d-i partman/alignment select cylinder\n\n<%= @host.diskLayout %>\n\n<% if host_param('preseed-kernel-image') -%>\n# Install different kernel\nd-i base-installer/kernel/image string <%= host_param('preseed-kernel-image') %>\n<% end %>\n\n# User settings\nd-i passwd/root-password-crypted password <%= root_pass %>\nuser-setup-udeb passwd/root-login boolean true\nd-i passwd/make-user boolean false\nuser-setup-udeb passwd/make-user boolean false\n\n<% repos = 0 %>\n\n<% @additional_media.each do |medium| -%>\nd-i apt-setup/local<%= repos %>/repository string <%= medium[:url] %> <%= @host.operatingsystem.release_name %>-<%= medium[:name] %> main\n<%= "d-i apt-setup/local#{repos}/comment string #{medium[:comment]}" if medium[:comment] %>\n<%= "d-i apt-setup/local#{repos}/key string #{medium[:gpgkey]}" if medium[:gpgkey] %>\n<% repos +=1 -%>\n<% end -%>\n\n<% if salt_enabled -%>\n<% if host_param_true?('enable-saltstack-repo') -%>\n<% if @host.operatingsystem.name == 'Debian' -%>\nd-i apt-setup/local<%= repos %>/repository string http://debian.saltstack.com/debian <%= @host.operatingsystem.release_name %>-saltstack main\nd-i apt-setup/local<%= repos %>/comment string SaltStack Repository\nd-i apt-setup/local<%= repos %>/key string http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key\n<% repos += 1 -%>\n<% end -%>\n<% if @host.operatingsystem.name == 'Ubuntu' -%>\nd-i apt-setup/local<%= repos %>/repository string http://ppa.launchpad.net/saltstack/salt/ubuntu <%= @host.operatingsystem.release_name %> main\nd-i apt-setup/local<%= repos %>/comment string SaltStack Repository\nd-i apt-setup/local<%= repos %>/key string http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x4759FA960E27C0A6\n<% repos += 1 -%>\n<% end -%>\n<% end -%>\n<% end -%>\n\n<% if host_param('kt_activation_keys') -%>\n# If we are using Katello for content management, then we do not want to use\n# upstream mirrors prior to Katello registration.\nd-i apt-setup/use_mirror boolean false\nd-i apt-setup/services-select multiselect\n\n<% end -%>\n# Install minimal task set (see tasksel --task-packages minimal)\ntasksel tasksel/first multiselect minimal, ssh-server, openssh-server\n\n# Install some base packages\nd-i pkgsel/include string <%= additional_packages %>\nd-i pkgsel/update-policy select <%= host_param('preseed-update-policy') || 'unattended-upgrades' %>\nd-i pkgsel/upgrade select <%= host_param('preseed-post-install-upgrade') || 'none' %>\n\npopularity-contest popularity-contest/participate boolean false\n\n# Boot loader settings\n#grub-pc grub-pc/hidden_timeout boolean false\n#grub-pc grub-pc/timeout string 10\nd-i grub-installer/only_debian boolean true\nd-i grub-installer/with_other_os boolean true\nd-i finish-install/reboot_in_progress note\n\n<%= snippet_if_exists(template_name + " custom post") -%>\n\nd-i preseed/late_command string wget -Y off <%= @static ? "'#{foreman_url('finish', static: 'true')}'" : foreman_url('finish') %> -O /target/tmp/finish.sh && in-target chmod +x /tmp/finish.sh && in-target /tmp/finish.sh\n	f	6	2025-01-19 19:42:37.803927	2025-01-19 19:42:37.803927	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The provisioning template for preseed based distributions. The output is fetched by the installer during\nthe network based installation. To customize the installation, modify the host parameters.	f	\N
63	RancherOS provision	<%#\nkind: provision\nname: RancherOS provision\nmodel: ProvisioningTemplate\noses:\n- RancherOS\ndescription: |\n  The provisioning template for the RancherOS. The output is the cloud config data.\n  This does not work with k3os, a successor of the RancherOS 1.x and 2.x\n-%>\n<%= snippet 'rancheros_cloudconfig' -%>\n	f	6	2025-01-19 19:42:37.812585	2025-01-19 19:42:37.812585	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The provisioning template for the RancherOS. The output is the cloud config data.\nThis does not work with k3os, a successor of the RancherOS 1.x and 2.x	f	\N
64	Windows default provision	<%#\nkind: provision\nname: Windows default provision\nmodel: ProvisioningTemplate\noses:\n- Windows\ntest_on:\n- windows10_dhcp\ndescription: |\n  A templated answers.xml file for windows installations. This provides all answers to the questions an interactive installation would ask.\n  It supports the following parameters:\n  - windowsLicenseKey: ABCDE-ABCDE-ABCDE-ABCDE-ABCDE # Valid Windows license key\n  - windowsLicenseOwner: Company, INC # Legal owner of the Windows license key\n  - systemLocale: en-US\n  - systemUILanguage: en-US\n  - systemTimeZone: GMT Standard Time #see https://msdn.microsoft.com/en-us/library/ms912391(v=winembedded.11).aspx\n  - wimImageName = Windows 10 Pro # Image name seems only necessary if the WIM contains more than one image\n-%>\n<%\n  system_locale = host_param('systemLocale', 'en-US')\n  system_ui_lang = host_param('systemUILanguage', 'en-US')\n  setup_ui_lang = 'en-US'\n  input_locale = host_param('inputLocale', 'en-US')\n  system_timezone = host_param('systemTimeZone', 'GMT Standard Time')\n  network_location = host_param('networklocation', 'private')\n-%>\n<?xml version="1.0" encoding="utf-8"?>\n<unattend xmlns="urn:schemas-microsoft-com:unattend">\n    <servicing></servicing>\n    <settings pass="offlineServicing">\n        <component name="Microsoft-Windows-LUA-Settings" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <EnableLUA>false</EnableLUA>\n        </component>\n    </settings>\n    <settings pass="windowsPE">\n        <component name="Microsoft-Windows-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <EnableFirewall><%= host_param('EnableFirewall', 'true') %></EnableFirewall>\n            <EnableNetwork>true</EnableNetwork>\n            <Restart>Restart</Restart>\n            <ImageInstall>\n                <OSImage>\n                    <InstallFrom>\n                        <MetaData wcm:action="add">\n                            <Value><%= host_param('wimImageName') -%></Value>\n                        </MetaData>\n                    </InstallFrom>\n                    <InstallToAvailablePartition>true</InstallToAvailablePartition>\n                    <WillShowUI>OnError</WillShowUI>\n                </OSImage>\n            </ImageInstall>\n            <UserData>\n                <AcceptEula>true</AcceptEula>\n            </UserData>\n        </component>\n        <component name="Microsoft-Windows-International-Core-WinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <SetupUILanguage>\n                <UILanguage><%= setup_ui_lang %></UILanguage>\n            </SetupUILanguage>\n              <InputLocale><%= input_locale %></InputLocale>\n              <SystemLocale><%= system_locale %></SystemLocale>\n              <UILanguageFallback><%= setup_ui_lang %></UILanguageFallback>\n              <UILanguage><%= system_ui_lang %></UILanguage>\n              <UserLocale><%= system_locale %></UserLocale>\n        </component>\n    </settings>\n    <settings pass="oobeSystem">\n        <component name="Microsoft-Windows-International-Core" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n              <InputLocale><%= input_locale %></InputLocale>\n              <SystemLocale><%= system_locale %></SystemLocale>\n              <UILanguageFallback><%= setup_ui_lang %></UILanguageFallback>\n              <UILanguage><%= system_ui_lang %></UILanguage>\n              <UserLocale><%= system_locale %></UserLocale>\n        </component>\n        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <UserAccounts>\n                <AdministratorPassword>\n                    <Value><%= root_pass %></Value>\n                    <PlainText>false</PlainText>\n                </AdministratorPassword>\n            <% if host_param('ansible_user') && host_param('create_ansible_user') -%>\n                <LocalAccounts>\n                    <LocalAccount wcm:action="add">\n                        <Password>\n                            <Value><![CDATA[<%= host_param('ansible_ssh_pass') %>]]></Value>\n                            <PlainText>true</PlainText>\n                        </Password>\n                        <Description>Ansible login service user</Description>\n                        <DisplayName><%= host_param('ansible_user') %></DisplayName>\n                        <Group>Administrators</Group>\n                        <Name><%= host_param('ansible_user') %></Name>\n                    </LocalAccount>\n\t            </LocalAccounts>\n\t        <% end -%>\n            </UserAccounts>\n            <TimeZone><%= system_timezone -%></TimeZone>\n            <% if host_param('windowsLicenseOwner') -%>\n              <RegisteredOrganization><%= host_param('windowsLicenseOwner') -%></RegisteredOrganization>\n              <RegisteredOwner><%= host_param('windowsLicenseOwner') -%></RegisteredOwner>\n            <% end -%>\n            <OOBE>\n                <HideEULAPage>true</HideEULAPage>\n                <NetworkLocation>Home</NetworkLocation>\n                <ProtectYourPC>1</ProtectYourPC>\n                <SkipUserOOBE>true</SkipUserOOBE>\n                <SkipMachineOOBE>true</SkipMachineOOBE>\n                <HideLocalAccountScreen>true</HideLocalAccountScreen>\n                <HideOEMRegistrationScreen>true</HideOEMRegistrationScreen>\n                <HideOnlineAccountScreens>true</HideOnlineAccountScreens>\n                <HideWirelessSetupInOOBE>true</HideWirelessSetupInOOBE>\n            </OOBE>\n            <ShowWindowsLive>false</ShowWindowsLive>\n            <% if host_param('windowsLicenseKey') -%>\n              <ProductKey><%= host_param('windowsLicenseKey').to_s -%></ProductKey>\n            <% end -%>\n        </component>\n    </settings>\n    <settings pass="specialize">\n        <component name="Microsoft-Windows-International-Core" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n              <InputLocale><%= system_locale %></InputLocale>\n              <SystemLocale><%= system_locale %></SystemLocale>\n              <UILanguageFallback><%= setup_ui_lang %></UILanguageFallback>\n              <UILanguage><%= system_ui_lang %></UILanguage>\n              <UserLocale><%= system_locale %></UserLocale>\n        </component>\n        <component name="Microsoft-Windows-IE-ESC" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <IEHardenAdmin>false</IEHardenAdmin>\n        </component>\n        <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <ComputerName><%= @host.shortname -%></ComputerName>\n            <% if host_param('windowsLicenseOwner') -%>\n              <RegisteredOrganization><%= host_param('windowsLicenseOwner') -%></RegisteredOrganization>\n              <RegisteredOwner><%= host_param('windowsLicenseOwner') -%></RegisteredOwner>\n            <% end -%>\n            <TimeZone><%= system_timezone -%></TimeZone>\n        </component>\n        <component name="Networking-MPSSVC-Svc" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <DomainProfile_EnableFirewall><%= host_param('EnableFirewall', 'true') %></DomainProfile_EnableFirewall>\n            <PrivateProfile_EnableFirewall><%= host_param('EnableFirewall', 'true') %></PrivateProfile_EnableFirewall>\n            <PublicProfile_EnableFirewall><%= host_param('EnableFirewall', 'true') %></PublicProfile_EnableFirewall>\n        </component>\n        <component name="Microsoft-Windows-DNS-Client" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <% if @host.provision_interface.subnet && !@host.provision_interface.subnet.dhcp_boot_mode? -%>\n            <DNSSuffixSearchOrder>\n                <DomainName wcm:action="add" wcm:keyValue="1"><%= @host.domain %></DomainName>\n            </DNSSuffixSearchOrder>\n            <% end -%>\n            <DNSDomain><%= @host.domain %></DNSDomain>\n        </component>\n        <% if host_param('hide_server_manager') -%>\n        <component name="Microsoft-Windows-ServerManager-SvrMgrNc" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <DoNotOpenServerManagerAtLogon>true</DoNotOpenServerManagerAtLogon>\n        </component>\n        <% end -%>\n        <component name="Microsoft-Windows-TerminalServices-LocalSessionManager" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <fDenyTSConnections>false</fDenyTSConnections>\n        </component>\n        <component name="Microsoft-Windows-TerminalServices-RDP-WinStationExtensions" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n            <SecurityLayer>1</SecurityLayer>\n            <UserAuthentication>0</UserAuthentication>\n        </component>\n    </settings>\n    <cpi:offlineImage cpi:source="catalog:c:/deploy/wimaging/sources/win81x64/sources/install_windows 8.1 pro.clg" xmlns:cpi="urn:schemas-microsoft-com:cpi" />\n</unattend>\n	f	6	2025-01-19 19:42:37.821107	2025-01-19 19:42:37.821107	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	A templated answers.xml file for windows installations. This provides all answers to the questions an interactive installation would ask.\nIt supports the following parameters:\n- windowsLicenseKey: ABCDE-ABCDE-ABCDE-ABCDE-ABCDE # Valid Windows license key\n- windowsLicenseOwner: Company, INC # Legal owner of the Windows license key\n- systemLocale: en-US\n- systemUILanguage: en-US\n- systemTimeZone: GMT Standard Time #see https://msdn.microsoft.com/en-us/library/ms912391(v=winembedded.11).aspx\n- wimImageName = Windows 10 Pro # Image name seems only necessary if the WIM contains more than one image	f	\N
65	XenServer default answerfile	<%#\nkind: provision\nname: XenServer default answerfile\nmodel: ProvisioningTemplate\noses:\n- XenServer\ndescription: |\n    The provisioning template for the XenServer or Citrix Hypervisor.\n-%>\n<%\n  subnet = @host.subnet\n  dhcp = subnet.dhcp_boot_mode?\n  interface_name = @host.primary_interface.identifier.blank? ? 'eth0' : @host.primary_interface.identifier\n-%>\n<?xml version="1.0"?>\n<installation mode="fresh" srtype="lvm">\n<%= @host.diskLayout -%>\n  <keymap><%= host_param('keyboard') || 'us' %></keymap>\n  <hostname><%= @host.shortname %></hostname>\n  <root-password type="hash"><%= root_pass %></root-password>\n  <source type="url"><%= @mediapath %></source>\n  <admin-interface name="<%= interface_name %>" proto="<%= dhcp ? 'dhcp' : 'static' %>">\n<% unless dhcp -%>\n    <ip><%= @host.ip %></ip>\n    <subnet-mask><%= subnet.mask %></subnet-mask>\n<% if subnet.gateway.present? -%>\n    <gateway><%= subnet.gateway %></gateway>\n<% end -%>\n<% end -%>\n  </admin-interface>\n<% subnet.dns_servers.each do |nameserver| -%>\n  <name-server><%= nameserver %></name-server>\n<% end -%>\n  <ntp-server><%= host_param('ntp-server') || 'pool.ntp.org' %></ntp-server>\n  <timezone><%= host_param('time-zone') || 'UTC' %></timezone>\n  <time-config-method>ntp</time-config-method>\n  <script stage="installation-complete" type="url">\n    <%= foreman_url('finish') %>\n  </script>\n</installation>\n	f	6	2025-01-19 19:42:37.829904	2025-01-19 19:42:37.829904	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The provisioning template for the XenServer or Citrix Hypervisor.	f	\N
66	foreman_ca_refresh	<%#\nkind: public\nname: foreman_ca_refresh\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\ndescription: |\n  This template is used to refresh foreman CA certificates on Katello-registered hosts\n-%>\n#!/bin/sh\n\n<%= snippet('ca_registration') -%>\n	f	16	2025-01-19 19:42:37.83849	2025-01-19 19:42:37.83849	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used to refresh foreman CA certificates on Katello-registered hosts	f	\N
67	foreman_raw_ca	<%#\nkind: public\nname: foreman_raw_ca\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\ndescription: |\n  This template exposes the CA certificate to be consumed directly from a URL.\n-%>\n<%= foreman_server_ca_cert -%>\n	f	16	2025-01-19 19:42:37.846987	2025-01-19 19:42:37.846987	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template exposes the CA certificate to be consumed directly from a URL.	f	\N
68	Global Registration	<%#\nkind: registration\nname: Global Registration\nmodel: ProvisioningTemplate\ndescription: |\n  The registration template used to render OS agnostic script that any host can use to register to\n  this Foreman instance. It is rendered as a response in the registration API endpoint. The resulting\n  script contains instructions to prepare the machine for registration, to create a new Host record in Foreman,\n  and to fetch and run the host specific initial configuration script. The initial script is rendered based\n  on the template of host_init_config kind.\n-%>\n#!/bin/sh\n\n# Make sure, all command output can be parsed (e.g. from subscription-manager)\nexport LC_ALL=C LANG=C\n<%\n    headers = ["-H 'Authorization: Bearer #{@auth_token}'"]\n    activation_keys = [(@hostgroup.params['kt_activation_keys'] if @hostgroup), @activation_keys].compact.join(',')\n-%>\n\n# Rendered with following template parameters:\n<%= "# User: [#{@user.login}]" if @user -%>\n<%= "\\n# Organization: [#{@organization.name}]" if @organization -%>\n<%= "\\n# Location: [#{@location.name}]" if @location -%>\n<%= "\\n# Host group: [#{@hostgroup.title}]" if @hostgroup -%>\n<%= "\\n# Operating system: [#{@operatingsystem}]" if @operatingsystem -%>\n<%= "\\n# Setup Insights: [#{@setup_insights}]" unless @setup_insights.nil? -%>\n<%= "\\n# Setup remote execution: [#{@setup_remote_execution}]" unless @setup_remote_execution.nil? -%>\n<%= "\\n# Setup remote execution pull: [#{@setup_remote_execution_pull}]" unless @setup_remote_execution_pull.nil? -%>\n<%= "\\n# Remote execution interface: [#{@remote_execution_interface}]" if @remote_execution_interface.present? -%>\n<%= "\\n# Packages: [#{@packages}]" if @packages.present? -%>\n<%= "\\n# Update packages: [#{@update_packages}]" unless @update_packages.nil? -%>\n<%= "\\n# Repository data: [#{@repo_data}]" if @repo_data.present? -%>\n<%= "\\n# Force: [#{@force}]" unless @force.nil? -%>\n<%= "\\n# Ignore subman errors: [#{@ignore_subman_errors}]" unless @ignore_subman_errors.nil? -%>\n<%= "\\n# Lifecycle environment id: [#{@lifecycle_environment_id}]" if @lifecycle_environment_id.present? -%>\n<%= "\\n# Activation keys: [#{activation_keys}]" if activation_keys.present? -%>\n\n\nif ! [ $(id -u) = 0 ]; then\n  echo "Please run as root"\n  exit 1\nfi\n\n# Select package manager for the OS (sets the $PKG_MANAGER* variables)\n<%= snippet 'pkg_manager' %>\n\nSSL_CA_CERT=$(mktemp)\ncat << EOF > $SSL_CA_CERT\n<%= foreman_server_ca_cert %>\nEOF\n\ncleanup_and_exit() {\n  rm -f $SSL_CA_CERT\n  exit $1\n}\n\n<%= snippet_if_exists('before_registration') -%>\n\n<% unless @repo_data.blank? -%>\n<% index = 0 %>\n<% @repo_data.each do |repo, repo_gpg_key_url| -%>\necho '#'\necho '# Adding repository'\necho '#'\n\n<% index += 1 %>\nif [ x$PKG_MANAGER = xdnf -o x$PKG_MANAGER = xyum -o x$PKG_MANAGER = xzypper ]; then\n  cat << EOF > /tmp/foreman_registration.repo\n[foreman_register<%= index %>]\nname=foreman_register<%= index %>\nbaseurl=<%= shell_escape repo %>\nenabled=1\ntype=rpm-md\nEOF\n<% if repo_gpg_key_url.present? -%>\n  echo gpgcheck=1 >> /tmp/foreman_registration.repo\n  echo gpgkey=<%= shell_escape repo_gpg_key_url %> >> /tmp/foreman_registration.repo\n<% else -%>\n  echo gpgcheck=0 >> /tmp/foreman_registration.repo\n<% end -%>\n  if [ x$PKG_MANAGER = xdnf -o x$PKG_MANAGER = xyum ]; then\n    mv -f /tmp/foreman_registration.repo /etc/yum.repos.d/foreman_registration<%= index %>.repo\n    echo "Building yum metadata cache, this may take a few minutes"\n    $PKG_MANAGER makecache\n  else\n    zypper --quiet --non-interactive addrepo /tmp/foreman_registration.repo\n  fi\nelif [ -f /etc/debian_version ]; then\n  <%= save_to_file("/etc/apt/sources.list.d/foreman_registration#{index}.list", repo) %>\n<% if repo_gpg_key_url.present? -%>\n<%# "apt 1.2.35" on Ubuntu 16.04 does not support storing GPG public keys in "/etc/apt/trusted.gpg.d/" in ASCII format -%>\n  if [ "$(. /etc/os-release ; echo "$VERSION_ID")" = "16.04" ]; then\n    $PKG_MANAGER_INSTALL ca-certificates curl gnupg\n    curl --silent --show-error <%= shell_escape repo_gpg_key_url %> | gpg --dearmor > /etc/apt/trusted.gpg.d/client<%= index %>.gpg\n  else\n    $PKG_MANAGER_INSTALL ca-certificates curl\n    curl --silent --show-error --output /etc/apt/trusted.gpg.d/client<%= index %>.asc <%= shell_escape repo_gpg_key_url %>\n  fi\n<% end -%>\n  apt-get update\n\nelse\n  echo "Unsupported operating system, can't add repository."\n  cleanup_and_exit 1\nfi\n<% end -%>\n<% end -%>\n\nregister_host() {\n  curl --silent --show-error --cacert $SSL_CA_CERT --request POST <%= @registration_url %> \\\n       <%= headers.join(' ') %> \\\n       --data "host[name]=$(hostname --fqdn)" \\\n       --data "host[build]=false" \\\n       --data "host[managed]=false" \\\n<%= "       --data 'host[organization_id]=#{@organization.id}' \\\\\\n" if @organization -%>\n<%= "       --data 'host[location_id]=#{@location.id}' \\\\\\n" if @location -%>\n<%= "       --data 'host[hostgroup_id]=#{@hostgroup.id}' \\\\\\n" if @hostgroup -%>\n<%= "       --data 'host[operatingsystem_id]=#{@operatingsystem.id}' \\\\\\n" if @operatingsystem -%>\n<%= "       --data host[interfaces_attributes][0][identifier]=#{shell_escape(@remote_execution_interface)} \\\\\\n" if @remote_execution_interface.present? -%>\n<%= "       --data 'setup_insights=#{@setup_insights}' \\\\\\n" unless @setup_insights.nil? -%>\n<%= "       --data 'setup_remote_execution=#{@setup_remote_execution}' \\\\\\n" unless @setup_remote_execution.nil? -%>\n<%= "       --data remote_execution_interface=#{shell_escape(@remote_execution_interface)} \\\\\\n" if @remote_execution_interface.present? -%>\n<%= "       --data packages=#{shell_escape(@packages)} \\\\\\n" if @packages.present? -%>\n<%= "       --data 'update_packages=#{@update_packages}' \\\\\\n" unless @update_packages.nil? -%>\n\n}\n\necho "#"\necho "# Running registration"\necho "#"\n\n<% if plugin_present?('katello') && activation_keys.present? -%>\nregister_katello_host(){\n    UUID=$(subscription-manager identity | grep --max-count 1 --only-matching '\\([[:xdigit:]]\\{8\\}-[[:xdigit:]]\\{4\\}-[[:xdigit:]]\\{4\\}-[[:xdigit:]]\\{4\\}-[[:xdigit:]]\\{12\\}\\)')\n    curl --silent --show-error --cacert $KATELLO_SERVER_CA_CERT --request POST "<%= @registration_url %>" \\\n         <%= headers.join(' ') %> \\\n         --data "uuid=$UUID" \\\n         --data "host[build]=false" \\\n<%= "      --data 'host[organization_id]=#{@organization.id}' \\\\\\n" if @organization -%>\n<%= "      --data 'host[location_id]=#{@location.id}' \\\\\\n" if @location -%>\n<%= "      --data 'host[hostgroup_id]=#{@hostgroup.id}' \\\\\\n" if @hostgroup -%>\n<%= "      --data 'host[lifecycle_environment_id]=#{@lifecycle_environment_id}' \\\\\\n" if @lifecycle_environment_id.present? -%>\n<%= "      --data 'setup_insights=#{@setup_insights}' \\\\\\n" unless @setup_insights.nil? -%>\n<%= "      --data 'setup_remote_execution=#{@setup_remote_execution}' \\\\\\n" unless @setup_remote_execution.nil? -%>\n<%= "      --data remote_execution_interface=#{shell_escape(@remote_execution_interface)} \\\\\\n" if @remote_execution_interface.present? -%>\n<%= "      --data 'setup_remote_execution_pull=#{@setup_remote_execution_pull}' \\\\\\n" unless @setup_remote_execution_pull.nil? -%>\n<%= "      --data packages=#{shell_escape(@packages)} \\\\\\n" if @packages.present? -%>\n<%= "      --data 'update_packages=#{@update_packages}' \\\\\\n" unless @update_packages.nil? -%>\n\n}\n\n# Set up subscription-manager\n<%= snippet("subscription_manager_setup", variables: { subman_setup_scenario: 'registration' }).strip -%>\n\nsubscription-manager register <%= '--force' if truthy?(@force) %> \\\n  --org='<%= @organization.label if @organization %>' \\\n  --activationkey='<%= activation_keys %>' || <%= truthy?(@ignore_subman_errors) ? 'true' : 'cleanup_and_exit 1' %>\n\nregister_katello_host | bash\n<% else -%>\nregister_host | bash\n<% end -%>\n\n<%= snippet_if_exists('after_registration') -%>\n\ncleanup_and_exit\n	f	13	2025-01-19 19:42:37.855392	2025-01-19 19:42:37.855392	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The registration template used to render OS agnostic script that any host can use to register to\nthis Foreman instance. It is rendered as a response in the registration API endpoint. The resulting\nscript contains instructions to prepare the machine for registration, to create a new Host record in Foreman,\nand to fetch and run the host specific initial configuration script. The initial script is rendered based\non the template of host_init_config kind.	f	\N
69	remote_execution_pull_setup	<%#\nkind: snippet\nname: remote_execution_pull_setup\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Snippet for installing and setting up a client to be reachable by remote execution in pull mode\n-%>\n\necho "Starting deployment of REX pull provider"\n# check if system is registered\nsubscription-manager identity > /dev/null\nif [ $? -ne 0 ]; then\n    echo "Please register with subscription-manager first, then re-run '$0'."\n    exit 1\nfi\n\nset -e\n\n<%= install_packages('foreman_ygg_worker') %>\n\necho "Getting configuration from subscription-manager..."\nKPPTEMPFILE=$(mktemp kpp_tempfile_XXXXXXXX)\ntrap "rm -f $KPPTEMPFILE" EXIT\nsubscription-manager config --list > $KPPTEMPFILE\nCONSUMER_CERT_DIR=$(grep 'consumercertdir' $KPPTEMPFILE | cut -d= -f2 | xargs | sed 's/[][]//g')\nCERT_FILE=$CONSUMER_CERT_DIR/cert.pem\nKEY_FILE=$CONSUMER_CERT_DIR/key.pem\nCA_FILE=$(grep 'repo_ca_cert = ' $KPPTEMPFILE | cut -d= -f2 | xargs | cut -d ' ' -f1)\nSERVER_NAME=$(grep 'hostname = ' $KPPTEMPFILE | cut -d= -f2 | xargs | cut -d ' ' -f1)\n\n# fail if no server name, cert dir, or ca file\nif [ -z "$SERVER_NAME" ] || [ -z "$CONSUMER_CERT_DIR" ] || [ -z "$CA_FILE" ]; then\n    echo "Unable to determine config from 'subscription-manager config --list'; exiting"\n    exit 1\nfi\n\n# fail if client is not registered to a Katello\nif ! grep -q 'prefix = \\/rhsm' $KPPTEMPFILE; then\n    echo "Client is registered to RHSM; exiting"\n    exit 1\nfi\n\n# set SYSCONFDIR to /etc if it is not set\nif [ -z "$SYSCONFDIR" ]; then\n    SYSCONFDIR=/etc\nfi\n\n# see if /etc/yggdrasil/config.toml exists\nCONFIGTOML=$SYSCONFDIR/yggdrasil/config.toml\nif [ -f $CONFIGTOML ]; then\n    # make a backup of CONFIGTOML\n    cp $CONFIGTOML $CONFIGTOML.bak\n    cat <<EOF > $CONFIGTOML\n# yggdrasil global configuration settings written by katello-pull-transport-migrate\nbroker = ["mqtts://$SERVER_NAME:1883"]\ncert-file = "$CERT_FILE"\nkey-file = "$KEY_FILE"\nca-root = ["$CA_FILE"]\nlog-level = "error"\nEOF\n\nelse\n    echo "$SYSCONFDIR/yggdrasil/config.toml not found! Did 'yum install yggdrasil' succeed?"\n    exit 1\nfi\n\n# start the yggdrasild service\nif systemctl is-enabled yggdrasild 2>/dev/null && [ -n "$YGGDRASIL_RESTART_DELAY" ] && [ "$YGGDRASIL_RESTART_DELAY" -gt 0 ]; then\n    systemd-run --on-active="$YGGDRASIL_RESTART_DELAY" --collect --no-block systemctl restart yggdrasild\nelse\n    echo "Starting yggdrasild..."\n    systemctl try-restart yggdrasild\n    systemctl enable --now yggdrasild\n\n    # check status of yggdrasild and fail if it is not running\n    # possible failure reason: incorrect protocol (should be tcp:// or mqtt://) or port (should be 1883)\n    # also, cert-file and key-file must be valid\n    # and broker must be running on the server\n    yggdrasil status\n\n    if ! systemctl is-active --quiet yggdrasild; then\n        echo ""\n        echo "yggdrasild failed to start! Check configuration in $CONFIGTOML and make sure the broker is running on the server."\n        exit $?\n    fi\nfi\n\necho "Remote execution pull provider successfully configured!"\n	t	\N	2025-01-19 19:42:37.873298	2025-01-19 19:42:37.873298	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Snippet for installing and setting up a client to be reachable by remote execution in pull mode	f	\N
70	Grubby default	#!/bin/bash\n<%#\nkind: script\nname: Grubby default\nmodel: ProvisioningTemplate\ndescription: |\n  Script that can be manually downloaded to a server to reprovision it without booting from network.\n  Grubby compatibility package must be installed. WARNING: It will immediately reconfigure\n  bootloader and reprovision the node.\n  \n  Usage:\n  curl https://foreman/unattended/script -o reprovision.sh\n  bash reprovision.sh\n  reboot\n-%>\n\nKERNEL="/boot/kernel"\nINITRD="/boot/initrd.img"\n\nwget -O "$KERNEL" "<%= @host.url_for_boot(:kernel) %>"\nwget -O "$INITRD" "<%= @host.url_for_boot(:initrd) %>"\n\ngrubby --add-kernel=$KERNEL --initrd=$INITRD  --copy-default --title "<%= @host.operatingsystem %>" --make-default  --args="inst.ks=<%= foreman_url('provision')%>"\n	f	8	2025-01-19 19:42:37.88134	2025-01-19 19:42:37.88134	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Script that can be manually downloaded to a server to reprovision it without booting from network.\nGrubby compatibility package must be installed. WARNING: It will immediately reconfigure\nbootloader and reprovision the node.\n\nUsage:\ncurl https://foreman/unattended/script -o reprovision.sh\nbash reprovision.sh\nreboot	f	\N
71	Windows peSetup.cmd	<%#\nkind: script\nname: Windows peSetup.cmd\nmodel: ProvisioningTemplate\noses:\n- Windows\ntest_on:\n- windows10_dhcp\ndescription: |\n  The provisioning template used for Windows\n  You can create and assign a "user_data" ProvisioningTemplate as powershell to execute some custom code\n  See https://community.theforeman.org/t/windows-provisioning-made-easy/16756/\n  params:\n  - wimImageName: Windows 8.1 Pro # name of wim image to apply\n  - windowsLicenseKey: ABCDE-ABCDE-ABCDE-ABCDE-ABCDE # Valid Windows license key\n  - windowsLicenseOwner: Company, INC # Legal owner of the Windows license key\n-%>\n<%\n  iface = @host.provision_interface\n  proxy_uri = host_param('http-proxy') ? "#{host_param('http-proxy')}:#{host_param('http-proxy-port', 3128)}" : nil\n  proxy_string = proxy_uri ? "-e http_proxy=#{proxy_uri}" : ''\n%>\n@setlocal enableextensions enabledelayedexpansion\n@echo off\nset WGET=wget64.exe\n\n<%= @host.diskLayout %>\n\n\n<% if iface.subnet && !iface.subnet.dhcp_boot_mode? -%>\necho Setting network config for static interfaces\n    netsh interface ip set address name="Ethernet0" static "<%= iface.ip %>" "<%= iface.subnet.mask %>" "<%= iface.subnet.gateway %>"\n    net stop "DHCP-Client"\n    net stop "DHCP Client"\n    net start "DNS-Client"\n    net start "DNS Client"\n    ping -n "<%= iface.subnet.gateway %>"\n    netsh interface ip set dns name="Ethernet0" static "<%= iface.subnet.dns_primary %>"\n<% end -%>\n\necho Downloading main WIM\n\n%WGET% <%= proxy_string %> "<%= medium_uri %>sources/images.ini" -O X:\\images.ini\nif %ERRORLEVEL% == 0 goto :lookup_image\n\necho WARNING: Couldn't download the images.ini, falling back to legacy mode!\n%WGET% <%= proxy_string %> "<%= medium_uri %>sources/install.wim" -O C:\\install.wim\ngoto :install\n\n:lookup_image\nset file=X:\\images.ini\nset key=<%= host_param('wimImageName') %>\nfor /f "usebackq delims=" %%a in ("!file!") do (\n\tset ln=%%a\n        for /f "tokens=1,2 delims==" %%b in ("!ln!") do (\n            set currkey=%%b\n            set currval=%%c\n            if "x!key!"=="x!currkey!" (\n                %WGET% <%= proxy_string %> <%= medium_uri %>sources/!currval! -O C:\\install.wim\n            )\n        )\n    )\n)\n\n:install\necho Writing install image to partition while downloading additional files\n\n(\n   start /min cmd /C "echo Writing the install image to the partition\n                dism.exe /apply-image /imagefile:C:\\install.wim /Name:"<%= host_param('wimImageName') %>" /ApplyDir:C:\\\n                echo Removing install.wim\n                del /q /s C:\\install.wim"\n   start /min cmd /C "echo Downloading the drivers\n                md c:\\drivers\n                %WGET% <%= proxy_string %> -P c:\\drivers -r -np -nH --cut-dirs=3 -R index.html -q --level=0 <%= medium_uri %>/drivers/"\n   start /min cmd /C "echo Downloading additional updates\n                md c:\\updates\n                %WGET% <%= proxy_string %> -P c:\\updates\\ -r -np -nH --cut-dirs=3 -R index.html -q --level=0 <%= medium_uri %>/updates/"\n   start /min cmd /C "echo Downloading finsh script and activating SetupComplete.cmd\n                md c:\\deploy\n                %WGET% --no-verbose <%= foreman_url("finish") -%> -O C:\\deploy\\foreman-finish.bat"\n) | pause\n\necho Creating a temp staging folder for DISM\nmd c:\\MININT\\Scratch\n\necho Creating the Panther directory if needed\nset PantherDirectory=C:\\Windows\\Panther\\\nIF not exist %PantherDirectory% (mkdir %PantherDirectory%)\n\necho Finalizing installation...\n\necho Downloading custom theme\n%WGET% <%= proxy_string %> -P C:\\Windows\\Web\\ -r -np -nH --cut-dirs=3 -R index.html -q --level=0 "<%= medium_uri %>/theme/"\n\necho Staging the Unattend.xml file for dism to apply\necho Downloading unattend.xml\n%WGET% --no-verbose <%= foreman_url("provision") -%> -O c:\\Windows\\Panther\\unattend.xml\necho Applying Unattend.xml\ndism.exe /Image:C:\\ /Apply-Unattend:C:\\Windows\\Panther\\unattend.xml /ScratchDir:C:\\MININT\\Scratch/\n\necho Copying tools\ncopy x:\\windows\\system32\\wget64.exe C:\\deploy\\\ncopy x:\\windows\\system32\\wget64.exe C:\\Windows\\wget.exe\ncopy x:\\windows\\system32\\sdelete.exe C:\\Windows\\\nIF not exist C:\\Windows\\Setup\\Scripts (md C:\\Windows\\Setup\\Scripts)\necho call C:\\deploy\\foreman-finish.bat ^> c:\\foreman.log 2^>^&1 > C:\\Windows\\Setup\\Scripts\\SetupComplete.cmd\n\n<% unless host_param('foremanDebug') -%>\nsdelete.exe -accepteula -p 2 c:\\foreman.log\n<% end -%>\n\necho Applying drivers\ndism.exe /Image:C:\\ /Add-Driver /Driver:C:\\drivers\\ /Recurse /ForceUnsigned\n\necho Applying updates\nfor /f %%u in ('dir /s/b C:\\updates\\*.msu') do dism.exe /Image:C:\\ /Add-Package /PackagePath:%%u /ScratchDir:C:\\MININT\\Scratch/\n\necho Setting the boot sector\nbootsect.exe /nt60 C:\nC:\\Windows\\System32\\bcdboot C:\\Windows /l en-US\n\necho Foreman build has finished\n%WGET% <%= foreman_url('built') %>\n\nexit 0\n	f	8	2025-01-19 19:42:37.890029	2025-01-19 19:42:37.890029	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The provisioning template used for Windows\nYou can create and assign a "user_data" ProvisioningTemplate as powershell to execute some custom code\nSee https://community.theforeman.org/t/windows-provisioning-made-easy/16756/\nparams:\n- wimImageName: Windows 8.1 Pro # name of wim image to apply\n- windowsLicenseKey: ABCDE-ABCDE-ABCDE-ABCDE-ABCDE # Valid Windows license key\n- windowsLicenseOwner: Company, INC # Legal owner of the Windows license key	f	\N
72	alterator_pkglist	<%#\nkind: snippet\nname: alterator_pkglist\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Fetches the list of packages from the ALTLinux installation media.\n  It is used by the ALTLinux provisioning templates.\n  This template will not function with Safemode set to true.\n-%>\n<%= Net::HTTP.get(URI.parse("#{@mediapath}/Metadata/pkg-groups.tar")) %>\n	t	\N	2025-01-19 19:42:37.899283	2025-01-19 19:42:37.899283	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Fetches the list of packages from the ALTLinux installation media.\nIt is used by the ALTLinux provisioning templates.\nThis template will not function with Safemode set to true.	f	\N
73	ansible_provisioning_callback	<%#\nkind: snippet\nname: ansible_provisioning_callback\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Setups the one time run of the Ansible Tower / AWX callback script on a host.\n  Supports only RPM based distributions. It is only used if the host param "ansible_tower_provisioning"\n  is set to true. The actual callback script content is stored in the "ansible_tower_callback_script"\n  snippet.\n\n  See https://docs.theforeman.org/nightly/Configuring_Ansible/index-foreman-el.html#provisioning-a-callback-for-a-host_ansible for more details\n-%>\n<% if host_param_true?('ansible_tower_provisioning') -%>\n<%\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  os_major = @host.operatingsystem.major.to_i\n  has_systemd = (@host.operatingsystem.name == 'Fedora' && os_major >= 20) || (rhel_compatible && os_major >= 7) || (@host.operatingsystem.name == 'Ubuntu' && os_major >= 15) || (@host.operatingsystem.name == 'Debian' && os_major >= 8)\n-%>\n<% if has_systemd -%>\n<%= save_to_file('/etc/systemd/system/ansible-callback.service',\n                 snippet('ansible_tower_callback_service')) %>\n# Runs during first boot, removes itself\nsystemctl enable ansible-callback\n<% else -%>\n# Assume systemd is not available\n<%= save_to_file('/root/ansible_provisioning_call.sh', snippet('ansible_tower_callback_script')) %>\n(chmod +x /root/ansible_provisioning_call.sh; crontab -u root -l 2>/dev/null; echo "@reboot /root/ansible_provisioning_call.sh" ) | crontab -u root -\n<% end -%>\n<% end -%>\n	t	\N	2025-01-19 19:42:37.908362	2025-01-19 19:42:37.908362	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Setups the one time run of the Ansible Tower / AWX callback script on a host.\nSupports only RPM based distributions. It is only used if the host param "ansible_tower_provisioning"\nis set to true. The actual callback script content is stored in the "ansible_tower_callback_script"\nsnippet.\n\nSee https://docs.theforeman.org/nightly/Configuring_Ansible/index-foreman-el.html#provisioning-a-callback-for-a-host_ansible for more details	f	\N
74	ansible_tower_callback_script	<%#\nkind: snippet\nname: ansible_tower_callback_script\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  The script that calls to the Ansible Tower / AWX to trigger a job on the host. Typically used\n  during provisioning to trigger one Ansible run on newly provisioned host.\n-%>\n#!/bin/sh\n\necho "Calling Ansible AWX/Tower provisioning callback..."\n<% if host_param('ansible_extra_vars') -%>\n/usr/bin/curl -v -k -s -H 'Content-Type: application/json' --data '{"host_config_key":"<%= host_param('ansible_host_config_key') %>", "extra_vars": <%=host_param('ansible_extra_vars') %>}' https://<%= host_param('ansible_tower_fqdn') %>/api/v2/job_templates/<%= host_param('ansible_job_template_id') %>/callback/\n<% else -%>\n/usr/bin/curl -v -k -s --data "host_config_key=<%= host_param('ansible_host_config_key') %>" https://<%= host_param('ansible_tower_fqdn') %>/api/v2/job_templates/<%= host_param('ansible_job_template_id') %>/callback/\n<% end -%>\necho "DONE"\n	t	\N	2025-01-19 19:42:37.917545	2025-01-19 19:42:37.917545	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The script that calls to the Ansible Tower / AWX to trigger a job on the host. Typically used\nduring provisioning to trigger one Ansible run on newly provisioned host.	f	\N
152	Preseed default autoinstall encrypted	<%#\nkind: ptable\nname: Preseed default autoinstall encrypted\nmodel: Ptable\ndescription: |\n  Preseed Autoinstall default storage snippet configures drives automatically\n  with LVM and disk encryption.\n  Requires Ubuntu >= 22.04.3.\n  The snippet is automatically indented by 2 spaces. For reference:\n  https://ubuntu.com/server/docs/install/autoinstall-reference\noses:\n- Ubuntu\n%>\nstorage:\n  layout:\n    name: lvm\n    password: <%= host_param('disk_enc_passphrase', 'linux') %>\n	f	\N	2025-01-19 19:42:38.636008	2025-01-19 19:42:38.636008	t	t	Foreman	Ptable	Debian	Miscellaneous	\N	\N	\N	Preseed Autoinstall default storage snippet configures drives automatically\nwith LVM and disk encryption.\nRequires Ubuntu >= 22.04.3.\nThe snippet is automatically indented by 2 spaces. For reference:\nhttps://ubuntu.com/server/docs/install/autoinstall-reference	f	\N
75	ansible_tower_callback_service	<%#\nkind: snippet\nname: ansible_tower_callback_service\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  The content of a systemd service for running Ansible Tower / AWX callback script one-time.\n  Used in the ansible_provisioning_callback snippet for systemd enabled systems.\n-%>\n[Unit]\nDescription=Provisioning callback to Ansible Tower\nWants=network-online.target\nAfter=network-online.target\n\n[Service]\nType=oneshot\n<% if host_param('ansible_extra_vars') -%>\nExecStart=/usr/bin/curl -k -s -H 'Content-Type: application/json' --data '{"host_config_key":"<%= host_param('ansible_host_config_key') %>", "extra_vars": <%=host_param('ansible_extra_vars') %>}' https://<%= host_param('ansible_tower_fqdn') %>/api/v2/job_templates/<%= host_param('ansible_job_template_id') %>/callback/\n<% else -%>\nExecStart=/usr/bin/curl -k -s --data "host_config_key=<%= host_param('ansible_host_config_key') -%>" https://<%= host_param('ansible_tower_fqdn') -%>/api/v2/job_templates/<%= host_param('ansible_job_template_id') -%>/callback/\n<% end -%>\nExecStartPost=/usr/bin/systemctl disable ansible-callback\n\n[Install]\nWantedBy=multi-user.target\n	t	\N	2025-01-19 19:42:37.926684	2025-01-19 19:42:37.926684	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The content of a systemd service for running Ansible Tower / AWX callback script one-time.\nUsed in the ansible_provisioning_callback snippet for systemd enabled systems.	f	\N
76	blacklist_kernel_modules	<%#\nkind: snippet\nname: blacklist_kernel_modules\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n    The snippet to generate the command disables kernel modules based on the blacklist_kernel_modules\n    host parameter. It is used by multiple provisioning and finish templates.\n-%>\n<% if host_param('blacklist_kernel_modules') -%>\n<% host_param('blacklist_kernel_modules').split.each do |mod| -%>\necho "blacklist <%= mod %>" >> /etc/modprobe.d/blacklist.conf\n<% end -%>\n<% end -%>\n	t	\N	2025-01-19 19:42:37.935866	2025-01-19 19:42:37.935866	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The snippet to generate the command disables kernel modules based on the blacklist_kernel_modules\nhost parameter. It is used by multiple provisioning and finish templates.	f	\N
77	bmc_nic_setup	<%#\nkind: snippet\nname: bmc_nic_setup\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  This snippet configure BMC interfaces.\n  At this time, only IPMI provider is supported.\n  It was tested on some Dell hardware with CentOS 6 - CentOS 7 and should be compatible with respective\n  upstream RHEL versions.\n\n  What this snippet does:\n  * Configure the networking part of the interface (ipaddr, netmask, ip gateway or dhcp)\n\n  * Set the authentication mechanism to 'MD5' for the used privilege level\n\n  * Create or Update the provided user with provided privileges level. ADMINISTRATOR privilege level is used by default\n    because ipmitool utility request ADMINISTRATOR privileges level if no privilege level is provided.\n    If you want to use a lower level of privileges (like OPERATOR), don't forget to add the privilege level to request\n    with your ipmi command (eg: ipmitool -I lanplus -L operator -U user1 -H 192.168.1.2 chassis status).\n\n  * Enable the user created/updated\n\n  What this snippet doesn't do:\n  * Set/Update the VLAN tag on the BMC interface because this configuration depends on the switch port configuration\n    and the 'ipmitool lan set <channel> vlan id <off|<id>>' command don't work on all Dell hardware tested.\n\n  host_params:\n  * bmc_ipmi_priv_level: Privilege level to use for the ipmi user.\n                         'ADMINISTRATOR' is used by default if not provided.\n  * bmc_ipmi_auth_method: Channel authentication types. Possible values: NONE, MD2, MD4, MD5, PASSWORD.\n                          'MD5' is used by default if not provided.\n  * bmc_ipmi_channel_id: Channel ID for the IPMI configuration.\n\n\n  How to test configuration result:\n  * From a remote host that can reach the current IPMI interface, install ipmitool utilities and type the following command:\n    ipmitool -I <interface> -L <privilege_level> -U <user> -H <host> chassis status\n-%>\n<%\nbmc_nic = @host.bmc_nic\n\nprivilege_levels = {'ADMINISTRATOR' => 4, 'OPERATOR' => 3}\nuser_privilege_level = host_param('bmc_ipmi_priv_level') || 'ADMINISTRATOR'\nauth_method = host_param('bmc_ipmi_auth_method') || 'MD5'\nchannel_id = host_param('bmc_ipmi_channel_id') || '1'\n\nos_family = @host.operatingsystem.family\n%>\n\n<% if bmc_nic && bmc_nic.managed? && bmc_nic.provider == "IPMI" && !bmc_nic.username.empty?  && !bmc_nic.password.empty? -%>\n\n# Configure BMC interface\n<% if os_family == 'Redhat' %>\nif [ -f /usr/bin/dnf ]; then\n  dnf -y install ipmitool\nelse\n  yum -t -y install ipmitool\nfi\n<% elsif os_family == 'Freebsd' %>\npkg install -y ipmitool\n<% elsif os_family == 'Debian' %>\napt-get update\napt-get install -y ipmitool\n<% end %>\n\n<% if bmc_nic.subnet.dhcp_boot_mode? -%>\nipmitool lan set <%= channel_id %> ipsrc dhcp\n<% else -%>\nipmitool lan set <%= channel_id %> ipsrc static\nipmitool lan set <%= channel_id %> ipaddr <%= bmc_nic.ip %>\nipmitool lan set <%= channel_id %> netmask <%= bmc_nic.subnet.mask %>\nipmitool lan set <%= channel_id %> defgw ipaddr <%= bmc_nic.subnet.gateway %>\n<% end -%>\n\nipmitool lan set <%= channel_id %> auth <%= user_privilege_level %> <%= auth_method %>\nipmitool lan set <%= channel_id %> arp respond on\nipmitool lan set <%= channel_id %> access on\n\n# Provided user exist, get his ID\nif ipmitool user list <%= channel_id %> | grep -m 1 -E '[[:blank:]]<%= bmc_nic.username %>[[:blank:]]' >/dev/null 2>&1; then\n  ipmi_user_id=$(ipmitool user list <%= channel_id %> | grep -m 1 -E '[[:blank:]]<%= bmc_nic.username %>[[:blank:]]' | cut -d ' ' -f1)\n# provided user don't exist, get the next free ID and create a new user.\nelse\n  ipmi_user_id=$[$(ipmitool user list <%= channel_id %> | tail -n 1 | cut -d ' ' -f1)+1]\n  ipmitool user set name ${ipmi_user_id} <%= bmc_nic.username %>\nfi\n\nipmitool user set password ${ipmi_user_id} <%= bmc_nic.password %>\nipmitool channel setaccess <%= channel_id %> ${ipmi_user_id} link=on ipmi=on callin=on privilege=<%= privilege_levels[user_privilege_level] %>\nipmitool user enable ${ipmi_user_id}\n<% end -%>\n	t	\N	2025-01-19 19:42:37.945023	2025-01-19 19:42:37.945023	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This snippet configure BMC interfaces.\nAt this time, only IPMI provider is supported.\nIt was tested on some Dell hardware with CentOS 6 - CentOS 7 and should be compatible with respective\nupstream RHEL versions.\n\nWhat this snippet does:\n* Configure the networking part of the interface (ipaddr, netmask, ip gateway or dhcp)\n\n* Set the authentication mechanism to 'MD5' for the used privilege level\n\n* Create or Update the provided user with provided privileges level. ADMINISTRATOR privilege level is used by default\n  because ipmitool utility request ADMINISTRATOR privileges level if no privilege level is provided.\n  If you want to use a lower level of privileges (like OPERATOR), don't forget to add the privilege level to request\n  with your ipmi command (eg: ipmitool -I lanplus -L operator -U user1 -H 192.168.1.2 chassis status).\n\n* Enable the user created/updated\n\nWhat this snippet doesn't do:\n* Set/Update the VLAN tag on the BMC interface because this configuration depends on the switch port configuration\n  and the 'ipmitool lan set <channel> vlan id <off|<id>>' command don't work on all Dell hardware tested.\n\nhost_params:\n* bmc_ipmi_priv_level: Privilege level to use for the ipmi user.\n                       'ADMINISTRATOR' is used by default if not provided.\n* bmc_ipmi_auth_method: Channel authentication types. Possible values: NONE, MD2, MD4, MD5, PASSWORD.\n                        'MD5' is used by default if not provided.\n* bmc_ipmi_channel_id: Channel ID for the IPMI configuration.\n\n\nHow to test configuration result:\n* From a remote host that can reach the current IPMI interface, install ipmitool utilities and type the following command:\n  ipmitool -I <interface> -L <privilege_level> -U <user> -H <host> chassis status	f	\N
78	built	<%#\nkind: snippet\nname: built\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Sends 'built' request to exit build mode for the host, that finished the provisioning.\n  Used from most of provisioning and finish templates.\n  Only use in multi-line shell context.\n  Tries curl, if not found then wget and finally wget from busybox (limited options).\n-%>\n<%\n  endpoint = @endpoint || 'built'\n  method = @method || 'POST'\n  url = foreman_url(endpoint)\n  built_https = url.start_with?('https')\n  curl_opts = ["-H 'Content-Type: text/plain'"]\n  wget_opts = ["--header 'Content-Type: text/plain'"]\n  if @body_file\n    curl_opts << "--data @#{@body_file}"\n    wget_opts << "--body-file=#{@body_file}"\n  elsif @post_data\n    curl_opts << "--data '#{@post_data}'"\n    wget_opts << "--body-data='#{@post_data}'"\n  end\n-%>\n<% if built_https -%>\nSSL_CA_CERT=$(mktemp)\ncat << EOF > $SSL_CA_CERT\n<%= foreman_server_ca_cert %>\nEOF\n<%\n  curl_opts << "--cacert $SSL_CA_CERT"\n  wget_opts << "--ca-certificate $SSL_CA_CERT"\n-%>\n<% end -%>\nif [ -x /usr/bin/curl ]; then\n  /usr/bin/curl -o /dev/null --noproxy \\* <%= curl_opts.join(' ') %> --silent '<%= url %>'\nelif [ -x /usr/bin/wget ]; then\n  /usr/bin/wget -q -O /dev/null --no-proxy --method <%= method %> <%= wget_opts.join(' ') %> '<%= url %>'\nelse\n  wget -q -O /dev/null --header 'Content-Type: text/plain' '<%= url %>'\nfi\n\nif [ -x "$(command -v subscription-manager)" ] ; then\n  subscription-manager facts --update\nfi\n	t	\N	2025-01-19 19:42:37.95661	2025-01-19 19:42:37.95661	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Sends 'built' request to exit build mode for the host, that finished the provisioning.\nUsed from most of provisioning and finish templates.\nOnly use in multi-line shell context.\nTries curl, if not found then wget and finally wget from busybox (limited options).	f	\N
79	ca_registration	<%#\nkind: snippet\nname: ca_registration\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  This template is used for updating Foreman's CA on hosts that are registered by Katello.\n  It replaces the CA used by subscription-manager and adds the CA to trusted anchors.\n-%>\n\n<% if plugin_present?('katello') -%>\n  # Define the path to the Katello server CA certificate\n  KATELLO_SERVER_CA_CERT=/etc/rhsm/ca/katello-server-ca.pem\n\n  # If katello ca cert file exists on host, update it and make sure it's in trust anchors\n  if [ -f "$KATELLO_SERVER_CA_CERT" ]; then\n    <%= save_to_file('"$KATELLO_SERVER_CA_CERT"', foreman_server_ca_cert) -%>\n\n    if [ -f /etc/debian_version ]; then\n      CA_TRUST_ANCHORS=/usr/local/share/ca-certificates/\n    else\n      CA_TRUST_ANCHORS=/etc/pki/ca-trust/source/anchors\n    fi\n\n    # Add the Katello CA certificate to the system-wide CA certificate store\n    cp $KATELLO_SERVER_CA_CERT $CA_TRUST_ANCHORS\n\n    if [ -f /etc/debian_version ]; then\n      update-ca-certificates\n    else\n      update-ca-trust\n    fi\n  fi\n<% end -%>\n	t	\N	2025-01-19 19:42:37.966187	2025-01-19 19:42:37.966187	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used for updating Foreman's CA on hosts that are registered by Katello.\nIt replaces the CA used by subscription-manager and adds the CA to trusted anchors.	f	\N
80	chef_client	<%#\nkind: snippet\nname: chef_client\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n    This is a single entry point for chef-client bootstrapping, it selects\n    a bootstrapping strategy based on host parameter named "chef_bootstrap_template"\n    note that it can be set per host group, os, domain etc.\n    if there's no strategy set, omnibus is used by default\n-%>\necho "Bootstraping chef"\n<%= snippet_if_exists(host_param('chef_bootstrap_template') || 'chef-client omnibus bootstrap') %>\n	t	\N	2025-01-19 19:42:37.975591	2025-01-19 19:42:37.975591	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This is a single entry point for chef-client bootstrapping, it selects\na bootstrapping strategy based on host parameter named "chef_bootstrap_template"\nnote that it can be set per host group, os, domain etc.\nif there's no strategy set, omnibus is used by default	f	\N
81	coreos_cloudconfig	#cloud-config\n<%#\nkind: snippet\nname: coreos_cloudconfig\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  The actual content of the provisioning template for the CoreOS Container Linux distribution.\n  It is only used from the provisioning template.\n-%>\n<%\n  units = 0\n  unless host_param_false?('enable_etcd')\n    units += 1\n  end\n  if host_param_true?('expose_docker_socket')\n    units += 1\n  end\n  if @host.subnet.respond_to?(:dhcp_boot_mode?)\n    dhcp = @host.subnet.dhcp_boot_mode? && !@static\n  else\n    dhcp = !@static\n  end\n  unless dhcp\n    units += 1\n  end\n-%>\n<% if units > 0 -%>\n      coreos:\n<% if host_param('reboot-strategy') -%>\n        update:\n          reboot-strategy: <%= host_param('reboot-strategy') %>\n<% end -%>\n<% unless host_param_false?('enable_etcd') -%>\n        etcd2:\n<% if host_param('etcd_discovery_url') -%>\n          discovery: <%= host_param('etcd_discovery_url') %>\n<% end -%>\n          advertise-client-urls: http://<%= @host.ip %>:2379\n          initial-advertise-peer-urls: http://<%= @host.ip %>:2380\n          listen-client-urls: http://0.0.0.0:2379\n          listen-peer-urls: http://0.0.0.0:2380\n<% end -%>\n        units:\n<% unless host_param_false?('enable_etcd') -%>\n          - name: etcd2.service\n            command: start\n          - name: fleet.service\n            command: start\n<% end -%>\n<% if host_param_true?('expose_docker_socket') -%>\n          - name: docker-tcp.socket\n            command: start\n            enable: yes\n            content: |\n              [Unit]\n              Description=Docker Socket for the API\n\n              [Socket]\n              ListenStream=2375\n              BindIPv6Only=both\n              Service=docker.service\n\n              [Install]\n              WantedBy=sockets.target\n          - name: enable-docker-tcp.service\n            command: start\n            content: |\n              [Unit]\n              Description=Enable the Docker Socket for the API\n\n              [Service]\n              Type=oneshot\n              ExecStart=/usr/bin/systemctl enable docker-tcp.socket\n<% end -%>\n<% unless dhcp -%>\n          - name: systemd-networkd.service\n            command: stop\n          - name: static.network\n            command: start\n            content: |\n              [Match]\n              MACAddress=<%= @host.mac %>\n              [Network]\n<% if @host.subnet.present? -%>\n              Gateway=<%= @host.subnet.gateway %>\n<% end -%>\n              Address=<%= @host.ip %>/<%= @host.subnet.cidr %>\n<% @host.subnet.dns_servers.each do |nameserver| -%>\n              DNS=<%= nameserver %>\n<% end -%>\n          - name: down-interfaces.service\n            command: start\n            content: |\n              [Service]\n              Type=oneshot\n              ExecStart=/usr/bin/bash -c 'for i in $(/usr/bin/ls /sys/class/net/); do [ $i == "lo" ] || (/usr/bin/ip link set $i down; /usr/bin/ip addr flush dev $i); done'\n          - name: systemd-networkd.service\n            command: restart\n<% end -%>\n<% end -%>\n      hostname: <%= @host.name %>\n<% if host_param('ssh_authorized_keys') -%>\n      ssh_authorized_keys:\n  <% host_param('ssh_authorized_keys').split(',').map{ |item| item.strip }.each do |ssh_key| -%>\n      - "<%= ssh_key %>"\n  <% end -%>\n<% else -%>\n      users:\n        - name: core\n          passwd: <%= root_pass %>\n<% end -%>\n	t	\N	2025-01-19 19:42:37.984989	2025-01-19 19:42:37.984989	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The actual content of the provisioning template for the CoreOS Container Linux distribution.\nIt is only used from the provisioning template.	f	\N
82	create_users	<%#\nname: create_users\nmodel: ProvisioningTemplate\nkind: snippet\nsnippet: true\ndescription: |\n  This snippet can be used to create user accounts during the provisioning\n  based on the Host owner. If the owner is set to the user group, all users\n  from that user group will have an account created. Each such account will\n  be also configured with the respective SSH authorized keys uploaded to the\n  Foreman.\n-%>\n<%- users = @host.owner_type == 'Usergroup' ? @host.owner.all_users : [@host.owner] -%>\n<%- users.each do |user| -%>\n<%=   "useradd #{user.login}" %>\n<%-   if user.respond_to?(:ssh_authorized_keys) && user.ssh_authorized_keys.any? -%>\n<%=     "mkdir -p -m 0700 ~#{user.login}/.ssh" %>\n<%=     "cat >> ~#{user.login}/.ssh/authorized_keys <<EOF" %>\n<%-     index = 0 -%>\n<%-     user.ssh_keys.each do |key| -%>\n<%-       if index == 0 -%>\n<%=        "#{key.type} #{key.ssh_key} #{key.comment}" %>\n<%-       else -%>\n<%=        "#{key.type} #{key.ssh_key} #{key.comment} - #{index}" %>\n<%-       end -%>\n<%-       index += 1 -%>\n<%-     end -%>\n<%=     "EOF" %>\n<%=     "chown -R #{user.login}:#{user.login} ~#{user.login}/.ssh" %>\n<%=     "chmod -R go= ~#{user.login}/.ssh" %>\n<%-   end -%>\n<%- end %>\n	t	\N	2025-01-19 19:42:37.994379	2025-01-19 19:42:37.994379	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This snippet can be used to create user accounts during the provisioning\nbased on the Host owner. If the owner is set to the user group, all users\nfrom that user group will have an account created. Each such account will\nbe also configured with the respective SSH authorized keys uploaded to the\nForeman.	f	\N
83	csr_attributes.yaml	<%#\nkind: snippet\nname: csr_attributes.yaml\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Used to configure custom CSR attributes of a Puppet CA when bootstrapping a puppet agent\n  in case puppet_token_whitelisting provider is used. See puppet_setup snipper for more details.\n-%>\n---\ncustom_attributes:\n  1.2.840.113549.1.9.7: "<%= @host.puppetca_token.value %>"\n	t	\N	2025-01-19 19:42:38.003595	2025-01-19 19:42:38.003595	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Used to configure custom CSR attributes of a Puppet CA when bootstrapping a puppet agent\nin case puppet_token_whitelisting provider is used. See puppet_setup snipper for more details.	f	\N
84	disk_enc_clevis_tang	<%#\nkind: snippet\nname: disk_enc_clevis_tang\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Binds encrypted root directory ('/') utilizing Clevis to Tang server(s) for\n  decryption. The first parent device containing a LUKS container will be used.\n  The temporary passphrase will be removed afterwards. Currently, only Red Hat\n  family and Ubuntu operating systems are supported.\n-%>\n<%\n  passphrase = host_param('disk_enc_passphrase', 'linux')\n  tang_server_list = []\n  packages_redhat = "clevis clevis-luks clevis-systemd clevis-dracut"\n  packages_ubuntu = "clevis clevis-luks clevis-systemd clevis-initramfs"\n\n  unless host_param('disk_enc_tang_servers').blank?\n    if host_param('disk_enc_tang_servers').is_a?(String)\n      tang_server_list = [host_param('disk_enc_tang_servers')]\n    else\n      tang_server_list = host_param('disk_enc_tang_servers')\n    end\n  end\n-%>\n\n<% if (@host.operatingsystem.family == 'Redhat' || @host.operatingsystem.name == 'Ubuntu') && tang_server_list.present? -%>\n\ncat > /tmp/rootdir-luks-device.sh << "EOF"\n#!/bin/sh\n#\n# Author Jan Löser <loeser@atix.de>\n# Published under the GNU Public Licence 3\n#\n# This scripts tries to find the 1st LUKS device for / (root directory).\n#\nset -o pipefail\n\nrootdev=$(df / --output=source | tail -n1)\ntargetdev=$(readlink -f $rootdev)\nslavedev=$targetdev\n\nwhile : ; do\n    /sbin/cryptsetup luksDump $slavedev &>/dev/null && echo $slavedev && exit 0\n    set -e\n    slave=$(find /sys/class/block/$(basename $slavedev)/slaves -type l | head -n1)\n    slavedev=$(find /dev -name "$(basename $slave)" | head -n1)\n    set +e\ndone\n\nexit 1\nEOF\n\n# needs bash here because Ubuntu's sh (dash) doesn't support `-o pipefail` option\nluksdev=$(bash /tmp/rootdir-luks-device.sh)\n\nif [[ -n "$luksdev" ]]; then\n  echo "LUKS device found for '/': $luksdev"\n\n<% if @host.operatingsystem.family == 'Redhat' -%>\n  $PKG_MANAGER_INSTALL <%= packages_redhat %>\n<% elsif @host.operatingsystem.name == 'Ubuntu' -%>\n  $PKG_MANAGER_INSTALL <%= packages_ubuntu %>\n<% end -%>\n\n<% for tang_server in tang_server_list -%>\n  echo '<%= passphrase %>' | clevis luks bind -y -k - -d $luksdev tang '{"url": "<%= tang_server %>"}'\n  if [[ $? -ne 0 ]]; then\n    echo "---"\n    echo "There was an error during Clevis LUKS bind of '$luksdev' to Tang server '<%= tang_server %>'."\n    echo "System halted."\n    sleep infinity\n  fi\n<% end -%>\n  echo '<%= passphrase %>' | cryptsetup luksRemoveKey $luksdev\n  systemctl enable clevis-luks-askpass.path\n  systemctl enable remote-cryptsetup.target\n\n<% if @host.operatingsystem.family == 'Redhat' -%>\n  dracut --verbose --force --hostonly-cmdline --regenerate-all\n<% elsif @host.operatingsystem.name == 'Ubuntu' -%>\n  update-initramfs -u -k 'all'\n<% end -%>\n\nelse\n  echo "No LUKS device found!"\nfi\n\n<% end -%>\n	t	\N	2025-01-19 19:42:38.013003	2025-01-19 19:42:38.013003	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Binds encrypted root directory ('/') utilizing Clevis to Tang server(s) for\ndecryption. The first parent device containing a LUKS container will be used.\nThe temporary passphrase will be removed afterwards. Currently, only Red Hat\nfamily and Ubuntu operating systems are supported.	f	\N
85	efibootmgr_netboot	<%#\nkind: snippet\nname: efibootmgr_netboot\nmodel: ProvisioningTemplate\ndescription: Configure booting from network in EFI\nsnippet: true\ndescription: |\n  Most EFI system firmware implementations put new items to the top of the boot priority list. Foreman workflow assumes that managed nodes always boot from network. This snippet can be included from provisioning templates and when "efi_bootentry" host param is set to "previous" it will attempt to find previous boot entry (network) and put it back into first position.\n-%>\n<% if host_param('efi_bootentry') == 'previous' -%>\nif [ -d /sys/firmware/efi ]; then\n  echo "Changing EFI boot order to preserve boot. Typically the previous entry"\n  echo "was network boot in netboot workflows but this can also break things."\n  echo "In that case use efi_keep_bootorder host parameter to keep it untouched."\n  echo "Boot order is currently:"\n  efibootmgr\n  echo\n  created_entry=$(efibootmgr | grep "BootOrder" | cut -d " " -f 2 | cut -d "," -f 1)\n  others=$(efibootmgr | grep "BootOrder" | cut -d " " -f 2 | cut -d "," -f 2-)\n  new_order="${others},${created_entry}"\n  echo "Found entry ${created_entry}, changing order to:"\n  efibootmgr -o ${new_order}\n  echo\nfi\n<% elsif (entry = host_param('efi_bootentry')) -%>\nif [ -d /sys/firmware/efi ]; then\n  echo "Trying to find EFI boot entry containing: <%= entry -%>"\n  echo "Boot order is currently:"\n  efibootmgr\n  echo\n  current=$(efibootmgr | grep "BootOrder" | cut -d " " -f 2)\n  id=$(efibootmgr | grep -E '^Boot[0-9]+' | grep -E 'a' | efibootmgr | grep -E '^Boot[0-9]+' | grep -E '<%= entry -%>' | cut -c5-8)\n  echo "Found entry ${id}, changing order to:"\n  efibootmgr -o ${id},${current}\n  echo\nfi\n<% end -%>\n	t	\N	2025-01-19 19:42:38.022317	2025-01-19 19:42:38.022317	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Most EFI system firmware implementations put new items to the top of the boot priority list. Foreman workflow assumes that managed nodes always boot from network. This snippet can be included from provisioning templates and when "efi_bootentry" host param is set to "previous" it will attempt to find previous boot entry (network) and put it back into first position.	f	\N
86	eject_cdrom	<%#\nkind: snippet\nname: eject_cdrom\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  This template will eject DVD/CD ROM for bootdisk provisioning method,\n  typically called in the final phase of the main provisioning template,\n  such as %post section of Kickstart or Preseed Finish.\n-%>\n<% if @host.respond_to?(:bootdisk_build?) && @host.bootdisk_build? -%>\neject -v\n<% end -%>\n	t	\N	2025-01-19 19:42:38.031562	2025-01-19 19:42:38.031562	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template will eject DVD/CD ROM for bootdisk provisioning method,\ntypically called in the final phase of the main provisioning template,\nsuch as %post section of Kickstart or Preseed Finish.	f	\N
87	epel	<%#\nkind: snippet\nname: epel\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Installs the epel RPM from the official online EPEL repository. Supports\n  using the http proxy through host parameters.\n-%>\n<%\nrepo_base  = host_param('epel-repo-base') ? host_param('epel-repo-base') : 'https://dl.fedoraproject.org/pub/epel'\nhttp_proxy = host_param('http-proxy') ? " --httpproxy #{host_param('http-proxy')}" : nil\nhttp_port  = host_param('http-proxy-port') ? " --httpport #{host_param('http-proxy-port')}" : nil\nos_major   = @host.operatingsystem.major.to_i\n-%>\nrpm -Uvh<%= http_proxy %><%= http_port %> <%= repo_base %>/epel-release-latest-<%= os_major %>.noarch.rpm\n	t	\N	2025-01-19 19:42:38.040876	2025-01-19 19:42:38.040876	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Installs the epel RPM from the official online EPEL repository. Supports\nusing the http proxy through host parameters.	f	\N
88	fips_packages	<%#\nkind: snippet\nname: fips_packages\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Used to adjusts packages in Kickstart template on FIPS enabled OS.\n-%>\ndracut-fips\n-prelink\n	t	\N	2025-01-19 19:42:38.050068	2025-01-19 19:42:38.050068	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Used to adjusts packages in Kickstart template on FIPS enabled OS.	f	\N
89	fix_hosts	<%#\nkind: snippet\nname: fix_hosts\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Used in user_data templates for setting the correct content of the /etc/hosts file.\n  The goal is to potentially fix incorrect hosts file that is baked in the image\n  used for the provisioning.\n-%>\necho "<%= @host.shortname %>" > /etc/hostname\n<% if @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.major.to_i == 6 %>\nhostname <%= @host %>\n<% else %>\nhostname <%= @host.shortname %>\n<% end %>\ncat > /etc/hosts << EOF\n<%# simple snippet to generate /etc/hosts when provisioning image based systems -%>\n127.0.0.1   <%= @host %> <%= @host.shortname %> localhost localhost.localdomain\n::1     ip6-localhost ip6-loopback\nfe00::0 ip6-localnet\nff00::0 ip6-mcastprefix\nff02::1 ip6-allnodes\nff02::2 ip6-allrouters\nEOF\n	t	\N	2025-01-19 19:42:38.059383	2025-01-19 19:42:38.059383	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Used in user_data templates for setting the correct content of the /etc/hosts file.\nThe goal is to potentially fix incorrect hosts file that is baked in the image\nused for the provisioning.	f	\N
90	freeipa_register	<%#\nkind: snippet\nname: freeipa_register\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Installs IPA client and enrolls the host in IPA realm using the OTP\n  Optional parameters:\n    freeipa_server              IPA server\n    freeipa_sudo                Enable sudoers\n    freeipa_ssh                 Enable ssh integration\n                                Default: true\n    freeipa_automount           Enable automounter\n                                Default: false\n    freeipa_automount_location  Location for automounts\n    freeipa_mkhomedir           Enable automatically making home directories\n                                Default: true\n    freeipa_opts                Additional options to pass directly to installer\n    freeipa_automount_server    Override automount server if freeipa_automount is true and the server differs from freeipa_server\n-%>\n<% if @host.operatingsystem.family == 'Redhat' -%>\n  <% if @host.operatingsystem.name == 'Fedora' -%>\n    freeipa_client=freeipa-client\n  <% else -%>\n    freeipa_client=ipa-client\n  <% end -%>\n  <% os_major = @host.operatingsystem.major.to_i %>\n  <% if os_major == 7 -%>\n    /usr/sbin/sshd-keygen\n  <% elsif os_major > 7 %>\n    /usr/libexec/openssh/sshd-keygen rsa\n  <% end -%>\n<% else -%>\n  freeipa_client=freeipa-client\n<% end -%>\n\n<%= @host.operatingsystem.family == 'Redhat' ? 'yum install -y libsss_sudo' : 'DEBIAN_FRONTEND=noninteractive apt-get install -y libsss-sudo' %> $freeipa_client\n\n##\n## IPA Client Installation\n##\n<% if host_param('freeipa_server') -%>\n<% domain = host_param('freeipa_domain') || @host.realm.name.downcase -%>\n\nfreeipa_server="--server <%= host_param('freeipa_server') %>"\nfreeipa_domain="--domain <%= domain %>"\n<% end -%>\n\n<% unless host_param_false?('freeipa_mkhomedir') %>\nfreeipa_mkhomedir="--mkhomedir"\n<% end -%>\n\n<% if host_param_false?('freeipa_ssh') %>\nfreeipa_ssh="--no-ssh"\n<% end -%>\n\n<% if host_param('freeipa_opts') -%>\nfreeipa_opts="<%= host_param('freeipa_opts') %>"\n<% end -%>\n\n# One-time password will be requested at install time. Otherwise, $HOST[OTP] is used as a placeholder value.\n/usr/sbin/ipa-client-install -w '<%= @host.otp || "$HOST[OTP]" %>' --realm=<%= @host.realm %> -U $freeipa_mkhomedir $freeipa_opts $freeipa_server $freeipa_domain $freeipa_ssh\n\n##\n## Automounter\n##\n\n<% if host_param('freeipa_automount_location') -%>\nautomount_location="--location <%= host_param('freeipa_automount_location') %>"\n<% end -%>\n\n<% if host_param_true?('freeipa_automount') -%>\nif [ -f /usr/sbin/ipa-client-automount ]\nthen\n  automount_server=$freeipa_server\n  <%- if automount_server = host_param('freeipa_automount_server') || host_param('freeipa_server') -%>\n  automount_server="--server <%= automount_server %>"\n  <%- end -%>\n  /usr/sbin/ipa-client-automount $automount_server $automount_location --unattended\nfi\n<% end -%>\n\n##\n## Sudoers\n##\n\n<% unless host_param_false?('freeipa_enable_sudo') %>\n\nfreeipa_client_version=$(ipa-client-install --version)\nfreeipa_client_version_major=$(echo $freeipa_client_version | cut -f1 -d.)\nfreeipa_client_version_minor=$(echo $freeipa_client_version | cut -f2 -d.)\nfreeipa_realm=$(grep default_realm /etc/krb5.conf | cut -d"=" -f2 | tr -d ' ')\nfreeipa_domain=$(grep -A 2 domain_realm /etc/krb5.conf | tail -n1 | awk '{print $1}')\nfreeipa_dn=$(for word in $(echo $freeipa_domain | sed 's/\\./ /g'); do echo -n dc=$word,; done)\nsssd_version=$(sssd --version)\nsssd_major=$(echo $sssd_version | cut -f1 -d.)\nsssd_minor=$(echo $sssd_version | cut -f2 -d.)\nLDAP_CONFIG=$(mktemp)\n\n# >=ipa-client-4.1.0 automatically configures sssd for sudo\n# =<ipa-client-3 requires manual configuration which this snippet takes care of\n\nif [ $freeipa_client_version_major -lt 4 ]\nthen\n  # Modify sssd.conf\n  sed -i -e "s/services = .*/\\0, sudo/" /etc/sssd/sssd.conf\n\n  # Modify sssd.conf for sssd <1.11 (RHEL <6.6)\n  if [ $sssd_minor -lt 11 ] || [ $sssd_major -lt 1 ]\n  then\n    <% if host_param('freeipa_server') -%>\n    ldap_uri=", ldap://<%= host_param('freeipa_server') %>"\n    krb5_server=<%= host_param('freeipa_server') %>\n    <% else -%>\n    krb5_server="_srv_"\n    <% end -%>\n\ncat <<EOF > $LDAP_CONFIG\nsudo_provider = ldap\nldap_uri = _srv_ $ldap_uri\nldap_sudo_search_base = ou=SUDOers,${freeipa_dn%?}\nldap_sasl_mech = GSSAPI\nldap_sasl_authid = host/$HOSTNAME\nldap_sasl_realm = $freeipa_realm\nkrb5_server = $krb5_server\nEOF\n  sed -i -e "/\\[domain\\/.*\\]/ r $LDAP_CONFIG" /etc/sssd/sssd.conf\n  fi\n\n  # Modify nsswitch.conf\n  grep -q sudoers /etc/nsswitch.conf\n  if [[ $? -eq 0 ]];\n  then\n    sed -i -e "s/^sudoers.*/sudoers:    files sss/" /etc/nsswitch.conf\n  else\n    echo "sudoers:    files sss" >> /etc/nsswitch.conf\n  fi\n\n  # Configure nisdomain\n  <% if @host.operatingsystem.family == 'Redhat' -%>\n    authconfig --nisdomain ${freeipa_domain} --update\n    chkconfig sssd on\n    \n    if [[ $(rpm -qa systemd | wc -l) -gt 0 ]];\n    then\n      domain_service=/usr/lib/systemd/system/*-domainname.service\n      \n      # Workaround for BZ1071969 on RHEL 7.0\n      grep -q "DefaultDependencies=no" $domain_service\n      if [[ $? -ne 0 ]]\n      then\n        sed -i -e "s/\\[Unit\\]/\\[Unit\\]\\nDefaultDependencies=no/" $domain_service\n      fi\n\n      systemctl start $(basename $domain_service)\n      systemctl enable $(basename $domain_service)\n    fi\n  <% else -%>\n  # OS is not RedHat\n  sed -i -e '/^exit /d' /etc/rc.local\n  echo "nisdomainname ${freeipa_domain}" >> /etc/rc.local\n  echo "exit 0" >> /etc/rc.local\n  nisdomainname ${freeipa_domain}  \n  <% end -%>\nfi\n\n<% end -%>\n\n	t	\N	2025-01-19 19:42:38.06882	2025-01-19 19:42:38.06882	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Installs IPA client and enrolls the host in IPA realm using the OTP\nOptional parameters:\n  freeipa_server              IPA server\n  freeipa_sudo                Enable sudoers\n  freeipa_ssh                 Enable ssh integration\n                              Default: true\n  freeipa_automount           Enable automounter\n                              Default: false\n  freeipa_automount_location  Location for automounts\n  freeipa_mkhomedir           Enable automatically making home directories\n                              Default: true\n  freeipa_opts                Additional options to pass directly to installer\n  freeipa_automount_server    Override automount server if freeipa_automount is true and the server differs from freeipa_server	f	\N
91	http_proxy	<%#\nkind: snippet\nname: http_proxy\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Configures common HTTP proxy ENV variables based on the host_proxy\n  host parameter. Currently not used by any shipped template.\n-%>\n<% if (proxy = host_param("http_proxy")) -%>\nhttp_proxy=<%= proxy %>\nexport http_proxy\nhttps_proxy=<%= proxy %>\nexport https_proxy\nno_proxy=localhost,127.0.0.0/8,*.local,*.<%= @host.domain.name -%>,puppet\nexport no_proxy\n<% end -%>\n	t	\N	2025-01-19 19:42:38.078188	2025-01-19 19:42:38.078188	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Configures common HTTP proxy ENV variables based on the host_proxy\nhost parameter. Currently not used by any shipped template.	f	\N
92	insights	<%#\nkind: snippet\nname: insights\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Installs and registers the insights client on RHEL, typically used\n  in the Kickstart provisioning and host init templates.\n-%>\n<% if @host.operatingsystem.name == 'RedHat' -%>\necho '#'\necho '# Installing Insights client'\necho '#'\n\nyum install -y insights-client\ninsights-client --register < /dev/null\n\n<% end -%>\n	t	\N	2025-01-19 19:42:38.08738	2025-01-19 19:42:38.08738	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Installs and registers the insights client on RHEL, typically used\nin the Kickstart provisioning and host init templates.	f	\N
93	kickstart_ifcfg_bond_interface	<%#\nname: kickstart_ifcfg_bond_interface\nmodel: ProvisioningTemplate\nsnippet: true\nmodel: ProvisioningTemplate\nkind: snippet\ndescription: |\n  Generates the ifcfg configuration file for bond interface.\n  This is typically used by other templates and snippets that pass interface\n  object to be configured. It is not expected to be used directly.\n-%>\n<%= snippet('kickstart_ifcfg_generic_interface', :variables => {\n                  :interface => @interface,\n                  :subnet => @subnet,\n                  :subnet6 => @subnet6,\n                  :dhcp => @dhcp }) -%>\nTYPE=Bond\n<%-   if @interface.mac.to_s.present? -%>\nMACADDR="<%= @interface.mac -%>"\n<%-   end -%>\nBONDING_OPTS="<%= @interface.bond_options -%> mode=<%= @interface.mode -%>"\nBONDING_MASTER=yes\n<%-   if ( @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.major.to_i <= 7 ) -%>\n<%=     "NM_CONTROLLED=no" %>\n<%-   end -%>\n	t	\N	2025-01-19 19:42:38.096518	2025-01-19 19:42:38.096518	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates the ifcfg configuration file for bond interface.\nThis is typically used by other templates and snippets that pass interface\nobject to be configured. It is not expected to be used directly.	f	\N
94	kickstart_ifcfg_bonded_interface	<%#\nname: kickstart_ifcfg_bonded_interface\nmodel: ProvisioningTemplate\nsnippet: true\nmodel: ProvisioningTemplate\nkind: snippet\ndescription: |\n  Generates the ifcfg configuration file for interface attached to a bond.\n  This is typically used by other templates and snippets that pass interface\n  object to be configured. It is not expected to be used directly.\n-%>\n<%= snippet('kickstart_ifcfg_generic_interface', :variables => {\n                  :interface => @interface,\n                  :subnet => @subnet,\n                  :subnet6 => @subnet6,\n                  :dhcp => @dhcp }) -%>\n<%-   if ( @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.major.to_i <= 7 ) -%>\n<%=     "NM_CONTROLLED=no" %>\n<%-   end -%>\nMASTER=<%= @bond_identifier %>\nSLAVE=yes\n	t	\N	2025-01-19 19:42:38.105747	2025-01-19 19:42:38.105747	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates the ifcfg configuration file for interface attached to a bond.\nThis is typically used by other templates and snippets that pass interface\nobject to be configured. It is not expected to be used directly.	f	\N
95	kickstart_ifcfg_generic_interface	<%#\nname: kickstart_ifcfg_generic_interface\nmodel: ProvisioningTemplate\nsnippet: true\nmodel: ProvisioningTemplate\nkind: snippet\ndescription: |\n  Generates the ifcfg configuration file for a generic network interface.\n  This is typically used by other templates and snippets that pass interface\n  object to be configured. It is not expected to be used directly.\n-%>\n<%- primary = @interface.primary ? 'yes' : 'no' -%>\nBOOTPROTO="<%= @dhcp ? 'dhcp' : 'none' -%>"\n<%- unless @dhcp || @subnet.nil? -%>\n<%-   if @interface.ip.present? -%>\n<%=     "IPADDR=\\"#{@interface.ip}\\"" %>\n<%=     "NETMASK=\\"#{@subnet.mask}\\"" %>\n<%-     if @subnet.gateway.present? -%>\n<%=       "GATEWAY=\\"#{@subnet.gateway}\\"" %>\n<%-     end -%>\n<%-   end -%>\n<%- end -%>\n<%- if @interface.ip6.present? -%>\n<%=   "IPV6INIT=yes" %>\n<%=   "IPV6_AUTOCONF=#{host_param_true?('use-slaac') ? 'yes' : 'no'}" %>\n<%=   "IPV6ADDR=#{@interface.ip6}" %>\n<%-   if !@subnet6.nil? && @subnet6.gateway.present? -%>\n<%=     "IPV6_DEFAULTGW=#{@subnet6.gateway}" %><%= '%$real' if @subnet6.gateway.match(/^fe80:/) %>\n<%-   end -%>\n<%=   "IPV6_PEERDNS=#{primary}" %>\n<%=   "IPV6_PEERROUTES=#{primary}" %>\n<%=   "IPV6_DEFROUTE=#{primary}" %>\n<%- end -%>\n<%- if @interface.domain -%>\nDOMAIN="<%= @interface.domain %>"\n<%- end -%>\nDEVICE=$real\n<%- unless @interface.virtual? -%>\n<%=   "HWADDR=\\"#{@interface.mac}\\"" %>\n<%- end -%>\nONBOOT=yes\nPEERDNS=<%= primary %>\nPEERROUTES=<%= primary %>\nDEFROUTE=<%= primary %>\n<%- if @interface.primary -%>\n<%-   if !@dhcp && @subnet -%>\n<%-     @subnet.dns_servers.each_index do |index| -%>\n<%=       "DNS#{index +1}=\\"#{@subnet.dns_servers[index]}\\"" %>\n<%-     end -%>\n<%-   elsif !@dhcp && @subnet6 -%>\n<%-     @subnet6.dns_servers.each_index do |index| -%>\n<%=       "DNS#{index +1}=\\"#{@subnet6.dns_servers[index]}\\"" %>\n<%-     end -%>\n<%-   end -%>\n<%- end -%>\n<%- if @interface.virtual? && (!@subnet.nil? && (@subnet.has_vlanid? || @interface.vlanid.present?)) -%>\n<%=   "VLAN=yes" %>\n<%-   if @attached_to_bond -%>\n<%-     if ( @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.major.to_i <= 7 ) -%>\n<%=       "NM_CONTROLLED=no" %>\n<%-     end -%>\n<%-   end -%>\n<%-   if @interface.identifier.match(/^vlan\\d+/) -%>\n<%=     "VLAN_NAME_TYPE=VLAN_PLUS_VID_NO_PAD" %>\n<%=     "PHYSDEV=#{@interface.attached_to}" %>\n<%-     if @bonding_interfaces.include?(@interface.attached_to) -%>\n<%=       "TYPE=bonding" %>\n<%-     end -%>\n<%-   end -%>\n<%- elsif @interface.virtual? && !@subnet.nil? && !@subnet.has_vlanid? && @interface.identifier.include?(':') -%>\n<%=   "TYPE=Alias" %>\n<%- end -%>\n<%- if @subnet -%>\n<%=   "MTU=#{@subnet.mtu}" %>\n<%- elsif @subnet6 -%>\n<%=   "MTU=#{@subnet6.mtu}" %>\n<%- end -%>\n	t	\N	2025-01-19 19:42:38.114998	2025-01-19 19:42:38.114998	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates the ifcfg configuration file for a generic network interface.\nThis is typically used by other templates and snippets that pass interface\nobject to be configured. It is not expected to be used directly.	f	\N
96	kickstart_ifcfg_get_identifier_names	<%#\nname: kickstart_ifcfg_get_identifier_names\nmodel: ProvisioningTemplate\nsnippet: true\nmodel: ProvisioningTemplate\nkind: snippet\ndescription: |\n  Generates shell snippet that detects the current identifier of a network interface\n  based on the MAC address. This is required in provisioning flows when reboot is involved\n  between when the network interfaces has been reported to the database and the actual\n  provisioning, e.g. when provisioning using discovery image. Interfaces reported by FDI\n  use naming convention used by FDI, e.g. eth0, while when provisioning a newer RHEL, interfaces\n  use bios dev names e.g. enp0s31f6.\n  This is typically used by other templates and snippets that pass interface\n  object to be configured. It is not expected to be used directly.\n-%>\n<%- if @identifier -%>\n<%=   "real=\\"#{@identifier}\\"" %>\n<%- else -%>\n<%-   if !@interface.inheriting_mac -%>\n<%=     "\\nreal=`echo #{@interface.identifier}`" -%>\n<%-   else -%>\n<%=     "real=`grep -l #{@interface.inheriting_mac} /sys/class/net/*/{bonding_slave/perm_hwaddr,address} 2>/dev/null | awk -F '/' '// {print $5}' | head -1`" -%>\n<%-   end -%>\n<%-   if @interface.virtual? -%>\n<%=     "\\nreal=`echo #{@interface.identifier} | sed s/#{@interface.attached_to}/$real/`" -%>\n<%-   end -%>\n<%- end -%>\n<%# ifcfg files are ignored by NM if their name contains colons so we convert colons to underscore %>\nsanitized_real=`echo $real | sed s/:/_/`\n	t	\N	2025-01-19 19:42:38.124199	2025-01-19 19:42:38.124199	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates shell snippet that detects the current identifier of a network interface\nbased on the MAC address. This is required in provisioning flows when reboot is involved\nbetween when the network interfaces has been reported to the database and the actual\nprovisioning, e.g. when provisioning using discovery image. Interfaces reported by FDI\nuse naming convention used by FDI, e.g. eth0, while when provisioning a newer RHEL, interfaces\nuse bios dev names e.g. enp0s31f6.\nThis is typically used by other templates and snippets that pass interface\nobject to be configured. It is not expected to be used directly.	f	\N
97	kickstart_kernel_options	<%#\nkind: snippet\nname: kickstart_kernel_options\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  The list of kernel options for initrd appended to the bootloader kernel line on Red Hat compatible distributions.\n  Typically renders to a string with the url where to fetch the OS installer answer files, e.g.\n    network ksdevice=bootif ks.device=bootif BOOTIF=01-52-54-00-8b-a3-86 inst.ks=http://foreman.example.com/unattended/provision inst.ks.sendmac ip=dhcp nameserver=192.168.122.1\n  Custom options can be added by setting the array parameter kickstart_kernel_custom_options\n-%>\n<%\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  is_fedora = @host.operatingsystem.name == 'Fedora'\n  os_major = @host.operatingsystem.major.to_i\n  os_minor = @host.operatingsystem.minor.to_i\n  major = @host.operatingsystem.major.to_i\n  hostname = @host.name\n  iface = @host.provision_interface\n  mac = @host.provision_interface.mac\n  subnet4 = iface.subnet\n  subnet6 = iface.subnet6\n  dual_stack_fallback = host_param('dual_stack_provision_fallback')\n\n  custom_options = [host_param('kickstart_kernel_custom_options')].flatten.compact\n  options = []\n\n  if rhel_compatible && os_major < 8\n    # replaced with BOOTIF in EL8+\n    options.push("network", "ksdevice=bootif", "ks.device=bootif")\n  end\n\n  if mac\n    # hardware type is always 01 (ethernet) unless specified otherwise\n    options.push("BOOTIF=#{host_param("hardware_type", "01")}-#{mac.gsub(':', '-')}")\n  end\n\n  # tell Anaconda what to pass off to kickstart server\n  # both current and legacy syntax provided\n  if (is_fedora && os_major >= 33) || (rhel_compatible && os_major >= 8)\n    if subnet4 && !subnet4.dhcp_boot_mode?\n      options.push("inst.ks=#{foreman_url('provision', static: '1').gsub("&", "\\\\\\\\&")}")\n    elsif subnet6 && !subnet6.dhcp_boot_mode?\n      options.push("inst.ks=#{foreman_url('provision', static6: '1').gsub("&", "\\\\\\\\&")}")\n    else\n      options.push("inst.ks=#{foreman_url('provision').gsub("&", "\\\\\\\\&")}", "inst.ks.sendmac")\n    end\n  else\n    if subnet4 && !subnet4.dhcp_boot_mode?\n      options.push("ks=#{foreman_url('provision', static: '1').gsub("&", "\\\\\\\\&")}")\n    elsif subnet6 && !subnet6.dhcp_boot_mode?\n      options.push("ks=#{foreman_url('provision', static6: '1').gsub("&", "\\\\\\\\&")}")\n    else\n      options.push("ks=#{foreman_url('provision').gsub("&", "\\\\\\\\&")}", "kssendmac", "ks.sendmac")\n    end  \n  end\n\n  # networking credentials\n  if subnet4 && subnet6\n    if dual_stack_fallback == 'IPv4'\n      subnet6 = false\n    elsif dual_stack_fallback == 'IPv6'\n      subnet4 = false\n    else\n      raise("Dual-stack provisioning not supported, set parameter 'dual_stack_provision_fallback'")\n    end\n  end\n  options.push("dualstack!") if subnet4 && subnet6\n  if subnet4 && subnet4.dhcp_boot_mode?\n    options.push("ip=dhcp") if rhel_compatible && major >= 7\n  elsif subnet4 && !subnet4.dhcp_boot_mode?\n    if rhel_compatible && major < 7\n      dns_servers = subnet4.dns_servers.join(',')\n      if @ipxe_net\n        options.push('ip=${netX/ip} netmask=${netX/netmask} gateway=${netX/gateway} dns=${dns}')\n      else\n        options.push("ip=#{iface.ip}", "netmask=#{subnet4.mask}", "gateway=#{subnet4.gateway}", "dns=#{dns_servers}")\n      end\n    else\n      if @ipxe_net\n        options.push("ip=${netX/ip}::${netX/gateway}:${netX/netmask}:#{hostname}:#{iface.identifier}:none nameserver=${dns}")\n      else\n        options.push("ip=#{iface.ip}::#{subnet4.gateway}:#{subnet4.mask}:#{hostname}:#{iface.identifier}:none")\n      end\n    end\n  elsif subnet6 && subnet6.dhcp_boot_mode? && rhel_compatible && major >= 7\n    if host_param_true?("use-slaac")\n      options.push("ip=auto6")\n    else\n      options.push("ip=dhcp6")\n    end\n  elsif subnet6 && !subnet6.dhcp_boot_mode?\n    raise("Static IPv6 provisioning works on RHEL7 or newer") if rhel_compatible && major < 7\n    gw = subnet6.gateway ? "[#{subnet6.gateway}]" : ""\n    options.push("ip=[#{iface.ip6}]::#{gw}:#{subnet6.cidr}:#{hostname}:#{iface.identifier}:none")\n  end\n\n  # nameservers - must be present even for DHCP subnets because of bug:\n  # https://bugzilla.redhat.com/show_bug.cgi?id=1795276\n  if subnet4 && !@ipxe_net\n    subnet4.dns_servers.each { |server|\n      options.push("nameserver=#{server}")\n    }\n  elsif subnet6 && !@ipxe_net\n    subnet6.dns_servers.each { |server|\n      options.push("nameserver=#{server}")\n    }\n  end\n\n  # bond\n  if iface.bond? && rhel_compatible && os_major >= 6\n    bond_slaves = iface.attached_devices_identifiers.join(',')\n    options.push("bond=#{iface.identifier}:#{bond_slaves}:mode=#{iface.mode},#{iface.bond_options.tr(' ', ',')}")\n  end\n\n  # VLAN (only on physical is recognized)\n  if iface.virtual? && iface.tag.present? && iface.attached_to.present?\n    if iface.attached_to.match 'bond'\n      @host.bond_interfaces.each do |bond_interface|\n          if bond_interface.identifier == iface.attached_to\n              bond_slaves = bond_interface.attached_devices_identifiers.join(',')\n              options.push("bond=#{bond_interface.identifier}:#{bond_slaves}:mode=#{bond_interface.mode},#{bond_interface.bond_options.tr(' ', ',')}")\n          end\n      end\n    end\n    if (is_fedora && os_major < 17) || (rhel_compatible && os_major < 7)\n      options.push("vlanid=#{iface.tag}")\n    else\n      options.push("vlan=#{iface.attached_to}.#{iface.tag}:#{iface.attached_to}")\n    end\n  end\n\n  if host_param('kickstart_liveimg')\n    options.push("inst.stage2=#{medium_uri}")\n  end\n\n  # S390x architecture has a different stage two image:\n  # https://access.redhat.com/solutions/4206591\n  if @host.architecture.to_s.match(/s390x?/i)\n    options.push("inst.cmdline")\n    options.push("inst.repo=#{medium_uri}")\n  end\n\n  # FIPS\n  if !is_fedora && os_major >= 7 && host_param_true?('fips_enabled')\n    options.push('fips=1')\n  end\n\n  nic_delay = subnet4&.nic_delay || subnet6&.nic_delay\n  if nic_delay && rhel_compatible && major >= 7\n    ["dhcp", "iflink", "ifup", "route", "ipv6dad", "ipv6auto", "carrier"].each do |type|\n      options.push("rd.net.timeout.#{type}=#{nic_delay}")\n    end\n  elsif nic_delay\n    options.push("nicdelay=#{nic_delay} linksleep=#{nic_delay}")\n  end\n\n  # add user specified custom options if specified (noop if not)\n  options.concat(custom_options)\n-%>\n<%# do not add newline after the next line %>\n<%= options.join(' ') -%>\n	t	\N	2025-01-19 19:42:38.133415	2025-01-19 19:42:38.133415	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The list of kernel options for initrd appended to the bootloader kernel line on Red Hat compatible distributions.\nTypically renders to a string with the url where to fetch the OS installer answer files, e.g.\n  network ksdevice=bootif ks.device=bootif BOOTIF=01-52-54-00-8b-a3-86 inst.ks=http://foreman.example.com/unattended/provision inst.ks.sendmac ip=dhcp nameserver=192.168.122.1\nCustom options can be added by setting the array parameter kickstart_kernel_custom_options	f	\N
98	kickstart_network_interface	<%#\nname: kickstart_network_interface\nmodel: ProvisioningTemplate\nsnippet: true\nmodel: ProvisioningTemplate\nkind: snippet\ndescription: |\n  Generates network directive for a given interface. It is not expected to be used directly.\n-%>\n<%#\n  # Variables: iface, host, use_slaac, static, static6\n-%>\n<%if @iface.managed? -%>\n<%\nnetwork_options = []\nnameservers = []\nsubnet4 = @iface.subnet\nsubnet6 = @iface.subnet6\n\nrhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\nis_fedora = @host.operatingsystem.name == 'Fedora'\nos_major = @host.operatingsystem.major.to_i\n\n# device and hostname\nif @iface.bond? || @iface.bridge?\n  network_options.push("--device=#{@iface.identifier}")\nelse\n  network_options.push("--device=#{@iface.mac || @iface.identifier}")\nend\nnetwork_options.push("--hostname #{@host.name}")\n\n# single stack\nnetwork_options.push("--noipv6") if subnet4 && !subnet6\nnetwork_options.push("--noipv4") if !subnet4 && subnet6\n\n# dual stack MTU check\nraise("IPv4 and IPv6 subnets have different MTU") if subnet4 && subnet6 && subnet4.mtu.present? && subnet6.mtu.present? && subnet4.mtu != subnet6.mtu\n\n# mtu method is taking into account both ipv4 and ipv6 stacks\nif @iface.respond_to?(:mtu) && @iface.mtu\n  network_options.push("--mtu=#{@iface.mtu}")\nend\n\n# IPv4\nif subnet4\n  if !subnet4.dhcp_boot_mode? || @static\n    network_options.push("--bootproto static")\n    network_options.push("--ip=#{@iface.ip}")\n    network_options.push("--netmask=#{subnet4.mask}")\n    network_options.push("--gateway=#{subnet4.gateway}")\n  elsif subnet4.dhcp_boot_mode?\n    network_options.push("--bootproto dhcp")\n  end\n\n  nameservers.concat(subnet4.dns_servers)\nend\n\n# IPv6\nif subnet6\n  if !subnet6.dhcp_boot_mode? || @static6\n    network_options.push("--ipv6=#{@iface.ip6}/#{subnet6.cidr}")\n    network_options.push("--ipv6gateway=#{subnet6.gateway}")\n  elsif subnet6.dhcp_boot_mode?\n    if @use_slaac\n      network_options.push("--ipv6 auto")\n    else\n      network_options.push("--ipv6 dhcp")\n    end\n  end\n\n  nameservers.concat(subnet6.dns_servers)\nend\n\n# bond\nif @iface.bond?\n  bond_slaves = @iface.attached_devices_identifiers.join(',')\n  network_options.push("--bondslaves=#{bond_slaves}")\n  network_options.push("--bondopts=mode=#{@iface.mode},#{@iface.bond_options.tr(' ', ',')}")\nend\n\n# bridge\nif @iface.bridge?\n  bridge_slaves = @iface.attached_devices_identifiers.join(',')\n  network_options.push("--bridgeslaves=#{bridge_slaves}")\n  # Currently no support for bridge options in the interface.\nend\n\n# VLAN (only on physical is recognized)\nif @iface.virtual? && @iface.tag.present? && @iface.attached_to.present?\n  network_options.push("--vlanid=#{@iface.tag}")\n  network_options.push("--interfacename=vlan#{@iface.tag}") if (is_fedora && os_major >= 21) || (rhel_compatible && os_major >= 7)\nend\n\n# DNS\nif nameservers.empty?\n  network_options.push("--nodns")\nelse\n  network_options.push("--nameserver=#{nameservers.join(',')}")\nend\n\n# Search domain - available from Fedora 39 (RHEL 10)\nif @iface.domain && ((is_fedora && os_major >= 39) || (rhel_compatible && os_major >= 10))\n  network_options.push("--ipv4-dns-search=#{@iface.domain}") if subnet4\n  network_options.push("--ipv6-dns-search=#{@iface.domain}") if subnet6\nend\n-%>\n<%= "network #{network_options.join(' ')}\\n" -%>\n<% end -%>\n	t	\N	2025-01-19 19:42:38.142681	2025-01-19 19:42:38.142681	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates network directive for a given interface. It is not expected to be used directly.	f	\N
99	kickstart_networking_setup	<%#\nname: kickstart_networking_setup\nmodel: ProvisioningTemplate\nsnippet: true\nkind: snippet\ndescription: |\n  Generates a complete shell script that creates ifcfg configuration files for all\n  host's network interfaces. Typically used on Red Hat based distributions.\n-%>\n<%- bonded_interfaces = [] -%>\n<%- bonding_interfaces = [] -%>\n<%- @host.bond_interfaces.each do |bond| -%>\n<%-   bonding_interfaces.push(bond.identifier) -%>\n<%=   "# #{bond.identifier} interface" %>\n<%=   snippet('kickstart_ifcfg_get_identifier_names', :variables => { :identifier => bond.identifier }) %>\n<%-   ifcfg = snippet('kickstart_ifcfg_bond_interface', :variables => {\n                        :interface => bond,\n                        :subnet => bond.subnet,\n                        :subnet6 => bond.subnet6,\n                        :dhcp => bond.subnet&.dhcp_boot_mode? }) -%>\n<%=   save_to_file('/etc/sysconfig/network-scripts/ifcfg-$sanitized_real', ifcfg) %>\n\n<%-   @host.interfaces_with_identifier(bond.attached_devices_identifiers).each do |interface| -%>\n<%-     next if !interface.managed? -%>\n<%=     "# #{interface.identifier} interface" %>\n<%=     snippet('kickstart_ifcfg_get_identifier_names', :variables => { :interface => interface }) -%>\n<%-     ifcfg = snippet('kickstart_ifcfg_bonded_interface', :variables => {\n                          :interface => interface,\n                          :subnet => interface.subnet,\n                          :subnet6 => interface.subnet6,\n                          :dhcp => false,\n                          :bond_identifier => bond.identifier }) %>\n<%=     save_to_file('/etc/sysconfig/network-scripts/ifcfg-$sanitized_real', ifcfg) %>\n<%-     bonded_interfaces.push(interface.identifier) %>\n<%-   end -%>\n<%- end -%>\n\n<%- @host.managed_interfaces.each do |interface| %>\n<%-   next if !interface.managed? -%>\n<%-   next if bonded_interfaces.include?(interface.identifier) -%>\n\n<%-   interface_identifier = @host.bond_interfaces.map { |i| i.identifier }.include?(interface.attached_to) ? interface.identifier : nil %>\n<%=   "# #{interface.identifier} interface" %>\n<%=   snippet('kickstart_ifcfg_get_identifier_names', :variables => { :interface => interface, :identifier => interface_identifier }) -%>\n<%-   ifcfg = snippet('kickstart_ifcfg_generic_interface', :variables => {\n                        :interface => interface,\n                        :subnet => interface.subnet,\n                        :subnet6 => interface.subnet6,\n                        :bonding_interfaces => bonding_interfaces,\n                        :dhcp => interface.subnet&.dhcp_boot_mode?,\n                        :attached_to_bond => interface_identifier.present? }) %>\n<%=   save_to_file('/etc/sysconfig/network-scripts/ifcfg-$sanitized_real', ifcfg) %>\n<%- end %>\n	t	\N	2025-01-19 19:42:38.151954	2025-01-19 19:42:38.151954	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates a complete shell script that creates ifcfg configuration files for all\nhost's network interfaces. Typically used on Red Hat based distributions.	f	\N
100	kickstart_rhsm	<%#\nkind: snippet\nname: kickstart_rhsm\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Generate Anaconda RHSM configuration for Red Hat OS registration\ntest_on:\n- rhel9_dhcp\n-%>\n<%\n  subman_keys = host_param('kt_activation_keys') || host_param('activation_key')\n  subman_org = host_param('subscription_manager_org') || (plugin_present?('katello') && @host.rhsm_organization_label)\n  subman_registration = host_param_true?('subscription_manager') || subman_keys.present?\n  subman_hostname = " --server-hostname #{@host.content_source.rhsm_url.host}" if (plugin_present?('katello') && @host.content_source)\n  subman_rhsm_baseurl = " --rhsm-baseurl #{@host.content_source.pulp_content_url}" if (plugin_present?('katello') && @host.content_source)\n  subman_insights = ' --connect-to-insights' if host_param_true?('host_registration_insights')\n\n  sys_role = " --role '#{host_param('syspurpose_role')}'" if host_param('syspurpose_role')\n  sys_usage = " --usage '#{host_param('syspurpose_usage')}'" if host_param('syspurpose_usage')\n  sys_sla = " --sla '#{host_param('syspurpose_sla')}'" if host_param('syspurpose_sla')\n  sys_addons = " #{host_param('syspurpose_addons').split(',')\n                                                  .map { |add_on| "--addon '#{add_on.strip}'" }.join(" ")}" if host_param('syspurpose_addons')\n-%>\n<% if subman_registration -%>\nrhsm --organization="<%= subman_org %>" --activation-key="<%= subman_keys %>"<%= subman_hostname -%><%= subman_rhsm_baseurl -%><%= subman_insights -%>\n<% end -%>\n<%- if host_param('syspurpose_role') %>\nsyspurpose<%= sys_role %><%= sys_usage %><%= sys_sla %><%= sys_addons %>\n<% end -%>\n	t	\N	2025-01-19 19:42:38.161119	2025-01-19 19:42:38.161119	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generate Anaconda RHSM configuration for Red Hat OS registration	f	\N
160	User - Registered Users	<%#\nname: User - Registered Users\ndescription: Report of registered users\nsnippet: false\ntemplate_inputs:\n- name: Users filter\n  required: false\n  input_type: user\n  description: Limit the report only on users found by this search query. Keep empty\n    for report on all available users.\n  advanced: false\n  value_type: search\n  resource_type: User\nmodel: ReportTemplate\n-%>\n<%- load_users(search: input('Users filter'), includes: :auth_source).each_record do |user| -%>\n<%-   report_row({\n        'Login': user.login,\n        'Firstname': user.firstname,\n        'Lastname': user.lastname,\n        'Email': user.mail,\n        'Last Login': user.last_login_on,\n        'Auth source': user_auth_source_name(user)\n      }) -%>\n<%- end -%>\n<%= report_render -%>\n	f	\N	2025-01-19 19:42:38.747232	2025-01-19 19:42:38.747232	t	t	Foreman	ReportTemplate	\N	Miscellaneous	\N	\N	\N	Report of registered users	f	\N
101	ntp	<%#\nkind: snippet\nname: ntp\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  The snippet configuring the system time using a given NTP server\n  It respects the following parameters:\n  - use-ntp: boolean (default depends on OS release)\n  - ntp-server: string (default=undef)\n-%>\n<%\nrhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\nis_fedora = @host.operatingsystem.name == 'Fedora'\nos_major = @host.operatingsystem.major.to_i\nuse_ntp = host_param_true?('use-ntp', (is_fedora && os_major < 16) || (rhel_compatible && os_major <= 6))\n-%>\n\necho "Updating system time"\n<% if use_ntp -%>\nyum -y install ntpdate\n  <% if host_param('ntp-server') -%>\n/usr/sbin/ntpdate -sub <%= host_param('ntp-server') %>\n  <% end -%>\nsystemctl enable --now ntpd\n<% else -%>\nsystemctl enable --now chronyd\n/usr/bin/chronyc -a makestep\n<% end -%>\n/usr/sbin/hwclock --systohc\n	t	\N	2025-01-19 19:42:38.170269	2025-01-19 19:42:38.170269	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The snippet configuring the system time using a given NTP server\nIt respects the following parameters:\n- use-ntp: boolean (default depends on OS release)\n- ntp-server: string (default=undef)	f	\N
102	pkg_manager	<%#\nkind: snippet\nname: pkg_manager\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Select package manager for the OS. Snippet sets the package manager\n  in the PKG_MANAGER env variable so it can be used in templates like this:\n  $PKG_MANAGER install -y pkg1 pkg2\n-%>\nif [ -f /etc/os-release ] ; then\n  . /etc/os-release\nfi\n\nif [ "${NAME%.*}" = 'FreeBSD' ]; then\n  PKG_MANAGER='pkg'\n  PKG_MANAGER_INSTALL="${PKG_MANAGER} install -y"\n  PKG_MANAGER_REMOVE="${PKG_MANAGER} delete -y"\n  PKG_MANAGER_UPGRADE="${PKG_MANAGER} install -y"\nelif [ -f /etc/fedora-release -o -f /etc/redhat-release -o -f /etc/amazon-linux-release -o -f /etc/system-release ]; then\n  PKG_MANAGER='dnf'\n  if [ -f /etc/redhat-release -a "${VERSION_ID%.*}" -le 7 ]; then\n    PKG_MANAGER='yum'\n  elif [ -f /etc/system-release ]; then\n    PKG_MANAGER='yum'\n  fi\n  PKG_MANAGER_INSTALL="${PKG_MANAGER} install -y"\n  PKG_MANAGER_REMOVE="${PKG_MANAGER} remove -y"\n  PKG_MANAGER_UPGRADE="${PKG_MANAGER} upgrade -y"\nelif [ -f /etc/debian_version ]; then\n  PKG_MANAGER='apt-get'\n  PKG_MANAGER_INSTALL="${PKG_MANAGER} install -y"\n  PKG_MANAGER_REMOVE="${PKG_MANAGER} remove -y"\n  PKG_MANAGER_UPGRADE="${PKG_MANAGER} -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' -o APT::Get::Upgrade-Allow-New='true' upgrade -y"\nelif [ -f /etc/arch-release ]; then\n  PKG_MANAGER='pacman'\n  PKG_MANAGER_INSTALL="${PKG_MANAGER} --noconfirm -S"\n  PKG_MANAGER_REMOVE="${PKG_MANAGER} --noconfirm -R"\n  PKG_MANAGER_UPGRADE="${PKG_MANAGER} --noconfirm -S"\nelif [ x$ID = xopensuse-tumbleweed -o x$ID = xsles ]; then\n  PKG_MANAGER='zypper'\n  PKG_MANAGER_INSTALL="${PKG_MANAGER} --non-interactive install --auto-agree-with-licenses"\n  PKG_MANAGER_REMOVE="${PKG_MANAGER} --non-interactive remove"\n  PKG_MANAGER_UPGRADE="${PKG_MANAGER} --non-interactive update"\nfi\n	t	\N	2025-01-19 19:42:38.179431	2025-01-19 19:42:38.179431	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Select package manager for the OS. Snippet sets the package manager\nin the PKG_MANAGER env variable so it can be used in templates like this:\n$PKG_MANAGER install -y pkg1 pkg2	f	\N
103	preseed_autoinstall_clevis_tang_wrapper	<%#\nkind: snippet\nname: preseed_autoinstall_clevis_tang_wrapper\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Wrapper snippet to set up Clevis/Tang disk encryption.\n  Requires Ubuntu >= 22.04.3.\n  The snippet is automatically indented by 2 spaces. For reference:\n  https://ubuntu.com/server/docs/install/autoinstall-reference\n%>\n- |\n  cat > /target/tmp/disk_enc_clevis_tang.sh <<"WRAPPER"\n  #!/bin/sh\n<%= indent(2) { snippet 'disk_enc_clevis_tang' } %>\n  WRAPPER\n- curtin in-target -- bash /tmp/disk_enc_clevis_tang.sh\n- curtin in-target -- rm /tmp/disk_enc_clevis_tang.sh\n	t	\N	2025-01-19 19:42:38.188653	2025-01-19 19:42:38.188653	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Wrapper snippet to set up Clevis/Tang disk encryption.\nRequires Ubuntu >= 22.04.3.\nThe snippet is automatically indented by 2 spaces. For reference:\nhttps://ubuntu.com/server/docs/install/autoinstall-reference	f	\N
104	preseed_kernel_options	<%#\nkind: snippet\nname: preseed_kernel_options\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: options for the kernel / preseed startup initialization\n-%>\n<%\n  is_debian = @host.operatingsystem.name == 'Debian'\n  hostname = @host.name\n  domain = @host.domain\n  iface = @host.provision_interface\n  mac = @host.provision_interface.mac\n  subnet4 = iface.subnet\n  subnet6 = iface.subnet6\n  options = []\n\n  if host_param('blacklist')\n    options << host_param('blacklist').split(',').collect{|x| "#{x.strip}.blacklist=yes"}.join(' ')\n  end\n\n  if mac\n    # hardware type is always 01 (ethernet) unless specified otherwise\n    if @ipxe_net\n      options << "BOOTIF=01-${netX/mac:hexhyp}"\n    else\n      options << "BOOTIF=#{host_param("hardware_type", "01")}-#{mac.gsub(':', '-')}"\n    end\n  end\n\n  if is_debian\n    options << "auto=true"\n  else\n    options << 'console-setup/ask_detect=false console-setup/layout=USA console-setup/variant=USA keyboard-configuration/layoutcode=us localechooser/translation/warn-light=true localechooser/translation/warn-severe=true'\n  end\n\n  if @host.provision_interface.vlanid.present?\n    options << "netcfg/use_vlan=true netcfg/vlan_id=#{@host.provision_interface.vlanid}"\n  end\n\n  if subnet4 && subnet4.dhcp_boot_mode?\n    options << 'netcfg/disable_dhcp=false'\n  elsif subnet4 && !subnet4.dhcp_boot_mode?\n    if @ipxe_net\n      options << 'netcfg/disable_dhcp=true netcfg/get_ipaddress=${netX/ip} netcfg/get_netmask=${netX/netmask} netcfg/get_gateway=${netX/gateway} netcfg/get_nameservers=${dns} netcfg/confirm_static=true'\n    else\n      dns_servers = subnet4.dns_servers.join(' ')\n      options << "netcfg/disable_dhcp=true netcfg/get_ipaddress=#{iface.ip} netcfg/get_netmask=#{subnet4.mask} netcfg/get_gateway=#{subnet4.gateway} netcfg/get_nameservers=\\"#{dns_servers}\\" netcfg/confirm_static=true"\n    end\n  elsif subnet6 && subnet6.dhcp_boot_mode?\n    options << 'netcfg/disable_dhcp=false'\n  elsif subnet6 && !subnet6.dhcp_boot_mode?\n    if @ipxe_net\n      options << 'netcfg/disable_dhcp=true netcfg/get_ipaddress=${netX/ip} netcfg/get_netmask=${netX/netmask} netcfg/get_gateway=${netX/gateway} netcfg/get_nameservers=${dns} netcfg/confirm_static=true'\n    else\n      dns_servers = subnet6.dns_servers.join(' ')\n      options << "netcfg/disable_dhcp=true netcfg/get_ipaddress=#{iface.ip6} netcfg/get_netmask=#{subnet6.mask} netcfg/get_gateway=#{subnet6.gateway} netcfg/get_nameservers=\\"#{dns_servers}\\" netcfg/confirm_static=true"\n    end\n  end\n\n  if host_param('pxe_kernel_options')\n    options << host_param('pxe_kernel_options')\n  end\n\n  options << "locale=#{host_param('lang') || 'en_US'}"\n  options << "hostname=#{hostname}"\n  options << "domain=#{domain}"\n%>\n<%# do not add newline after the next line %>\n<%= options.join(' ') -%>\n	t	\N	2025-01-19 19:42:38.197729	2025-01-19 19:42:38.197729	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	options for the kernel / preseed startup initialization	f	\N
105	preseed_kernel_options_autoinstall	<%#\nkind: snippet\nname: preseed_kernel_options_autoinstall\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: options for the kernel / preseed startup initialization\noses:\n- ubuntu\ntest_on:\n- ubuntu_autoinst4dhcp\n-%>\n<%\n  hostname = @host.name\n  domain = @host.domain\n  iface = @host.provision_interface\n  mac = @host.provision_interface.mac\n  subnet4 = iface.subnet\n  subnet6 = iface.subnet6\n  image_path = @preseed_path.sub(/\\/?$/, '.iso')\n  userdata_option = "ds=nocloud-net;s=http://#{foreman_request_addr}/userdata/#{mac ? mac + '/' : ''}"\n  options = []\n\n  if host_param('blacklist')\n    options << host_param('blacklist').split(',').collect{|x| "#{x.strip}.blacklist=yes"}.join(' ')\n  end\n  if @host.provision_interface.vlanid.present?\n    options << "netcfg/use_vlan=true netcfg/vlan_id=#{@host.provision_interface.vlanid}"\n  end\n  if subnet4 && subnet4.dhcp_boot_mode?\n    options << 'ip=dhcp'\n  elsif subnet4 && !subnet4.dhcp_boot_mode?\n    options << "ip=#{iface.ip}::#{subnet4.gateway}:#{subnet4.mask}:#{hostname}:#{iface.identifier}:none:#{subnet4.dns_servers.join(':')}"\n  elsif subnet6 && subnet6.dhcp_boot_mode?\n    options << 'ip=dhcp'\n  elsif subnet6 && !subnet6.dhcp_boot_mode?\n    options << "ip=[#{iface.ip6}]::[#{subnet6.gateway}]:[#{subnet6.mask}]:#{hostname}:#{iface.identifier}:none:[#{subnet6.dns_servers.join(']:[')}]"\n  end\n\n  options << "BOOTIF=#{mac}" if mac\n  options << 'ramdisk_size=1500000'\n  options << 'fsck.mode=skip'\n  options << 'autoinstall'\n  options << "url=http://#{@preseed_server}#{image_path}"\n  options << 'cloud-config-url=/dev/null'\n  if @add_userdata_quotes\n    options << "\\"#{userdata_option}\\""\n  else\n    options << userdata_option\n  end\n  options << 'console-setup/ask_detect=false'\n  options << "locale=#{host_param('lang') || 'en_US'}"\n  options << 'localechooser/translation/warn-light=true'\n  options << 'localechooser/translation/warn-severe=true'\n  options << "hostname=#{hostname}"\n  options << "domain=#{domain}"\n%>\n<%# do not add newline after the next line %>\n<%= options.join(' ') -%>\n	t	\N	2025-01-19 19:42:38.207371	2025-01-19 19:42:38.207371	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	options for the kernel / preseed startup initialization	f	\N
106	preseed_netplan_generic_interface	<%#\nname: preseed_netplan_generic_interface\nmodel: ProvisioningTemplate\nsnippet: true\nmodel: ProvisioningTemplate\nkind: snippet\noses:\n- Ubuntu\n-%>\n<%- if @interface.identifier.blank? -%>\n    id0:\n        match:\n          macaddress: "<%= @host.mac %>"\n<%- else -%>\n    <%= @interface.identifier %>:\n<%- end -%>\n        dhcp4: <%= @dhcp %>\n        dhcp6: <%= @dhcp6 %>\n<%-\nstatic_v4 = !@dhcp && !@subnet.nil? && !@interface.ip.nil?\nstatic_v6 = !@dhcp6 && !@subnet6.nil? && !@interface.ip6.nil?\n-%>\n<%- if static_v4 || static_v6 -%>\n        addresses:\n<%-   if static_v4 -%>\n          - <%= @interface.ip %>/<%= @subnet.cidr %>\n<%-   end -%>\n<%-   if static_v6 -%>\n          - "<%= @interface.ip6 %>/<%= @subnet6.cidr %>"\n<%-   end -%>\n<%-   if static_v4 && @subnet.gateway.present? -%>\n        gateway4: <%= @subnet.gateway %>\n<%-   end -%>\n<%-   if static_v6 && @subnet6.gateway.present? -%>\n        gateway6: "<%= @subnet6.gateway %>"\n<%-   end -%>\n<%-   if @interface.primary -%>\n        nameservers:\n          search: [ <%= @interface.domain %> ]\n          addresses:\n<%-     if static_v4 -%>\n<%-       @subnet.dns_servers.each do |dns_server| -%>\n            - <%= dns_server %>\n<%-       end -%>\n<%-     end -%>\n<%-     if static_v6 -%>\n<%-       @subnet6.dns_servers.each do |dns6_server| -%>\n            - "<%= dns6_server %>"\n<%-       end -%>\n<%-     end -%>\n<%-   end -%>\n<%- end -%>\n	t	\N	2025-01-19 19:42:38.217127	2025-01-19 19:42:38.217127	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	\N	f	\N
107	preseed_netplan_setup	<%#\nkind: snippet\nname: preseed_netplan_setup\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  This will configure your host networking, it configures your\n  primary interface as well as other NICs like BOND, BRIDGE, VLAN and Alias\n  interfaces.\noses:\n- Ubuntu\n-%>\n<% os_major = @host.operatingsystem.major.to_i -%>\n<% os_minor = @host.operatingsystem.minor.to_i -%>\n<%- -%>\n<%# Begin Ubuntu 18.04 and newer uses netplan instead of /etc/network/interfaces -%>\n<%- if os_major >= 20 -%>\n<%- bonding_interfaces = [] -%>\n<%- bridged_interfaces = [] -%>\n<%- vlans_interfaces = [] -%>\n  network:\n    version: 2\n<%#\n##### Processing bond-interfaces #####\n-%>\n<%- found = false -%>\n<%- @host.bond_interfaces.each do | bond | -%>\n  <%- bonding_interfaces.push(bond.identifier) -%>\n  <%- if !found -%>\n  <%- found = true -%>\n    bonds:\n  <%- end -%>\n<%- result= snippet('preseed_netplan_generic_interface', :variables => {\n                  :interface => bond,\n                  :subnet => bond.subnet,\n                  :subnet6 => bond.subnet6,\n                  :dhcp => bond.subnet.nil? ? false : bond.subnet.dhcp_boot_mode?,\n                  :dhcp6 => bond.subnet6.nil? ? false : bond.subnet6.dhcp_boot_mode? }) -%>\n  <%= result -%>\n        interfaces: <%= bond.attached_devices_identifiers %>\n        parameters:\n          mode: <%= bond.mode %>\n          <%- options = bond.bond_options.split() -%>\n          <%- options.each do | option | -%>\n          <%= option.gsub('=',': ') %>\n          <%- end -%>\n<% end -%>\n<%#\n##### Processing bridge interfaces #####\n-%>\n<%- found = false -%>\n<%- @host.bridge_interfaces.each do | bridge | -%>\n<%- next if bonding_interfaces.include?(bridge.identifier) -%>\n  <%- bridged_interfaces.push(bridge.identifier) -%>\n  <%- if !found -%>\n  <%- found = true -%>\n    bridges:\n  <%- end -%>\n<%- result= snippet('preseed_netplan_generic_interface', :variables => {\n                  :interface => bridge,\n                  :subnet => bridge.subnet,\n                  :subnet6 => bridge.subnet6,\n                  :dhcp => bridge.subnet.nil? ? false : bridge.subnet.dhcp_boot_mode?,\n                  :dhcp6 => bridge.subnet6.nil? ? false : bridge.subnet6.dhcp_boot_mode? }) -%>\n  <%= result -%>\n<%- end -%>\n<%#\n##### Processing vlan interfaces #####\n-%>\n<%- found = false -%>\n<%- @host.managed_interfaces.each do | vlan | -%>\n<%- next if bonding_interfaces.include?(vlan.identifier) -%>\n<%- next if bridged_interfaces.include?(vlan.identifier) -%>\n<%- next if !vlan.virtual? -%>\n  <%- vlans_interfaces.push(vlan.identifier) -%>\n  <%- if !found -%>\n  <%- found = true -%>\n    vlans:\n  <%- end -%>\n<%- result= snippet('preseed_netplan_generic_interface', :variables => {\n                  :interface => vlan,\n                  :subnet => vlan.subnet,\n                  :subnet6 => vlan.subnet6,\n                  :dhcp => vlan.subnet.nil? ? false : vlan.subnet.dhcp_boot_mode?,\n                  :dhcp6 => vlan.subnet6.nil? ? false : vlan.subnet6.dhcp_boot_mode? }) -%>\n  <%= result -%>\n        id: <%= vlan.tag %>\n        link: <%= vlan.attached_to %>\n<%- end -%>\n<%#\n##### Processing remaining interfaces (ethernets) #####\n-%>\n<%- found = false -%>\n<%- @host.managed_interfaces.each do | interface | -%>\n<%- next if bonding_interfaces.include?(interface.identifier) -%>\n<%- next if bridged_interfaces.include?(interface.identifier) -%>\n<%- next if vlans_interfaces.include?(interface.identifier) -%>\n  <%- interface_subnet = interface.subnet -%>\n  <%- if !found -%>\n  <%- found = true -%>\n    ethernets:\n  <%- end -%>\n<%- result= snippet('preseed_netplan_generic_interface', :variables => {\n                  :interface => interface,\n                  :subnet => interface.subnet,\n                  :subnet6 => interface.subnet6,\n                  :dhcp => interface.subnet.nil? ? false : interface.subnet.dhcp_boot_mode?,\n                  :dhcp6 => interface.subnet6.nil? ? false : interface.subnet6.dhcp_boot_mode? }) -%>\n  <%= result -%>\n<%- end -%>\n<%- end -%>\n	t	\N	2025-01-19 19:42:38.226729	2025-01-19 19:42:38.226729	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This will configure your host networking, it configures your\nprimary interface as well as other NICs like BOND, BRIDGE, VLAN and Alias\ninterfaces.	f	\N
108	preseed_networking_setup	<%#\nkind: snippet\nname: preseed_networking_setup\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  This will configure your host networking, it configures your primary interface as well\n  as other configures NICs. It supports physical, VLAN and Alias interfaces. It's intended to be\n  called in your preseed finish template.\n-%>\n<% host_subnet = @host.subnet -%>\n<% host_dhcp = host_subnet.nil? ? true : host_subnet.dhcp_boot_mode? -%>\n<% host_subnet6 = @host.subnet6 -%>\n<% host_dhcp6 = host_subnet6.nil? ? true : host_subnet6.dhcp_boot_mode? -%>\n\nreal=`ip -o link | awk '/<%= @host.mac -%>/ {print $2;}' | sed s/://`\ncat << EOF > /etc/network/interfaces\n#loopback\nauto lo\niface lo inet loopback\n\n#<%= @host.primary_interface.identifier %>\nauto $real\nallow-hotplug $real\niface $real inet <%= host_dhcp ? 'dhcp' : 'static' %>\n<% if host_subnet && !host_dhcp -%>\n    address <%= @host.ip %>\n    gateway <%= host_subnet.gateway %>\n    netmask <%= host_subnet.mask %>\n    dns-nameservers <%= host_subnet.dns_servers.join(' ') %>\n    dns-search <%= @host.domain %>\n<% end -%>\n<% if @host.ip6 && host_subnet6 && !host_dhcp6 -%>\niface $real inet6 static\n    address <%= @host.ip6 %>/<%= host_subnet6.cidr %>\n<% if host_subnet6.gateway -%>\n    gateway <%= host_subnet6.gateway %>\n<% end -%>\n<% end -%>\nEOF\n\n<% @host.managed_interfaces.each do |interface| -%>\n<% interface_subnet = interface.subnet -%>\n<% interface_dhcp = interface_subnet.nil? ? true : interface_subnet.dhcp_boot_mode? -%>\n<% interface_subnet6 = interface.subnet6 -%>\n<% interface_dhcp6 = interface_subnet6.nil? ? true : interface_subnet6.dhcp_boot_mode? -%>\n<% next if !interface.managed? || (interface_subnet.nil? && interface_subnet6.nil?) || interface.primary -%>\n<% if interface.virtual? -%>\n    real="<%= interface.attached_to -%>"\n<% else -%>\n    real=`ip -o link | awk '/<%= interface.mac -%>/ {print $2;}' | sed s/:$//`\n<% end -%>\n\ncat << EOF >> /etc/network/interfaces\n#<%= interface.identifier %>\n<% if interface_subnet %>\nauto $real\niface $real inet <%= interface_dhcp ? 'dhcp' : 'static' %>\n<% unless interface_dhcp -%>\n    address <%= interface.ip %>\n    netmask <%= interface_subnet.mask %>\n<% end -%>\n<% end -%>\n<% if interface.ip6 && interface_subnet6 %>\n<% unless interface_dhcp6 -%>\niface $real inet6 static\n    address <%= interface.ip6 %>/<%= interface_subnet6.cidr %>\n<% if interface_subnet6.gateway -%>\n    gateway <%= interface_subnet6.gateway %>\n<% end -%>\n<% end -%>\n<% end -%>\nEOF\n<% end -%>\n	t	\N	2025-01-19 19:42:38.235875	2025-01-19 19:42:38.235875	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This will configure your host networking, it configures your primary interface as well\nas other configures NICs. It supports physical, VLAN and Alias interfaces. It's intended to be\ncalled in your preseed finish template.	f	\N
109	puppet.conf	<%#\nkind: snippet\nname: puppet.conf\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Generates a puppet.conf file which is required for the puppet agent bootstraping.\n  The puppet server and CA is configured based on the host configuration. It supports\n  Puppet 5 and newer.\n-%>\n<%\n  os_family = @host.operatingsystem.family\n  os_name   = @host.operatingsystem.name\n\n  aio_enabled = host_param_true?('enable-puppetlabs-repo') ||  host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-puppet8') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppet7') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppet6') || host_param_true?('enable-puppetlabs-puppet5-repo') || host_param_true?('enable-puppet5')\n  aio_available = os_family == 'Debian' || os_family == 'Redhat' || os_name == 'SLES'\n\n  if os_family == 'Windows'\n    var_dir = 'C:\\ProgramData\\PuppetLabs\\puppet\\cache'\n    log_dir = 'C:\\ProgramData\\PuppetLabs\\puppet\\var\\log'\n    run_dir = 'C:\\ProgramData\\PuppetLabs\\puppet\\var\\run'\n    ssl_dir = 'C:\\ProgramData\\PuppetLabs\\puppet\\etc\\ssl'\n  else\n    if @host.operatingsystem.family == 'Freebsd'\n      var_dir = '/var/puppet'\n    else\n      var_dir = '/var/lib/puppet'\n    end\n    log_dir = '/var/log/puppet'\n    run_dir = '/var/run/puppet'\n    ssl_dir = '\\$vardir/ssl'\n  end\n-%>\n[main]\n<%- unless host_param('dns_alt_names').to_s.empty? -%>\ndns_alt_names = <%= host_param('dns_alt_names') %>\n<%- end -%>\n<% unless aio_enabled && aio_available -%>\nvardir = <%= var_dir %>\nlogdir = <%= log_dir %>\nrundir = <%= run_dir %>\nssldir = <%= ssl_dir %>\n<% end -%>\n\n[agent]\npluginsync      = true\nreport          = true\n<%- if host_puppet_ca_server.present? -%>\nca_server       = <%= host_puppet_ca_server %>\n<%- end -%>\ncertname        = <%= @host.certname %>\n<%- if host_puppet_server.present? -%>\nserver          = <%= host_puppet_server %>\n<%- end -%>\n<%- if host_puppet_environment.present? -%>\nenvironment     = <%= host_puppet_environment %>\n<%- end -%>\n	t	\N	2025-01-19 19:42:38.245048	2025-01-19 19:42:38.245048	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates a puppet.conf file which is required for the puppet agent bootstraping.\nThe puppet server and CA is configured based on the host configuration. It supports\nPuppet 5 and newer.	f	\N
110	puppet_setup	<%#\nkind: snippet\nname: puppet_setup\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Bootstraps the Puppet agent and performs one run to create a certificate request.\n\n  In more details it installs a Puppet agent, creates the necessary configuration files,\n  enables the Puppet agent service and performs a single run with a specified tag.\n  By default the tag `no_such_tag` is used to generate an empty run.\n  An empty run can be used for the agent to detect it's missing a client certificate\n  and ask for a new one from the host's Puppet CA.\n-%>\n<%\nos_family = @host.operatingsystem.family\nos_major  = @host.operatingsystem.major.to_i\nos_name   = @host.operatingsystem.name\n\naio_enabled = host_param_true?('enable-puppetlabs-repo') || host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-puppet8') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppet7') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppet6') || host_param_true?('enable-puppetlabs-puppet5-repo') || host_param_true?('enable-puppet5')\n\nif host_param('run-puppet-in-installer-tags')\n  puppet_tags = host_param('run-puppet-in-installer-tags')\nelse\n  puppet_tags = 'no_such_tag'\nend\n\nif os_family == 'Freebsd'\n  freebsd_package = host_param_true?('enable-puppet6') ? 'puppet6' : 'puppet5'\n  etc_path = '/usr/local/etc/puppet'\n  bin_path = '/usr/local/bin'\nelsif os_family == 'Windows'\n  windows_package = "puppet-agent-#{@host.architecture}.msi"\n  etc_path = 'C:\\ProgramData\\PuppetLabs\\puppet\\etc'\n  bin_path = 'C:\\Program Files\\Puppet Labs\\Puppet\\bin'\nelsif aio_enabled\n  linux_package = 'puppet-agent'\n  etc_path = '/etc/puppetlabs/puppet'\n  bin_path = '/opt/puppetlabs/bin'\nelse\n  linux_package = os_family == 'Suse' ? 'rubygem-puppet' : 'puppet'\n  etc_path = '/etc/puppet'\n  bin_path = '/usr/bin'\nend\n-%>\n<% if os_family == 'Debian' -%>\napt-get update\napt-get install -y <%= linux_package %>\n<% elsif os_family == 'Freebsd' -%>\npkg install -y <%= freebsd_package %>\n<% elsif os_family == 'Redhat' -%>\nif [ -f /usr/bin/dnf ]; then\n  dnf -y install <%= linux_package %>\nelse\n  yum -t -y install <%= linux_package %>\nfi\n<% elsif os_family == 'Suse' -%>\n<% if host_param_true?('enable-puppetlabs-repo') || host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppetlabs-puppet5-repo') -%>\nrpmkeys --import https://yum.puppet.com/RPM-GPG-KEY-puppetlabs\nrpmkeys --import https://yum.puppet.com/RPM-GPG-KEY-puppet\n<% end -%>\n<% if @host.provision_method == 'image' -%>\n/usr/bin/zypper -n install <%= linux_package %>\n<% end -%>\n<% elsif os_family == 'Windows' -%>\n$puppet_agent_msi = "${env:TEMP}\\<%= windows_package %>"\n$puppet_install_args = @(\n  '/qn',\n  '/norestart',\n  '/i',\n  "${puppet_agent_msi}",\n  <%- if host_puppet_ca_server.present? -%>\n  "PUPPET_CA_SERVER=<%= host_puppet_ca_server %>",\n  <%- end -%>\n  "PUPPET_MASTER_SERVER=<%= host_puppet_server %>"\n)\n\nWrite-Host "Installing ${puppet_agent_msi} with args ${puppet_install_args}"\nStart-Process 'msiexec.exe' -ArgumentList $puppet_install_args -Wait -NoNewWindow\n<% end -%>\n\n<% if os_family == 'Windows' -%>\n$puppet_conf = @("<%= snippet 'puppet.conf' %>".Replace("`n","`r`n"))\nOut-File -FilePath <%= etc_path %>\\puppet.conf -InputObject $puppet_conf\n<% else -%>\ncat > <%= etc_path %>/puppet.conf << EOF\n<%= snippet 'puppet.conf' %>\nEOF\n<% end -%>\n\n<% if @host.puppetca_token.present? -%>\n<% if os_family == 'Windows' -%>\n$csr_attributes = @("<%= snippet 'csr_attributes.yaml' %>".Replace("`n","`r`n"))\nOut-File -FilePath <%= etc_path %>\\csr_attributes.yaml -InputObject $csr_attributes\n<% else -%>\ncat > <%= etc_path %>/csr_attributes.yaml << EOF\n<%= snippet 'csr_attributes.yaml' %>\nEOF\n<% end -%>\n<% end -%>\n\n<% if os_family == 'Redhat' -%>\n<% if os_major > 6 -%>\npuppet_unit=puppet\n/usr/bin/systemctl list-unit-files | grep -q puppetagent && puppet_unit=puppetagent\n/usr/bin/systemctl enable ${puppet_unit}\n<% else -%>\n/sbin/chkconfig --level 345 puppet on\n<% end -%>\n<% end -%>\n<% if os_family == 'Freebsd' -%>\necho 'puppet_enable="YES"' >>/etc/rc.conf\n<% end -%>\n<% unless aio_enabled -%>\n<% if os_family == 'Debian' -%>\nif [ -f "/etc/default/puppet" ]\nthen\n/bin/sed -i 's/^START=no/START=yes/' /etc/default/puppet\nfi\n<%= bin_path %>/puppet agent --enable\n<% elsif os_family == 'Suse' -%>\nif [ -f "/etc/sysconfig/puppet" ]\nthen\n/usr/bin/sed -ie s/^PUPPET_SERVER=.*/PUPPET_SERVER=<%= host_puppet_server %>/ /etc/sysconfig/puppet\nfi\n<% end -%>\n<% end -%>\n<%#\nIMPORTANT NOTE: Setting "run-puppet-in-installer" is UNSUPPORTED!\n\nThe default mode of operation in Foreman is only to set up Puppet, but to not run it inside the installer environment.\nRunning Puppet inside the installer can cause various hard to diagnose errors, many of them resulting from the fact that\nservices are not started inside the installer.\n\nIf you are aware of the downsides, you can trigger a Puppet run inside the installer by setting the variable\nrun-puppet-in-installer to true.\n\nNote, that this is an *unsupported mode of operation* and not supported by Foreman at all. You have been warned!\n%>\n<% if host_param_true?('run-puppet-in-installer') -%>\n<% if (os_name == 'Ubuntu' && os_major >= 15) || (os_name == 'Debian' && os_major >= 8) -%>\n# Puppet tries to detect the init system by checking the presence of the directory /run/systemd/system. That detection\n# fails in a chroot environment like the one the installer provides. See Puppet tickets PA-136 and PUP-5577\n#\n# We work around that here until it gets fixed in Puppet (probably never for Puppet 3.x)\nmkdir -p /run/systemd/system\n<% end -%>\n<% end -%>\n# export a custom fact called 'is_installer' to allow detection of the installer environment in Puppet modules\n<% if os_family == 'Windows' -%>\n$env:FACTER_is_installer = $TRUE\n\n# passing a non-existent tag like "no_such_tag" to the puppet agent only initializes the node\n# You can select specific tag(s) with the "run-puppet-in-installer-tags" parameter\n# or set a full puppet run by setting "run-puppet-in-installer" = true\n$puppet_agent_args = @(\n  "agent",\n  "--config", "<%= etc_path %>\\puppet.conf",\n  "--onetime",\n  <%= host_param_true?('run-puppet-in-installer') || @full_puppet_run ? '' : "\\"--tags #{puppet_tags}\\"," %>\n  <%= host_puppet_server.blank? ? '' : "\\"--server #{host_puppet_server}\\"," %>\n  "--no-daemonize"\n)\nStart-Process '<%= bin_path %>\\puppet' -ArgumentList $puppet_agent_args -Wait -NoNewWindow\n<% else -%>\nexport FACTER_is_installer=true\n# passing a non-existent tag like "no_such_tag" to the puppet agent only initializes the node\n# You can select specific tag(s) with the "run-puppet-in-installer-tags" parameter\n# or set a full puppet run by setting "run-puppet-in-installer" = true\n<% if host_param_true?('run-puppet-in-installer') || @full_puppet_run -%>\necho "Performing initial full puppet run"\n<% else -%>\necho "Performing initial puppet run for --tags <%= puppet_tags %>"\n<% end -%>\n<%= bin_path %>/puppet agent --config <%= etc_path %>/puppet.conf --onetime <%= host_param_true?('run-puppet-in-installer') || @full_puppet_run ? '' : "--tags #{puppet_tags}" %> <%= host_puppet_server.blank? ? '' : "--server #{host_puppet_server}" %> --no-daemonize\n<% if os_family == 'Suse' || (os_name == 'Debian' && os_major > 8) || (os_name == 'Ubuntu' && os_major >= 15) -%>\n<% if os_family == 'Suse' -%>\n<%= bin_path %>/puppet resource service puppet enable=true\n<% else -%>\nsystemctl enable puppet\n<% end -%>\n<% end -%>\n<% if @host.provision_method == 'image' -%>\n<%= bin_path %>/puppet resource service puppet ensure=running\n<% end -%>\n<% end -%>\n	t	\N	2025-01-19 19:42:38.254151	2025-01-19 19:42:38.254151	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Bootstraps the Puppet agent and performs one run to create a certificate request.\n\nIn more details it installs a Puppet agent, creates the necessary configuration files,\nenables the Puppet agent service and performs a single run with a specified tag.\nBy default the tag `no_such_tag` is used to generate an empty run.\nAn empty run can be used for the agent to detect it's missing a client certificate\nand ask for a new one from the host's Puppet CA.	f	\N
111	puppetlabs_repo	<%#\nkind: snippet\nname: puppetlabs_repo\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Fetches the package that deploys the PuppetLabs repository that can be\n  used to install Puppet from. It only performs the installation in case\n  one of the enable-puppetlabs*repo parameter is set to true.\n-%>\n<%\nhttp_proxy   = host_param('http-proxy') ? " --httpproxy #{host_param('http-proxy')}" : nil\nhttp_port    = host_param('http-proxy-port') ? " --httpport #{host_param('http-proxy-port')}" : nil\nproxy_uri    = host_param('http-proxy') ? "http://#{host_param('http-proxy')}:#{host_param('http-proxy-port')}" : nil\nproxy_string = proxy_uri ? " -e https_proxy=#{proxy_uri}/" : ''\nproxy_string_bits = proxy_uri ? " -ProxyUsage Override -ProxyList #{proxy_uri}" : ''\nos_family = @host.operatingsystem.family\nos_major  = @host.operatingsystem.major.to_i\nos_name   = @host.operatingsystem.name\n\nif os_family == 'Redhat'\n  repo_host = 'yum.puppet.com'\n  if os_name == 'Fedora'\n    repo_os = 'fedora'\n  else\n    repo_os = 'el'\n  end\nelsif os_family == 'Suse'\n  repo_host = 'yum.puppet.com'\n  repo_os = 'sles' # PuppetLabs repos only exist for SLES, not OpenSUSE\nelsif os_family == 'Debian'\n  repo_host = 'apt.puppet.com'\n  repo_os = @host.operatingsystem.release_name\nelsif os_family == 'Windows'\n  repo_host = 'downloads.puppet.com'\n  repo_os = 'windows'\nend\n\nif host_param_true?('enable-puppetlabs-repo')\n  repo_name = 'puppet-release'\nelsif host_param_true?('enable-official-puppet8-repo')\n  repo_name = 'puppet8-release'\nelsif host_param_true?('enable-official-puppet7-repo')\n  repo_name = 'puppet7-release'\nelsif host_param_true?('enable-puppetlabs-puppet6-repo')\n  repo_name = 'puppet6-release'\nelsif host_param_true?('enable-puppetlabs-puppet5-repo')\n  repo_name = 'puppet5-release'\nend\n-%>\n<% if repo_name -%>\n<% if os_family == 'Redhat' || os_name == 'SLES' -%>\nrpm -Uvh<%= http_proxy %><%= http_port %> https://<%= repo_host %>/<%= repo_name %>-<%= repo_os %>-<%= os_major %>.noarch.rpm\n<% elsif os_family == 'Debian' -%>\napt-get update\napt-get -y install ca-certificates\nwget -O /tmp/<%= repo_name %>-<%= repo_os %>.deb<%= proxy_string %> https://<%= repo_host %>/<%= repo_name %>-<%= repo_os %>.deb\ndpkg -i /tmp/<%= repo_name %>-<%= repo_os %>.deb\n<% elsif os_family == 'Windows' -%>\n$puppet_agent_source = 'https://<%= repo_host %>/<%= repo_os %>/puppet-agent-<%= @host.architecture %>-latest.msi'\n$puppet_agent_msi = "${env:TEMP}\\puppet-agent-<%= @host.architecture %>.msi"\nWrite-Host "Downloading puppet-agent from ${$puppet_agent_source} to ${puppet_agent_msi}"\nStart-BitsTransfer -Source "${puppet_agent_source}" -Destination "${puppet_agent_msi}"<%= proxy_string_bits %>\n<% end -%>\n<% end -%>\n	t	\N	2025-01-19 19:42:38.263415	2025-01-19 19:42:38.263415	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Fetches the package that deploys the PuppetLabs repository that can be\nused to install Puppet from. It only performs the installation in case\none of the enable-puppetlabs*repo parameter is set to true.	f	\N
112	pxegrub2_chainload	<%#\nkind: snippet\nname: pxegrub2_chainload\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  In Foreman's typical PXE workflow, managed hosts are configured to always boot from network and inventory build flag dictates if they should boot into installer (build is on) or boot from local drive (build is off). This template is used to chainload from EFI ESP for systems which booted from network. It is not as straightforward as in BIOS and EFI boot file must be found on an ESP partition.\n\n  This will only be needed when provisioned hosts are set to boot from network, typically EFI firmware implementations overrides boot order after new OS installation. This behavior can be set in EFI, or "efi_bootentry" host parameter can be set to "previous" to override boot order back to previous (network) setting. See efibootmgr_netboot snippet for more info.\n-%>\n<%\n  paths = [\n    '/EFI/fedora/shim.efi',\n    '/EFI/fedora/grubx64.efi',\n    '/EFI/redhat/shim.efi',\n    '/EFI/redhat/grubx64.efi',\n    '/EFI/centos/shim.efi',\n    '/EFI/centos/grubx64.efi',\n    '/EFI/rocky/shim.efi',\n    '/EFI/rocky/grubx64.efi',\n    '/EFI/almalinux/shim.efi',\n    '/EFI/almalinux/grubx64.efi',\n    '/EFI/debian/grubx64.efi',\n    '/EFI/ubuntu/grubx64.efi',\n    '/EFI/sles/grubx64.efi',\n    '/EFI/opensuse/grubx64.efi',\n    '/EFI/Microsoft/boot/bootmgfw.efi'\n  ]\n  config_paths = [\n    '/EFI/fedora/grub.cfg',\n    '/EFI/redhat/grub.cfg',\n    '/EFI/centos/grub.cfg',\n    '/EFI/rocky/grub.cfg',\n    '/EFI/almalinux/grub.cfg',\n    '/EFI/debian/grub.cfg',\n    '/EFI/ubuntu/grub.cfg',\n    '/EFI/sles/grub.cfg',\n    '/EFI/opensuse/grub.cfg',\n  ]\n-%>\ninsmod part_gpt\ninsmod fat\ninsmod chain\n\necho "VMWare hosts with QuickBoot feature enabled may not find the local ESP"\necho "partition due to not initializing all the EFI devices. To address this,"\necho "use an up-to-date grub2 (*) version and include the "connectefi scsi" statement"\necho "as provided below. If you're using an older grub2 version or"\necho "the "connectefi" option isn't recognized by your grub2, grub2 will print a error"\necho "like 'can't find command connectefi' but the boot process will continue."\necho "For hosts, you can omit this by adding a (global) parameter to 'grub2-connectefi=false'."\necho "For the default GRUB2 script, you can omit this by setting the"\necho "default_connectefi_option below to 'false'."\necho "Valid values of 'grub2-connectefi' parameter: false, scsi, pciroot"\necho\necho "Virtual or physical hosts using Software RAID for the ESP partition may try"\necho "booting on the Software RAID, which will fail. To workaround, upgrade to the"\necho "latest grub2 (*) and add "--efidisk-only" argument to the "search" command in"\necho "the grub2_chainload template."\necho\necho "(*) grub2-efi-x64-2.02-122.el8 (upstream doesn't have the patches yet)"\necho\n<%=\n  default_connectefi_option = 'scsi'\n  connectefi_option = @host ? host_param('grub2-connectefi', default_connectefi_option) : default_connectefi_option\n  connectefi_option = nil if connectefi_option == 'false'\n  "connectefi #{connectefi_option}" if connectefi_option\n%>\n\nif [ "${lockdown}" == "y" ]; then\n  if [ "${default}" == "local" ]; then\n    set default="grub_config"\n  fi\n\n  menuentry 'Loading GRUB2 config from ESP' --id grub_config {\n<%\n  config_paths.each do |config_path|\n-%>\n  echo "Trying <%= config_path %>"\n  unset chroot\n  # add --efidisk-only when using Software RAID\n  search --file --no-floppy --set=chroot <%= config_path %>\n  if [ -f ($chroot)<%= config_path %> ]; then\n    configfile ($chroot)<%= config_path %>\n  fi\n<%\n  end\n-%>\n  }\nfi\n\nmenuentry 'Chainload Grub2 EFI from ESP' --id local_chain_hd0 {\n  echo "Chainloading Grub2 EFI from ESP, enabled devices for booting:"\n  ls\n<%\n  paths.each do |path|\n-%>\n  echo "Trying <%= path %> "\n  unset chroot\n  # add --efidisk-only when using Software RAID\n  search --file --no-floppy --set=chroot <%= path %>\n  if [ -f ($chroot)<%= path %> ]; then\n    chainloader ($chroot)<%= path %>\n    echo "Found <%= path %> at $chroot, attempting to chainboot it..."\n    sleep 2\n    boot\n  fi\n<%\n  end\n-%>\n  echo "Partition with known EFI file not found, you may want to drop to grub shell"\n  echo "and investigate available files updating 'pxegrub2_chainload' template and"\n  echo "the list of known filepaths for probing. Available devices are:"\n  echo\n  ls\n  echo\n  echo "If you cannot see the HDD, make sure the drive is marked as bootable in EFI and"\n  echo "not hidden. Boot order must be the following:"\n  echo "1) NETWORK"\n  echo "2) HDD"\n  echo\n  echo "The system will poweroff in 2 minutes or press ESC to poweroff immediately."\n  sleep -i 120\n  halt\n}\n\nmenuentry 'Chainload into BIOS bootloader on first disk' --id local_chain_legacy_hd0 {\n  set root=(hd0,0)\n  chainloader +1\n  boot\n}\n\nmenuentry 'Chainload into BIOS bootloader on second disk' --id local_chain_legacy_hd1 {\n  set root=(hd1,0)\n  chainloader +1\n  boot\n}\n	t	\N	2025-01-19 19:42:38.272552	2025-01-19 19:42:38.272552	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	In Foreman's typical PXE workflow, managed hosts are configured to always boot from network and inventory build flag dictates if they should boot into installer (build is on) or boot from local drive (build is off). This template is used to chainload from EFI ESP for systems which booted from network. It is not as straightforward as in BIOS and EFI boot file must be found on an ESP partition.\n\nThis will only be needed when provisioned hosts are set to boot from network, typically EFI firmware implementations overrides boot order after new OS installation. This behavior can be set in EFI, or "efi_bootentry" host parameter can be set to "previous" to override boot order back to previous (network) setting. See efibootmgr_netboot snippet for more info.	f	\N
178	Manage Windows Updates - Ansible Default	- hosts: all\n  vars:\n    updates: []\n    <% if input('state').blank? %>\n    state: searched\n    <% else %>\n    state: <%= input('state') %>\n    <% end %>\n\n  tasks:\n    - name: "{{ state | replace('ed','') | capitalize }} Windows Updates"\n      win_updates:\n        <% unless input('reject_list').blank? %>\n        blacklist: <%= input('reject_list') %>\n        <% end -%>\n        <% if input('category_names').blank? %>\n        category_names: ["CriticalUpdates", "SecurityUpdates", "UpdateRollups"]\n        <% else %>\n        category_names: <%= input('category_names') %>\n        <% end %>\n        <% unless input('log_path').blank? %>\n        log_path: <%= input('log_path') %>\n        <% end -%>\n        <% if input('reboot').blank? %>\n        reboot: false\n        <% else %>\n        reboot: <%= input('reboot') %>\n        <% end %>\n        <% if input('reboot_timeout').blank? %>\n        reboot_timeout: 1200\n        <% else %>\n        reboot_timeout: <%= input('reboot_timeout') %>\n        <% end -%>\n        <% if input('server_selection').blank? %>\n        server_selection: default\n        <% else %>\n        server_selection: <%= input('server_selection') %>\n        <% end %>\n        state: "{{ state }}"\n        <% if input('use_scheduled_task').blank? %>\n        use_scheduled_task: false\n        <% else %>\n        use_scheduled_task: <%= input('use_scheduled_task') %>\n        <% end %>\n        <% if !input('whitelist').blank? %>\n        whitelist: <%= input('whitelist') %>\n        <% end -%>\n\n      register: found_updates\n      \n    - name: "Get all {{ state }} updates"\n      set_fact:\n        updates: "{{ updates + [ current_update ] }}"\n      vars:\n        current_update: "{{ item.value.title  }}"\n      loop: "{{ found_updates.updates | dict2items }}"\n      no_log: true\n\n    - name: "List {{ state }} Windows Updates"\n      debug: \n        msg: "{{ item }}"\n      loop: "{{ updates }}"	f	\N	2025-01-19 19:42:39.346929	2025-01-19 19:42:39.346929	t	t	\N	JobTemplate	\N	Ansible Playbook	Ansible	\N	\N	\N	f	\N
113	pxegrub2_discovery	<%#\nkind: snippet\nname: pxegrub2_discovery\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Snippet with grub2 menu items for discovery plugin. It is included in PXEGrub2 Default templates to boot unknown hosts into discovery image.\n\n  RHEL 7 virtio driver does not have persistent naming scheme, causing interfaces\n  to be named eth0, eth1, etc.. If you want to enable the new persistent naming\n  scheme and get inteface names like ens3, add net.ifnames=1 to the linuxefi line\n  below. This will not be fixed until RHEL8 due to prevent breaking changes for\n  existing systems. See RHBZ#1259015 for more details.\n-%>\ncommon="rootflags=loop root=live:/fdi.iso rootfstype=auto ro rd.live.image acpi=force rd.luks=0 rd.md=0 rd.dm=0 rd.lvm=0 rd.bootif=0 rd.neednet=0 nokaslr nomodeset proxy.url=<%= foreman_server_url %> proxy.type=foreman BOOTIF=01-$net_default_mac"\n\nif [ ${grub_platform} == "pc" ]; then\n  menuentry 'Foreman Discovery Image' --id discovery {\n    linux boot/fdi-image/vmlinuz0 ${common}\n    initrd boot/fdi-image/initrd0.img\n  }\nelse\n  menuentry 'Foreman Discovery Image EFI' --id discovery {\n    linuxefi boot/fdi-image/vmlinuz0 ${common}\n    initrdefi boot/fdi-image/initrd0.img\n  }\nfi\n	t	\N	2025-01-19 19:42:38.281827	2025-01-19 19:42:38.281827	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Snippet with grub2 menu items for discovery plugin. It is included in PXEGrub2 Default templates to boot unknown hosts into discovery image.\n\nRHEL 7 virtio driver does not have persistent naming scheme, causing interfaces\nto be named eth0, eth1, etc.. If you want to enable the new persistent naming\nscheme and get inteface names like ens3, add net.ifnames=1 to the linuxefi line\nbelow. This will not be fixed until RHEL8 due to prevent breaking changes for\nexisting systems. See RHBZ#1259015 for more details.	f	\N
114	pxegrub2_mac	<%#\nkind: snippet\nname: pxegrub2_mac\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Snippet that is included in all PXEGrub2 templates in order to find MAC-based configuration on TFTP/HTTPBoot. Grub2 in Red Hat is patched with this feature, however, Debian/Ubuntu or other distributions do not have this patch.\n-%>\necho "Trying /httpboot/grub2/grub.cfg-$net_default_mac"\nconfigfile "/httpboot/grub2/grub.cfg-$net_default_mac"\n\necho "Trying /grub2/grub.cfg-$net_default_mac"\nconfigfile "/grub2/grub.cfg-$net_default_mac"\n\n# The following four statements breaks grub2 and it's no\n# longer able to load any file from the base URL.\n# Comment them out to be able to use (UEFI/iPXE) HTTP Boot:\n# https://bugzilla.redhat.com/show_bug.cgi?id=1763216\necho "Trying grub2/grub.cfg-$net_default_mac"\nconfigfile "grub2/grub.cfg-$net_default_mac"\n\necho "Trying grub.cfg-$net_default_mac"\nconfigfile "grub.cfg-$net_default_mac"\n	t	\N	2025-01-19 19:42:38.290964	2025-01-19 19:42:38.290964	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Snippet that is included in all PXEGrub2 templates in order to find MAC-based configuration on TFTP/HTTPBoot. Grub2 in Red Hat is patched with this feature, however, Debian/Ubuntu or other distributions do not have this patch.	f	\N
115	pxegrub_chainload	<%#\nkind: snippet\nname: pxegrub_chainload\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Snippet used to chainload BIOS HDD when booted from network. Used in PXEGrub global and local templates.\n-%>\n<%\n  # paths variable must be passed into the snippet, otherwise no EFI items are rendered\n  if !@paths.nil? && @paths.size > 1\n-%>\nfallback=<%= (1..@paths.size).to_a.join(' ') %>\n  <% @paths.each do |path| %>\ntitle Chainload Grub from /EFI/<%= path %> or try next\n  rootnoverify (hd0,0)\n  chainloader /EFI/<%= path %>/grubx64.efi\n  <% end -%>\n<% else -%>\ntitle Update your PXEGrub local template to get EFI options\n  root (hd0,0)\n  chainloader +1\n<% end -%>\n\ntitle Chainload into bootloader on first disk\n  root (hd0,0)\n  chainloader +1\n	t	\N	2025-01-19 19:42:38.302148	2025-01-19 19:42:38.302148	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Snippet used to chainload BIOS HDD when booted from network. Used in PXEGrub global and local templates.	f	\N
116	pxegrub_discovery	<%#\nkind: snippet\nname: pxegrub_discovery\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Snippet with Grub menu items for discovery plugin. It is included in PXEGrub Default templates to boot unknown hosts into discovery image.\n\n  RHEL 7 virtio driver does not have persistent naming scheme, causing interfaces\n  to be named eth0, eth1, etc.. If you want to enable the new persistent naming\n  scheme and get inteface names like ens3, add net.ifnames=1 to the linuxefi line\n  below. This will not be fixed until RHEL8 due to prevent breaking changes for\n  existing systems. See RHBZ#1259015 for more details.\n-%>\n# http://projects.theforeman.org/issues/15997\ntitle Foreman Discovery Image - not supported with Grub 1.x\n  kernel boot/fdi-image/vmlinuz0 rootflags=loop root=live:/fdi.iso rootfstype=auto ro rd.live.image acpi=force rd.luks=0 rd.md=0 rd.dm=0 rd.lvm=0 rd.bootif=0 rd.neednet=0 nokaslr nomodeset proxy.url=<%= foreman_server_url %> proxy.type=foreman BOOTIF=01-$net_default_mac\n  initrd boot/fdi-image/initrd0.img\n	t	\N	2025-01-19 19:42:38.311716	2025-01-19 19:42:38.311716	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Snippet with Grub menu items for discovery plugin. It is included in PXEGrub Default templates to boot unknown hosts into discovery image.\n\nRHEL 7 virtio driver does not have persistent naming scheme, causing interfaces\nto be named eth0, eth1, etc.. If you want to enable the new persistent naming\nscheme and get inteface names like ens3, add net.ifnames=1 to the linuxefi line\nbelow. This will not be fixed until RHEL8 due to prevent breaking changes for\nexisting systems. See RHBZ#1259015 for more details.	f	\N
117	pxelinux_chainload	<%#\nkind: snippet\nname: pxelinux_chainload\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Snippet used to chainload BIOS HDD when booted from network. Used in PXELinux global and local templates.\n-%>\nLABEL local\n  MENU LABEL Default local boot\n  LOCALBOOT 0\n\nLABEL local_primary\n  MENU LABEL Default local boot from primary hard drive\n  LOCALBOOT 0x80\n\nLABEL local_skip\n  MENU LABEL Boot from the next BIOS device\n  LOCALBOOT -1\n\nLABEL local_chain_hd0\n  MENU LABEL Chainload the first hard drive (hd0)\n  COM32 chain.c32\n  APPEND hd0\n\nLABEL local_chain_hd1\n  MENU LABEL Chainload the second hard drive (hd1)\n  COM32 chain.c32\n  APPEND hd1\n	t	\N	2025-01-19 19:42:38.321098	2025-01-19 19:42:38.321098	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Snippet used to chainload BIOS HDD when booted from network. Used in PXELinux global and local templates.	f	\N
161	Check Update - Script Default	<%\n  supported_families = ['Redhat', 'Debian', 'Suse']\n  render_error(N_('Unsupported or no operating system found for this host.')) unless @host.operatingsystem && supported_families.include?(@host.operatingsystem.family)\n\n  command = case @host.operatingsystem.family\n            when 'Redhat'\n              'yum check-update'\n            when 'Debian'\n              'apt list --upgradable'\n            when 'Suse'\n              'zypper list-updates'\n            end\n-%>\n\n<%= command %>\n<% if command.start_with? 'yum' %>\nrc=$?\n# yum check-update returns 100 when there are updates available\nif [ $rc -eq 100 ]; then\n    # In this case, we override the exit code to 0 so Remote Execution\n    # can consider this run as successful\n    (exit 0)\nelse\n    # For any other exit code, we don't modify it\n    (exit $rc)\nfi\n<% end %>	f	\N	2025-01-19 19:42:39.169344	2025-01-19 19:42:39.169344	t	t	\N	JobTemplate	\N	Packages	script	Check for package updates	\N	\N	f	\N
118	pxelinux_discovery	<%#\nkind: snippet\nname: pxelinux_discovery\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Snippet with PXELinux menu items for discovery plugin. It is included in PXELinux Default templates to boot unknown hosts into discovery image.\n\n  discovery image is based on CentOS/RHEL and therefore it is affected by https://bugzilla.redhat.com/show_bug.cgi?id=1259015.\n  In short, before RHEL 7.2 virtio driver didn't have the new persistent naming scheme, causing interfaces to be named eth0, eth1, etc..\n  If you want to enable the new persistent naming scheme and get inteface names like ens3, add net.ifnames=1 to the APPEND line below.\n-%>\nLABEL discovery\n  MENU LABEL Foreman Discovery Image\n  KERNEL boot/fdi-image/vmlinuz0\n  APPEND initrd=boot/fdi-image/initrd0.img rootflags=loop root=live:/fdi.iso rootfstype=auto ro rd.live.image acpi=force rd.luks=0 rd.md=0 rd.dm=0 rd.lvm=0 rd.bootif=0 rd.neednet=0 nokaslr nomodeset proxy.url=<%= foreman_server_url %> proxy.type=foreman\n  IPAPPEND 2\n\n<%#\nChainbooting via iPXE requires an extra script published via HTTP:\n\n#!ipxe\nkernel http://foreman_url/pub/vmlinuz0 rootflags=loop root=live:/fdi.iso rootfstype=auto ro rd.live.image acpi=force rd.luks=0 rd.md=0 rd.dm=0 rd.lvm=0 rd.bootif=0 rd.neednet=0 nokaslr nomodeset proxy.url=https://foreman_url proxy.type=foreman BOOTIF=01-${net0/mac}\ninitrd http://foreman_url/pub/initrd0.img\nboot\n-%>\nLABEL discovery_ipxe\n  MENU LABEL Foreman Discovery Image - iPXE\n  KERNEL ipxe.lkrn\n  APPEND dhcp && chain <%= foreman_server_url %>/pub/discovery.ipxe\n	t	\N	2025-01-19 19:42:38.330493	2025-01-19 19:42:38.330493	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Snippet with PXELinux menu items for discovery plugin. It is included in PXELinux Default templates to boot unknown hosts into discovery image.\n\ndiscovery image is based on CentOS/RHEL and therefore it is affected by https://bugzilla.redhat.com/show_bug.cgi?id=1259015.\nIn short, before RHEL 7.2 virtio driver didn't have the new persistent naming scheme, causing interfaces to be named eth0, eth1, etc..\nIf you want to enable the new persistent naming scheme and get inteface names like ens3, add net.ifnames=1 to the APPEND line below.	f	\N
119	rancheros_cloudconfig	<%#\nkind: snippet\nname: rancheros_cloudconfig\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n    The cloud config used for the RancherOS installation\n-%>\n#cloud-config\nhostname: <%= @host.shortname %>\nrancher:\n  network:\n    dns:\n<% unless @host.subnet.dns_servers.empty? -%>\n      nameservers:\n<% @host.subnet.dns_servers.each do |nameserver| -%>\n        - <%= nameserver %>\n<% end -%>\n<% end -%>\n      search:\n        - <%= @host.domain %>\n    interfaces:\n      eth*:\n        dhcp: true\n<% unless @host.subnet.respond_to?(:dhcp_boot_mode?) -%>\n      eth0:\n        address: <%= @host.ip -%>/<%= @host.subnet.cidr %>\n        gateway: <%= @host.subnet.gateway %>\n<% end -%>\n  console: debian\nssh_authorized_keys:\n<%-\nusers = @host.owner_type == 'Usergroup' ? @host.owner.all_users : [@host.owner]\nusers.each do |user|\n  if user.respond_to?(:ssh_authorized_keys) && user.ssh_authorized_keys.any?\n    index = 0\n    user.ssh_keys.each do |key|\n      if index == 0\n-%>\n<%="  - #{key.type} #{key.ssh_key} #{key.comment}"%>\n<%-\n      else\n-%>\n<%="  - #{key.type} #{key.ssh_key} #{key.comment} - #{index}"%>\n<%-\n      end\n      index += 1\n    end\n  end\nend\n-%>\n	t	\N	2025-01-19 19:42:38.339869	2025-01-19 19:42:38.339869	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The cloud config used for the RancherOS installation	f	\N
120	redhat_register	<%#\nkind: snippet\nname: redhat_register\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Red Hat Registration Snippet\n\n  General parameters:\n\n    redhat_install_host_tools = [true|false]    Install the katello-host-tools yum/dnf plugins.\n\n    redhat_install_host_tracer_tools = [true|false]  Install the katello-host-tools Tracer yum/dnf plugin.\n\n    activation_key = <key>                      Activation key string, not needed if using\n                                                subscription-manager with username/password\n\n  Parameters for use with subscription-manager (Red Hat CDN, Satellite, or Katello)\n\n    subscription_manager = 'true'               You're going to use subscription-manager\n\n    subscription_manager_auto_attach = 'false'  Run attach --auto after registering.\n\n    subscription_manager_username = <username>  Username for subscription-manager\n\n    subscription_manager_password = <password>  Password for subscription-manager\n\n    subscription_manager_certpkg_url = <url>    Custom certificate package URL\n\n    subscription_manager_org = <org name>       Organization name, if required\n\n    subscription_manager_repos = <repos>        Additional repositories to enable\n                                                after registration.\n                                                Seperate multiple repositories with commas.\n\n    subscription_manager_override_repos_cost = <cost>  Override repository cost\n\n    subscription_manager_pool = <pool>          Specific subscription pool to use\n\n    only_subscription_manager_repos = 'true'    dnf/yum should only use repos managed by sub-man\n\n    http-proxy = <host>                         Proxy hostname to be used for registration\n\n    http-proxy-port = <port>                    Proxy port to be used for registration\n\n    http-proxy-user = <user>                    Proxy user to be used for registration\n\n    http-proxy-password = <password>            Proxy password to be used for registration\n\n    syspurpose_role                             Sets the system purpose role\n\n    syspurpose_usage                            Sets the system purpose usage\n\n    syspurpose_sla                              Sets the system purpose SLA\n\n    syspurpose_addons                           Sets the system purpose add-ons. Separate multiple\n                                                values with commas.\n\n  Set these parameters if you're using rhnreg_ks:\n\n    spacewalk_host = <hostname>                 Hostname of Spacewalk server\n-%>\n<%\n  # Katello or subscription-manager:\n  if host_param_true?('subscription_manager') || host_param('kt_activation_keys')\n    registration_type = 'subscription_manager'\n  # Spacewalk:\n  elsif host_param('spacewalk_host')\n    registration_type = 'spacewalk'\n  else\n    registration_type = nil\n  end\n-%>\n# registration_type = '<%= registration_type %>'\n<% if registration_type == 'subscription_manager' -%>\n  <%\n    if host_param('kt_activation_keys')\n      subscription_manager_certpkg_url = subscription_manager_configuration_url(@host)\n      subscription_manager_org = @host.rhsm_organization_label\n      activation_key = host_param('kt_activation_keys')\n      redhat_install_host_tools = host_param_true?('redhat_install_host_tools', true)\n      redhat_install_host_tracer_tools = host_param_true?('redhat_install_host_tracer_tools')\n    else\n      subscription_manager_certpkg_url = host_param('subscription_manager_certpkg_url')\n      subscription_manager_org = host_param('subscription_manager_org')\n      activation_key = host_param('activation_key')\n      redhat_install_host_tools = host_param_true?('redhat_install_host_tools')\n      redhat_install_host_tracer_tools = host_param_true?('redhat_install_host_tracer_tools')\n    end\n  -%>\n\n  echo "##############################################################"\n  echo "################# SUBSCRIPTION MANAGER #######################"\n  echo "##############################################################"\n  echo\n  echo "Starting the subscription-manager registration process"\n\n  # Set up subscription-manager\n  <%= snippet("subscription_manager_setup", variables: { subman_setup_scenario: 'provisioning' }).strip -%>\n\n  <%- if (host_param('syspurpose_role') || host_param('syspurpose_usage') || host_param('syspurpose_sla') || host_param('syspurpose_addons')) -%>\n    # Avoid timeout accessing unreachable repo on air gapped infrastructure,\n    #  assuming subscription-manager-syspurpose is installed in custom packages section.\n    if ! rpm --query --quiet subscription-manager-syspurpose ; then\n      $PKG_MANAGER_INSTALL subscription-manager-syspurpose\n    fi\n\n    if [ -f /usr/sbin/syspurpose ]; then\n      <%- if host_param('syspurpose_role') -%>\n        syspurpose set-role "<%= host_param('syspurpose_role') %>"\n      <%- end -%>\n      <%- if host_param('syspurpose_usage') -%>\n        syspurpose set-usage "<%= host_param('syspurpose_usage') %>"\n      <%- end -%>\n      <%- if host_param('syspurpose_sla') -%>\n        syspurpose set-sla "<%= host_param('syspurpose_sla') %>"\n      <%- end -%>\n      <%- if host_param('syspurpose_addons') -%>\n        <%- addons = host_param('syspurpose_addons').split(',')\n              .map { |add_on| "'#{add_on.strip}'" }.join(" ") %>\n        syspurpose add-addons <%= addons %>\n      <%- end -%>\n    else\n      echo "Syspurpose CLI not found."\n    fi\n  <% end -%>\n\n  <% if host_param('http-proxy') -%>\n    subscription-manager config --server.proxy_hostname='<%= host_param("http-proxy") %>'\n    <% if host_param('http-proxy-user') -%>\n      subscription-manager config --server.proxy_user='<%= host_param("http-proxy-user") %>'\n    <% end -%>\n    <% if host_param('http-proxy-password') -%>\n      subscription-manager config --server.proxy_password='<%= host_param("http-proxy-password") %>'\n    <% end -%>\n    <% if host_param('http-proxy-port') -%>\n      subscription-manager config --server.proxy_port='<%= host_param("http-proxy-port") %>'\n    <% end -%>\n  <% end -%>\n  \n  <% if host_param('subscription_manager_username') && host_param('subscription_manager_password') -%>\n    <% if host_param('subscription_manager_pool') -%>\n      subscription-manager register --name="<%= @host.name %>" --username='<%= host_param("subscription_manager_username") %>' --password='<%= host_param("subscription_manager_password") %>'\n      subscription-manager attach --pool='<%= host_param('subscription_manager_pool') %>'\n    <% else -%>\n      subscription-manager register --name="<%= @host.name %>" --username='<%= host_param("subscription_manager_username") %>' --password='<%= host_param("subscription_manager_password") %>' --auto-attach\n    <% end -%>\n\n  <% elsif activation_key -%>\n    subscription-manager register --name="<%= @host.name %>" --org='<%= subscription_manager_org %>' --activationkey='<%= activation_key %>'\n  <% else -%>\n    echo "No activation key found: Not registering to subscription manager"\n  <% end -%>\n\n  <% if host_param_true?('only_subscription_manager_repos') -%>\n    for subman_config_file in /etc/yum/pluginconf.d/subscription-manager.conf /etc/dnf/plugins/subscription-manager.conf; do\n      if [ -f $subman_config_file ]; then\n        egrep -q "^disable_system_repos=" $subman_config_file\n        if [ "$?" -eq 0 ]; then\n          sed s/^disable_system_repos=.*/disable_system_repos=1/ $subman_config_file >"${subman_config_file}.new"\n          mv -f "${subman_config_file}.new" $subman_config_file\n        else\n          echo "disable_system_repos=1" >>$subman_config_file\n        fi\n      fi\n    done\n  <% end -%>\n\n  <% if host_param_true?('subscription_manager_auto_attach', false) -%>\n    subscription-manager attach --auto\n\n  <% end -%>\n  <% if host_param('subscription_manager_repos') -%>\n    # workaround for RHEL 6.4 bug https://bugzilla.redhat.com/show_bug.cgi?id=1008016\n    subscription-manager repos --list > /dev/null\n    <%= "subscription-manager repos --enable #{host_param('subscription_manager_repos').gsub(/,\\s*/, ' --enable ')}" %>\n  <% end -%>\n\n  <% if host_param('subscription_manager_override_repos_cost') -%>\n    for repo in $(subscription-manager repos --list-enabled | grep "Repo ID:" | awk -F' ' '{ print $3 }'); do\n      <%= "subscription-manager repo-override --list --repo $repo | grep 'cost:' &>/dev/null || subscription-manager repo-override --repo $repo --add=cost:#{host_param('subscription_manager_override_repos_cost')}" %>\n    done\n  <% end -%>\n\n  <% if redhat_install_host_tools -%>\n    $PKG_MANAGER_INSTALL katello-host-tools\n  <% end -%>\n\n  <% if redhat_install_host_tracer_tools -%>\n    $PKG_MANAGER_INSTALL katello-host-tools-tracer\n  <% end -%>\n<% end -%>\n\n<% if registration_type == 'spacewalk' -%>\n  echo "##############################################################"\n  echo "################ SPACEWALK REGISTRATION ######################"\n  echo "##############################################################"\n\n  <% if host_param('activation_key') -%>\n    rhn_activation_key="<%= host_param('activation_key') -%>"\n    satellite_hostname="<%= host_param('spacewalk_host') -%>"\n    rhn_cert_file="RHN-ORG-TRUSTED-SSL-CERT"\n\n    echo "Registering to RHN Satellite at [$satellite_hostname]"\n    echo "Using Registration Key [$rhn_activation_key]"\n\n    # Obtain our RHN Satellite Certificate\n    echo "Obtaining RHN SSL certificate"\n    curl -o /usr/share/rhn/$rhn_cert_file -k https://$satellite_hostname/pub/$rhn_cert_file\n\n    <% if @host.operatingsystem.name == 'SLES' -%>\n      # If SLES then add CA Cert to CA Certs for curl\n      cp /usr/share/rhn/$rhn_cert_file /etc/ssl/certs/\n      ln -s /etc/ssl/certs/$rhn_cert_file /etc/ssl/certs/`openssl x509 -hash -noout -in /etc/ssl/certs/$rhn_cert_file`.0\n    <% end -%>\n\n    # Update our up2date configuration file\n    echo "Updating SSL CA Certificate to /usr/share/rhn/$rhn_cert_file"\n    sed -i -e "s|^sslCACert=.*$|sslCACert=/usr/share/rhn/$rhn_cert_file|" /etc/sysconfig/rhn/up2date\n\n    # Update our Satellite Hostname\n    echo "Updating Satellite Hostname to [$satellite_hostname]"\n    sed -i -e "s|^serverURL=.*$|serverURL=https://$satellite_hostname/XMLRPC|" /etc/sysconfig/rhn/up2date\n    sed -i -e "s|^noSSLServerURL=.*$|noSSLServerURL=https://$satellite_hostname/XMLRPC|" /etc/sysconfig/rhn/up2date\n\n    # Restart messagebus/HAL to try and prevent hardware detection errors in rhnreg_ks\n    echo "Restarting services..."\n    <% if @host.operatingsystem.name == 'SLES' && @host.operatingsystem.major.to_i < 12 -%>\n      service haldaemon restart\n    <% else -%>\n      service messagebus restart\n      service hald restart\n    <% end -%>\n\n    # Now, perform our registration\n    #  (might get hardware errors here, due to dbus/messagebus lameness. These are safe to ignore.)\n    echo -n "Performing RHN Registration... "\n    rhnreg_ks --activationkey=$rhn_activation_key\n    echo "done."\n\n    # Check we registered\n    echo -n "Checking System Registration... "\n    if ! rhn_check; then\n        echo "FAILED"\n        echo " >> RHN Registration FAILED. Please Investigate. <<"\n    else\n        echo "registration successful."\n    fi\n\n  <% else -%>\n    echo "No activation key found: Not registering"\n  <% end -%>\n<% end -%>\n	t	\N	2025-01-19 19:42:38.349298	2025-01-19 19:42:38.349298	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Red Hat Registration Snippet\n\nGeneral parameters:\n\n  redhat_install_host_tools = [true|false]    Install the katello-host-tools yum/dnf plugins.\n\n  redhat_install_host_tracer_tools = [true|false]  Install the katello-host-tools Tracer yum/dnf plugin.\n\n  activation_key = <key>                      Activation key string, not needed if using\n                                              subscription-manager with username/password\n\nParameters for use with subscription-manager (Red Hat CDN, Satellite, or Katello)\n\n  subscription_manager = 'true'               You're going to use subscription-manager\n\n  subscription_manager_auto_attach = 'false'  Run attach --auto after registering.\n\n  subscription_manager_username = <username>  Username for subscription-manager\n\n  subscription_manager_password = <password>  Password for subscription-manager\n\n  subscription_manager_certpkg_url = <url>    Custom certificate package URL\n\n  subscription_manager_org = <org name>       Organization name, if required\n\n  subscription_manager_repos = <repos>        Additional repositories to enable\n                                              after registration.\n                                              Seperate multiple repositories with commas.\n\n  subscription_manager_override_repos_cost = <cost>  Override repository cost\n\n  subscription_manager_pool = <pool>          Specific subscription pool to use\n\n  only_subscription_manager_repos = 'true'    dnf/yum should only use repos managed by sub-man\n\n  http-proxy = <host>                         Proxy hostname to be used for registration\n\n  http-proxy-port = <port>                    Proxy port to be used for registration\n\n  http-proxy-user = <user>                    Proxy user to be used for registration\n\n  http-proxy-password = <password>            Proxy password to be used for registration\n\n  syspurpose_role                             Sets the system purpose role\n\n  syspurpose_usage                            Sets the system purpose usage\n\n  syspurpose_sla                              Sets the system purpose SLA\n\n  syspurpose_addons                           Sets the system purpose add-ons. Separate multiple\n                                              values with commas.\n\nSet these parameters if you're using rhnreg_ks:\n\n  spacewalk_host = <hostname>                 Hostname of Spacewalk server	f	\N
121	remote_execution_ssh_keys	<%#\nkind: snippet\nname: remote_execution_ssh_keys\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  SSH keys setup snippet for Remote Execution plugin\n\n  Parameters:\n\n  remote_execution_ssh_keys: public keys to be put in ~/.ssh/authorized_keys\n\n  remote_execution_ssh_user: user for which remote_execution_ssh_keys will be\n                             authorized\n\n  remote_execution_create_user: create user if it not already existing\n\n  remote_execution_effective_user_method: method to switch from ssh user to\n                                          effective user\n\n  This template sets up SSH keys in any host so that as long as your public\n  SSH key is in remote_execution_ssh_keys, you can SSH into a host. This\n  works in combination with Remote Execution plugin by querying smart proxies\n  to build an array.\n\n  To use this snippet without the plugin provide the SSH keys as host parameter\n  remote_execution_ssh_keys. It expects the same format like the authorized_keys\n  file.\n-%>\n\n<% if !host_param('remote_execution_ssh_keys').blank? %>\n<% ssh_user = host_param('remote_execution_ssh_user') || 'root' %>\n\nuser_exists=false\ngetent passwd <%= ssh_user %> >/dev/null 2>&1 && user_exists=true\n\n<% if ssh_user != 'root' && host_param_true?('remote_execution_create_user') -%>\nif ! $user_exists; then\n  useradd -m <%= ssh_user %> && user_exists=true\nfi\n<% end -%>\n\nif $user_exists; then\n<% ssh_path = "~#{ssh_user}/.ssh" %>\n\n  mkdir -p <%= ssh_path %>\n\n  cat << EOF >> <%= ssh_path %>/authorized_keys\n<%= host_param('remote_execution_ssh_keys').is_a?(String) ? host_param('remote_execution_ssh_keys') : host_param('remote_execution_ssh_keys').join("\\n") %>\nEOF\n\n  chmod 0700 <%= ssh_path %>\n  chmod 0600 <%= ssh_path %>/authorized_keys\n  chown -R <%= "#{ssh_user}:" %> <%= ssh_path %>\n  chown -R <%= "#{ssh_user}:" %> <%= "~#{ssh_user}" %>\n\n  # Restore SELinux context with restorecon, if it's available:\n  command -v restorecon && restorecon -RvF <%= ssh_path %> || true\n\n<% if ssh_user != 'root' && host_param('remote_execution_effective_user_method') == 'sudo' -%>\n<% if @host.operatingsystem.family == 'Redhat' || @host.operatingsystem.family == 'Debian' -%>\necho "<%= ssh_user %> ALL = (root) NOPASSWD : ALL" > /etc/sudoers.d/<%= ssh_user %>\necho "Defaults:<%= ssh_user %> !requiretty" >> /etc/sudoers.d/<%= ssh_user %>\n<% elsif @host.operatingsystem.family == 'Suse' -%>\necho "<%= ssh_user %> ALL = (root) NOPASSWD : ALL" >> /etc/sudoers\necho "Defaults:<%= ssh_user %> !targetpw" >> /etc/sudoers\n<% end -%>\n<% end -%>\nelse\n  echo 'The remote_execution_ssh_user does not exist and remote_execution_create_user is not set to true.  remote_execution_ssh_keys snippet will not install keys'\nfi\n<% end -%>\n	t	\N	2025-01-19 19:42:38.358781	2025-01-19 19:42:38.358781	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	SSH keys setup snippet for Remote Execution plugin\n\nParameters:\n\nremote_execution_ssh_keys: public keys to be put in ~/.ssh/authorized_keys\n\nremote_execution_ssh_user: user for which remote_execution_ssh_keys will be\n                           authorized\n\nremote_execution_create_user: create user if it not already existing\n\nremote_execution_effective_user_method: method to switch from ssh user to\n                                        effective user\n\nThis template sets up SSH keys in any host so that as long as your public\nSSH key is in remote_execution_ssh_keys, you can SSH into a host. This\nworks in combination with Remote Execution plugin by querying smart proxies\nto build an array.\n\nTo use this snippet without the plugin provide the SSH keys as host parameter\nremote_execution_ssh_keys. It expects the same format like the authorized_keys\nfile.	f	\N
122	saltstack_minion	<%#\nkind: snippet\nname: saltstack_minion\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Generates a Salt minion configuration file which is required for the Salt bootstraping.\n  The Salt master is configured based on the host parameter called "salt_master".\n  It can also statically assign grains based on the "salt_grains" host parameter.\n-%>\nmaster: <%= host_param('salt_master') %>\nlog_level: warning\n\nautosign_grains:\n  - autosign_key\n\n<%#\n# Grains (http://docs.saltstack.com/en/latest/topics/targeting/grains.html#grains-in-the-minion-config)\n#\n# Possible parameters are:\n#\n# * {'cluster': 'alpha'}\n# * {'roles': ['webserver', 'frontend']}\n#\n-%>\n<% if plugin_present?('foreman_salt') -%>\ngrains: <%= to_json(@host.derive_salt_grains(use_autosign: true)) %>\n<% else -%>\ngrains: <%= host_param('salt_grains') ? to_json(host_param('salt_grains')) : '{}' %>\n<% end -%>\n	t	\N	2025-01-19 19:42:38.36812	2025-01-19 19:42:38.36812	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Generates a Salt minion configuration file which is required for the Salt bootstraping.\nThe Salt master is configured based on the host parameter called "salt_master".\nIt can also statically assign grains based on the "salt_grains" host parameter.	f	\N
123	saltstack_setup	<%#\nkind: snippet\nname: saltstack_setup\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: this snippet will configure the Saltstack Minion\n-%>\n<%\netc_path = (@host.operatingsystem.family == 'Freebsd') ? '/usr/local/etc/salt' : '/etc/salt'\nbin_path = (@host.operatingsystem.family == 'Freebsd') ? '/usr/local/bin' : '/usr/bin'\n%>\n\n<% if @host.operatingsystem.family == 'Debian' -%>\napt-get update\napt-get install -y salt-minion\n<% elsif @host.operatingsystem.family == 'Freebsd' -%>\npkg install -y py27-salt\n<% elsif @host.operatingsystem.family == 'Redhat' -%>\nif [ -f /usr/bin/dnf ]; then\n  dnf -y install salt-minion\nelse\n  yum -t -y install salt-minion\nfi\n<% elsif @host.operatingsystem.family == 'Suse' -%>\n  /usr/bin/zypper -n install salt-minion\n<% end -%>\n\ncat > <%= etc_path %>/minion.d/minion.conf << EOF\n<%= snippet 'saltstack_minion' %>\nEOF\n\necho <%= @host.name %> > <%= etc_path %>/minion_id\n\n<% if @host.operatingsystem.family == 'Freebsd' -%>\necho 'salt_minion_enable="YES"' >>/etc/rc.conf\necho 'salt_minion_paths="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"' >>/etc/rc.conf\n<% elsif @host.operatingsystem.family == 'Redhat' -%>\n/sbin/chkconfig --level 345 salt-minion on\n<% elsif @host.operatingsystem.family == 'Suse' -%>\n/sbin/chkconfig salt-minion on -f\n<% end -%>\n\n<%= bin_path %>/salt-call --no-color --grains >/dev/null\n	t	\N	2025-01-19 19:42:38.377447	2025-01-19 19:42:38.377447	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	this snippet will configure the Saltstack Minion	f	\N
124	schedule_reboot	<%#\nkind: snippet\nname: schedule_reboot\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  In image based provisioning using finish templates, reboot can't be performed\n  immediatelly, because it would interrupt the ongoing SSH connection. Instead\n  this snippet should be used. It schedules reboot correctly a minute after,\n  which gives SSH enough time to properly disconnect. To active this behavior\n  schedule_reboot host parameter must be set to true.\n-%>\n<% if host_param_true?('schedule_reboot') -%>\nPATH=/usr/bin:/usr/sbin:/bin:/sbin:$PATH shutdown -r +1\n<% end -%>\n	t	\N	2025-01-19 19:42:38.386723	2025-01-19 19:42:38.386723	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	In image based provisioning using finish templates, reboot can't be performed\nimmediatelly, because it would interrupt the ongoing SSH connection. Instead\nthis snippet should be used. It schedules reboot correctly a minute after,\nwhich gives SSH enough time to properly disconnect. To active this behavior\nschedule_reboot host parameter must be set to true.	f	\N
125	subscription_manager_setup	<%#\nkind: snippet\nname: subscription_manager_setup\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  This snippet installs and configures subscription-manager that is required for host registration.\n  The snippet is included in the "global_registration" template and in the "redhat_register" snippet.\n  The latter ensures host registration during the provisioning process.\n-%>\n# Select package manager for the OS (sets the $PKG_MANAGER* variables)\nif [ -z "$PKG_MANAGER" ]; then\n<%= indent(2) { snippet 'pkg_manager' } -%>\nfi\n\n# Define the path to rhsm.conf\nRHSM_CFG=/etc/rhsm/rhsm.conf\n\n<% if @subman_setup_scenario == 'registration' -%>\n  # Backup the original rhsm.conf file\n  if [ -f $RHSM_CFG ] ; then\n    test -f $RHSM_CFG.bak || cp $RHSM_CFG $RHSM_CFG.bak\n  fi\n<% end -%>\n\n<% if plugin_present?('katello') -%>\n  <% if @subman_setup_scenario == 'registration' -%>\n    # rhn-client-tools conflicts with subscription-manager package\n    # since rhn tools replaces subscription-manager, we need to explicitly\n    # install subscription-manager after the rhn tools cleanup\n    if [ x$ID = xol ]; then\n      $PKG_MANAGER_REMOVE rhn-client-tools\n      $PKG_MANAGER_INSTALL --setopt=obsoletes=0 subscription-manager\n    elif [ -f /etc/debian_version ]; then\n      $PKG_MANAGER_INSTALL subscription-manager\n    fi\n\n    <% if truthy?(@force) -%>\n      # Unregister host and remove all local system and subscription data\n      if [ -x "$(command -v subscription-manager)" ] ; then\n        subscription-manager unregister || true\n        subscription-manager clean\n      fi\n\n      if ! [ -f /etc/debian_version ]; then\n        $PKG_MANAGER_REMOVE katello-ca-consumer\\* > /dev/null 2>&1\n      fi\n    <% end -%>\n  <% end -%>\n\n  # Define the path to the Katello server CA certificate\n  KATELLO_SERVER_CA_CERT=/etc/rhsm/ca/katello-server-ca.pem\n\n  # Prepare the SSL certificate\n  mkdir -p /etc/rhsm/ca\n  touch $KATELLO_SERVER_CA_CERT\n  chmod 644 $KATELLO_SERVER_CA_CERT\n\n  <%= snippet('ca_registration') -%>\n<% end -%>\n\n# Prepare subscription-manager\nif ! [ -x "$(command -v subscription-manager)" ] ; then\n  $PKG_MANAGER_INSTALL subscription-manager\nelse\n  echo "subscription-manager is already installed!"\n  <% if @subman_setup_scenario == 'registration' -%>\n    $PKG_MANAGER_UPGRADE subscription-manager > /dev/null 2>&1\n  <% end %>\nfi\n\n# Check if rhsm.conf exists\nif ! [ -f $RHSM_CFG ] ; then\n  echo "'$RHSM_CFG' not found, cannot configure subscription-manager"\n  <% if plugin_present?('katello') -%>\n    rm -f $SSL_CA_CERT\n  <% end -%>\n  exit 1\nfi\n\n<% if @subman_setup_scenario == 'registration'\n     if plugin_present?('katello')\n       server_hostname = @rhsm_url.host if @rhsm_url\n       server_port = @rhsm_url.port if @rhsm_url\n       server_prefix = @rhsm_url.path if @rhsm_url\n       repo_ca_cert = "$KATELLO_SERVER_CA_CERT"\n       rhsm_baseurl = @pulp_content_url\n     end\n   elsif @subman_setup_scenario == 'provisioning'\n     if plugin_present?('katello')\n       server_hostname = @host.content_source.rhsm_url.host\n       server_port = @host.content_source.rhsm_url.port\n       server_prefix = @host.content_source.rhsm_url.path\n       repo_ca_cert = "$KATELLO_SERVER_CA_CERT"\n       rhsm_baseurl = @host.content_source.pulp_content_url\n     else\n       server_hostname = "subscription.rhsm.redhat.com"\n       server_port = "443"\n       server_prefix = "/subscription"\n       repo_ca_cert = "/etc/rhsm/ca/redhat-uep.pem"\n       rhsm_baseurl = "https://cdn.redhat.com"\n     end\n   end\n-%>\n\n# Configure subscription-manager\ntest -f $RHSM_CFG.bak || cp $RHSM_CFG $RHSM_CFG.bak\nsubscription-manager config \\\n  --server.hostname="<%= server_hostname %>" \\\n  --server.port="<%= server_port %>" \\\n  --server.prefix="<%= server_prefix %>" \\\n  --rhsm.repo_ca_cert="<%= repo_ca_cert %>" \\\n  --rhsm.baseurl="<%= rhsm_baseurl %>"\n\n# Older versions of subscription manager may not recognize\n# report_package_profile and package_profile_on_trans options.\n# So set them separately and redirect out & error to /dev/null\n# to fail silently.\nsubscription-manager config --rhsm.package_profile_on_trans=1 > /dev/null 2>&1 || true\nsubscription-manager config --rhsm.report_package_profile=1 > /dev/null 2>&1 || true\n\n# Configuration for EL6\nif grep --quiet full_refresh_on_yum $RHSM_CFG; then\n  sed -i "s/full_refresh_on_yum\\s*=.*$/full_refresh_on_yum = 1/g" $RHSM_CFG\nelse\n  full_refresh_config="#config for on-premise management\\nfull_refresh_on_yum = 1"\n  sed -i "/baseurl/a $full_refresh_config" $RHSM_CFG\nfi\n\n# Restart yggdrasild if installed and running\nsystemctl try-restart yggdrasil >/dev/null 2>&1 || true\n	t	\N	2025-01-19 19:42:38.395994	2025-01-19 19:42:38.395994	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This snippet installs and configures subscription-manager that is required for host registration.\nThe snippet is included in the "global_registration" template and in the "redhat_register" snippet.\nThe latter ensures host registration during the provisioning process.	f	\N
126	windows_network	<%#\nname: windows_network\nmodel: ProvisioningTemplate\nsnippet: true\nkind: snippet\ntest_on:\n- windows10_dhcp\ndescription: |\n  Configures networking using netsh command on Windows hosts.\n-%>\n@echo off\nsetlocal enableDelayedExpansion\n\nfor /f "delims=" %%a in ('ipconfig /all') do (\n    set line=%%a\n    if not "!line:~0,1!"==" " if not "!line:adapter=!"=="!line!" (\n        set name=!line:*adapter =!\n        set name=!name::=!\n    )\n\n    for /f "tokens=1,2,*" %%b in ("%%a") do (\n        if "%%b %%c"=="Physical Address." (\n            set mac=%%d\n            set mac=!mac:*: =!\n            set mac=!mac:-=:!\n            call :tolower mac\n\n<% @host.managed_interfaces.each do |interface| -%>\n            if "<%= interface.mac %>"=="!mac!" (\n                <% if (interface.subnet.nil? ? false : interface.subnet.dhcp_boot_mode?) -%>\n                    echo DHCP is active\n                <% end -%>\n                <% if !interface.identifier.empty? -%>\n                    netsh interface set interface name="!name!" newname="<%= interface.identifier %>"\n                    <% if (interface.subnet.nil? ? false : !interface.subnet.dhcp_boot_mode?) -%>\n                    netsh interface ip set address "<%= interface.identifier %>" static <%= interface.ip %> <%= interface.subnet.mask %> <%= interface.subnet.gateway %>\n                        <% if (interface.subnet.nil? ? false : interface.subnet.dns_primary.present?) -%>\n                        netsh interface ip add dnsserver "<%= interface.identifier %>" address="<%= interface.subnet.dns_primary %>" index=1\n                        <% end -%>\n                        <% if (interface.subnet.nil? ? false : interface.subnet.dns_secondary.present?) -%>\n                        netsh interface ip add dnsserver "<%= interface.identifier %>" address="<%= interface.subnet.dns_secondary %>" index=2\n                        <% end -%>\n                    <% end -%>\n                    <% if interface.subnet6 -%>\n                    netsh interface ipv6 add address "<%= interface.identifier %>" <%= interface.ip6 %>/<%= interface.subnet6.cidr %>\n                    <% if interface.subnet6.gateway -%>\n                    netsh interface ipv6 add route ::/0 "<%= interface.identifier %>" <%= interface.subnet6.gateway %>\n                    <% end -%>\n                    <% end -%>\n                <% else -%>\n                    <% if (interface.subnet.nil? ? false : !interface.subnet.dhcp_boot_mode?) -%>\n                    netsh interface ip set address "!name!" static <%= interface.ip %> <%= interface.subnet.mask %> <%= interface.subnet.gateway %>\n                        <% if (interface.subnet.nil? ? false : interface.subnet.dns_primary.present?) -%>\n                        netsh interface ip add dnsserver "!name!" address="<%= interface.subnet.dns_primary %>" index=1\n                        <% end -%>\n                        <% if (interface.subnet.nil? ? false : interface.subnet.dns_secondary.present?) -%>\n                        netsh interface ip add dnsserver "!name!" address="<%= interface.subnet.dns_secondary %>" index=2\n                        <% end -%>\n                    <% end -%>\n                    <% if interface.subnet6 -%>\n                    netsh interface ipv6 add address "!name!" <%= interface.ip6 %>/<%= interface.subnet6.cidr %>\n                    <% if interface.subnet6.gateway -%>\n                    netsh interface ipv6 add route ::/0 "!name!" <%= interface.subnet6.gateway %>\n                    <% end -%>\n                    <% end -%>\n                <% end -%>\n            )\n<% end -%>\n        )\n    )\n)\ncall :done\n\n:tolower\nfor %%L IN (a b c d e f g h i j k l m n o p q r s t u v w x y z) DO SET %1=!%1:%%L=%%L!\ngoto :EOF\n\n:done\n	t	\N	2025-01-19 19:42:38.405464	2025-01-19 19:42:38.405464	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Configures networking using netsh command on Windows hosts.	f	\N
127	yum_proxy	<%#\nkind: snippet\nname: yum_proxy\nmodel: ProvisioningTemplate\nsnippet: true\ndescription: |\n  Configures HTTP proxy in /etc/yum.conf based on the http-proxy and http-proxy-port\n  host parameters.\n-%>\n<%\nproxy_uri = host_param('http-proxy') ? "http://#{host_param('http-proxy')}:#{host_param('http-proxy-port')}" : nil\n-%>\n\n<% if proxy_uri -%>\n  echo 'proxy = <%= proxy_uri %>' >> /etc/yum.conf\n<% end -%>\n	t	\N	2025-01-19 19:42:38.41475	2025-01-19 19:42:38.41475	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Configures HTTP proxy in /etc/yum.conf based on the http-proxy and http-proxy-port\nhost parameters.	f	\N
128	AutoYaST default user data	<%#\nkind: user_data\nname: AutoYaST default user data\nmodel: ProvisioningTemplate\noses:\n- OpenSUSE\n- SLES\ndescription: |\n  This template is used during image based provisioning, when the image is configured to use user-data.\n  The output is a shell script that cloud-init runs to configures the VM\n  booted from the image. The image must have cloud-init installed in order for this to work.\n  This script can be used with OpenSUSE and SLES images.\n-%>\n<%\n  # safemode renderer does not support unary negation\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n-%>\n#!/bin/bash\n\n<%# Cloud instances frequently have incorrect hosts data %>\n<%= snippet 'fix_hosts' %>\n\n<% if @host.provision_method == 'image' && root_pass.present? -%>\n# Install the root password\necho 'root:<%= root_pass -%>' | /usr/sbin/chpasswd -e\n<% end -%>\n\n<%= snippet('remote_execution_ssh_keys') %>\n\n<%= snippet "blacklist_kernel_modules" %>\n\n<% if puppet_enabled %>\n<% if host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppetlabs-puppet5-repo') -%>\n<%= snippet 'puppetlabs_repo' %>\n<% end -%>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if salt_enabled %>\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n\n# UserData still needs to mark the build as finished\n<%= snippet 'built' %>\n	f	9	2025-01-19 19:42:38.423509	2025-01-19 19:42:38.423509	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used during image based provisioning, when the image is configured to use user-data.\nThe output is a shell script that cloud-init runs to configures the VM\nbooted from the image. The image must have cloud-init installed in order for this to work.\nThis script can be used with OpenSUSE and SLES images.	f	\N
162	Convert2RHEL analyze	<% if @host.operatingsystem.family == 'Redhat' -%>\nif ! [ $(id -u) -eq 0 ]; then\n  echo "You must run convert2rhel as a root user."\n  exit 1\nfi\n\nif ! rpm -q convert2rhel &> /dev/null; then\n  yum install -y convert2rhel\nfi\n\nexport CONVERT2RHEL_THROUGH_FOREMAN=1\n\n/usr/bin/convert2rhel analyze -y\n\n# Workaround for https://issues.redhat.com/browse/RHELC-1280\nsubscription-manager facts --update\n\nif grep -q ERROR /var/log/convert2rhel/convert2rhel-pre-conversion.json; then\n    echo "Error: Some error(s) have been found."\n    echo "Exiting ..."\n    exit 1\nfi\n\n<% else %>\necho 'Unsupported OS, it must be from the Red Hat family.'\nexit 1\n<% end -%>	f	\N	2025-01-19 19:42:39.178229	2025-01-19 19:42:39.178229	t	t	\N	JobTemplate	\N	Convert 2 RHEL	script	\N	\N	\N	f	\N
129	Kickstart default user data	<%#\nkind: user_data\nname: Kickstart default user data\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- Rocky\ndescription: |\n  This template is used during image based provisioning, when the image is configured to use user-data.\n  The output is a shell script that cloud-init runs to configures the VM\n  booted from the image. The image must have cloud-init installed in order for this to work.\n  This script can be used with kickstart based distributions images.\n-%>\n<%\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  # safemode renderer does not support unary negation\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  chef_enabled = @host.respond_to?(:chef_proxy) && @host.chef_proxy\n-%>\n#!/bin/bash\n\n<%# Cloud instances frequently have incorrect hosts data %>\n<%= snippet 'fix_hosts' %>\n\n<% if @host.provision_method == 'image' && root_pass.present? -%>\n# Install the root password\necho 'root:<%= root_pass -%>' | /usr/sbin/chpasswd -e\n<% end -%>\n\n<%= snippet 'yum_proxy' %>\n\n<%= snippet 'ntp' %>\n\n<% if rhel_compatible && host_param_true?('enable-epel') -%>\n<%= snippet 'epel' -%>\n<% end -%>\n\n<%= snippet 'redhat_register' %>\n\n<% if host_enc['parameters']['realm'] && @host.realm && (@host.realm.realm_type == 'FreeIPA' || @host.realm.realm_type == 'Red Hat Identity Management') -%>\n<%= snippet 'freeipa_register' %>\n<% end -%>\n\n<% unless host_param_false?('package_upgrade') -%>\n# update all the base packages from the updates repository\nif [ -f /usr/bin/dnf ]; then\n  dnf -y update\nelse\n  yum -t -y update\nfi\n<% end -%>\n\n<%= snippet('remote_execution_ssh_keys') %>\n\n<%= snippet "blacklist_kernel_modules" %>\n\n<% if chef_enabled %>\n<%= snippet 'chef_client' %>\n<% end -%>\n\n<% if puppet_enabled %>\n<% if host_param_true?('enable-puppetlabs-repo') || host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppetlabs-puppet5-repo') -%>\n<%= snippet 'puppetlabs_repo' %>\n<% end -%>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if salt_enabled %>\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n\n<% if host_param_true?('ansible_tower_provisioning') -%>\n    <%= save_to_file('/tmp/ansible_provisioning_call.sh', snippet('ansible_tower_callback_script')) %>\n    /bin/sh /tmp/ansible_provisioning_call.sh\n<% end -%>\n\n# UserData still needs to mark the build as finished\n<%= snippet 'built' %>\n	f	9	2025-01-19 19:42:38.432113	2025-01-19 19:42:38.432113	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used during image based provisioning, when the image is configured to use user-data.\nThe output is a shell script that cloud-init runs to configures the VM\nbooted from the image. The image must have cloud-init installed in order for this to work.\nThis script can be used with kickstart based distributions images.	f	\N
130	Preseed Autoinstall cloud-init user data	<%#\nkind: user_data\nname: Preseed Autoinstall cloud-init user data\nmodel: ProvisioningTemplate\noses:\n- ubuntu\ntest_on:\n- ubuntu_autoinst4dhcp\ndescription: |\n  The provisioning template for Autoinstall based distributions. To customize the installation,\n  modify the host parameters\n\n  This template accepts the following parameters:\n  - lang: string (default="en_US.UTF-8")\n  - keyboard: string (default="us")\n  - package_upgrade: boolean (default=false)\n  - remote_execution_ssh_keys: string (default="")\n  - username_to_create: string (default="root")\n  - realname_to_create: string (default=username_to_create)\n  - password_to_create: string (default=@host.root_pass)\n-%>\n<%-\nusername_to_create = host_param('username_to_create', 'root')\nrealname_to_create = host_param('realname_to_create') || username_to_create\npassword_to_create = host_param('password_to_create') || @host.root_pass\nenable_auto_update = (host_param_true?('package_upgrade') && !host_param('kt_activation_keys'))\nos_major = @host.operatingsystem.major.to_i\nos_minor = @host.operatingsystem.minor.to_i\n-%>\n#cloud-config\nautoinstall:\n  version: 1\n  apt:\n    geoip: false\n    preserve_sources_list: false\n    primary:\n      - arches: [amd64, i386]\n        uri: http://archive.ubuntu.com/ubuntu\n      - arches: [default]\n        uri: http://ports.ubuntu.com/ubuntu-ports\n<% unless enable_auto_update -%>\n    disable_components: [multiverse]\n    disable_suites: [backports,security,updates] \n    fallback: offline-install\n<% end -%>\n<%= indent(4) { snippet_if_exists(template_name + " custom apt") } -%>\n  user-data:\n    disable_root: false\n    fqdn: <%= @host.name %>\n    users:\n    - name: <%= username_to_create %>\n      gecos: <%= realname_to_create %>\n      lock_passwd: false\n      hashed_passwd: <%= password_to_create %>\n<% if !host_param('remote_execution_ssh_keys').blank? -%>\n<%   if host_param('remote_execution_ssh_keys').is_a?(String) -%>\n      ssh_authorized_keys: [<%= host_param('remote_execution_ssh_keys') %>]\n<%   else -%>\n      ssh_authorized_keys: <%= host_param('remote_execution_ssh_keys') %>\n<%   end -%>\n<% end -%>\n  keyboard:\n    layout: <%= host_param('keyboard', 'us') %>\n    toggle: null\n    variant: ''\n  locale: <%= host_param('lang', 'en_US') %>.UTF-8\n<%= snippet 'preseed_netplan_setup' -%>\n  ssh:\n    allow-pw: true\n    install-server: true\n  updates: security\n<%= indent(2) { @host.diskLayout } %>\n<%= indent(2) { snippet_if_exists(template_name + " custom root") } -%>\n  late-commands:\n<%= indent(2) { snippet 'preseed_autoinstall_clevis_tang_wrapper' if host_param('disk_enc_tang_servers') && os_major >= 22 && os_minor >= 3 } %>\n  - wget -Y off <%= @static ? "'#{foreman_url('finish', static: 'true')}'" : foreman_url('finish') %> -O /target/tmp/finish.sh\n  - curtin in-target -- chmod +x /tmp/finish.sh\n  - curtin in-target -- /tmp/finish.sh\n	f	9	2025-01-19 19:42:38.440863	2025-01-19 19:42:38.440863	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	The provisioning template for Autoinstall based distributions. To customize the installation,\nmodify the host parameters\n\nThis template accepts the following parameters:\n- lang: string (default="en_US.UTF-8")\n- keyboard: string (default="us")\n- package_upgrade: boolean (default=false)\n- remote_execution_ssh_keys: string (default="")\n- username_to_create: string (default="root")\n- realname_to_create: string (default=username_to_create)\n- password_to_create: string (default=@host.root_pass)	f	\N
131	Preseed default user data	<%#\nkind: user_data\nname: Preseed default user data\nmodel: ProvisioningTemplate\noses:\n- Debian\n- Ubuntu\ntest_on:\n- debian4dhcp\n- ubuntu4dhcp\ndescription: |\n  This template is used during image based provisioning, when the image is configured to use user-data.\n  The output is a shell script that cloud-init runs to configures the VM\n  booted from the image. The image must have cloud-init installed in order for this to work.\n  This script can be used with preseed distributions images.\n-%>\n#!/bin/bash\n\n<%# Cloud instances frequently have incorrect hosts data %>\n<%= snippet 'fix_hosts' %>\n\n<%\n  # safemode renderer does not support unary negation\n  proxy_uri = host_param('http-proxy') ? "http://#{host_param('http-proxy')}:#{host_param('http-proxy-port')}" : nil\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  chef_enabled = @host.respond_to?(:chef_proxy) && @host.chef_proxy\n%>\n\n<% if proxy_uri -%>\necho 'Acquire::http::Proxy "<%= proxy_uri %>";' >> /etc/apt/apt.conf\n<% end -%>\n\n<% if host_enc['parameters']['realm'] && @host.realm && @host.realm.realm_type == 'FreeIPA' -%>\n<%= snippet 'freeipa_register' %>\n<% end -%>\n\n<%= snippet('remote_execution_ssh_keys') %>\n\n<%= snippet "blacklist_kernel_modules" %>\n\n<% if chef_enabled %>\n<%= snippet 'chef_client' %>\n<% end -%>\n\n<% if puppet_enabled %>\n<% if host_param_true?('enable-puppetlabs-repo') || host_param_true?('enable-official-puppet8-repo') || host_param_true?('enable-official-puppet7-repo') || host_param_true?('enable-puppetlabs-puppet6-repo') || host_param_true?('enable-puppetlabs-puppet5-repo') -%>\n<%= snippet 'puppetlabs_repo' %>\n<% end -%>\n<%= snippet 'puppet_setup' %>\n<% end -%>\n\n<% if salt_enabled %>\n<%= snippet 'saltstack_setup' %>\n<% end -%>\n\n# UserData still needs wget to mark as finished\n<%= snippet 'built' %>\n	f	9	2025-01-19 19:42:38.449576	2025-01-19 19:42:38.449576	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used during image based provisioning, when the image is configured to use user-data.\nThe output is a shell script that cloud-init runs to configures the VM\nbooted from the image. The image must have cloud-init installed in order for this to work.\nThis script can be used with preseed distributions images.	f	\N
132	UserData default	<%#\nkind: user_data\nname: UserData default\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- Rocky\n- Debian\n- Ubuntu\ndescription: |\n  This template is used during image based provisioning, when the image is configured to use user-data.\n  The output is a list of cloud-init directives that cloud-init parses to configures the VM\n  booted from the image. The image must have cloud-init installed in order for this to work.\n\n  This template accepts the following parameters:\n  - ssh_pwauth: boolean (default=true unless ssh_authorized_keys)\n  - ssh_authorized_keys: string w newline seperated keys (default="")\n  - package_upgrade: boolean (default=false)\n  - reboot: boolean (default=false)\n  - skip-puppet-setup: boolean (default=false)\n-%>\n<%\n  ssh_pwauth = host_param('ssh_pwauth') ? host_param_true?('ssh_pwauth') : !host_param('ssh_authorized_keys')\n  rhel_compatible = @host.operatingsystem.family == 'Redhat' && @host.operatingsystem.name != 'Fedora'\n  # safemode renderer does not support unary negation\n  puppet_enabled = !host_param_true?('skip-puppet-setup') && (host_puppet_server.present? || host_param_true?('force-puppet'))\n  salt_enabled = host_param('salt_master') ? true : false\n  chef_enabled = @host.respond_to?(:chef_proxy) && @host.chef_proxy\n-%>\n#cloud-config\nhostname: <%= @host.shortname %>\nfqdn: <%= @host %>\nmanage_etc_hosts: true\n<% if ssh_pwauth -%>\n<%# Don't enable this in production. It is very insecure! Use ssh_authorized_keys instead...\n    http://cloudinit.readthedocs.io/en/latest/topics/examples.html#including-users-and-groups -%>\nssh_pwauth: true\ngroups:\n- admin\nusers:\n- default\n- name: admin\n  primary-group: admin\n  groups: users\n  shell: /bin/bash\n  sudo: ['ALL=(ALL) ALL']\n  lock-passwd: false\n  passwd: <%= @host.root_pass %>\n<% end -%>\n<% if host_param('ssh_authorized_keys') -%>\nssh_authorized_keys:\n<% host_param('ssh_authorized_keys').split("\\n").each do |ssh_key| -%>\n- <%= ssh_key %>\n<% end -%>\n<% end -%>\n\n<% if host_param_true?('package_upgrade') -%>\npackage_upgrade: true\n<% end -%>\n\nruncmd:\n<% if rhel_compatible -%>\n- |\n<%= indent(2) { snippet('epel') } %>\n<% end -%>\n- |\n<%= indent(2) { snippet('remote_execution_ssh_keys') } %>\n<% if chef_enabled -%>\n- |\n<%= indent(2) { snippet('chef_client') } %>\n<% end -%>\n<% if puppet_enabled -%>\n- |\n<%= indent(2) { snippet('puppetlabs_repo') } %>\n- |\n<%= indent(2) { snippet('puppet_setup') } %>\n<% end -%>\n<% if salt_enabled -%>\n- |\n<%= indent(2) { snippet('saltstack_setup') } %>\n<% end -%>\n\n<%# Contact Foreman to confirm instance is built -%>\nphone_home:\n  url: <%= foreman_url('built') %>\n  post: []\n  tries: 10\n\n<% if host_param_true?('reboot') -%>\npower_state:\n  mode: reboot\n  timeout: 30\n  condition: true\n<% end -%>\n	f	9	2025-01-19 19:42:38.458193	2025-01-19 19:42:38.458193	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	This template is used during image based provisioning, when the image is configured to use user-data.\nThe output is a list of cloud-init directives that cloud-init parses to configures the VM\nbooted from the image. The image must have cloud-init installed in order for this to work.\n\nThis template accepts the following parameters:\n- ssh_pwauth: boolean (default=true unless ssh_authorized_keys)\n- ssh_authorized_keys: string w newline seperated keys (default="")\n- package_upgrade: boolean (default=false)\n- reboot: boolean (default=false)\n- skip-puppet-setup: boolean (default=false)	f	\N
133	UserData open-vm-tools	<%#\nkind: user_data\nname: UserData open-vm-tools\nmodel: ProvisioningTemplate\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- Rocky\n- Debian\n- Ubuntu\ndescription: |\n  Template for VMWare customization via open-vm-tools during user-data image based provisioning.\n\n  Comparing to other user-data templates, e.g. those based on cloud-init, this template defines a Customization Specifications that is evaluated by vSphere while cloning a VM from a Template. When the Template that should be cloned has open-vm-tools installed, this allows to configure certain aspects, e.g. networking of the VM, prior boot, so no DHCP configuration is required.\n  Cloud-init is typically used for a stage 2 configuration. In order for this to work, the VMware\n  template must have open-vm-tools installed.\n  The example below is for Linux only, Windows is supported by this mechanism via Sysprep as well, though.\n  \n  This needs to he a hash in YAML format with these keys:\n  - encryptionKey (array)\n  - globalIPSettings (hash), REQUIRED\n  - identity (hash), REQUIRED\n  - nicSettingMap (array)\n  - options (hash)\n  - extraConfig (hash)\n  \n  See https://docs.theforeman.org/nightly/Provisioning_Guide/index-foreman-el.html#Provisioning_Virtual_Machines_in_VMware_vSphere-Provisioning_with_cloudinit_and_userdata_templates\n-%>\n\nidentity:\n  LinuxPrep:\n    domain: <%= @host.domain %>\n    hostName: <%= @host.shortname %>\n    hwClockUTC: true\n    timeZone: <%= host_param('time-zone') || 'UTC' %>\n\nglobalIPSettings:\n  dnsSuffixList: [<%= @host.domain %>]\n  <%- @host.interfaces.each do |interface| -%>\n  <%- next unless interface.subnet -%>\n  dnsServerList: [<%= interface.subnet.dns_servers.join(', ') %>]\n  <%- end -%>\n\nnicSettingMap:\n<%- @host.interfaces.each do |interface| -%>\n<%- next unless interface.subnet -%>\n  - adapter:\n      dnsDomain: <%= interface.domain %>\n      dnsServerList: [<%= interface.subnet.dns_servers.join(', ') %>]\n      gateway: [<%= interface.subnet.gateway %>]\n      ip: <%= interface.ip %>\n      subnetMask: <%= interface.subnet.mask %>\n<%- end -%>\n	f	9	2025-01-19 19:42:38.466945	2025-01-19 19:42:38.466945	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	Template for VMWare customization via open-vm-tools during user-data image based provisioning.\n\nComparing to other user-data templates, e.g. those based on cloud-init, this template defines a Customization Specifications that is evaluated by vSphere while cloning a VM from a Template. When the Template that should be cloned has open-vm-tools installed, this allows to configure certain aspects, e.g. networking of the VM, prior boot, so no DHCP configuration is required.\nCloud-init is typically used for a stage 2 configuration. In order for this to work, the VMware\ntemplate must have open-vm-tools installed.\nThe example below is for Linux only, Windows is supported by this mechanism via Sysprep as well, though.\n\nThis needs to he a hash in YAML format with these keys:\n- encryptionKey (array)\n- globalIPSettings (hash), REQUIRED\n- identity (hash), REQUIRED\n- nicSettingMap (array)\n- options (hash)\n- extraConfig (hash)\n\nSee https://docs.theforeman.org/nightly/Provisioning_Guide/index-foreman-el.html#Provisioning_Virtual_Machines_in_VMware_vSphere-Provisioning_with_cloudinit_and_userdata_templates	f	\N
134	Windows default user data	<%#\nkind: user_data\nname: Windows default user data\nmodel: ProvisioningTemplate\noses:\n- Windows Server 2016\n- Windows Server 2019\n- Windows 10 Pro\n-%>\n<%-\n  pm_set = @host.puppet_server.present?\n  puppet_enabled = pm_set || host_param_true?('force-puppet')\n  network_location = host_param('networklocation') ? host_param('networklocation') : 'private'\n  powershell = '%SystemRoot%\\\\\\\\System32\\\\\\\\WindowsPowerShell\\\\\\\\v1.0\\\\\\\\powershell.exe -ExecutionPolicy Unrestricted -NoLogo -NoProfile'\n-%>\n---\nidentity:\n  Sysprep:\n    guiRunOnce:\n      commandList:\n        - "<%= powershell %> -NonInteractive -Command \\"invoke-webrequest -Uri <%= foreman_url("built") %>\\""\n        <% if host_param('remote_desktop') %>\n        - "<%= powershell %> -NonInteractive -Command \\"netsh advfirewall firewall set rule group=\\"remote desktop\\" new enable=Yes\\""\n        - "<%= powershell %> -NonInteractive -Command \\"netsh advfirewall firewall set rule group=\\"remotedesktop\\" new enable=Yes\\""\n        <% end %>\n        <% if host_param('ping') %>\n        - "<%= powershell %> -NonInteractive -Command \\"netsh advfirewall firewall add rule name=\\"Enable IPv4 ICMP\\" dir=in protocol=icmpv4 action=allow\\""\n        <% end %>\n        <% if host_param('ansible_port') == 5985 or host_param('ansible_winrm_scheme') == 'http' or host_param('ansible_winrm_transport') == 'basic' or host_param('ansible_winrm_transport') == 'credssp' or host_param('ansible_winrm_transport') == 'certificate' %>\n        - "<%= powershell %> -NonInteractive -Command \\"Set-NetConnectionProfile -InterfaceAlias Ethernet0 -NetworkCategory \\"<%= network_location %>\\"\\""\n        - "<%= powershell %> -NonInteractive -Command \\"Enable-PSRemoting\\""\n        <% end %>\n        <% if host_param('ansible_port') == 5985 or host_param('ansible_winrm_scheme') == 'http' %>\n        - "<%= powershell %> -NonInteractive -Command \\"netsh advfirewall firewall add rule name=\\\\\\"WinRM-HTTP\\\\\\" dir=in localport=5985 protocol=TCP action=allow\\""\n        - "<%= powershell %> -NonInteractive -Command \\"winrm set winrm/config/service '@{AllowUnencrypted=\\\\\\"true\\\\\\"}'\\""\n        <% end %>\n        <% if host_param('ansible_winrm_transport') == 'basic' %>\n        - "<%= powershell %> -NonInteractive -Command \\"winrm set winrm/config/client/auth '@{Basic=\\\\\\"true\\\\\\"}'\\""\n        - "<%= powershell %> -NonInteractive -Command \\"winrm set winrm/config/service/auth '@{Basic=\\\\\\"true\\\\\\"}'\\""\n        <% end %>\n        <% if host_param('ansible_winrm_transport') == 'credssp' %>\n        - "<%= powershell %> -NonInteractive -Command \\"winrm set winrm/config/client/auth '@{CredSSP=\\\\\\"true\\\\\\"}'\\""\n        - "<%= powershell %> -NonInteractive -Command \\"winrm set winrm/config/service/auth '@{CredSSP=\\\\\\"true\\\\\\"}'\\""\n        <% end %>\n        <% if host_param('ansible_winrm_transport') == 'certificate' %>\n        - "<%= powershell %> -NonInteractive -Command \\"winrm set winrm/config/client/auth '@{Certificate=\\\\\\"true\\\\\\"}'\\""\n        - "<%= powershell %> -NonInteractive -Command \\"winrm set winrm/config/service/auth '@{Certificate=\\\\\\"true\\\\\\"}'\\""\n        <% end %>\n        <% if puppet_enabled %>\n        - "<%= powershell %> -Command \\"invoke-webrequest -Uri <%= host_param('win_puppet_source') %> -OutFile C:\\\\puppet-agent-latest.msi\\""\n        - "<%= powershell %> -Command \\"md C:\\\\ProgramData\\\\PuppetLabs\\\\puppet\\\\etc\\""\n        - "<%= powershell %> -Command \\"echo \\"[main]\\" | out-file C:\\\\ProgramData\\\\PuppetLabs\\\\puppet\\\\etc\\\\puppet.conf -encoding utf8\\""\n        - "<%= powershell %> -Command \\"echo \\"server=http://<%= foreman_server_fqdn %>:8000/unattended/built?token=cae2cc74-1394-4acb-ad16-1011020b9bbe\\" | add-content C:\\\\ProgramData\\\\PuppetLabs\\\\puppet\\\\etc\\\\puppet.conf -encoding utf8\\""\n        - "<%= powershell %> -Command \\"echo \\"autoflush=true\\" | add-content C:\\\\ProgramData\\\\PuppetLabs\\\\puppet\\\\etc\\\\puppet.conf -encoding utf8\\""\n        - "<%= powershell %> -Command \\"start /wait \\"\\" msiexec /qn /norestart /i C:\\\\puppet-agent-latest.msi PUPPET_MASTER_SERVER=<%= @host.puppet_server %>\\""\n        - "<%= powershell %> -Command \\"sdelete.exe -accepteula -p 2 C:\\\\puppet-agent-latest.msi\\""\n        <% end %>\n    guiUnattended:\n      autoLogon: true\n      autoLogonCount: 1\n      password:\n        plainText: true\n        value: <%= host_param('win_password') %>\n      timeZone: 110\n    identification:\n      joinWorkgroup: 'WORKGROUP'\n    licenseFilePrintData:\n      autoMode: 'perSeat'\n    userData:\n      computerName: <%= @host.shortname %>\n      fullName: 'IT'\n      orgName: <%= @host.organization %>\n      productId: "<%= host_param('windowsLicenseKey').to_s %>"\nnicSettingMap:\n  - adapter:\n      dnsDomain: <%= @host.domain %>\n      dnsServerList:\n        - <%= @host.subnet.dns_primary %>\n      gateway:\n        - <%= @host.subnet.gateway %>\n      ip: <%= @host.ip %>\n      subnetMask: <%= @host.subnet.mask %>\nglobalIPSettings:\n  dnsServerList:\n    - <%= @host.subnet.dns_primary %>\n  dnsSuffixList:\n    - <%= @host.domain %>\noptions:\n  changeSID: true\n  deleteAccounts: false\n	f	9	2025-01-19 19:42:38.47561	2025-01-19 19:42:38.47561	t	t	Foreman	ProvisioningTemplate	\N	Miscellaneous	\N	\N	\N	\N	f	\N
135	AutoYaST entire SCSI disk	<%#\nkind: ptable\nname: AutoYaST entire SCSI disk\nmodel: Ptable\noses:\n- SLES\n- OpenSUSE\n%>\n  <partitioning  config:type="list">\n    <drive>\n      <device>/dev/sda</device>\n      <use>all</use>\n    </drive>\n  </partitioning>\n	f	\N	2025-01-19 19:42:38.495365	2025-01-19 19:42:38.495365	t	t	Foreman	Ptable	Suse	Miscellaneous	\N	\N	\N	\N	f	\N
136	AutoYaST entire virtual disk	<%#\nkind: ptable\nname: AutoYaST entire virtual disk\nmodel: Ptable\noses:\n- SLES\n- OpenSUSE\n%>\n  <partitioning  config:type="list">\n    <drive>\n      <device>/dev/vda</device>\n      <use>all</use>\n    </drive>\n  </partitioning>\n	f	\N	2025-01-19 19:42:38.503856	2025-01-19 19:42:38.503856	t	t	Foreman	Ptable	Suse	Miscellaneous	\N	\N	\N	\N	f	\N
137	AutoYaST LVM	<%#\nkind: ptable\nname: AutoYaST LVM\nmodel: Ptable\noses:\n- SLES\n- OpenSUSE\n%>\n  <partitioning config:type="list">\n    <drive>\n      <device>/dev/sda</device>\n      <initialize config:type="boolean">true</initialize>\n      <partitions config:type="list">\n        <partition>\n          <create config:type="boolean">true</create>\n          <filesystem config:type="symbol">ext3</filesystem>\n          <format config:type="boolean">true</format>\n          <mount>/boot</mount>\n          <partition_id config:type="integer">131</partition_id>\n          <partition_nr config:type="integer">1</partition_nr>\n          <size>1G</size>\n          <stripes config:type="integer">1</stripes>\n          <stripesize config:type="integer">4</stripesize>\n          <subvolumes config:type="list"/>\n        </partition>\n        <partition>\n          <create config:type="boolean">true</create>\n          <format config:type="boolean">false</format>\n          <lvm_group>vg00</lvm_group>\n          <partition_id config:type="integer">142</partition_id>\n          <partition_nr config:type="integer">2</partition_nr>\n          <size>max</size>\n        </partition>\n      </partitions>\n      <pesize></pesize>\n      <type config:type="symbol">CT_DISK</type>\n      <use>all</use>\n    </drive>\n    <drive>\n      <device>/dev/vg00</device>\n      <initialize config:type="boolean">true</initialize>\n      <partitions config:type="list">\n        <partition>\n          <create config:type="boolean">true</create>\n          <filesystem config:type="symbol">ext3</filesystem>\n          <format config:type="boolean">true</format>\n          <lv_name>root</lv_name>\n          <mount>/</mount>\n          <size>4G</size>\n        </partition>\n        <partition>\n          <create config:type="boolean">true</create>\n          <filesystem config:type="symbol">swap</filesystem>\n          <format config:type="boolean">true</format>\n          <lv_name>swap</lv_name>\n          <mount>swap</mount>\n          <size>8G</size>\n        </partition>\n        <partition>\n          <create config:type="boolean">true</create>\n          <filesystem config:type="symbol">ext3</filesystem>\n          <format config:type="boolean">true</format>\n          <lv_name>usr</lv_name>\n          <mount>/usr</mount>\n          <size>8G</size>\n        </partition>\n        <partition>\n          <create config:type="boolean">true</create>\n          <filesystem config:type="symbol">ext3</filesystem>\n          <format config:type="boolean">true</format>\n          <lv_name>tmp</lv_name>\n          <mount>/tmp</mount>\n          <size>4G</size>\n        </partition>\n        <partition>\n          <create config:type="boolean">true</create>\n          <filesystem config:type="symbol">ext3</filesystem>\n          <format config:type="boolean">true</format>\n          <lv_name>var</lv_name>\n          <mount>/var</mount>\n          <size>4G</size>\n        </partition>\n      </partitions>\n      <type config:type="symbol">CT_LVM</type>\n      <use>all</use>\n    </drive>\n  </partitioning>\n	f	\N	2025-01-19 19:42:38.512095	2025-01-19 19:42:38.512095	t	t	Foreman	Ptable	Suse	Miscellaneous	\N	\N	\N	\N	f	\N
138	CoreOS default fake	<%#\nkind: ptable\nname: CoreOS default fake\nmodel: Ptable\noses:\n- CoreOS\n%>\n# Not supported with coreos-install\n	f	\N	2025-01-19 19:42:38.52045	2025-01-19 19:42:38.52045	t	t	Foreman	Ptable	Coreos	Miscellaneous	\N	\N	\N	\N	f	\N
144	Kickstart custom	<%#\nkind: ptable\nname: Kickstart custom\nmodel: Ptable\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\n-%>\n<% if host_param('driverdisk_source') -%>\ndriverdisk --source=<%= host_param('driverdisk_source') %>\n<% end -%>\nzerombr\nclearpart --all --initlabel\n<%\n  dev = host_param('part_device') || 'sda'\n  swap = host_param('part_swap_size') || '4096'\n  root = host_param('part_root_percent') || '100'\n  home = host_param('part_home_percent') || '0'\n  fstype = host_param('part_fstype') || 'xfs'\n  vgname = host_param('part_vgname') || "vg_#{dev}"\n  lvname_swap = host_param('part_swap_name') || 'lv_swap'\n  lvname_root = host_param('part_root_name') || 'lv_root'\n  lvname_home = host_param('part_home_name') || 'lv_home'\n  pxe_loader = @host.pxe_loader || ''\n-%>\n\n<% if pxe_loader.include?('UEFI') || pxe_loader.include?('BIOS') -%>\n  <%- if pxe_loader.include?('UEFI') -%>\n  part /boot/efi --fstype="efi" --ondisk=<%= dev %> --size=200 --fsoptions="umask=0077,shortname=efi"\n  <%- end -%>\n\n  <%- if (@host.operatingsystem.family == 'Redhat' && @host.operatingsystem.major.to_i >= 7 ) -%>\n  part /boot --fstype="<%= fstype %>" --ondisk=<%= dev %> --size=1024\n  <% else -%>\n  part /boot --fstype="ext4" --ondisk=<%= dev %> --size=1024\n  <% end -%>\n  part pv.01 --fstype="lvmpv" --ondisk=<%= dev %> --size=1024 --grow\n  volgroup <%= vgname %> --pesize=4096 pv.01\n  logvol swap --fstype="swap" --size=<%= swap %> --name=<%= lvname_swap %> --vgname=<%= vgname %>\n  logvol / --fstype="<%= fstype %>" --percent=<%= root %> --name=<%= lvname_root %> --vgname=<%= vgname %>\n  <% if home != '0' -%>\n  logvol /home --fstype="<%= fstype %>" --percent=<%= home %> --name=<%= lvname_home %> --vgname=<%= vgname %>\n  <% end -%>\n\n<% else -%>\n\n# fallback to autopart, PXE loader was set to: <%= @host.pxe_loader %>\nautopart <%= host_param('autopart_options') %>\n\n<% end -%>\n	f	\N	2025-01-19 19:42:38.570212	2025-01-19 19:42:38.570212	t	t	Foreman	Ptable	Redhat	Miscellaneous	\N	\N	\N	\N	f	\N
145	Kickstart default	<%#\nkind: ptable\nname: Kickstart default\nmodel: Ptable\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\n-%>\n<% if host_param('driverdisk_source') -%>\ndriverdisk --source=<%= host_param('driverdisk_source') %>\n<% end -%>\n<% if host_param('ignoredisk_options') %>\nignoredisk <%= host_param('ignoredisk_options') %>\n<% end %>\nzerombr\nclearpart --all --initlabel\nautopart <%= host_param('autopart_options') %>\n	f	\N	2025-01-19 19:42:38.57849	2025-01-19 19:42:38.57849	t	t	Foreman	Ptable	Redhat	Miscellaneous	\N	\N	\N	\N	f	\N
146	Kickstart default encrypted	<%#\nkind: ptable\nname: Kickstart default encrypted\nmodel: Ptable\noses:\n- AlmaLinux\n- RedHat\n- Rocky\n-%>\n<% if host_param('driverdisk_source') -%>\ndriverdisk --source=<%= host_param('driverdisk_source') %>\n<% end -%>\n<% if host_param('ignoredisk_options') -%>\nignoredisk <%= host_param('ignoredisk_options') %>\n<% end -%>\nzerombr\nclearpart --all --initlabel\nautopart --encrypted --passphrase="<%= host_param('disk_enc_passphrase', 'linux') %>" <%= host_param('autopart_options') %>\n	f	\N	2025-01-19 19:42:38.586728	2025-01-19 19:42:38.586728	t	t	Foreman	Ptable	Redhat	Miscellaneous	\N	\N	\N	\N	f	\N
147	Kickstart default thin	<%#\nkind: ptable\nname: Kickstart default thin\nmodel: Ptable\noses:\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- oVirt\n- RHVH\n-%>\n<% if host_param('driverdisk_source') -%>\ndriverdisk --source=<%= host_param('driverdisk_source') %>\n<% end -%>\nzerombr\nclearpart --all --initlabel\nautopart --type=thinp <%= host_param('autopart_options') %>\n	f	\N	2025-01-19 19:42:38.595011	2025-01-19 19:42:38.595011	t	t	Foreman	Ptable	Redhat	Miscellaneous	\N	\N	\N	\N	f	\N
148	Kickstart dynamic	<%#\nkind: ptable\nname: Kickstart dynamic\nmodel: Ptable\noses:\n- AlmaLinux\n- CentOS\n- CentOS_Stream\n- Fedora\n- RedHat\n- Rocky\n-%>\n<%#\n\nWhen a partition template contains a line starting with "#Dynamic", the contents\nwill be put into %pre shell scriplet executed with bash and it's expected to\ncreate a file "/tmp/diskpart.cfg" which is then included into the Kickstart\npartitioning section. This allows generating partitioning schemes on the\nmanaged node before Anaconda starts installation.\n\nThis template is an example of such dynamic partitioning scheme. It follows\nrecommended scheme of Red Hat Enterprise Linux for servers (no extra allocation\nfor hibernation):\n\nhttps://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/ch-swapspace\n\nTake this as an example, any configuration (RAID, LVM, LUKS) can be created\nthis way.\n\n-%>\n#Dynamic (do not remove this line)\n\nMEMORY=$((`grep MemTotal: /proc/meminfo | sed 's/^MemTotal: *//'|sed 's/ .*//'` / 1024))\nif [ "$MEMORY" -lt 2048 ]; then\n    SWAP_MEMORY=$(($MEMORY * 2))\nelif [ "$MEMORY" -lt 8192 ]; then\n    SWAP_MEMORY=$MEMORY\nelif [ "$MEMORY" -lt 65536 ]; then\n    SWAP_MEMORY=$(($MEMORY / 2))\nelse\n    SWAP_MEMORY=32768\nfi\n\ncat <<EOF > /tmp/diskpart.cfg\nzerombr\nclearpart --all --initlabel\npart /boot --fstype ext4 --size 200 --asprimary\npart swap --size "$SWAP_MEMORY"\npart / --fstype ext4 --size 1024 --grow\nEOF\n	f	\N	2025-01-19 19:42:38.603303	2025-01-19 19:42:38.603303	t	t	Foreman	Ptable	Redhat	Miscellaneous	\N	\N	\N	\N	f	\N
149	NX-OS default fake	<%#\nkind: ptable\nname: NX-OS default fake\nmodel: Ptable\noses:\n- NX-OS\n%>\n# Not required for NX-OS POAP provisioning.\n	f	\N	2025-01-19 19:42:38.611423	2025-01-19 19:42:38.611423	t	t	Foreman	Ptable	NXOS	Miscellaneous	\N	\N	\N	\N	f	\N
150	Preseed default	<%#\nkind: ptable\nname: Preseed default\nmodel: Ptable\noses:\n- Debian\n- Ubuntu\n%>\n<%\n  partitioning_method = host_param('partitioning-method') ? host_param('partitioning-method') : 'regular'\n  partitioning_recipe = host_param('partitioning-recipe') ? host_param('partitioning-recipe') : 'atomic'\n  partitioning_expert_recipe = host_param('partitioning-expert-recipe') ? host_param('partitioning-expert-recipe') : ''\n  vg_name = host_param('partitioning-vg-name') ? host_param('partitioning-vg-name') : ''\n  partitioning_filesystem = host_param('partitioning-filesystem') ? host_param('partitioning-filesystem') : ''\n-%>\n\n<% if host_param('install-disk') -%>\nd-i partman-auto/disk string <%= host_param('install-disk') %>\nd-i grub-installer/bootdev string <%= host_param('install-disk') %>\n<% else -%>\n# Use the first detected hard disk\nd-i partman/early_command string \\\n  INSTALL_DISK="$(list-devices disk | head -n1)"; \\\n  debconf-set partman-auto/disk "$INSTALL_DISK"; \\\n  debconf-set grub-installer/bootdev "$INSTALL_DISK"\n<% end -%>\n\n### Partitioning\n# The presently available methods are: "regular", "lvm" and "crypto"\nd-i partman-auto/method string <%= partitioning_method %>\n\n<% if partitioning_method == 'crypto' -%>\n# Unattended 'crypto' partitioning method requires a passphrase.\nd-i partman-crypto/passphrase password <%= host_param('partitioning-crypto-passphrase') %>\nd-i partman-crypto/passphrase-again password <%= host_param('partitioning-crypto-passphrase') %>\n\n# When disk encryption is enabled, skip wiping the partitions beforehand.\nd-i partman-auto-crypto/erase_disks boolean <%= host_param_true?('partitioning-crypto-erase-disks') ? 'true' : 'false' %>\n\n<% end -%>\n# If one of the disks that are going to be automatically partitioned\n# contains an old LVM configuration, the user will normally receive a\n# warning. This can be preseeded away...\nd-i partman-lvm/device_remove_lvm boolean true\n# The same applies to pre-existing software RAID array:\nd-i partman-md/device_remove_md boolean true\n# And the same goes for the confirmation to write the lvm partitions.\nd-i partman-lvm/confirm boolean true\nd-i partman-lvm/confirm_nooverwrite boolean true\n\n<% if partitioning_method == 'lvm' || partitioning_method == 'crypto' -%>\n# For LVM partitioning, you can select how much of the volume group to use\n# for logical volumes.\nd-i partman-auto-lvm/guided_size string max\n<% if vg_name != '' -%>\nd-i partman-auto-lvm/new_vg_name string <%= vg_name %>\n<% end -%>\n<% end -%>\n\n<% if host_param_true?('partitioning-allow-noswap') -%>\nd-i partman-basicfilesystems/no_swap boolean false\n<% end -%>\n\n<% if host_param('partitioning-disk-label') -%>\nd-i partman-partitioning/choose_label string <%= host_param('partitioning-disk-label') %>\nd-i partman-partitioning/default_label string <%= host_param('partitioning-disk-label') %>\n<% end -%>\n\n# You can choose one of the three predefined partitioning recipes:\n# - atomic: all files in one partition\n# - home:   separate /home partition\n# - multi:  separate /home, /var, and /tmp partitions (/usr was removed in jessie)\nd-i partman-auto/choose_recipe select <%= partitioning_recipe %>\n\n<% if partitioning_expert_recipe != '' -%>\n# Or provide a recipe of your own...\n# If you have a way to get a recipe file into the d-i environment, you can\n# just point at it.\nd-i partman-auto/expert_recipe string \\\n<%= partitioning_expert_recipe.gsub(/(?:\\n\\r?|\\r\\n?)/, " \\\\\\n") %>\n\n<% end -%>\n\n# If you just want to change the default filesystem to something\n# else, you can do that without providing a full recipe.\n<% if partitioning_filesystem != '' -%>\nd-i partman/default_filesystem string <%= partitioning_filesystem %>\n<% end -%>\n\n# This makes partman automatically partition without confirmation, provided\n# that you told it what to do using one of the methods above.\nd-i partman/confirm_write_new_label boolean true\nd-i partman/choose_partition select finish\nd-i partman/confirm boolean true\nd-i partman/confirm_nooverwrite boolean true\n	f	\N	2025-01-19 19:42:38.619513	2025-01-19 19:42:38.619513	t	t	Foreman	Ptable	Debian	Miscellaneous	\N	\N	\N	\N	f	\N
151	Preseed default autoinstall	<%#\nkind: ptable\nname: Preseed default autoinstall\nmodel: Ptable\ndescription: |\n  Preseed Autoinstall default storage snippet configures drives automatically\n  with LVM. The snippet is automatically indented by 2 spaces. For reference:\n  https://ubuntu.com/server/docs/install/autoinstall-reference\noses:\n- Ubuntu\n%>\nstorage:\n  layout:\n    name: lvm\n	f	\N	2025-01-19 19:42:38.627824	2025-01-19 19:42:38.627824	t	t	Foreman	Ptable	Debian	Miscellaneous	\N	\N	\N	Preseed Autoinstall default storage snippet configures drives automatically\nwith LVM. The snippet is automatically indented by 2 spaces. For reference:\nhttps://ubuntu.com/server/docs/install/autoinstall-reference	f	\N
153	Preseed default LVM	<%#\nkind: ptable\nname: Preseed default LVM\nmodel: Ptable\noses:\n- Debian\n- Ubuntu\n%>\n<%\n  partitioning_method = host_param('partitioning-method') ? host_param('partitioning-method') : 'lvm'\n  partitioning_recipe = host_param('partitioning-recipe') ? host_param('partitioning-recipe') : 'multi'\n  partitioning_expert_recipe = host_param('partitioning-expert-recipe') ? host_param('partitioning-expert-recipe') : ''\n  vg_name = host_param('partitioning-vg-name') ? host_param('partitioning-vg-name') : 'vg00'\n  partitioning_filesystem = host_param('partitioning-filesystem') ? host_param('partitioning-filesystem') : ''\n  partitioning_crypto_erase = host_param('partitioning-crypto-erase') ? host_param('partitioning-crypto-erase') : 'false'\n  partitioning_crypto_password = host_param('partitioning-crypto-password') ? host_param('partitioning-crypto-password') : 'temporarypassword'\n  partitioning_crypto_password_weak = host_param('partitioning-crypto-password-weak') ? host_param('partitioning-crypto-password-weak') : 'false'\n-%>\n\n<% if host_param('install-disk') -%>\nd-i partman-auto/disk string <%= host_param('install-disk') %>\nd-i grub-installer/bootdev string <%= host_param('install-disk') %>\n<% else -%>\n# Use the first detected hard disk\nd-i partman/early_command string \\\n  INSTALL_DISK="$(list-devices disk | head -n1)"; \\\n  debconf-set partman-auto/disk "$INSTALL_DISK"; \\\n  debconf-set grub-installer/bootdev "$INSTALL_DISK"\n<% end -%>\n\n### Partitioning\n# The presently available methods are: "regular", "lvm" and "crypto"\nd-i partman-auto/method string <%= partitioning_method %>\n\n# If one of the disks that are going to be automatically partitioned\n# contains an old LVM configuration, the user will normally receive a\n# warning. This can be preseeded away...\nd-i partman-lvm/device_remove_lvm boolean true\n# The same applies to pre-existing software RAID array:\nd-i partman-md/device_remove_md boolean true\n# And the same goes for the confirmation to write the lvm partitions.\nd-i partman-lvm/confirm boolean true\nd-i partman-lvm/confirm_nooverwrite boolean true\n\n<% if partitioning_method == 'lvm' or partitioning_method == 'crypto' -%>\n# For LVM partitioning, you can select how much of the volume group to use\n# for logical volumes.\nd-i partman-auto-lvm/guided_size string max\n<% if partitioning_method == 'crypto' -%>\nd-i partman-crypto/erase_data boolean <%= partitioning_crypto_erase %>\nd-i partman-crypto/passphrase password <%= partitioning_crypto_password %>\nd-i partman-crypto/passphrase-again password <%= partitioning_crypto_password %>\nd-i partman-crypto/weak_passphrase boolean <%= partitioning_crypto_password_weak %>\n<% end -%>\n<% if vg_name != '' -%>\nd-i partman-auto-lvm/new_vg_name string <%= vg_name %>\n<% end -%>\n<% end -%>\n\n<% if host_param_true?('partitioning-allow-noswap') -%>\nd-i partman-basicfilesystems/no_swap boolean false\n<% end -%>\n\n<% if host_param('partitioning-disk-label') -%>\nd-i partman-partitioning/choose_label string <%= host_param('partitioning-disk-label') %>\nd-i partman-partitioning/default_label string <%= host_param('partitioning-disk-label') %>\n<% end -%>\n\n# You can choose one of the three predefined partitioning recipes:\n# - atomic: all files in one partition\n# - home:   separate /home partition\n# - multi:  separate /home, /var, and /tmp partitions (/usr was removed in jessie)\nd-i partman-auto/choose_recipe select <%= partitioning_recipe %>\n\n<% if partitioning_expert_recipe != '' -%>\n# Or provide a recipe of your own...\n# If you have a way to get a recipe file into the d-i environment, you can\n# just point at it.\nd-i partman-auto/expert_recipe string \\\n<%= partitioning_expert_recipe.gsub(/(?:\\n\\r?|\\r\\n?)/, " \\\\\\n") %>\n\n<% end -%>\n\n# If you just want to change the default filesystem to something\n# else, you can do that without providing a full recipe.\n<% if partitioning_filesystem != '' -%>\nd-i partman/default_filesystem string <%= partitioning_filesystem %>\n<% end -%>\n\n# This makes partman automatically partition without confirmation, provided\n# that you told it what to do using one of the methods above.\nd-i partman/confirm_write_new_label boolean true\nd-i partman/choose_partition select finish\nd-i partman/confirm boolean true\nd-i partman/confirm_nooverwrite boolean true\n	f	\N	2025-01-19 19:42:38.644171	2025-01-19 19:42:38.644171	t	t	Foreman	Ptable	Debian	Miscellaneous	\N	\N	\N	\N	f	\N
154	Windows default partition table	<%#\nkind: ptable\nname: Windows default partition table\nmodel: Ptable\noses:\n- Windows\n%>\n:: Disk Partitioning Layout\n\nset DPFILE=%SYSTEMDRIVE%\\dp.txt\n\n:: Append commands to Diskpart file\necho select disk 0 > %DPFILE%\necho clean >> %DPFILE%\necho create partition primary size=100 >> %DPFILE%\necho select partition 1 >> %DPFILE%\necho active >> %DPFILE%\necho format quick fs=ntfs >> %DPFILE%\necho create partition primary >> %DPFILE%\necho select partition 2 >> %DPFILE%\necho format quick fs=ntfs label="<%= @host.operatingsystem.family -%>" >> %DPFILE%\necho assign letter="C" >> %DPFILE%\necho exit >> %DPFILE%\n\n:: Execute Diskpart with file as script argument\ndiskpart /s %DPFILE%\n\n:: Remove Diskpart script file\ndel %DPFILE%\n	f	\N	2025-01-19 19:42:38.654923	2025-01-19 19:42:38.654923	t	t	Foreman	Ptable	Windows	Miscellaneous	\N	\N	\N	\N	f	\N
155	Windows default GPT EFI partition table	<%#\nname: Windows default GPT EFI partition table\nmodel: Ptable\noses:\n- Windows\n%>\n:: Disk Partitioning Layout\n\nset DPFILE=%SYSTEMDRIVE%\\dp.txt\n\n:: Append commands to Diskpart file\necho select disk 0 > %DPFILE%\necho clean >> %DPFILE%\necho convert gpt >> %DPFILE%\necho create partition EFI size=100 >> %DPFILE%\necho select partition 1 >> %DPFILE%\necho format quick fs=fat32 label="System" >> %DPFILE%\necho set id="c12a7328-f81f-11d2-ba4b-00a0c93ec93b" >> %DPFILE%\necho assign letter="K" >> %DPFILE%\necho create partition msr size=128 >> %DPFILE%\necho create partition primary >> %DPFILE%\necho select partition 3 >> %DPFILE%\necho shrink minimum=450 >> %DPFILE%\necho format quick fs=ntfs label="<%= @host.operatingsystem.family -%>" >> %DPFILE%\necho select partition 3 >> %DPFILE%\necho assign letter="C" >> %DPFILE%\necho create partition primary >> %DPFILE%\necho format quick fs=ntfs label="WinRE" >> %DPFILE%\necho set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac" >> %DPFILE%\necho gpt attributes=0x8000000000000001 >> %DPFILE%\necho exit >> %DPFILE%\n\n:: Execute Diskpart with file as script argument\ndiskpart /s %DPFILE%\n\n:: Remove Diskpart script file\ndel %DPFILE%\n	f	\N	2025-01-19 19:42:38.663591	2025-01-19 19:42:38.663591	t	t	Foreman	Ptable	Windows	Miscellaneous	\N	\N	\N	\N	f	\N
156	XenServer default	<%#\nkind: ptable\nname: XenServer default\nmodel: Ptable\noses:\n- XenServer\n-%>\n<%\n  gueststorage = host_param('gueststorage') || 'yes'\n  primary_disk = host_param('install-disk') || 'sda'\n-%>\n  <primary-disk gueststorage="<%= gueststorage %>"><%= primary_disk %></primary-disk>\n	f	\N	2025-01-19 19:42:38.672194	2025-01-19 19:42:38.672194	t	t	Foreman	Ptable	Xenserver	Miscellaneous	\N	\N	\N	\N	f	\N
157	Ansible - Ansible Inventory	<%#\nname: Ansible - Ansible Inventory\ndescription: This template has a special meaning and should not be renamed.\nsnippet: false\ntemplate_inputs:\n- name: Organization\n  required: true\n  input_type: user\n  description: Whether should be Organization included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "yes"\n- name: Location\n  required: true\n  input_type: user\n  description: Whether should be Location included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "yes"\n- name: Host Group\n  required: true\n  input_type: user\n  description: Whether should be Host Group included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "yes"\n- name: Host Collections\n  required: true\n  input_type: user\n  description: Whether should be Host Collections included. Ignored when Katello is not available.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "yes"\n- name: Host Parameters\n  required: true\n  input_type: user\n  description: Whether should be Host Parameters included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "no"\n- name: IPv4\n  required: true\n  input_type: user\n  description: Whether should be IPv4 included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "yes"\n- name: IPv6\n  required: true\n  input_type: user\n  description: Whether should be IPv6 included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "no"\n- name: Subnet\n  required: true\n  input_type: user\n  description: Whether should be Subnet included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "yes"\n- name: Subnet v6\n  required: true\n  input_type: user\n  description: Whether should be Subnet v6 included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "no"\n- name: Smart Proxies\n  required: true\n  input_type: user\n  description: Whether should be Smart Proxies included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "yes"\n- name: Content Attributes\n  required: true\n  input_type: user\n  description: Whether should be Content Attributes included. Ignored when Katello is not available.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "no"\n- name: Facts\n  required: true\n  input_type: user\n  description: Whether should be Facts included.\n  advanced: false\n  value_type: plain\n  options: "yes\\r\\nno"\n  default: "no"\n- name: Hosts\n  required: false\n  input_type: user\n  description: Limit the report only on hosts found by this search query. Keep\n    empty for report on all available hosts.\n  advanced: false\n  value_type: search\n  resource_type: Host\nmodel: ReportTemplate\n-%>\n<%- report_headers 'id', 'name' -%>\n<%- if plugin_present?('katello') -%>\n<%-   content_attrs = input('Content Attributes') == 'yes' -%>\n<%-   include_host_collections = input('Host Collections') == 'yes' -%>\n<%- end -%>\n<%- input_organization = input('Organization') == 'yes'\n    input_location = input('Location') == 'yes'\n    input_hostgroup = input('Host Group') == 'yes'\n    input_hostparameters = input('Host Parameters') == 'yes'\n    input_ipv4 = input('IPv4') == 'yes'\n    input_ipv6 = input('IPv6') == 'yes'\n    input_subnet = input('Subnet') == 'yes'\n    input_subnet6 = input('Subnet v6') == 'yes'\n    input_smartproxies = input('Smart Proxies') == 'yes'\n    input_facts = input('Facts') == 'yes'\n%>\n<%- interface_includes = [:subnet] -%>\n<%- interface_includes.push(:domain) if input_hostparameters -%>\n<%- includes = [:organization, :location, :hostgroup, { interfaces: interface_includes }] -%>\n<%- includes.push(:host_collections) if include_host_collections -%>\n<%- includes.push(:content_facet) if content_attrs -%>\n<%- includes.push(:operatingsystem) if input_hostparameters -%>\n<%- load_hosts(search: input('Hosts'), includes: includes).each_record do |host| -%>\n<%-   content_facet = host_content_facet(host) if content_attrs -%>\n<%-   content_attribute_data = nil -%>\n<%-   if content_facet -%>\n<%-     content_attribute_data = {\n          'applicable_module_stream_count': content_facet.applicable_module_stream_count,\n          'applicable_package_count': content_facet.applicable_rpm_count,\n          'content_source': content_facet.content_source,\n          'content_source_id': content_facet.content_source_id,\n          'content_source_name': content_facet.content_source_name,\n          'content_view': {\n              'id': content_facet.single_content_view&.id,\n              'name': content_facet.single_content_view&.name,\n          },\n          'content_view_id': content_facet.single_content_view&.id,\n          'content_view_name': content_facet.single_content_view&.name,\n          'errata_counts': content_facet.errata_counts,\n          'id': content_facet.id,\n          'kickstart_repository': content_facet.kickstart_repository,\n          'kickstart_repository_id': content_facet.kickstart_repository_id,\n          'kickstart_repository_name': content_facet.kickstart_repository_name,\n          'lifecycle_environment': {\n              'id': content_facet.single_lifecycle_environment&.id,\n              'name': content_facet.single_lifecycle_environment&.name,\n          },\n          'lifecycle_environment_id': content_facet.single_lifecycle_environment&.id,\n          'lifecycle_environment_name': content_facet.single_lifecycle_environment&.name,\n          'upgradable_module_stream_count': content_facet.upgradable_module_stream_count,\n          'upgradable_package_count': content_facet.upgradable_rpm_count,\n          'uuid': content_facet.uuid,\n}\n-%>\n<%-   end -%>\n<%-   inventory_data = { 'id': host.id, 'name': host.name }\n      inventory_data.update('organization': host.organization) if input_organization\n      inventory_data.update('location': host.location) if input_location\n      hostgroup = host.hostgroup.title if host.hostgroup\n      inventory_data.update('host_group': hostgroup) if input_hostgroup\n      if include_host_collections\n        host_collections = host.host_collections.map { |c| c.name } if host.host_collections\n        inventory_data.update('host_collections': host_collections)\n      end\n      inventory_data.update('host_parameters': host.params) if input_hostparameters\n\n      net_sources = [host]\n      net_sources.unshift(host.execution_interface) if host.respond_to?(:execution_interface)\n      if input_ipv4 || input_subnet\n        ipv4_source = net_sources.find { |s| s.ip }\n        inventory_data.update('ipv4': ipv4_source&.ip) if input_ipv4\n        inventory_data.update('subnet': ipv4_source&.subnet) if input_subnet\n      end\n      if input_ipv6 || input_subnet6\n        ipv6_source = net_sources.find { |s| s.ip6 }\n        inventory_data.update('ipv6': ipv6_source&.ip6) if input_ipv6\n        inventory_data.update('subnet6': ipv6_source&.subnet6) if input_subnet6\n      end\n      smart_proxies = host.smart_proxies.map { |p| p.name } if host.smart_proxies\n      inventory_data.update('smart_proxies': smart_proxies) if input_smartproxies\n      inventory_data.update('content_attributes': content_attribute_data) if content_attrs\n      inventory_data.update('facts': host.facts) if input_facts\n      report_row(inventory_data)\n-%>\n<%- end -%>\n<%= report_render -%>\n	f	\N	2025-01-19 19:42:38.706317	2025-01-19 19:42:38.706317	t	t	Foreman	ReportTemplate	\N	Miscellaneous	\N	\N	\N	This template has a special meaning and should not be renamed.	f	\N
158	Host - Statuses	<%#\nname: Host - Statuses\nsnippet: false\ntemplate_inputs:\n- name: hosts\n  required: false\n  input_type: user\n  description: Limit the report only on hosts found by this search query. Keep empty\n    for report on all available hosts.\n  advanced: false\n  value_type: search\n  resource_type: Host\n- name: Output style\n  required: false\n  input_type: user\n  description: Select 'Human-readable' to show statuses as they would appear in the web UI, or 'Machine-readable' to show numeric statuses.\n  options: "Human-readable\\r\\nMachine-readable"\n  advanced: false\n  default: Human-readable\nmodel: ReportTemplate\n-%>\n<%- report_headers 'Name', 'Global' -%>\n<%- machine_readable = input('Output style') == 'Machine-readable' -%>\n<%- load_hosts(search: input('hosts'), includes: :host_statuses).each_record do |host| -%>\n<%-   report_row({\n        'Name': host.name,\n        'Global': machine_readable ? host.global_status : host.global_status_label\n      }.merge(machine_readable ? all_host_statuses_hash(host) : all_host_statuses_labels_hash(host))) -%>\n<%- end -%>\n<%= report_render -%>\n	f	\N	2025-01-19 19:42:38.727324	2025-01-19 19:42:38.727324	t	t	Foreman	ReportTemplate	\N	Miscellaneous	\N	\N	\N	\N	f	\N
159	Job - Invocation Report	<%#\nname: Job - Invocation Report\nsnippet: false\ntemplate_inputs:\n- name: job_id\n  required: true\n  input_type: user\n  description: Id of job invocation to report\n  advanced: false\n  value_type: plain\n  resource_type: JobInvocation\n  hidden_value: false\n- name: hosts\n  required: false\n  input_type: user\n  description: Field for filter hosts of job invocation. Leave blank for all hosts.\n  advanced: false\n  value_type: search\n  resource_type: Host\n  hidden_value: false\nmodel: ReportTemplate\nrequire:\n- plugin: foreman_remote_execution\n￼ version: 4.4.0\n-%>\n<%- report_headers 'Host', 'stdout', 'stderr', 'debug', 'Result', 'Finished' -%>\n<%- invocation = find_job_invocation_by_id(input('job_id')) -%>\n<%- parts = ["job_invocation.id = #{input('job_id')}"] -%>\n<%- parts << input('hosts') unless input('hosts').blank? -%>\n<%- search = parts.map { |part| '(' + part + ')' }.join(' AND ') -%>\n<%- load_hosts(search: search).each do |batch| -%>\n<%-   batch.each do |host|  -%>\n<%-     task = invocation.sub_task_for_host(host) -%>\n<%-     outputs = { 'stdout' => [], 'stderr' => [], 'debug' => [] }  -%>\n<%-     task.action_continuous_output.each do |output| -%>\n<%-       outputs[output['output_type']] << output['output'] -%>\n<%-     end -%>\n<%-     report_row(\n            'Host': host.name,\n            'stdout': join_with_line_break(outputs['stdout']),\n            'stderr': join_with_line_break(outputs['stderr']),\n            'debug': join_with_line_break(outputs['debug']),\n            'Result': task.result,\n            'Finished': task.ended_at.blank? ? nil : format_time(task.ended_at),\n        ) -%>\n<%-   end -%>\n<%- end -%>\n<%= report_render -%>\n	f	\N	2025-01-19 19:42:38.737319	2025-01-19 19:42:38.737319	t	t	Foreman	ReportTemplate	\N	Miscellaneous	\N	\N	\N	\N	f	\N
163	Module Action - Script Default	<%\n  supported_families = ['Redhat']\n  render_error(N_('Unsupported or no operating system found for this host.')) unless @host.operatingsystem && supported_families.include?(@host.operatingsystem.family)\n-%>\n#!/bin/bash\n\n# Helper function that exits with a particular message and code.\n#\n# Usage:\n#   exit_with_message "Could not do a thing" 2\n#\nfunction exit_with_message {\n  echo "${1}, exiting..."\n  exit $2\n}\n\n<% unless input("pre_script").blank? -%>\n  # Pre Script\n  <%= input("pre_script") %>\n  RETVAL=$?\n  [ $RETVAL -eq 0 ] || exit_with_message "Pre script failed" $RETVAL\n<% end -%>\n\n# Action\ndnf -y module <%= input("action") %> <%= input("module_spec") %> <%= input("options") %>\nRETVAL=$?\n[ $RETVAL -eq 0 ] || exit_with_message " module action failed" $RETVAL\n\n<% unless input("post_script").blank? -%>\n  # Post Script\n  <%= input("post_script") %>\n  RETVAL=$?\n  [ $RETVAL -eq 0 ] || exit_with_message "Post script failed" $RETVAL\n<% end -%>	f	\N	2025-01-19 19:42:39.18792	2025-01-19 19:42:39.18792	t	t	\N	JobTemplate	\N	Modules	script	Module %{action} %{module_spec}	\N	\N	f	\N
164	Package Action - Script Default	<%\n  supported_families = ['Redhat', 'Debian', 'Suse']\n  render_error(N_('Unsupported or no operating system found for this host.')) unless @host.operatingsystem && supported_families.include?(@host.operatingsystem.family)\n  action = input("action")\n\n  if @host.operatingsystem.family == 'Redhat'\n    package_manager = 'yum'\n  elsif @host.operatingsystem.family == 'Debian'\n    package_manager = 'apt'\n  elsif @host.operatingsystem.family == 'Suse'\n    package_manager = 'zypper'\n  end\n-%>\n#!/bin/bash\n\n# Helper function that exits with a particular message and code.\n#\n# Usage:\n#   exit_with_message "Could not do a thing" 2\n#\nexit_with_message () {\n  echo "${1}, exiting..."\n  exit $2\n}\n\n<% if package_manager == 'zypper' -%>\nhandle_zypp_res_codes () {\n  RETVAL=$1\n  ACTION=$2\n\n  # See https://github.com/openSUSE/zypper/blob/master/src/main.h\n  declare -A ZYPP_RES_CODES\n  ZYPP_RES_CODES[100]='Updates are needed'\n  ZYPP_RES_CODES[101]='Security updates are needed'\n  ZYPP_RES_CODES[102]='Reboot needed after install/upgrade'\n  ZYPP_RES_CODES[103]='Restart of package manager itself needed'\n  ZYPP_RES_CODES[104]='given capability not found'\n  ZYPP_RES_CODES[105]='SIGINT or SIGTERM received'\n  ZYPP_RES_CODES[106]='Some repos have been skipped due to refresh errors'\n  ZYPP_RES_CODES[107]='Some rpm %post configuration script failed'\n\n  if [ "${ZYPP_RES_CODES[$RETVAL]}" != "" ]; then\n    echo ${ZYPP_RES_CODES[$RETVAL]}\n  fi\n  if [[ $RETVAL -ge 100 && $RETVAL -le 103 ]]; then\n    RETVAL=0\n  elif [ "$ACTION" = "remove" ] && [ "$RETVAL" -eq 104 ]; then\n    RETVAL=0\n  fi\n\n  return $RETVAL\n}\n<% end -%>\n\n<% unless input("pre_script").blank? -%>\n  # Pre Script\n  <%= input("pre_script") %>\n  RETVAL=$?\n  [ $RETVAL -eq 0 ] || exit_with_message "Pre script failed" $RETVAL\n<% end -%>\n\n<% if input("refresh_subscription") == "true" -%>\n  [ -x "$(command -v subscription-manager)" ] && subscription-manager refresh\n<% end -%>\n\n# Action\n<% if package_manager == 'yum' -%>\n  yum -y <%= input("options") %> <%= action %> <%= input("package") %>\n<% elsif package_manager == 'apt' -%>\n  <%-\n    action = 'install' if action == 'group install'\n    action = 'remove' if action == 'group remove'\n    if action == 'group update' || action == 'update'\n      if input('package').blank?\n        action = 'upgrade'\n      else\n        action = '--only-upgrade install'\n      end\n    end\n  -%>\n  run_cmd()\n  {\n    LANG=C apt-get -o APT::Get::Upgrade-Allow-New="true" -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y <%= input("options") %> <%= action %> <%= input("package") %> 2>&1\n  }\n  export DEBIAN_FRONTEND=noninteractive\n  apt-get -y update\n  if [ "<%= action %>" = "remove" ]; then\n    OUTFILE=$(mktemp)\n    trap "rm -f $OUTFILE" EXIT\n    run_cmd > $OUTFILE\n    RETVAL=$?\n    cat $OUTFILE\n    if grep -q "Unable to locate" $OUTFILE; then\n      RETVAL=0\n    fi\n  else\n    run_cmd\n    RETVAL=$?\n  fi\n  setReturnValue() { RETVAL=$1; return $RETVAL; }\n  setReturnValue $RETVAL\n<% elsif package_manager == 'zypper' -%>\n  <%-\n    if action == "group install"\n      action = "install -t pattern"\n    elsif action == "group remove"\n      action = "remove -t pattern"\n    end\n  -%>\n  zypper refresh\n  zypper -n <%= action %> <%= input("options") %> <%= input("package") %>\n  handle_zypp_res_codes $? "<%= action %>"\n<% end -%>\nRETVAL=$?\n[ $RETVAL -eq 0 ] || exit_with_message "Package action failed" $RETVAL\n\n<% unless input("post_script").blank? -%>\n  # Post Script\n  <%= input("post_script") %>\n  RETVAL=$?\n  [ $RETVAL -eq 0 ] || exit_with_message "Post script failed" $RETVAL\n<% end -%>	f	\N	2025-01-19 19:42:39.19997	2025-01-19 19:42:39.19997	t	t	\N	JobTemplate	\N	Packages	script	%{action} package(s) %{package}	\N	\N	f	\N
165	Power Action - Script Default	PATH="$PATH:/usr/sbin:/sbin"\n\necho <%= input('action') %> host && sleep 3\n<%= case input('action')\n      when 'restart'\n        'shutdown -r +1'\n      else\n        'shutdown -h now'\n      end %>	f	\N	2025-01-19 19:42:39.209796	2025-01-19 19:42:39.209796	t	t	\N	JobTemplate	\N	Power	script	%{action} host	\N	\N	f	\N
166	Puppet Agent Disable - Script Default	<% if @host.operatingsystem.family == 'Debian' -%>\nexport PATH=/opt/puppetlabs/bin:$PATH\n<% end -%>\npuppet agent --disable "<%= input("comment").present? ? input("comment") : "Disabled using Foreman Remote Execution"  %> - <%= current_user %> - $(date "+%d/%m/%Y %H:%M")"	f	\N	2025-01-19 19:42:39.217626	2025-01-19 19:42:39.217626	t	t	\N	JobTemplate	\N	Puppet	script	Disable Puppet agent	\N	\N	f	\N
167	Puppet Agent Enable - Script Default	<% if @host.operatingsystem.family == 'Debian' -%>\nexport PATH=/opt/puppetlabs/bin:$PATH\n<% end -%>\npuppet agent --enable	f	\N	2025-01-19 19:42:39.224666	2025-01-19 19:42:39.224666	t	t	\N	JobTemplate	\N	Puppet	script	Enable Puppet agent	\N	\N	f	\N
168	Puppet Module - Install from forge - Script Default	<% if @host.operatingsystem.family == 'Debian' -%>\nexport PATH=/opt/puppetlabs/bin:$PATH\n<% end -%>\npuppet module install <%= input('puppet_module') %> <%= "--target-dir #{input('target_dir')}" if input('target_dir').present? %> <%= "--version #{input('version')}" if input('version').present? %> <%= "--force" if input('force') == "true" %> <%= "--ignore-dependencies" if input('ignore_dependencies') == "true" %>	f	\N	2025-01-19 19:42:39.233858	2025-01-19 19:42:39.233858	t	t	\N	JobTemplate	\N	Puppet	script	Install Puppet Module "%{puppet_module}" from forge	\N	\N	f	\N
169	Puppet Module - Install from git - Script Default	git clone <%= input('git_repository') %> <%= input('target_dir') %>	f	\N	2025-01-19 19:42:39.243576	2025-01-19 19:42:39.243576	t	t	\N	JobTemplate	\N	Puppet	script	Install Puppet Module "%{puppet_module}" from git	\N	\N	f	\N
170	Puppet Run Once - Script Default	if [ -f /etc/profile.d/puppet-agent.sh ]; then\n  . /etc/profile.d/puppet-agent.sh\nfi\npuppet agent --onetime --no-usecacheonfailure --no-daemonize <%= input("puppet_options") %>	f	\N	2025-01-19 19:42:39.254072	2025-01-19 19:42:39.254072	t	t	\N	JobTemplate	\N	Puppet	script	Run Puppet once with "%{puppet_options}"	\N	\N	f	\N
171	Run Command - Script Default	<%= input("command") %>	f	\N	2025-01-19 19:42:39.272967	2025-01-19 19:42:39.272967	t	t	\N	JobTemplate	\N	Commands	script	Run %{command}	\N	\N	f	\N
172	Download and run a script	set -o pipefail && curl -sS '<%= input("url") %>' | bash	f	\N	2025-01-19 19:42:39.284258	2025-01-19 19:42:39.284258	t	t	\N	JobTemplate	\N	Commands	script	Download the script from %{url} and run it locally	\N	\N	f	\N
173	Service Action - Script Default	<% if @host.operatingsystem.family == "Redhat" && @host.operatingsystem.major.to_i > 6 %>\nsystemctl <%= input("action") %> <%= input("service") %>\n<% else %>\n  <% case input("action")\n  when 'enable' %>\nchkconfig --add <%= input("service") %>\n  <% when 'disable' %>\nchkconfig --del <%= input("service") %>\n  <% else %>\nservice <%= input("service") %> <%= input("action") %>\n  <% end %>\n<% end -%>	f	\N	2025-01-19 19:42:39.292672	2025-01-19 19:42:39.292672	t	t	\N	JobTemplate	\N	Services	script	%{action} service %{service}	\N	\N	f	\N
174	Ansible Collection - Install from Galaxy	---\n- hosts: all\n  tasks:\n    - command: ansible-galaxy collection install <%= input('ansible_collections_list').split(",").join(' ') %> -p <%= input('collections_path').present? ? input('collections_path') : '/etc/ansible/collections' %>	f	\N	2025-01-19 19:42:39.30863	2025-01-19 19:42:39.30863	t	t	\N	JobTemplate	\N	Ansible Galaxy	Ansible	Install collections '%{ansible_collections_list}' from Galaxy	\N	\N	f	\N
175	Ansible Roles - Ansible Default	---\n- hosts: all\n  pre_tasks:\n    - name: Display all parameters known for the Foreman host\n      debug:\n        var: foreman\n      tags:\n        - always\n  tasks:\n    - name: Apply roles\n      include_role:\n        name: "{{ role }}"\n      tags:\n        - always\n      loop: "{{ foreman_ansible_roles }}"\n      loop_control:\n        loop_var: role	f	\N	2025-01-19 19:42:39.317389	2025-01-19 19:42:39.317389	t	t	\N	JobTemplate	\N	Ansible Playbook	Ansible	Run Ansible roles	\N	\N	f	\N
176	Ansible Roles - Install from Galaxy	---\n- hosts: all\n  tasks:\n    - command: ansible-galaxy install {{ item }} -p <%= input('location').present? ? input('location') : '/etc/ansible/roles' %>\n      register: out\n      with_items:\n        - <%= input('ansible_roles_list') %>\n    - debug: var=out	f	\N	2025-01-19 19:42:39.326075	2025-01-19 19:42:39.326075	t	t	\N	JobTemplate	\N	Ansible Galaxy	Ansible	Install roles '%{ansible_roles_list}' from Galaxy	\N	\N	f	\N
177	Ansible Roles - Install from git	---\n- hosts: all\n  tasks:\n    - git:\n        repo: "<%= input('git_repository') %>"\n        dest: "<%= input('location') %>"\n      register: out\n\n    - debug: var=out	f	\N	2025-01-19 19:42:39.334671	2025-01-19 19:42:39.334671	t	t	\N	JobTemplate	\N	Ansible Roles Installation	Ansible	Clone roles from git repository to %{location}	\N	\N	f	\N
179	Convert to RHEL	---\n- hosts: all\n  environment:\n    CONVERT2RHEL_THROUGH_FOREMAN: 1\n  tasks:\n    - name: Install convert2rhel\n      ansible.builtin.package:\n        name: convert2rhel\n        state: present\n\n    - name: Gather package facts\n      package_facts:\n        manager: auto\n\n    - name: Set fact for package version\n      set_fact:\n        convert2rhel_version: "{{ ansible_facts.packages['convert2rhel'][0].version }}"\n      when: "'convert2rhel' in ansible_facts.packages"\n      no_log: true\n\n    - name: Prepopulate katello-ca-consumer\n      get_url:\n        url: <%= subscription_manager_configuration_url(@host) %>\n        dest: /usr/share/convert2rhel/subscription-manager/katello-ca-consumer-latest.noarch.rpm\n      when:\n        - "convert2rhel_version is version('2.0.0', '<')"\n\n    - name: Start convert2rhel\n      command: convert2rhel -y --activationkey "<%= input_resource('Activation Key').name %>" --org "<%= @host.organization.label %>"\n\n<%- if input('Restart') == "yes" -%>\n    - name: Reboot the machine\n      reboot:\n        reboot_timeout: 1800\n<%- end -%>\n<%- # This will update system facts in Satellite and link the correct OS of the host %->\n    - name: Update system facts\n      command: subscription-manager facts --update	f	\N	2025-01-19 19:42:39.358834	2025-01-19 19:42:39.358834	t	t	\N	JobTemplate	\N	Convert 2 RHEL	Ansible	\N	\N	\N	f	\N
180	Download and execute a script	---\n- hosts: all\n  tasks:\n    - uri:\n        url: <%= input("url") %>\n        return_content: true\n      register: script_response\n    - shell:\n        cmd: |\n          {{script_response.content}}\n      register: out\n    - debug: var=out	f	\N	2025-01-19 19:42:39.366871	2025-01-19 19:42:39.366871	t	t	\N	JobTemplate	\N	Ansible Commands	Ansible	Download script from %{url} and execute it	\N	\N	f	\N
181	Module Action - Ansible Default	<% command = "dnf -y module #{input(:action)} #{input(:module_spec)} #{input(:options)}" %>\n\n---\n- hosts: all\n  <%- if input('pre_script').present? -%>\n  pre_tasks:\n    - shell: "<%= input('pre_script') %>"\n  <%- end -%>\n  tasks:\n    - shell: |\n<%=     indent(8) { command } %>\n      register: out\n      args:\n        warn: false\n    - debug: var=out\n  <%- if input('post_script').present? -%>\n  post_tasks:\n    - shell: "<%= input('post_script') %>"\n  <%- end -%>	f	\N	2025-01-19 19:42:39.376515	2025-01-19 19:42:39.376515	t	t	\N	JobTemplate	\N	Ansible Modules	Ansible	Module %{action} %{module_spec}	\N	\N	f	\N
182	Package Action - Ansible Default	# For Windows targets use the win_package module instead.\n---\n- hosts: all\n  <%- if input('pre_script').present? -%>\n  pre_tasks:\n    - shell: "<%= input('pre_script') %>"\n  <%- end -%>\n  tasks:\n    - package:\n<%= indent(8) { to_yaml({"name" => input('name')}).gsub(/---\\n/, '') } -%>\n        state: <%= input('state') %>\n  <%- if input('post_script').present? -%>\n  post_tasks:\n    - shell: "<%= input('post_script') %>"\n  <%- end -%>	f	\N	2025-01-19 19:42:39.387183	2025-01-19 19:42:39.387183	t	t	\N	JobTemplate	\N	Ansible Packages	Ansible	Package %{name}: %{state}	\N	\N	f	\N
183	Power Action - Ansible Default	---\n- hosts: all\n  tasks:\n    - shell: |\n        echo <%= input('action') %> host && sleep 3\n        <%= case input('action')\n          when 'restart'\n            'shutdown -r +1'\n          else\n            'shutdown -h +1'\n          end %>	f	\N	2025-01-19 19:42:39.395905	2025-01-19 19:42:39.395905	t	t	\N	JobTemplate	\N	Ansible Power	Ansible	%{action} host	\N	\N	f	\N
184	Puppet Run Once - Ansible Default	---\n- hosts: all\n  tasks:\n    - command: |\n        puppet agent --onetime --no-usecacheonfailure --no-daemonize <%= input("puppet_options") -%>\n<% if @host.operatingsystem.family == 'Debian' -%>\n      environment:\n        PATH: "/opt/puppetlabs/bin:{{ (ansible_env|default({})).PATH|default('') }}"\n<% end -%>	f	\N	2025-01-19 19:42:39.403424	2025-01-19 19:42:39.403424	t	t	\N	JobTemplate	\N	Ansible Puppet	Ansible	Run Puppet once with "%{puppet_options}"	\N	\N	f	\N
185	Run Command - Ansible Default	---\n- hosts: all\n  tasks:\n    - shell:\n        cmd: |\n<%=       indent(10) { input('command') } %>\n      register: out\n    - debug: var=out	f	\N	2025-01-19 19:42:39.410913	2025-01-19 19:42:39.410913	t	t	\N	JobTemplate	\N	Ansible Commands	Ansible	Run %{command}	\N	\N	f	\N
186	Run OpenSCAP scans - Ansible Default	<% raise "Create and assign a policy to this host before proceeding" if @host.policies_enc_raw.empty? -%>\n---\n- hosts: all\n  tasks:\n<% @host.policies_enc_raw.each do |policy| -%>\n    - shell: /usr/bin/foreman_scap_client <%= policy['id'] %>\n      register: out\n    - debug: var=out\n<% end -%>	f	\N	2025-01-19 19:42:39.417709	2025-01-19 19:42:39.417709	t	t	\N	JobTemplate	\N	OpenSCAP Ansible Commands	Ansible	Run scan for all OpenSCAP policies on given hosts	\N	\N	f	\N
187	Ansible - Run playbook	<%= input('playbook') %>	f	\N	2025-01-19 19:42:39.425589	2025-01-19 19:42:39.425589	t	t	\N	JobTemplate	\N	Ansible Playbook	Ansible	\N	\N	\N	f	\N
188	Service Action - Ansible Default	# For Windows targets, we should use win_service\n---\n- hosts: all\n  tasks:\n  - service:\n      name: <%= input('name') %>\n      state: <%= input('state') %>\n      <%= "enabled: #{input('enabled')}" if input('enabled').present? %>\n      <%= "args: #{input('args')}" if input('args').present? %>\n      <%= "pattern: #{input('pattern')}" if input('pattern').present? %>\n      <%= "sleep: #{input('sleep')}" if input('sleep').present? %>	f	\N	2025-01-19 19:42:39.436974	2025-01-19 19:42:39.436974	t	t	\N	JobTemplate	\N	Ansible Services	Ansible	%{state} service %{name}	\N	\N	f	\N
189	Service Action - Enable Web Console	---\n- hosts: all\n  tasks:\n  - name: ensure cockpit is installed\n    package:\n      name: "cockpit-system"\n      state: present	f	\N	2025-01-19 19:42:39.446828	2025-01-19 19:42:39.446828	t	t	\N	JobTemplate	\N	Ansible Services	Ansible	\N	\N	\N	f	\N
190	Smart Proxy Upgrade Playbook	---\n- hosts: all\n  vars:\n    target_version: "<%= input('target_version').present? ? input('target_version') : product_short_version %>"\n  tasks:\n    - name: Gather the rpm package facts\n      package_facts:\n        manager: auto\n\n    - name: Fail if the target server is a Foreman server\n      fail:\n        msg: "This playbook cannot be executed on a Foreman server. Use only on a Smart Proxy server."\n      when: "'foreman' in ansible_facts.packages"\n\n    - name: Install foreman release gpg key\n      rpm_key:\n        state: present\n        key: http://yum.theforeman.org/releases/{{ target_version }}/RPM-GPG-KEY-foreman\n      when: target_version != "nightly"\n\n    - name: Update foreman repositories\n      package:\n        name: https://yum.theforeman.org/releases/{{ target_version }}/el{{ ansible_distribution_major_version }}/{{ ansible_architecture }}/foreman-release.rpm\n        state: installed\n\n    - name: Clean yum metadata\n      command: yum clean all\n\n    - name: Update all packages\n      package:\n        name: '*'\n        state: latest\n\n    - name: Run the installer\n      shell: foreman-installer	f	\N	2025-01-19 19:42:39.456173	2025-01-19 19:42:39.456173	t	t	\N	JobTemplate	\N	Maintenance Operations	Ansible	%{template_name}	\N	\N	f	\N
191	Ansible Tower - Host in Inventory	<%#\nname: Ansible Tower - Host in Inventory\ndescription: Create/update a host with associated inventory in Ansible Tower.\nsnippet: false\nmodel: WebhookTemplate\n-%>\n<%#\n  Create URL: https://tower/api/v2/hosts\n  Update/Delete URL: https://tower/api/v2/hosts/$HOST_ID\n-%>\n<%=\n  payload({\n    "name": @object.name,\n    "description": "Created via Foreman Webhook",\n    "inventory": @object.host_param('ansible_tower_inventory_id') || 1,\n    "enabled": true,\n    "instance_id": "",\n    "variables": ""\n  }, with_defaults: false)\n-%>\n	f	\N	2025-01-19 19:42:39.525081	2025-01-19 19:42:39.525081	t	t	Foreman	WebhookTemplate	\N	Miscellaneous	\N	\N	\N	Create/update a host with associated inventory in Ansible Tower.	f	\N
192	Empty Payload	<%#\nname: Empty Payload\ndescription: Useful for Shellhooks which only takes arguments via HTTP parameters.\nsnippet: false\nmodel: WebhookTemplate\n-%>\n	f	\N	2025-01-19 19:42:39.532682	2025-01-19 19:42:39.532682	t	t	Foreman	WebhookTemplate	\N	Miscellaneous	\N	\N	\N	Useful for Shellhooks which only takes arguments via HTTP parameters.	f	\N
193	Katello Content View	<%#\nname: Katello Content View\ndescription: Example payload for actions.katello.content_view_*.event.foreman\nsnippet: false\nmodel: WebhookTemplate\n-%>\n#\n# Example webhook template, @object carries Action instance.\n# For more information about available helpers visit /templates_doc\n#\n# Content view id <%= @object.id %>\n# Content view name <%= @object.name %>\n# Content view label <%= @object.label %>\n# Organization id <%= @object.organization.id %>\n# Organization name <%= @object.organization.name %>\n# Organization label <%= @object.organization.label %>\n	f	\N	2025-01-19 19:42:39.54006	2025-01-19 19:42:39.54006	t	t	Foreman	WebhookTemplate	\N	Miscellaneous	\N	\N	\N	Example payload for actions.katello.content_view_*.event.foreman	f	\N
194	Katello Promote	<%#\nname: Katello Promote\ndescription: Example payload for actions.katello.content_view.promote_suceeded.event.foreman\nsnippet: false\nmodel: WebhookTemplate\n-%>\n#\n# Example webhook template, @object carries Action instance.\n# For more information about available helpers visit /templates_doc\n#\n# Environments <%= @object.environments %>\n# Content view ID <%= @object.content_view_id %>\n# Content view name <%= @object.content_view_name %>\n# Content view label <%= @object.content_view_label %>\n# Organization id <%= @object.organization_id %>\n# Organization name <%= @object.organization_name %>\n# Organization label <%= @object.organization_label %>\n# Task label <%= @object.task.label %>\n# Task started at <%= @object.task.started_at %>\n# Task ended at <%= @object.task.ended_at %>\n# Task resulted with <%= @object.task.result %>\n# Task state <%= @object.task.state %>\n	f	\N	2025-01-19 19:42:39.547501	2025-01-19 19:42:39.547501	t	t	Foreman	WebhookTemplate	\N	Miscellaneous	\N	\N	\N	Example payload for actions.katello.content_view.promote_suceeded.event.foreman	f	\N
195	Katello Publish	<%#\nname: Katello Publish\ndescription: Example payload for actions.katello.content_view.publish_suceeded.event.foreman\nsnippet: false\nmodel: WebhookTemplate\n-%>\n#\n# Example webhook template, @object carries Action instance.\n# For more information about available helpers visit /templates_doc\n#\n# Content view version id <%= @object.content_view_version_id %>\n# Content view version name <%= @object.content_view_version_name %>\n# Content view id <%= @object.content_view_id %>\n# Content view name <%= @object.content_view_name %>\n# Content view label <%= @object.content_view_label %>\n# Organization id <%= @object.organization_id %>\n# Organization name <%= @object.organization_name %>\n# Organization label <%= @object.organization_label %>\n# Task label <%= @object.task.label %>\n# Task started at <%= @object.task.started_at %>\n# Task ended at <%= @object.task.ended_at %>\n# Task resulted with <%= @object.task.result %>\n# Task state <%= @object.task.state %>\n	f	\N	2025-01-19 19:42:39.55485	2025-01-19 19:42:39.55485	t	t	Foreman	WebhookTemplate	\N	Miscellaneous	\N	\N	\N	Example payload for actions.katello.content_view.publish_suceeded.event.foreman	f	\N
196	Katello Sync	<%#\nname: Katello Sync\ndescription: Example payload for actions.katello.repository.sync_succeeded.event.foreman\nsnippet: false\nmodel: WebhookTemplate\n-%>\n#\n# Example webhook template, @object carries Action instance.\n# For more information about available helpers visit /templates_doc\n#\n# Repository id <%= @object.repository_id %>\n# Repository name <%= @object.repository_name %>\n# Repository label <%= @object.repository_label %>\n# Repository contents_changed <%= @object.contents_changed %>\n# Repository sync_result <%= @object.sync_result %>\n# Product id <%= @object.product_id %>\n# Product name <%= @object.product_name %>\n# Product label <%= @object.product_label %>\n# Organization id <%= @object.organization_id %>\n# Organization name <%= @object.organization_name %>\n# Organization label <%= @object.organization_label %>\n# Task label <%= @object.task.label %>\n# Task started at <%= @object.task.started_at %>\n# Task ended at <%= @object.task.ended_at %>\n# Task resulted with <%= @object.task.result %>\n# Task state <%= @object.task.state %>\n	f	\N	2025-01-19 19:42:39.562214	2025-01-19 19:42:39.562214	t	t	Foreman	WebhookTemplate	\N	Miscellaneous	\N	\N	\N	Example payload for actions.katello.repository.sync_succeeded.event.foreman	f	\N
197	Remote Execution Host Job	<%#\nname: Remote Execution Host Job\ndescription: Example payload for actions.remote_execution.run_host_job_succeeded.event.foreman\nsnippet: false\nmodel: WebhookTemplate\n-%>\n#\n# Example webhook template, @object carries Action instance.\n# For more information about available helpers visit /templates_doc\n#\n# Run job host name <%= @object.host_name %>\n# Run job host id <%= @object.host_id %>\n# Run job full host object <%= @object.host %>\n# Run job job_invocation_id <%= @object.job_invocation_id %>\n# Run job job_invocation <%= @object.job_invocation %>\n# Task label <%= @object.task.label %>\n# Task started at <%= @object.task.started_at %>\n# Task ended at <%= @object.task.ended_at %>\n# Task resulted with <%= @object.task.result %>\n# Task state <%= @object.task.state %>\n# Task action output <%= @object.task.action_continuous_output %>\n	f	\N	2025-01-19 19:42:39.569555	2025-01-19 19:42:39.569555	t	t	Foreman	WebhookTemplate	\N	Miscellaneous	\N	\N	\N	Example payload for actions.remote_execution.run_host_job_succeeded.event.foreman	f	\N
198	Webhook Template - Payload Default	<%#\nname: Webhook Template - Payload Default\ndescription: This template is used to define default content of payload for a webhook.\nsnippet: false\nmodel: WebhookTemplate\n-%>\n<%=\npayload({\n  id: @object.id\n})\n-%>\n	f	\N	2025-01-19 19:42:39.576922	2025-01-19 19:42:39.576922	t	t	Foreman	WebhookTemplate	\N	Miscellaneous	\N	\N	\N	This template is used to define default content of payload for a webhook.	f	\N
\.


--
-- TOC entry 4747 (class 0 OID 16983)
-- Dependencies: 305
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.tokens (id, value, expires, host_id, type) FROM stdin;
\.


--
-- TOC entry 4844 (class 0 OID 18490)
-- Dependencies: 402
-- Data for Name: upgrade_tasks; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.upgrade_tasks (id, name, task_name, long_running, always_run, skip_failure, last_run_time, ordering, subject, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4784 (class 0 OID 17684)
-- Dependencies: 342
-- Data for Name: user_mail_notifications; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.user_mail_notifications (id, user_id, mail_notification_id, last_sent, "interval", created_at, updated_at, mail_query) FROM stdin;
1	4	8	\N	Subscribe	2025-01-19 19:42:39.505698	2025-01-19 19:42:39.505698	\N
\.


--
-- TOC entry 4708 (class 0 OID 16710)
-- Dependencies: 266
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.user_roles (id, owner_id, role_id, owner_type) FROM stdin;
1	1	1	User
2	2	1	User
3	3	1	User
4	4	1	User
\.


--
-- TOC entry 4703 (class 0 OID 16674)
-- Dependencies: 261
-- Data for Name: usergroup_members; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.usergroup_members (id, member_type, member_id, usergroup_id) FROM stdin;
\.


--
-- TOC entry 4701 (class 0 OID 16667)
-- Dependencies: 259
-- Data for Name: usergroups; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.usergroups (id, name, created_at, updated_at, admin) FROM stdin;
\.


--
-- TOC entry 4693 (class 0 OID 16626)
-- Dependencies: 251
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.users (id, login, firstname, lastname, mail, admin, last_login_on, auth_source_id, created_at, updated_at, password_hash, password_salt, locale, avatar_hash, default_organization_id, default_location_id, lower_login, mail_enabled, timezone, description, disabled) FROM stdin;
1	foreman_admin	Anonymous	Admin	\N	t	\N	2	2025-01-19 19:42:36.204519	2025-01-19 19:42:36.204519	\N	\N	\N	\N	1	2	foreman_admin	f	\N	\N	f
2	foreman_console_admin	Console	Admin	\N	t	\N	2	2025-01-19 19:42:36.260548	2025-01-19 19:42:36.260548	\N	\N	\N	\N	1	2	foreman_console_admin	f	\N	\N	f
3	foreman_api_admin	API	Admin	\N	t	\N	2	2025-01-19 19:42:36.279696	2025-01-19 19:42:36.279696	\N	\N	\N	\N	1	2	foreman_api_admin	f	\N	\N	f
4	admin	Admin	User	root@dens.local	t	\N	1	2025-01-19 19:42:36.400834	2025-01-19 19:42:36.400834	$2a$10$G/RXKLY9UffMDEiS/rCKGORSdR0h6myIPs0cLwtb.U9JuiH684UQS	$2a$10$G/RXKLY9UffMDEiS/rCKGO	\N	\N	1	2	admin	f	\N	\N	f
\.


--
-- TOC entry 4855 (class 0 OID 18593)
-- Dependencies: 413
-- Data for Name: webhooks; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.webhooks (id, name, target_url, events, created_at, updated_at, webhook_template_id, http_method, http_content_type, enabled, verify_ssl, ssl_ca_certs, "user", password, http_headers, proxy_authorization) FROM stdin;
\.


--
-- TOC entry 4780 (class 0 OID 17659)
-- Dependencies: 338
-- Data for Name: widgets; Type: TABLE DATA; Schema: public; Owner: foreman
--

COPY public.widgets (id, user_id, template, name, data, sizex, sizey, col, "row", created_at, updated_at) FROM stdin;
1	1	status_widget	Host Configuration Status for All	---\n:settings:\n  :origin: All\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.22476	2025-01-19 19:42:36.22476
2	1	status_chart_widget	Host Configuration Chart for All	---\n:settings:\n  :origin: All\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.225808	2025-01-19 19:42:36.225808
3	1	status_widget	Host Configuration Status for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.226635	2025-01-19 19:42:36.226635
4	1	status_chart_widget	Host Configuration Chart for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.227469	2025-01-19 19:42:36.227469
5	1	status_widget	Host Configuration Status for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.228267	2025-01-19 19:42:36.228267
6	1	status_chart_widget	Host Configuration Chart for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.229051	2025-01-19 19:42:36.229051
7	1	distribution_widget	Run Distribution Chart for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: run-distribution-chart\n	6	1	1	1	2025-01-19 19:42:36.22989	2025-01-19 19:42:36.22989
8	1	distribution_widget	Run Distribution Chart for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: run-distribution-chart\n	6	1	1	1	2025-01-19 19:42:36.230707	2025-01-19 19:42:36.230707
9	1	reports_widget	Latest Events	--- {}\n	6	1	1	1	2025-01-19 19:42:36.231397	2025-01-19 19:42:36.231397
10	1	new_hosts_widget	New Hosts	--- {}\n	8	1	1	1	2025-01-19 19:42:36.23215	2025-01-19 19:42:36.23215
11	1	hosts_in_build_mode_widget	Hosts in build mode	--- {}\n	8	1	1	1	2025-01-19 19:42:36.232843	2025-01-19 19:42:36.232843
12	1	foreman_tasks/tasks/dashboard/tasks_status	Task Status	--- {}\n	6	1	1	1	2025-01-19 19:42:36.233525	2025-01-19 19:42:36.233525
13	1	foreman_tasks/tasks/dashboard/latest_tasks_in_error_warning	Latest Warning/Error Tasks	--- {}\n	6	1	1	1	2025-01-19 19:42:36.234253	2025-01-19 19:42:36.234253
14	1	discovery_widget	Discovered Hosts	--- {}\n	6	1	1	1	2025-01-19 19:42:36.234948	2025-01-19 19:42:36.234948
15	1	dashboard/latest-jobs	Latest Jobs	--- {}\n	6	1	1	1	2025-01-19 19:42:36.235633	2025-01-19 19:42:36.235633
16	2	status_widget	Host Configuration Status for All	---\n:settings:\n  :origin: All\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.263503	2025-01-19 19:42:36.263503
17	2	status_chart_widget	Host Configuration Chart for All	---\n:settings:\n  :origin: All\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.264369	2025-01-19 19:42:36.264369
18	2	status_widget	Host Configuration Status for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.265163	2025-01-19 19:42:36.265163
19	2	status_chart_widget	Host Configuration Chart for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.266	2025-01-19 19:42:36.266
20	2	status_widget	Host Configuration Status for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.266798	2025-01-19 19:42:36.266798
21	2	status_chart_widget	Host Configuration Chart for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.26759	2025-01-19 19:42:36.26759
22	2	distribution_widget	Run Distribution Chart for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: run-distribution-chart\n	6	1	1	1	2025-01-19 19:42:36.268434	2025-01-19 19:42:36.268434
23	2	distribution_widget	Run Distribution Chart for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: run-distribution-chart\n	6	1	1	1	2025-01-19 19:42:36.269276	2025-01-19 19:42:36.269276
24	2	reports_widget	Latest Events	--- {}\n	6	1	1	1	2025-01-19 19:42:36.269956	2025-01-19 19:42:36.269956
25	2	new_hosts_widget	New Hosts	--- {}\n	8	1	1	1	2025-01-19 19:42:36.270759	2025-01-19 19:42:36.270759
26	2	hosts_in_build_mode_widget	Hosts in build mode	--- {}\n	8	1	1	1	2025-01-19 19:42:36.271441	2025-01-19 19:42:36.271441
27	2	foreman_tasks/tasks/dashboard/tasks_status	Task Status	--- {}\n	6	1	1	1	2025-01-19 19:42:36.272118	2025-01-19 19:42:36.272118
28	2	foreman_tasks/tasks/dashboard/latest_tasks_in_error_warning	Latest Warning/Error Tasks	--- {}\n	6	1	1	1	2025-01-19 19:42:36.272883	2025-01-19 19:42:36.272883
29	2	discovery_widget	Discovered Hosts	--- {}\n	6	1	1	1	2025-01-19 19:42:36.273561	2025-01-19 19:42:36.273561
30	2	dashboard/latest-jobs	Latest Jobs	--- {}\n	6	1	1	1	2025-01-19 19:42:36.274345	2025-01-19 19:42:36.274345
31	3	status_widget	Host Configuration Status for All	---\n:settings:\n  :origin: All\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.282694	2025-01-19 19:42:36.282694
32	3	status_chart_widget	Host Configuration Chart for All	---\n:settings:\n  :origin: All\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.283528	2025-01-19 19:42:36.283528
33	3	status_widget	Host Configuration Status for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.284315	2025-01-19 19:42:36.284315
34	3	status_chart_widget	Host Configuration Chart for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.285185	2025-01-19 19:42:36.285185
35	3	status_widget	Host Configuration Status for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.285962	2025-01-19 19:42:36.285962
36	3	status_chart_widget	Host Configuration Chart for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.286788	2025-01-19 19:42:36.286788
37	3	distribution_widget	Run Distribution Chart for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: run-distribution-chart\n	6	1	1	1	2025-01-19 19:42:36.287709	2025-01-19 19:42:36.287709
38	3	distribution_widget	Run Distribution Chart for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: run-distribution-chart\n	6	1	1	1	2025-01-19 19:42:36.288493	2025-01-19 19:42:36.288493
39	3	reports_widget	Latest Events	--- {}\n	6	1	1	1	2025-01-19 19:42:36.289199	2025-01-19 19:42:36.289199
40	3	new_hosts_widget	New Hosts	--- {}\n	8	1	1	1	2025-01-19 19:42:36.289891	2025-01-19 19:42:36.289891
41	3	hosts_in_build_mode_widget	Hosts in build mode	--- {}\n	8	1	1	1	2025-01-19 19:42:36.290586	2025-01-19 19:42:36.290586
42	3	foreman_tasks/tasks/dashboard/tasks_status	Task Status	--- {}\n	6	1	1	1	2025-01-19 19:42:36.291368	2025-01-19 19:42:36.291368
43	3	foreman_tasks/tasks/dashboard/latest_tasks_in_error_warning	Latest Warning/Error Tasks	--- {}\n	6	1	1	1	2025-01-19 19:42:36.292052	2025-01-19 19:42:36.292052
44	3	discovery_widget	Discovered Hosts	--- {}\n	6	1	1	1	2025-01-19 19:42:36.292729	2025-01-19 19:42:36.292729
45	3	dashboard/latest-jobs	Latest Jobs	--- {}\n	6	1	1	1	2025-01-19 19:42:36.293441	2025-01-19 19:42:36.293441
46	4	status_widget	Host Configuration Status for All	---\n:settings:\n  :origin: All\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.404898	2025-01-19 19:42:36.404898
47	4	status_chart_widget	Host Configuration Chart for All	---\n:settings:\n  :origin: All\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.405975	2025-01-19 19:42:36.405975
48	4	status_widget	Host Configuration Status for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.406959	2025-01-19 19:42:36.406959
49	4	status_chart_widget	Host Configuration Chart for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.407909	2025-01-19 19:42:36.407909
50	4	status_widget	Host Configuration Status for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: host-configuration-status\n	8	1	1	1	2025-01-19 19:42:36.408707	2025-01-19 19:42:36.408707
51	4	status_chart_widget	Host Configuration Chart for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: host-configuration-chart-widget\n	4	1	1	1	2025-01-19 19:42:36.409632	2025-01-19 19:42:36.409632
52	4	distribution_widget	Run Distribution Chart for Puppet	---\n:settings:\n  :origin: Puppet\n  :class_name: run-distribution-chart\n	6	1	1	1	2025-01-19 19:42:36.41042	2025-01-19 19:42:36.41042
53	4	distribution_widget	Run Distribution Chart for Ansible	---\n:settings:\n  :origin: Ansible\n  :class_name: run-distribution-chart\n	6	1	1	1	2025-01-19 19:42:36.411195	2025-01-19 19:42:36.411195
54	4	reports_widget	Latest Events	--- {}\n	6	1	1	1	2025-01-19 19:42:36.411995	2025-01-19 19:42:36.411995
55	4	new_hosts_widget	New Hosts	--- {}\n	8	1	1	1	2025-01-19 19:42:36.412668	2025-01-19 19:42:36.412668
56	4	hosts_in_build_mode_widget	Hosts in build mode	--- {}\n	8	1	1	1	2025-01-19 19:42:36.413454	2025-01-19 19:42:36.413454
57	4	foreman_tasks/tasks/dashboard/tasks_status	Task Status	--- {}\n	6	1	1	1	2025-01-19 19:42:36.414132	2025-01-19 19:42:36.414132
58	4	foreman_tasks/tasks/dashboard/latest_tasks_in_error_warning	Latest Warning/Error Tasks	--- {}\n	6	1	1	1	2025-01-19 19:42:36.414802	2025-01-19 19:42:36.414802
59	4	discovery_widget	Discovered Hosts	--- {}\n	6	1	1	1	2025-01-19 19:42:36.415548	2025-01-19 19:42:36.415548
60	4	dashboard/latest-jobs	Latest Jobs	--- {}\n	6	1	1	1	2025-01-19 19:42:36.416215	2025-01-19 19:42:36.416215
\.


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 377
-- Name: ansible_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.ansible_roles_id_seq', 1, false);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 219
-- Name: architectures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.architectures_id_seq', 1, true);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 217
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.audits_id_seq', 9, true);


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 245
-- Name: auth_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.auth_sources_id_seq', 3, true);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 287
-- Name: bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.bookmarks_id_seq', 14, true);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 310
-- Name: cached_user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.cached_user_roles_id_seq', 4, true);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 312
-- Name: cached_usergroup_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.cached_usergroup_members_id_seq', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 327
-- Name: compute_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.compute_attributes_id_seq', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 325
-- Name: compute_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.compute_profiles_id_seq', 3, true);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 294
-- Name: compute_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.compute_resources_id_seq', 1, false);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 331
-- Name: config_group_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.config_group_classes_id_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 329
-- Name: config_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.config_groups_id_seq', 1, false);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 345
-- Name: discovery_attribute_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.discovery_attribute_sets_id_seq', 1, false);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 343
-- Name: discovery_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.discovery_rules_id_seq', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 224
-- Name: domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.domains_id_seq', 1, false);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 433
-- Name: dynflow_envelopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.dynflow_envelopes_id_seq', 1, false);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 436
-- Name: dynflow_output_chunks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.dynflow_output_chunks_id_seq', 1, false);


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 234
-- Name: environment_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.environment_classes_id_seq', 1, false);


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 232
-- Name: environments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.environments_id_seq', 1, false);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 335
-- Name: external_usergroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.external_usergroups_id_seq', 1, false);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 213
-- Name: fact_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.fact_names_id_seq', 1, false);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 215
-- Name: fact_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.fact_values_id_seq', 1, false);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 284
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.features_id_seq', 19, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 320
-- Name: filterings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.filterings_id_seq', 428, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 318
-- Name: filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.filters_id_seq', 146, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 373
-- Name: foreign_input_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreign_input_sets_id_seq', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 414
-- Name: foreman_internals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreman_internals_id_seq', 1, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 404
-- Name: foreman_tasks_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreman_tasks_links_id_seq', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 323
-- Name: foreman_tasks_locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreman_tasks_locks_id_seq', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 363
-- Name: foreman_tasks_recurring_logics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreman_tasks_recurring_logics_id_seq', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 397
-- Name: foreman_tasks_remote_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreman_tasks_remote_tasks_id_seq', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 367
-- Name: foreman_tasks_task_group_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreman_tasks_task_group_members_id_seq', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 365
-- Name: foreman_tasks_task_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreman_tasks_task_groups_id_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 369
-- Name: foreman_tasks_triggerings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.foreman_tasks_triggerings_id_seq', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 380
-- Name: host_ansible_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.host_ansible_roles_id_seq', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 291
-- Name: host_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.host_classes_id_seq', 1, false);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 333
-- Name: host_config_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.host_config_groups_id_seq', 1, false);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 420
-- Name: host_facets_infrastructure_facets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.host_facets_infrastructure_facets_id_seq', 1, false);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 410
-- Name: host_facets_reported_data_facets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.host_facets_reported_data_facets_id_seq', 1, false);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 424
-- Name: host_proxy_invocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.host_proxy_invocations_id_seq', 1, false);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 416
-- Name: host_puppet_facets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.host_puppet_facets_id_seq', 1, false);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 347
-- Name: host_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.host_status_id_seq', 1, false);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 382
-- Name: hostgroup_ansible_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.hostgroup_ansible_roles_id_seq', 1, false);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 306
-- Name: hostgroup_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.hostgroup_classes_id_seq', 1, false);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 418
-- Name: hostgroup_puppet_facets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.hostgroup_puppet_facets_id_seq', 1, false);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 247
-- Name: hostgroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.hostgroups_id_seq', 1, false);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 211
-- Name: hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.hosts_id_seq', 1, false);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 393
-- Name: http_proxies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.http_proxies_id_seq', 1, false);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 298
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.images_id_seq', 1, false);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 422
-- Name: invocation_provider_input_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.invocation_provider_input_values_id_seq', 1, false);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 355
-- Name: job_invocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.job_invocations_id_seq', 1, false);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 371
-- Name: job_template_effective_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.job_template_effective_users_id_seq', 1, false);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 395
-- Name: jwt_secrets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.jwt_secrets_id_seq', 1, false);


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 300
-- Name: key_pairs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.key_pairs_id_seq', 1, false);


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 271
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 254
-- Name: lookup_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.lookup_keys_id_seq', 1, false);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 256
-- Name: lookup_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.lookup_values_id_seq', 1, false);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 339
-- Name: mail_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.mail_notifications_id_seq', 9, true);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 222
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.media_id_seq', 15, true);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 267
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 230
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.models_id_seq', 1, false);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 296
-- Name: nics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.nics_id_seq', 1, false);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 383
-- Name: notification_blueprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.notification_blueprints_id_seq', 20, true);


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 387
-- Name: notification_recipients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.notification_recipients_id_seq', 1, false);


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 385
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 228
-- Name: operatingsystems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.operatingsystems_id_seq', 1, false);


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 280
-- Name: os_default_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.os_default_templates_id_seq', 1, false);


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 243
-- Name: parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.parameters_id_seq', 4, true);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 316
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.permissions_id_seq', 231, true);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 391
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 239
-- Name: puppetclasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.puppetclasses_id_seq', 1, false);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 314
-- Name: realms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.realms_id_seq', 1, false);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 408
-- Name: registration_facets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.registration_facets_id_seq', 1, false);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 375
-- Name: remote_execution_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.remote_execution_features_id_seq', 18, true);


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 236
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, false);


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 263
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.roles_id_seq', 11, true);


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 252
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 289
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.settings_id_seq', 5, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 282
-- Name: smart_proxies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.smart_proxies_id_seq', 1, false);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 403
-- Name: smart_proxy_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.smart_proxy_features_id_seq', 1, false);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 269
-- Name: sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.sources_id_seq', 1, false);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 389
-- Name: ssh_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.ssh_keys_id_seq', 1, false);


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 406
-- Name: stored_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.stored_values_id_seq', 1, false);


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 292
-- Name: subnet_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.subnet_domains_id_seq', 1, false);


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 226
-- Name: subnets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.subnets_id_seq', 1, false);


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 399
-- Name: table_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.table_preferences_id_seq', 1, false);


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 361
-- Name: target_remote_execution_proxies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.target_remote_execution_proxies_id_seq', 1, false);


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 353
-- Name: targeting_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.targeting_hosts_id_seq', 1, false);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 351
-- Name: targetings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.targetings_id_seq', 1, false);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 308
-- Name: taxable_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.taxable_taxonomies_id_seq', 440, true);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 302
-- Name: taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.taxonomies_id_seq', 2, true);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 275
-- Name: template_combinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.template_combinations_id_seq', 1, false);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 349
-- Name: template_inputs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.template_inputs_id_seq', 82, true);


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 426
-- Name: template_invocation_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.template_invocation_events_id_seq', 1, false);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 359
-- Name: template_invocation_input_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.template_invocation_input_values_id_seq', 1, false);


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 357
-- Name: template_invocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.template_invocations_id_seq', 1, false);


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 278
-- Name: template_kinds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.template_kinds_id_seq', 16, true);


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 273
-- Name: templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.templates_id_seq', 198, true);


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 304
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.tokens_id_seq', 1, false);


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 401
-- Name: upgrade_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.upgrade_tasks_id_seq', 1, false);


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 341
-- Name: user_mail_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.user_mail_notifications_id_seq', 1, true);


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 265
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 4, true);


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 260
-- Name: usergroup_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.usergroup_members_id_seq', 1, false);


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 258
-- Name: usergroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.usergroups_id_seq', 1, false);


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 250
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 412
-- Name: webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.webhooks_id_seq', 1, false);


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 337
-- Name: widgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foreman
--

SELECT pg_catalog.setval('public.widgets_id_seq', 60, true);


--
-- TOC entry 4265 (class 2606 OID 18114)
-- Name: ansible_roles ansible_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.ansible_roles
    ADD CONSTRAINT ansible_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3973 (class 2606 OID 16399)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 4004 (class 2606 OID 16457)
-- Name: architectures architectures_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.architectures
    ADD CONSTRAINT architectures_pkey PRIMARY KEY (id);


--
-- TOC entry 3997 (class 2606 OID 16445)
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- TOC entry 4043 (class 2606 OID 16587)
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- TOC entry 4110 (class 2606 OID 16834)
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- TOC entry 4146 (class 2606 OID 17422)
-- Name: cached_user_roles cached_user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.cached_user_roles
    ADD CONSTRAINT cached_user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4151 (class 2606 OID 17432)
-- Name: cached_usergroup_members cached_usergroup_members_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.cached_usergroup_members
    ADD CONSTRAINT cached_usergroup_members_pkey PRIMARY KEY (id);


--
-- TOC entry 4187 (class 2606 OID 17535)
-- Name: compute_attributes compute_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.compute_attributes
    ADD CONSTRAINT compute_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 4185 (class 2606 OID 17526)
-- Name: compute_profiles compute_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.compute_profiles
    ADD CONSTRAINT compute_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 4121 (class 2606 OID 16875)
-- Name: compute_resources compute_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.compute_resources
    ADD CONSTRAINT compute_resources_pkey PRIMARY KEY (id);


--
-- TOC entry 4193 (class 2606 OID 17599)
-- Name: config_group_classes config_group_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.config_group_classes
    ADD CONSTRAINT config_group_classes_pkey PRIMARY KEY (id);


--
-- TOC entry 4191 (class 2606 OID 17592)
-- Name: config_groups config_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.config_groups
    ADD CONSTRAINT config_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4210 (class 2606 OID 17727)
-- Name: discovery_attribute_sets discovery_attribute_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.discovery_attribute_sets
    ADD CONSTRAINT discovery_attribute_sets_pkey PRIMARY KEY (id);


--
-- TOC entry 4207 (class 2606 OID 17713)
-- Name: discovery_rules discovery_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.discovery_rules
    ADD CONSTRAINT discovery_rules_pkey PRIMARY KEY (id);


--
-- TOC entry 4008 (class 2606 OID 16479)
-- Name: domains domains_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.domains
    ADD CONSTRAINT domains_pkey PRIMARY KEY (id);


--
-- TOC entry 4362 (class 2606 OID 18867)
-- Name: dynflow_actions dynflow_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_actions
    ADD CONSTRAINT dynflow_actions_pkey PRIMARY KEY (execution_plan_uuid, id);


--
-- TOC entry 4370 (class 2606 OID 18832)
-- Name: dynflow_coordinator_records dynflow_coordinator_records_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_coordinator_records
    ADD CONSTRAINT dynflow_coordinator_records_pkey PRIMARY KEY (id, class);


--
-- TOC entry 4372 (class 2606 OID 18842)
-- Name: dynflow_envelopes dynflow_envelopes_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_envelopes
    ADD CONSTRAINT dynflow_envelopes_pkey PRIMARY KEY (id);


--
-- TOC entry 4358 (class 2606 OID 18857)
-- Name: dynflow_execution_plans dynflow_execution_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_execution_plans
    ADD CONSTRAINT dynflow_execution_plans_pkey PRIMARY KEY (uuid);


--
-- TOC entry 4379 (class 2606 OID 18928)
-- Name: dynflow_output_chunks dynflow_output_chunks_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_output_chunks
    ADD CONSTRAINT dynflow_output_chunks_pkey PRIMARY KEY (id);


--
-- TOC entry 4366 (class 2606 OID 18880)
-- Name: dynflow_steps dynflow_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_steps
    ADD CONSTRAINT dynflow_steps_pkey PRIMARY KEY (execution_plan_uuid, id);


--
-- TOC entry 4025 (class 2606 OID 16519)
-- Name: environment_classes environment_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.environment_classes
    ADD CONSTRAINT environment_classes_pkey PRIMARY KEY (id);


--
-- TOC entry 4023 (class 2606 OID 16512)
-- Name: environments environments_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.environments
    ADD CONSTRAINT environments_pkey PRIMARY KEY (id);


--
-- TOC entry 4197 (class 2606 OID 17613)
-- Name: external_usergroups external_usergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.external_usergroups
    ADD CONSTRAINT external_usergroups_pkey PRIMARY KEY (id);


--
-- TOC entry 3989 (class 2606 OID 16417)
-- Name: fact_names fact_names_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.fact_names
    ADD CONSTRAINT fact_names_pkey PRIMARY KEY (id);


--
-- TOC entry 3993 (class 2606 OID 18271)
-- Name: fact_values fact_values_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.fact_values
    ADD CONSTRAINT fact_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4105 (class 2606 OID 16820)
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- TOC entry 4163 (class 2606 OID 17489)
-- Name: filterings filterings_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.filterings
    ADD CONSTRAINT filterings_pkey PRIMARY KEY (id);


--
-- TOC entry 4161 (class 2606 OID 17482)
-- Name: filters filters_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (id);


--
-- TOC entry 4257 (class 2606 OID 17999)
-- Name: foreign_input_sets foreign_input_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreign_input_sets
    ADD CONSTRAINT foreign_input_sets_pkey PRIMARY KEY (id);


--
-- TOC entry 4330 (class 2606 OID 18611)
-- Name: foreman_internals foreman_internals_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_internals
    ADD CONSTRAINT foreman_internals_pkey PRIMARY KEY (id);


--
-- TOC entry 4312 (class 2606 OID 18544)
-- Name: foreman_tasks_links foreman_tasks_links_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_links
    ADD CONSTRAINT foreman_tasks_links_pkey PRIMARY KEY (id);


--
-- TOC entry 4181 (class 2606 OID 17513)
-- Name: foreman_tasks_locks foreman_tasks_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_locks
    ADD CONSTRAINT foreman_tasks_locks_pkey PRIMARY KEY (id);


--
-- TOC entry 4242 (class 2606 OID 17927)
-- Name: foreman_tasks_recurring_logics foreman_tasks_recurring_logics_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_recurring_logics
    ADD CONSTRAINT foreman_tasks_recurring_logics_pkey PRIMARY KEY (id);


--
-- TOC entry 4303 (class 2606 OID 18383)
-- Name: foreman_tasks_remote_tasks foreman_tasks_remote_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_remote_tasks
    ADD CONSTRAINT foreman_tasks_remote_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 4250 (class 2606 OID 17947)
-- Name: foreman_tasks_task_group_members foreman_tasks_task_group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_task_group_members
    ADD CONSTRAINT foreman_tasks_task_group_members_pkey PRIMARY KEY (id);


--
-- TOC entry 4246 (class 2606 OID 17937)
-- Name: foreman_tasks_task_groups foreman_tasks_task_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_task_groups
    ADD CONSTRAINT foreman_tasks_task_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4252 (class 2606 OID 17966)
-- Name: foreman_tasks_triggerings foreman_tasks_triggerings_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_triggerings
    ADD CONSTRAINT foreman_tasks_triggerings_pkey PRIMARY KEY (id);


--
-- TOC entry 4267 (class 2606 OID 18123)
-- Name: host_ansible_roles host_ansible_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_ansible_roles
    ADD CONSTRAINT host_ansible_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4037 (class 2606 OID 16855)
-- Name: host_classes host_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_classes
    ADD CONSTRAINT host_classes_pkey PRIMARY KEY (id);


--
-- TOC entry 4195 (class 2606 OID 17606)
-- Name: host_config_groups host_config_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_config_groups
    ADD CONSTRAINT host_config_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4342 (class 2606 OID 18698)
-- Name: host_facets_infrastructure_facets host_facets_infrastructure_facets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_facets_infrastructure_facets
    ADD CONSTRAINT host_facets_infrastructure_facets_pkey PRIMARY KEY (id);


--
-- TOC entry 4323 (class 2606 OID 18583)
-- Name: host_facets_reported_data_facets host_facets_reported_data_facets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_facets_reported_data_facets
    ADD CONSTRAINT host_facets_reported_data_facets_pkey PRIMARY KEY (id);


--
-- TOC entry 4349 (class 2606 OID 18735)
-- Name: host_proxy_invocations host_proxy_invocations_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_proxy_invocations
    ADD CONSTRAINT host_proxy_invocations_pkey PRIMARY KEY (id);


--
-- TOC entry 4332 (class 2606 OID 18635)
-- Name: host_puppet_facets host_puppet_facets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_puppet_facets
    ADD CONSTRAINT host_puppet_facets_pkey PRIMARY KEY (id);


--
-- TOC entry 4213 (class 2606 OID 17787)
-- Name: host_status host_status_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_status
    ADD CONSTRAINT host_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4271 (class 2606 OID 18143)
-- Name: hostgroup_ansible_roles hostgroup_ansible_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_ansible_roles
    ADD CONSTRAINT hostgroup_ansible_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4049 (class 2606 OID 16995)
-- Name: hostgroup_classes hostgroup_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_classes
    ADD CONSTRAINT hostgroup_classes_pkey PRIMARY KEY (id);


--
-- TOC entry 4337 (class 2606 OID 18660)
-- Name: hostgroup_puppet_facets hostgroup_puppet_facets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_puppet_facets
    ADD CONSTRAINT hostgroup_puppet_facets_pkey PRIMARY KEY (id);


--
-- TOC entry 4045 (class 2606 OID 16594)
-- Name: hostgroups hostgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_pkey PRIMARY KEY (id);


--
-- TOC entry 3979 (class 2606 OID 16408)
-- Name: hosts hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- TOC entry 4296 (class 2606 OID 18331)
-- Name: http_proxies http_proxies_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.http_proxies
    ADD CONSTRAINT http_proxies_pkey PRIMARY KEY (id);


--
-- TOC entry 4131 (class 2606 OID 16925)
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- TOC entry 4347 (class 2606 OID 18726)
-- Name: invocation_provider_input_values invocation_provider_input_values_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.invocation_provider_input_values
    ADD CONSTRAINT invocation_provider_input_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4226 (class 2606 OID 17858)
-- Name: job_invocations job_invocations_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_invocations
    ADD CONSTRAINT job_invocations_pkey PRIMARY KEY (id);


--
-- TOC entry 4255 (class 2606 OID 17978)
-- Name: job_template_effective_users job_template_effective_users_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_template_effective_users
    ADD CONSTRAINT job_template_effective_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4301 (class 2606 OID 18361)
-- Name: jwt_secrets jwt_secrets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_pkey PRIMARY KEY (id);


--
-- TOC entry 4133 (class 2606 OID 16935)
-- Name: key_pairs key_pairs_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.key_pairs
    ADD CONSTRAINT key_pairs_pkey PRIMARY KEY (id);


--
-- TOC entry 4091 (class 2606 OID 18247)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4063 (class 2606 OID 16654)
-- Name: lookup_keys lookup_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.lookup_keys
    ADD CONSTRAINT lookup_keys_pkey PRIMARY KEY (id);


--
-- TOC entry 4068 (class 2606 OID 16664)
-- Name: lookup_values lookup_values_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.lookup_values
    ADD CONSTRAINT lookup_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4203 (class 2606 OID 17682)
-- Name: mail_notifications mail_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.mail_notifications
    ADD CONSTRAINT mail_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4006 (class 2606 OID 16469)
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- TOC entry 4082 (class 2606 OID 16743)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4021 (class 2606 OID 16505)
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- TOC entry 4127 (class 2606 OID 16884)
-- Name: nics nics_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.nics
    ADD CONSTRAINT nics_pkey PRIMARY KEY (id);


--
-- TOC entry 4276 (class 2606 OID 18163)
-- Name: notification_blueprints notification_blueprints_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notification_blueprints
    ADD CONSTRAINT notification_blueprints_pkey PRIMARY KEY (id);


--
-- TOC entry 4287 (class 2606 OID 18193)
-- Name: notification_recipients notification_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notification_recipients
    ADD CONSTRAINT notification_recipients_pkey PRIMARY KEY (id);


--
-- TOC entry 4282 (class 2606 OID 18173)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4019 (class 2606 OID 16496)
-- Name: operatingsystems operatingsystems_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.operatingsystems
    ADD CONSTRAINT operatingsystems_pkey PRIMARY KEY (id);


--
-- TOC entry 4101 (class 2606 OID 16802)
-- Name: os_default_templates os_default_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.os_default_templates
    ADD CONSTRAINT os_default_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 4041 (class 2606 OID 16574)
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- TOC entry 4159 (class 2606 OID 17472)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4294 (class 2606 OID 18315)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4035 (class 2606 OID 16554)
-- Name: puppetclasses puppetclasses_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.puppetclasses
    ADD CONSTRAINT puppetclasses_pkey PRIMARY KEY (id);


--
-- TOC entry 4156 (class 2606 OID 17446)
-- Name: realms realms_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.realms
    ADD CONSTRAINT realms_pkey PRIMARY KEY (id);


--
-- TOC entry 4321 (class 2606 OID 18567)
-- Name: registration_facets registration_facets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.registration_facets
    ADD CONSTRAINT registration_facets_pkey PRIMARY KEY (id);


--
-- TOC entry 4263 (class 2606 OID 18024)
-- Name: remote_execution_features remote_execution_features_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.remote_execution_features
    ADD CONSTRAINT remote_execution_features_pkey PRIMARY KEY (id);


--
-- TOC entry 4032 (class 2606 OID 18258)
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- TOC entry 4075 (class 2606 OID 16708)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3971 (class 2606 OID 16392)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 4058 (class 2606 OID 18615)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4116 (class 2606 OID 16850)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4103 (class 2606 OID 16811)
-- Name: smart_proxies smart_proxies_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.smart_proxies
    ADD CONSTRAINT smart_proxies_pkey PRIMARY KEY (id);


--
-- TOC entry 4108 (class 2606 OID 18506)
-- Name: smart_proxy_features smart_proxy_features_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.smart_proxy_features
    ADD CONSTRAINT smart_proxy_features_pkey PRIMARY KEY (id);


--
-- TOC entry 4085 (class 2606 OID 16753)
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- TOC entry 4290 (class 2606 OID 18294)
-- Name: ssh_keys ssh_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.ssh_keys
    ADD CONSTRAINT ssh_keys_pkey PRIMARY KEY (id);


--
-- TOC entry 4317 (class 2606 OID 18557)
-- Name: stored_values stored_values_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.stored_values
    ADD CONSTRAINT stored_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4119 (class 2606 OID 16866)
-- Name: subnet_domains subnet_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnet_domains
    ADD CONSTRAINT subnet_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 4014 (class 2606 OID 16488)
-- Name: subnets subnets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnets
    ADD CONSTRAINT subnets_pkey PRIMARY KEY (id);


--
-- TOC entry 4307 (class 2606 OID 18393)
-- Name: table_preferences table_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.table_preferences
    ADD CONSTRAINT table_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 4238 (class 2606 OID 17914)
-- Name: target_remote_execution_proxies target_remote_execution_proxies_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.target_remote_execution_proxies
    ADD CONSTRAINT target_remote_execution_proxies_pkey PRIMARY KEY (id);


--
-- TOC entry 4224 (class 2606 OID 17840)
-- Name: targeting_hosts targeting_hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.targeting_hosts
    ADD CONSTRAINT targeting_hosts_pkey PRIMARY KEY (id);


--
-- TOC entry 4220 (class 2606 OID 17821)
-- Name: targetings targetings_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.targetings
    ADD CONSTRAINT targetings_pkey PRIMARY KEY (id);


--
-- TOC entry 4144 (class 2606 OID 17011)
-- Name: taxable_taxonomies taxable_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.taxable_taxonomies
    ADD CONSTRAINT taxable_taxonomies_pkey PRIMARY KEY (id);


--
-- TOC entry 4136 (class 2606 OID 16949)
-- Name: taxonomies taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.taxonomies
    ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);


--
-- TOC entry 4097 (class 2606 OID 16780)
-- Name: template_combinations template_combinations_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_combinations
    ADD CONSTRAINT template_combinations_pkey PRIMARY KEY (id);


--
-- TOC entry 4217 (class 2606 OID 17804)
-- Name: template_inputs template_inputs_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_inputs
    ADD CONSTRAINT template_inputs_pkey PRIMARY KEY (id);


--
-- TOC entry 4355 (class 2606 OID 18751)
-- Name: template_invocation_events template_invocation_events_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocation_events
    ADD CONSTRAINT template_invocation_events_pkey PRIMARY KEY (id);


--
-- TOC entry 4235 (class 2606 OID 17889)
-- Name: template_invocation_input_values template_invocation_input_values_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocation_input_values
    ADD CONSTRAINT template_invocation_input_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4232 (class 2606 OID 17871)
-- Name: template_invocations template_invocations_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocations
    ADD CONSTRAINT template_invocations_pkey PRIMARY KEY (id);


--
-- TOC entry 4099 (class 2606 OID 16795)
-- Name: template_kinds template_kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_kinds
    ADD CONSTRAINT template_kinds_pkey PRIMARY KEY (id);


--
-- TOC entry 4095 (class 2606 OID 16773)
-- Name: templates templates_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);


--
-- TOC entry 4140 (class 2606 OID 16988)
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4310 (class 2606 OID 18501)
-- Name: upgrade_tasks upgrade_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.upgrade_tasks
    ADD CONSTRAINT upgrade_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 4205 (class 2606 OID 17689)
-- Name: user_mail_notifications user_mail_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.user_mail_notifications
    ADD CONSTRAINT user_mail_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4079 (class 2606 OID 16715)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4072 (class 2606 OID 16681)
-- Name: usergroup_members usergroup_members_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.usergroup_members
    ADD CONSTRAINT usergroup_members_pkey PRIMARY KEY (id);


--
-- TOC entry 4070 (class 2606 OID 16672)
-- Name: usergroups usergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_pkey PRIMARY KEY (id);


--
-- TOC entry 4054 (class 2606 OID 16633)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4328 (class 2606 OID 18600)
-- Name: webhooks webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 4201 (class 2606 OID 17671)
-- Name: widgets widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);


--
-- TOC entry 4359 (class 1259 OID 18825)
-- Name: dynflow_actions_caller_execution_plan_id_caller_action_id_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_actions_caller_execution_plan_id_caller_action_id_index ON public.dynflow_actions USING btree (caller_execution_plan_id, caller_action_id);


--
-- TOC entry 4360 (class 1259 OID 18868)
-- Name: dynflow_actions_execution_plan_uuid_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_actions_execution_plan_uuid_index ON public.dynflow_actions USING btree (execution_plan_uuid);


--
-- TOC entry 4367 (class 1259 OID 18833)
-- Name: dynflow_coordinator_records_class_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_coordinator_records_class_index ON public.dynflow_coordinator_records USING btree (class);


--
-- TOC entry 4368 (class 1259 OID 18834)
-- Name: dynflow_coordinator_records_owner_id_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_coordinator_records_owner_id_index ON public.dynflow_coordinator_records USING btree (owner_id);


--
-- TOC entry 4373 (class 1259 OID 18843)
-- Name: dynflow_envelopes_receiver_id_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_envelopes_receiver_id_index ON public.dynflow_envelopes USING btree (receiver_id);


--
-- TOC entry 4376 (class 1259 OID 18940)
-- Name: dynflow_output_chunks_execution_plan_uuid_action_id_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_output_chunks_execution_plan_uuid_action_id_index ON public.dynflow_output_chunks USING btree (execution_plan_uuid, action_id);


--
-- TOC entry 4377 (class 1259 OID 18939)
-- Name: dynflow_output_chunks_execution_plan_uuid_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_output_chunks_execution_plan_uuid_index ON public.dynflow_output_chunks USING btree (execution_plan_uuid);


--
-- TOC entry 4374 (class 1259 OID 18893)
-- Name: dynflow_scheduled_plans_execution_plan_uuid_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_scheduled_plans_execution_plan_uuid_index ON public.dynflow_delayed_plans USING btree (execution_plan_uuid);


--
-- TOC entry 4375 (class 1259 OID 18855)
-- Name: dynflow_scheduled_plans_start_at_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_scheduled_plans_start_at_index ON public.dynflow_delayed_plans USING btree (start_at);


--
-- TOC entry 4363 (class 1259 OID 18883)
-- Name: dynflow_steps_execution_plan_uuid_action_id_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_steps_execution_plan_uuid_action_id_index ON public.dynflow_steps USING btree (execution_plan_uuid, action_id);


--
-- TOC entry 4364 (class 1259 OID 18881)
-- Name: dynflow_steps_execution_plan_uuid_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX dynflow_steps_execution_plan_uuid_index ON public.dynflow_steps USING btree (execution_plan_uuid);


--
-- TOC entry 4253 (class 1259 OID 17979)
-- Name: effective_users_job_template_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX effective_users_job_template_id ON public.job_template_effective_users USING btree (job_template_id);


--
-- TOC entry 4313 (class 1259 OID 18546)
-- Name: foreman_tasks_links_unique_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX foreman_tasks_links_unique_index ON public.foreman_tasks_links USING btree (task_id, resource_type, resource_id);


--
-- TOC entry 4248 (class 1259 OID 18439)
-- Name: foreman_tasks_task_group_members_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX foreman_tasks_task_group_members_index ON public.foreman_tasks_task_group_members USING btree (task_id, task_group_id);


--
-- TOC entry 3974 (class 1259 OID 16616)
-- Name: host_arch_id_ix; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX host_arch_id_ix ON public.hosts USING btree (architecture_id);


--
-- TOC entry 3975 (class 1259 OID 16619)
-- Name: host_group_id_ix; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX host_group_id_ix ON public.hosts USING btree (hostgroup_id);


--
-- TOC entry 3976 (class 1259 OID 16618)
-- Name: host_medium_id_ix; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX host_medium_id_ix ON public.hosts USING btree (medium_id);


--
-- TOC entry 3977 (class 1259 OID 16617)
-- Name: host_os_id_ix; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX host_os_id_ix ON public.hosts USING btree (operatingsystem_id);


--
-- TOC entry 4345 (class 1259 OID 18727)
-- Name: idx_inv_provider_input_values_on_templ_inv_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX idx_inv_provider_input_values_on_templ_inv_id ON public.invocation_provider_input_values USING btree (template_invocation_id);


--
-- TOC entry 4128 (class 1259 OID 18336)
-- Name: image_name_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX image_name_index ON public.images USING btree (name, compute_resource_id, operatingsystem_id);


--
-- TOC entry 4129 (class 1259 OID 18337)
-- Name: image_uuid_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX image_uuid_index ON public.images USING btree (uuid, compute_resource_id);


--
-- TOC entry 4272 (class 1259 OID 18138)
-- Name: index_ansible_roles_hostgroup_on_hostgroup_id_and_role_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_ansible_roles_hostgroup_on_hostgroup_id_and_role_id ON public.hostgroup_ansible_roles USING btree (hostgroup_id, ansible_role_id);


--
-- TOC entry 4273 (class 1259 OID 18139)
-- Name: index_ansible_roles_hostgroup_on_role_id_and_hostgroup_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_ansible_roles_hostgroup_on_role_id_and_hostgroup_id ON public.hostgroup_ansible_roles USING btree (ansible_role_id, hostgroup_id);


--
-- TOC entry 3998 (class 1259 OID 18516)
-- Name: index_audits_on_associated_type_and_associated_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_audits_on_associated_type_and_associated_id ON public.audits USING btree (associated_type, associated_id);


--
-- TOC entry 3999 (class 1259 OID 18517)
-- Name: index_audits_on_auditable_type_and_auditable_id_and_version; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_audits_on_auditable_type_and_auditable_id_and_version ON public.audits USING btree (auditable_type, auditable_id, version);


--
-- TOC entry 4000 (class 1259 OID 16448)
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_audits_on_created_at ON public.audits USING btree (created_at);


--
-- TOC entry 4001 (class 1259 OID 17639)
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_audits_on_request_uuid ON public.audits USING btree (request_uuid);


--
-- TOC entry 4002 (class 1259 OID 18518)
-- Name: index_audits_on_user_type_and_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_audits_on_user_type_and_user_id ON public.audits USING btree (user_type, user_id);


--
-- TOC entry 4111 (class 1259 OID 16836)
-- Name: index_bookmarks_on_controller; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_bookmarks_on_controller ON public.bookmarks USING btree (controller);


--
-- TOC entry 4112 (class 1259 OID 16835)
-- Name: index_bookmarks_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_bookmarks_on_name ON public.bookmarks USING btree (name);


--
-- TOC entry 4113 (class 1259 OID 18519)
-- Name: index_bookmarks_on_owner_type_and_owner_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_bookmarks_on_owner_type_and_owner_id ON public.bookmarks USING btree (owner_type, owner_id);


--
-- TOC entry 4122 (class 1259 OID 16886)
-- Name: index_by_host; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_by_host ON public.nics USING btree (host_id);


--
-- TOC entry 4123 (class 1259 OID 16887)
-- Name: index_by_type_and_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_by_type_and_id ON public.nics USING btree (type, id);


--
-- TOC entry 4147 (class 1259 OID 17424)
-- Name: index_cached_user_roles_on_role_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_cached_user_roles_on_role_id ON public.cached_user_roles USING btree (role_id);


--
-- TOC entry 4148 (class 1259 OID 17423)
-- Name: index_cached_user_roles_on_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_cached_user_roles_on_user_id ON public.cached_user_roles USING btree (user_id);


--
-- TOC entry 4149 (class 1259 OID 17425)
-- Name: index_cached_user_roles_on_user_role_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_cached_user_roles_on_user_role_id ON public.cached_user_roles USING btree (user_role_id);


--
-- TOC entry 4152 (class 1259 OID 17433)
-- Name: index_cached_usergroup_members_on_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_cached_usergroup_members_on_user_id ON public.cached_usergroup_members USING btree (user_id);


--
-- TOC entry 4153 (class 1259 OID 17434)
-- Name: index_cached_usergroup_members_on_usergroup_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_cached_usergroup_members_on_usergroup_id ON public.cached_usergroup_members USING btree (usergroup_id);


--
-- TOC entry 4188 (class 1259 OID 17536)
-- Name: index_compute_attributes_on_compute_profile_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_compute_attributes_on_compute_profile_id ON public.compute_attributes USING btree (compute_profile_id);


--
-- TOC entry 4189 (class 1259 OID 17537)
-- Name: index_compute_attributes_on_compute_resource_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_compute_attributes_on_compute_resource_id ON public.compute_attributes USING btree (compute_resource_id);


--
-- TOC entry 4211 (class 1259 OID 17728)
-- Name: index_discovery_attribute_sets_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_discovery_attribute_sets_on_host_id ON public.discovery_attribute_sets USING btree (host_id);


--
-- TOC entry 4208 (class 1259 OID 18477)
-- Name: index_discovery_rules_on_priority; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_discovery_rules_on_priority ON public.discovery_rules USING btree (priority);


--
-- TOC entry 4026 (class 1259 OID 18548)
-- Name: index_env_classes_on_lookup_key_and_class; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_env_classes_on_lookup_key_and_class ON public.environment_classes USING btree (puppetclass_lookup_key_id, puppetclass_id);


--
-- TOC entry 4027 (class 1259 OID 18534)
-- Name: index_environment_classes_on_environment_id_and_puppetclass_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_environment_classes_on_environment_id_and_puppetclass_id ON public.environment_classes USING btree (environment_id, puppetclass_id);


--
-- TOC entry 4198 (class 1259 OID 17614)
-- Name: index_external_usergroups_on_usergroup_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_external_usergroups_on_usergroup_id ON public.external_usergroups USING btree (usergroup_id);


--
-- TOC entry 3990 (class 1259 OID 18299)
-- Name: index_fact_names_on_ancestry_and_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_fact_names_on_ancestry_and_name ON public.fact_names USING btree (ancestry, name);


--
-- TOC entry 3991 (class 1259 OID 17408)
-- Name: index_fact_names_on_name_and_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_fact_names_on_name_and_type ON public.fact_names USING btree (name, type);


--
-- TOC entry 3994 (class 1259 OID 17030)
-- Name: index_fact_values_on_fact_name_id_and_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_fact_values_on_fact_name_id_and_host_id ON public.fact_values USING btree (fact_name_id, host_id);


--
-- TOC entry 3995 (class 1259 OID 16429)
-- Name: index_fact_values_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_fact_values_on_host_id ON public.fact_values USING btree (host_id);


--
-- TOC entry 4106 (class 1259 OID 18590)
-- Name: index_features_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_features_on_name ON public.features USING btree (name);


--
-- TOC entry 4164 (class 1259 OID 17490)
-- Name: index_filterings_on_filter_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_filterings_on_filter_id ON public.filterings USING btree (filter_id);


--
-- TOC entry 4165 (class 1259 OID 17491)
-- Name: index_filterings_on_permission_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_filterings_on_permission_id ON public.filterings USING btree (permission_id);


--
-- TOC entry 4258 (class 1259 OID 18006)
-- Name: index_foreign_input_sets_on_target_template_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreign_input_sets_on_target_template_id ON public.foreign_input_sets USING btree (target_template_id);


--
-- TOC entry 4259 (class 1259 OID 18000)
-- Name: index_foreign_input_sets_on_template_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreign_input_sets_on_template_id ON public.foreign_input_sets USING btree (template_id);


--
-- TOC entry 4166 (class 1259 OID 18400)
-- Name: index_foreman_tasks_id_state; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_id_state ON public.foreman_tasks_tasks USING btree (id, state);


--
-- TOC entry 4314 (class 1259 OID 18545)
-- Name: index_foreman_tasks_links_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_links_on_resource_type_and_resource_id ON public.foreman_tasks_links USING btree (resource_type, resource_id);


--
-- TOC entry 4182 (class 1259 OID 18547)
-- Name: index_foreman_tasks_locks_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_foreman_tasks_locks_on_resource_type_and_resource_id ON public.foreman_tasks_locks USING btree (resource_type, resource_id);


--
-- TOC entry 4304 (class 1259 OID 18384)
-- Name: index_foreman_tasks_plan_id_and_step_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_plan_id_and_step_id ON public.foreman_tasks_remote_tasks USING btree (execution_plan_id, step_id);


--
-- TOC entry 4243 (class 1259 OID 18740)
-- Name: index_foreman_tasks_recurring_logics_on_purpose; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_foreman_tasks_recurring_logics_on_purpose ON public.foreman_tasks_recurring_logics USING btree (purpose) WHERE ((state)::text = ANY ((ARRAY['active'::character varying, 'disabled'::character varying])::text[]));


--
-- TOC entry 4244 (class 1259 OID 17928)
-- Name: index_foreman_tasks_recurring_logics_on_task_group_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_recurring_logics_on_task_group_id ON public.foreman_tasks_recurring_logics USING btree (task_group_id);


--
-- TOC entry 4247 (class 1259 OID 17938)
-- Name: index_foreman_tasks_task_groups_on_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_task_groups_on_type ON public.foreman_tasks_task_groups USING btree (type);


--
-- TOC entry 4167 (class 1259 OID 17500)
-- Name: index_foreman_tasks_tasks_on_ended_at; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_ended_at ON public.foreman_tasks_tasks USING btree (ended_at);


--
-- TOC entry 4168 (class 1259 OID 17504)
-- Name: index_foreman_tasks_tasks_on_external_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_external_id ON public.foreman_tasks_tasks USING btree (external_id);


--
-- TOC entry 4169 (class 1259 OID 18401)
-- Name: index_foreman_tasks_tasks_on_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_id ON public.foreman_tasks_tasks USING btree (id);


--
-- TOC entry 4170 (class 1259 OID 17498)
-- Name: index_foreman_tasks_tasks_on_label; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_label ON public.foreman_tasks_tasks USING btree (label);


--
-- TOC entry 4171 (class 1259 OID 18420)
-- Name: index_foreman_tasks_tasks_on_parent_task_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_parent_task_id ON public.foreman_tasks_tasks USING btree (parent_task_id);


--
-- TOC entry 4172 (class 1259 OID 17502)
-- Name: index_foreman_tasks_tasks_on_result; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_result ON public.foreman_tasks_tasks USING btree (result);


--
-- TOC entry 4173 (class 1259 OID 18227)
-- Name: index_foreman_tasks_tasks_on_start_at; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_start_at ON public.foreman_tasks_tasks USING btree (start_at);


--
-- TOC entry 4174 (class 1259 OID 18228)
-- Name: index_foreman_tasks_tasks_on_start_before; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_start_before ON public.foreman_tasks_tasks USING btree (start_before);


--
-- TOC entry 4175 (class 1259 OID 17499)
-- Name: index_foreman_tasks_tasks_on_started_at; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_started_at ON public.foreman_tasks_tasks USING btree (started_at);


--
-- TOC entry 4176 (class 1259 OID 17501)
-- Name: index_foreman_tasks_tasks_on_state; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_state ON public.foreman_tasks_tasks USING btree (state);


--
-- TOC entry 4177 (class 1259 OID 17497)
-- Name: index_foreman_tasks_tasks_on_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_type ON public.foreman_tasks_tasks USING btree (type);


--
-- TOC entry 4178 (class 1259 OID 17907)
-- Name: index_foreman_tasks_tasks_on_type_and_label; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_type_and_label ON public.foreman_tasks_tasks USING btree (type, label);


--
-- TOC entry 4179 (class 1259 OID 18528)
-- Name: index_foreman_tasks_tasks_on_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_foreman_tasks_tasks_on_user_id ON public.foreman_tasks_tasks USING btree (user_id);


--
-- TOC entry 4268 (class 1259 OID 18119)
-- Name: index_host_ansible_roles_on_ansible_role_id_and_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_ansible_roles_on_ansible_role_id_and_host_id ON public.host_ansible_roles USING btree (ansible_role_id, host_id);


--
-- TOC entry 4269 (class 1259 OID 18118)
-- Name: index_host_ansible_roles_on_host_id_and_ansible_role_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_ansible_roles_on_host_id_and_ansible_role_id ON public.host_ansible_roles USING btree (host_id, ansible_role_id);


--
-- TOC entry 4038 (class 1259 OID 18706)
-- Name: index_host_classes_on_host_puppet_facet_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_classes_on_host_puppet_facet_id ON public.host_classes USING btree (host_puppet_facet_id);


--
-- TOC entry 4343 (class 1259 OID 18704)
-- Name: index_host_facets_infrastructure_facets_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_host_facets_infrastructure_facets_on_host_id ON public.host_facets_infrastructure_facets USING btree (host_id);


--
-- TOC entry 4344 (class 1259 OID 18705)
-- Name: index_host_facets_infrastructure_facets_on_smart_proxy_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_facets_infrastructure_facets_on_smart_proxy_id ON public.host_facets_infrastructure_facets USING btree (smart_proxy_id);


--
-- TOC entry 4324 (class 1259 OID 18589)
-- Name: index_host_facets_reported_data_facets_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_host_facets_reported_data_facets_on_host_id ON public.host_facets_reported_data_facets USING btree (host_id);


--
-- TOC entry 4350 (class 1259 OID 18736)
-- Name: index_host_proxy_invocations_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_proxy_invocations_on_host_id ON public.host_proxy_invocations USING btree (host_id);


--
-- TOC entry 4351 (class 1259 OID 18738)
-- Name: index_host_proxy_invocations_on_host_id_and_smart_proxy_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_host_proxy_invocations_on_host_id_and_smart_proxy_id ON public.host_proxy_invocations USING btree (host_id, smart_proxy_id);


--
-- TOC entry 4352 (class 1259 OID 18737)
-- Name: index_host_proxy_invocations_on_smart_proxy_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_proxy_invocations_on_smart_proxy_id ON public.host_proxy_invocations USING btree (smart_proxy_id);


--
-- TOC entry 4333 (class 1259 OID 18652)
-- Name: index_host_puppet_facets_on_environment_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_puppet_facets_on_environment_id ON public.host_puppet_facets USING btree (environment_id);


--
-- TOC entry 4334 (class 1259 OID 18651)
-- Name: index_host_puppet_facets_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_puppet_facets_on_host_id ON public.host_puppet_facets USING btree (host_id);


--
-- TOC entry 4335 (class 1259 OID 18653)
-- Name: index_host_puppet_facets_on_puppet_proxy_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_puppet_facets_on_puppet_proxy_id ON public.host_puppet_facets USING btree (puppet_proxy_id);


--
-- TOC entry 4214 (class 1259 OID 17788)
-- Name: index_host_status_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_host_status_on_host_id ON public.host_status USING btree (host_id);


--
-- TOC entry 4215 (class 1259 OID 17957)
-- Name: index_host_status_on_type_and_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_host_status_on_type_and_host_id ON public.host_status USING btree (type, host_id);


--
-- TOC entry 4050 (class 1259 OID 18712)
-- Name: index_hostgroup_classes_on_hostgroup_puppet_facet_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hostgroup_classes_on_hostgroup_puppet_facet_id ON public.hostgroup_classes USING btree (hostgroup_puppet_facet_id);


--
-- TOC entry 4051 (class 1259 OID 16609)
-- Name: index_hostgroup_classes_on_puppetclass_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hostgroup_classes_on_puppetclass_id ON public.hostgroup_classes USING btree (puppetclass_id);


--
-- TOC entry 4338 (class 1259 OID 18677)
-- Name: index_hostgroup_puppet_facets_on_environment_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hostgroup_puppet_facets_on_environment_id ON public.hostgroup_puppet_facets USING btree (environment_id);


--
-- TOC entry 4339 (class 1259 OID 18676)
-- Name: index_hostgroup_puppet_facets_on_hostgroup_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hostgroup_puppet_facets_on_hostgroup_id ON public.hostgroup_puppet_facets USING btree (hostgroup_id);


--
-- TOC entry 4340 (class 1259 OID 18678)
-- Name: index_hostgroup_puppet_facets_on_puppet_proxy_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hostgroup_puppet_facets_on_puppet_proxy_id ON public.hostgroup_puppet_facets USING btree (puppet_proxy_id);


--
-- TOC entry 4046 (class 1259 OID 16841)
-- Name: index_hostgroups_on_ancestry; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hostgroups_on_ancestry ON public.hostgroups USING btree (ancestry);


--
-- TOC entry 4047 (class 1259 OID 17548)
-- Name: index_hostgroups_on_compute_profile_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hostgroups_on_compute_profile_id ON public.hostgroups USING btree (compute_profile_id);


--
-- TOC entry 3980 (class 1259 OID 16926)
-- Name: index_hosts_on_certname; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hosts_on_certname ON public.hosts USING btree (certname);


--
-- TOC entry 3981 (class 1259 OID 17549)
-- Name: index_hosts_on_compute_profile_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hosts_on_compute_profile_id ON public.hosts USING btree (compute_profile_id);


--
-- TOC entry 3982 (class 1259 OID 18755)
-- Name: index_hosts_on_creator_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hosts_on_creator_id ON public.hosts USING btree (creator_id);


--
-- TOC entry 3983 (class 1259 OID 16613)
-- Name: index_hosts_on_installed_at; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hosts_on_installed_at ON public.hosts USING btree (installed_at);


--
-- TOC entry 3984 (class 1259 OID 16612)
-- Name: index_hosts_on_last_report; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hosts_on_last_report ON public.hosts USING btree (last_report);


--
-- TOC entry 3985 (class 1259 OID 16410)
-- Name: index_hosts_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hosts_on_name ON public.hosts USING btree (name);


--
-- TOC entry 3986 (class 1259 OID 18352)
-- Name: index_hosts_on_type_and_location_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hosts_on_type_and_location_id ON public.hosts USING btree (type, location_id);


--
-- TOC entry 3987 (class 1259 OID 18351)
-- Name: index_hosts_on_type_and_organization_id_and_location_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_hosts_on_type_and_organization_id_and_location_id ON public.hosts USING btree (type, organization_id, location_id);


--
-- TOC entry 4297 (class 1259 OID 18591)
-- Name: index_http_proxies_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_http_proxies_on_name ON public.http_proxies USING btree (name);


--
-- TOC entry 4298 (class 1259 OID 18367)
-- Name: index_jwt_secrets_on_token; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_jwt_secrets_on_token ON public.jwt_secrets USING btree (token);


--
-- TOC entry 4299 (class 1259 OID 18368)
-- Name: index_jwt_secrets_on_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_jwt_secrets_on_user_id ON public.jwt_secrets USING btree (user_id);


--
-- TOC entry 4086 (class 1259 OID 16764)
-- Name: index_logs_on_level_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_logs_on_level_id ON public.logs USING btree (level_id);


--
-- TOC entry 4087 (class 1259 OID 16763)
-- Name: index_logs_on_message_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_logs_on_message_id ON public.logs USING btree (message_id);


--
-- TOC entry 4088 (class 1259 OID 16762)
-- Name: index_logs_on_report_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_logs_on_report_id ON public.logs USING btree (report_id);


--
-- TOC entry 4089 (class 1259 OID 17736)
-- Name: index_logs_on_source_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_logs_on_source_id ON public.logs USING btree (source_id);


--
-- TOC entry 4059 (class 1259 OID 18488)
-- Name: index_lookup_keys_on_ansible_role_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_lookup_keys_on_ansible_role_id ON public.lookup_keys USING btree (ansible_role_id);


--
-- TOC entry 4060 (class 1259 OID 16655)
-- Name: index_lookup_keys_on_key; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_lookup_keys_on_key ON public.lookup_keys USING btree (key);


--
-- TOC entry 4061 (class 1259 OID 17779)
-- Name: index_lookup_keys_on_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_lookup_keys_on_type ON public.lookup_keys USING btree (type);


--
-- TOC entry 4064 (class 1259 OID 18535)
-- Name: index_lookup_values_on_lookup_key_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_lookup_values_on_lookup_key_id ON public.lookup_values USING btree (lookup_key_id);


--
-- TOC entry 4065 (class 1259 OID 18628)
-- Name: index_lookup_values_on_lookup_key_id_and_match; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_lookup_values_on_lookup_key_id_and_match ON public.lookup_values USING btree (lookup_key_id, match);


--
-- TOC entry 4066 (class 1259 OID 18625)
-- Name: index_lookup_values_on_match; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_lookup_values_on_match ON public.lookup_values USING btree (match);


--
-- TOC entry 4080 (class 1259 OID 18689)
-- Name: index_messages_on_value; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_messages_on_value ON public.messages USING hash (value);


--
-- TOC entry 4124 (class 1259 OID 18058)
-- Name: index_nics_on_ip; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_nics_on_ip ON public.nics USING btree (ip);


--
-- TOC entry 4125 (class 1259 OID 18059)
-- Name: index_nics_on_ip6; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_nics_on_ip6 ON public.nics USING btree (ip6);


--
-- TOC entry 4274 (class 1259 OID 18164)
-- Name: index_notification_blueprints_on_group; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_notification_blueprints_on_group ON public.notification_blueprints USING btree ("group");


--
-- TOC entry 4283 (class 1259 OID 18204)
-- Name: index_notification_recipients_on_notification_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_notification_recipients_on_notification_id ON public.notification_recipients USING btree (notification_id);


--
-- TOC entry 4284 (class 1259 OID 18206)
-- Name: index_notification_recipients_on_seen; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_notification_recipients_on_seen ON public.notification_recipients USING btree (seen);


--
-- TOC entry 4285 (class 1259 OID 18298)
-- Name: index_notification_recipients_on_user_id_and_notification_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_notification_recipients_on_user_id_and_notification_id ON public.notification_recipients USING btree (user_id, notification_id);


--
-- TOC entry 4277 (class 1259 OID 18297)
-- Name: index_notifications_on_expired_at; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_notifications_on_expired_at ON public.notifications USING btree (expired_at);


--
-- TOC entry 4278 (class 1259 OID 18184)
-- Name: index_notifications_on_notification_blueprint_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_notifications_on_notification_blueprint_id ON public.notifications USING btree (notification_blueprint_id);


--
-- TOC entry 4279 (class 1259 OID 18295)
-- Name: index_notifications_on_subject_type_and_subject_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_notifications_on_subject_type_and_subject_id ON public.notifications USING btree (subject_type, subject_id);


--
-- TOC entry 4280 (class 1259 OID 18185)
-- Name: index_notifications_on_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_notifications_on_user_id ON public.notifications USING btree (user_id);


--
-- TOC entry 4015 (class 1259 OID 17902)
-- Name: index_operatingsystems_on_name_and_major_and_minor; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_operatingsystems_on_name_and_major_and_minor ON public.operatingsystems USING btree (name, major, minor);


--
-- TOC entry 4016 (class 1259 OID 17901)
-- Name: index_operatingsystems_on_title; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_operatingsystems_on_title ON public.operatingsystems USING btree (title);


--
-- TOC entry 4017 (class 1259 OID 17043)
-- Name: index_operatingsystems_on_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_operatingsystems_on_type ON public.operatingsystems USING btree (type);


--
-- TOC entry 4039 (class 1259 OID 17638)
-- Name: index_parameters_on_type_and_reference_id_and_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_parameters_on_type_and_reference_id_and_name ON public.parameters USING btree (type, reference_id, name);


--
-- TOC entry 4157 (class 1259 OID 17473)
-- Name: index_permissions_on_name_and_resource_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_permissions_on_name_and_resource_type ON public.permissions USING btree (name, resource_type);


--
-- TOC entry 4291 (class 1259 OID 18321)
-- Name: index_personal_access_tokens_on_token; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_personal_access_tokens_on_token ON public.personal_access_tokens USING btree (token);


--
-- TOC entry 4292 (class 1259 OID 18322)
-- Name: index_personal_access_tokens_on_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_personal_access_tokens_on_user_id ON public.personal_access_tokens USING btree (user_id);


--
-- TOC entry 4033 (class 1259 OID 18526)
-- Name: index_puppetclasses_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_puppetclasses_on_name ON public.puppetclasses USING btree (name);


--
-- TOC entry 4154 (class 1259 OID 17447)
-- Name: index_realms_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_realms_on_name ON public.realms USING btree (name);


--
-- TOC entry 4318 (class 1259 OID 18573)
-- Name: index_registration_facets_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_registration_facets_on_host_id ON public.registration_facets USING btree (host_id);


--
-- TOC entry 4319 (class 1259 OID 18574)
-- Name: index_registration_facets_on_jwt_secret; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_registration_facets_on_jwt_secret ON public.registration_facets USING btree (jwt_secret);


--
-- TOC entry 4260 (class 1259 OID 18026)
-- Name: index_remote_execution_features_on_job_template_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_remote_execution_features_on_job_template_id ON public.remote_execution_features USING btree (job_template_id);


--
-- TOC entry 4261 (class 1259 OID 18741)
-- Name: index_remote_execution_features_on_label; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_remote_execution_features_on_label ON public.remote_execution_features USING btree (label);


--
-- TOC entry 4028 (class 1259 OID 18285)
-- Name: index_reports_on_host_id_and_type_and_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_reports_on_host_id_and_type_and_id ON public.reports USING btree (host_id, type, id);


--
-- TOC entry 4029 (class 1259 OID 18296)
-- Name: index_reports_on_reported_at_and_host_id_and_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_reports_on_reported_at_and_host_id_and_type ON public.reports USING btree (reported_at, host_id, type);


--
-- TOC entry 4030 (class 1259 OID 18283)
-- Name: index_reports_on_type_and_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_reports_on_type_and_host_id ON public.reports USING btree (type, host_id);


--
-- TOC entry 4073 (class 1259 OID 18515)
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_roles_on_name ON public.roles USING btree (name);


--
-- TOC entry 4055 (class 1259 OID 16643)
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_sessions_on_session_id ON public.sessions USING btree (session_id);


--
-- TOC entry 4056 (class 1259 OID 16644)
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_sessions_on_updated_at ON public.sessions USING btree (updated_at);


--
-- TOC entry 4114 (class 1259 OID 16851)
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_settings_on_name ON public.settings USING btree (name);


--
-- TOC entry 4083 (class 1259 OID 18690)
-- Name: index_sources_on_value; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_sources_on_value ON public.sources USING hash (value);


--
-- TOC entry 4288 (class 1259 OID 18332)
-- Name: index_ssh_keys_on_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_ssh_keys_on_user_id ON public.ssh_keys USING btree (user_id);


--
-- TOC entry 4315 (class 1259 OID 18558)
-- Name: index_stored_values_on_key; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_stored_values_on_key ON public.stored_values USING btree (key);


--
-- TOC entry 4117 (class 1259 OID 18045)
-- Name: index_subnet_domains_on_subnet_id_and_domain_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_subnet_domains_on_subnet_id_and_domain_id ON public.subnet_domains USING btree (subnet_id, domain_id);


--
-- TOC entry 4009 (class 1259 OID 18602)
-- Name: index_subnets_on_externalipam_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_subnets_on_externalipam_id ON public.subnets USING btree (externalipam_id);


--
-- TOC entry 4010 (class 1259 OID 18523)
-- Name: index_subnets_on_httpboot_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_subnets_on_httpboot_id ON public.subnets USING btree (httpboot_id);


--
-- TOC entry 4011 (class 1259 OID 18522)
-- Name: index_subnets_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_subnets_on_name ON public.subnets USING btree (name);


--
-- TOC entry 4012 (class 1259 OID 18048)
-- Name: index_subnets_on_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_subnets_on_type ON public.subnets USING btree (type);


--
-- TOC entry 4305 (class 1259 OID 18399)
-- Name: index_table_preferences_on_user_id_and_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_table_preferences_on_user_id_and_name ON public.table_preferences USING btree (user_id, name);


--
-- TOC entry 4183 (class 1259 OID 18627)
-- Name: index_tasks_locks_on_task_id_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_tasks_locks_on_task_id_resource_type_and_resource_id ON public.foreman_tasks_locks USING btree (task_id, resource_type, resource_id);


--
-- TOC entry 4141 (class 1259 OID 18576)
-- Name: index_taxable_taxonomies_on_taxonomy_id_and_taxable_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_taxable_taxonomies_on_taxonomy_id_and_taxable_type ON public.taxable_taxonomies USING btree (taxonomy_id, taxable_type);


--
-- TOC entry 4134 (class 1259 OID 17575)
-- Name: index_taxonomies_on_ancestry; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_taxonomies_on_ancestry ON public.taxonomies USING btree (ancestry);


--
-- TOC entry 4353 (class 1259 OID 18752)
-- Name: index_template_invocation_events_on_template_invocation_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_template_invocation_events_on_template_invocation_id ON public.template_invocation_events USING btree (template_invocation_id);


--
-- TOC entry 4229 (class 1259 OID 18772)
-- Name: index_template_invocations_on_smart_proxy_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_template_invocations_on_smart_proxy_id ON public.template_invocations USING btree (smart_proxy_id);


--
-- TOC entry 4092 (class 1259 OID 18765)
-- Name: index_templates_on_cloned_from_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_templates_on_cloned_from_id ON public.templates USING btree (cloned_from_id);


--
-- TOC entry 4093 (class 1259 OID 18739)
-- Name: index_templates_on_type_and_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_templates_on_type_and_name ON public.templates USING btree (type, name);


--
-- TOC entry 4137 (class 1259 OID 18478)
-- Name: index_tokens_on_host_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_tokens_on_host_id ON public.tokens USING btree (host_id);


--
-- TOC entry 4138 (class 1259 OID 18487)
-- Name: index_tokens_on_value; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_tokens_on_value ON public.tokens USING btree (value);


--
-- TOC entry 4308 (class 1259 OID 18502)
-- Name: index_upgrade_tasks_on_name; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_upgrade_tasks_on_name ON public.upgrade_tasks USING btree (name);


--
-- TOC entry 4076 (class 1259 OID 17414)
-- Name: index_user_roles_on_owner_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_user_roles_on_owner_id ON public.user_roles USING btree (owner_id);


--
-- TOC entry 4077 (class 1259 OID 18521)
-- Name: index_user_roles_on_owner_type_and_owner_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_user_roles_on_owner_type_and_owner_id ON public.user_roles USING btree (owner_type, owner_id);


--
-- TOC entry 4052 (class 1259 OID 17585)
-- Name: index_users_on_lower_login; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX index_users_on_lower_login ON public.users USING btree (lower_login);


--
-- TOC entry 4325 (class 1259 OID 18601)
-- Name: index_webhooks_on_events; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_webhooks_on_events ON public.webhooks USING btree (events);


--
-- TOC entry 4326 (class 1259 OID 18679)
-- Name: index_webhooks_on_webhook_template_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_webhooks_on_webhook_template_id ON public.webhooks USING btree (webhook_template_id);


--
-- TOC entry 4199 (class 1259 OID 17672)
-- Name: index_widgets_on_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX index_widgets_on_user_id ON public.widgets USING btree (user_id);


--
-- TOC entry 4227 (class 1259 OID 17859)
-- Name: job_invocations_targeting_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX job_invocations_targeting_id ON public.job_invocations USING btree (targeting_id);


--
-- TOC entry 4228 (class 1259 OID 18458)
-- Name: job_invocations_task_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX job_invocations_task_id ON public.job_invocations USING btree (task_id);


--
-- TOC entry 4239 (class 1259 OID 17915)
-- Name: target_remote_execution_proxies_proxy_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX target_remote_execution_proxies_proxy_id ON public.target_remote_execution_proxies USING btree (remote_execution_proxy_id);


--
-- TOC entry 4240 (class 1259 OID 17916)
-- Name: target_remote_execution_proxies_target_id_target_type; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX target_remote_execution_proxies_target_id_target_type ON public.target_remote_execution_proxies USING btree (target_id, target_type);


--
-- TOC entry 4222 (class 1259 OID 17841)
-- Name: targeting_hosts_host_targeting_ids; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX targeting_hosts_host_targeting_ids ON public.targeting_hosts USING btree (host_id, targeting_id);


--
-- TOC entry 4230 (class 1259 OID 17872)
-- Name: targeting_invocation_template_ji_ids; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX targeting_invocation_template_ji_ids ON public.template_invocations USING btree (template_id, job_invocation_id);


--
-- TOC entry 4218 (class 1259 OID 17822)
-- Name: targetings_bookmark_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX targetings_bookmark_id ON public.targetings USING btree (bookmark_id);


--
-- TOC entry 4221 (class 1259 OID 17823)
-- Name: targetings_user_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX targetings_user_id ON public.targetings USING btree (user_id);


--
-- TOC entry 4142 (class 1259 OID 18520)
-- Name: taxable_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX taxable_index ON public.taxable_taxonomies USING btree (taxable_type, taxable_id, taxonomy_id);


--
-- TOC entry 4236 (class 1259 OID 17890)
-- Name: template_invocation_input_values_ti_ti_ids; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX template_invocation_input_values_ti_ti_ids ON public.template_invocation_input_values USING btree (template_invocation_id, template_input_id);


--
-- TOC entry 4233 (class 1259 OID 18467)
-- Name: template_invocations_run_host_job_task_id; Type: INDEX; Schema: public; Owner: foreman
--

CREATE INDEX template_invocations_run_host_job_task_id ON public.template_invocations USING btree (run_host_job_task_id);


--
-- TOC entry 4356 (class 1259 OID 18764)
-- Name: unique_template_invocation_events_index; Type: INDEX; Schema: public; Owner: foreman
--

CREATE UNIQUE INDEX unique_template_invocation_events_index ON public.template_invocation_events USING btree (template_invocation_id, sequence_id);


--
-- TOC entry 4397 (class 2606 OID 17044)
-- Name: architectures_operatingsystems architectures_operatingsystems_architecture_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.architectures_operatingsystems
    ADD CONSTRAINT architectures_operatingsystems_architecture_id_fk FOREIGN KEY (architecture_id) REFERENCES public.architectures(id);


--
-- TOC entry 4398 (class 2606 OID 17049)
-- Name: architectures_operatingsystems architectures_operatingsystems_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.architectures_operatingsystems
    ADD CONSTRAINT architectures_operatingsystems_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4462 (class 2606 OID 17543)
-- Name: compute_attributes compute_attributes_compute_profile_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.compute_attributes
    ADD CONSTRAINT compute_attributes_compute_profile_id_fk FOREIGN KEY (compute_profile_id) REFERENCES public.compute_profiles(id);


--
-- TOC entry 4461 (class 2606 OID 17538)
-- Name: compute_attributes compute_attributes_compute_resource_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.compute_attributes
    ADD CONSTRAINT compute_attributes_compute_resource_id_fk FOREIGN KEY (compute_resource_id) REFERENCES public.compute_resources(id);


--
-- TOC entry 4438 (class 2606 OID 17064)
-- Name: operatingsystems_provisioning_templates config_templates_operatingsystems_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.operatingsystems_provisioning_templates
    ADD CONSTRAINT config_templates_operatingsystems_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4433 (class 2606 OID 17069)
-- Name: templates config_templates_template_kind_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT config_templates_template_kind_id_fk FOREIGN KEY (template_kind_id) REFERENCES public.template_kinds(id);


--
-- TOC entry 4468 (class 2606 OID 17729)
-- Name: discovery_attribute_sets discovery_attribute_sets_host_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.discovery_attribute_sets
    ADD CONSTRAINT discovery_attribute_sets_host_id_fk FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4467 (class 2606 OID 18338)
-- Name: discovery_rules discovery_rules_hostgroup_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.discovery_rules
    ADD CONSTRAINT discovery_rules_hostgroup_id_fk FOREIGN KEY (hostgroup_id) REFERENCES public.hostgroups(id);


--
-- TOC entry 4399 (class 2606 OID 17074)
-- Name: domains domains_dns_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.domains
    ADD CONSTRAINT domains_dns_id_fk FOREIGN KEY (dns_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4506 (class 2606 OID 18901)
-- Name: dynflow_actions dynflow_actions_execution_plan_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_actions
    ADD CONSTRAINT dynflow_actions_execution_plan_uuid_fkey FOREIGN KEY (execution_plan_uuid) REFERENCES public.dynflow_execution_plans(uuid);


--
-- TOC entry 4510 (class 2606 OID 18929)
-- Name: dynflow_output_chunks dynflow_output_chunks_execution_plan_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_output_chunks
    ADD CONSTRAINT dynflow_output_chunks_execution_plan_uuid_fkey FOREIGN KEY (execution_plan_uuid) REFERENCES public.dynflow_execution_plans(uuid);


--
-- TOC entry 4511 (class 2606 OID 18934)
-- Name: dynflow_output_chunks dynflow_output_chunks_execution_plan_uuid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_output_chunks
    ADD CONSTRAINT dynflow_output_chunks_execution_plan_uuid_fkey1 FOREIGN KEY (execution_plan_uuid, action_id) REFERENCES public.dynflow_actions(execution_plan_uuid, id);


--
-- TOC entry 4509 (class 2606 OID 18916)
-- Name: dynflow_delayed_plans dynflow_scheduled_plans_execution_plan_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_delayed_plans
    ADD CONSTRAINT dynflow_scheduled_plans_execution_plan_uuid_fkey FOREIGN KEY (execution_plan_uuid) REFERENCES public.dynflow_execution_plans(uuid);


--
-- TOC entry 4507 (class 2606 OID 18906)
-- Name: dynflow_steps dynflow_steps_execution_plan_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_steps
    ADD CONSTRAINT dynflow_steps_execution_plan_uuid_fkey FOREIGN KEY (execution_plan_uuid) REFERENCES public.dynflow_execution_plans(uuid);


--
-- TOC entry 4508 (class 2606 OID 18911)
-- Name: dynflow_steps dynflow_steps_execution_plan_uuid_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.dynflow_steps
    ADD CONSTRAINT dynflow_steps_execution_plan_uuid_fkey1 FOREIGN KEY (execution_plan_uuid, action_id) REFERENCES public.dynflow_actions(execution_plan_uuid, id);


--
-- TOC entry 4406 (class 2606 OID 16972)
-- Name: environment_classes environment_classes_lookup_key_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.environment_classes
    ADD CONSTRAINT environment_classes_lookup_key_id_fk FOREIGN KEY (puppetclass_lookup_key_id) REFERENCES public.lookup_keys(id);


--
-- TOC entry 4464 (class 2606 OID 17620)
-- Name: external_usergroups external_usergroups_auth_source_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.external_usergroups
    ADD CONSTRAINT external_usergroups_auth_source_id_fk FOREIGN KEY (auth_source_id) REFERENCES public.auth_sources(id);


--
-- TOC entry 4463 (class 2606 OID 17615)
-- Name: external_usergroups external_usergroups_usergroup_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.external_usergroups
    ADD CONSTRAINT external_usergroups_usergroup_id_fk FOREIGN KEY (usergroup_id) REFERENCES public.usergroups(id);


--
-- TOC entry 4395 (class 2606 OID 17079)
-- Name: fact_values fact_values_fact_name_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.fact_values
    ADD CONSTRAINT fact_values_fact_name_id_fk FOREIGN KEY (fact_name_id) REFERENCES public.fact_names(id);


--
-- TOC entry 4396 (class 2606 OID 17084)
-- Name: fact_values fact_values_host_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.fact_values
    ADD CONSTRAINT fact_values_host_id_fk FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4443 (class 2606 OID 17089)
-- Name: smart_proxy_features features_smart_proxies_feature_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.smart_proxy_features
    ADD CONSTRAINT features_smart_proxies_feature_id_fk FOREIGN KEY (feature_id) REFERENCES public.features(id);


--
-- TOC entry 4444 (class 2606 OID 17094)
-- Name: smart_proxy_features features_smart_proxies_smart_proxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.smart_proxy_features
    ADD CONSTRAINT features_smart_proxies_smart_proxy_id_fk FOREIGN KEY (smart_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4458 (class 2606 OID 17565)
-- Name: filterings filterings_filters_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.filterings
    ADD CONSTRAINT filterings_filters_id_fk FOREIGN KEY (filter_id) REFERENCES public.filters(id);


--
-- TOC entry 4459 (class 2606 OID 17570)
-- Name: filterings filterings_permissions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.filterings
    ADD CONSTRAINT filterings_permissions_id_fk FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- TOC entry 4457 (class 2606 OID 17560)
-- Name: filters filters_roles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_roles_id_fk FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 4486 (class 2606 OID 18001)
-- Name: foreign_input_sets fk_rails_06bdfc8b9e; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreign_input_sets
    ADD CONSTRAINT fk_rails_06bdfc8b9e FOREIGN KEY (template_id) REFERENCES public.templates(id);


--
-- TOC entry 4493 (class 2606 OID 18316)
-- Name: personal_access_tokens fk_rails_08903b8f38; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT fk_rails_08903b8f38 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4498 (class 2606 OID 18680)
-- Name: webhooks fk_rails_130157602b; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT fk_rails_130157602b FOREIGN KEY (webhook_template_id) REFERENCES public.templates(id);


--
-- TOC entry 4504 (class 2606 OID 18671)
-- Name: hostgroup_puppet_facets fk_rails_16db508c33; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_puppet_facets
    ADD CONSTRAINT fk_rails_16db508c33 FOREIGN KEY (puppet_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4476 (class 2606 OID 17950)
-- Name: job_invocations fk_rails_23d6dd5ad0; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_invocations
    ADD CONSTRAINT fk_rails_23d6dd5ad0 FOREIGN KEY (task_group_id) REFERENCES public.foreman_tasks_task_groups(id);


--
-- TOC entry 4500 (class 2606 OID 18641)
-- Name: host_puppet_facets fk_rails_2640d30897; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_puppet_facets
    ADD CONSTRAINT fk_rails_2640d30897 FOREIGN KEY (environment_id) REFERENCES public.environments(id);


--
-- TOC entry 4394 (class 2606 OID 18756)
-- Name: hosts fk_rails_2d704211a5; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT fk_rails_2d704211a5 FOREIGN KEY (creator_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 4494 (class 2606 OID 18362)
-- Name: jwt_secrets fk_rails_3a8951dc4c; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT fk_rails_3a8951dc4c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4411 (class 2606 OID 18707)
-- Name: host_classes fk_rails_442a5d32e3; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_classes
    ADD CONSTRAINT fk_rails_442a5d32e3 FOREIGN KEY (host_puppet_facet_id) REFERENCES public.host_puppet_facets(id);


--
-- TOC entry 4482 (class 2606 OID 18773)
-- Name: template_invocations fk_rails_4512fa74b9; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocations
    ADD CONSTRAINT fk_rails_4512fa74b9 FOREIGN KEY (smart_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4496 (class 2606 OID 18568)
-- Name: registration_facets fk_rails_4c747e18cb; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.registration_facets
    ADD CONSTRAINT fk_rails_4c747e18cb FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4492 (class 2606 OID 18199)
-- Name: notification_recipients fk_rails_51975e21a8; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notification_recipients
    ADD CONSTRAINT fk_rails_51975e21a8 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4489 (class 2606 OID 18174)
-- Name: notifications fk_rails_51a98a5e10; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_rails_51a98a5e10 FOREIGN KEY (notification_blueprint_id) REFERENCES public.notification_blueprints(id);


--
-- TOC entry 4424 (class 2606 OID 18300)
-- Name: hostgroups fk_rails_61ca956e9a; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT fk_rails_61ca956e9a FOREIGN KEY (compute_resource_id) REFERENCES public.compute_resources(id);


--
-- TOC entry 4488 (class 2606 OID 18027)
-- Name: remote_execution_features fk_rails_62d06fbd3e; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.remote_execution_features
    ADD CONSTRAINT fk_rails_62d06fbd3e FOREIGN KEY (job_template_id) REFERENCES public.templates(id);


--
-- TOC entry 4505 (class 2606 OID 18699)
-- Name: host_facets_infrastructure_facets fk_rails_635427df4f; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_facets_infrastructure_facets
    ADD CONSTRAINT fk_rails_635427df4f FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4477 (class 2606 OID 17967)
-- Name: job_invocations fk_rails_64f7741f33; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_invocations
    ADD CONSTRAINT fk_rails_64f7741f33 FOREIGN KEY (triggering_id) REFERENCES public.foreman_tasks_triggerings(id);


--
-- TOC entry 4435 (class 2606 OID 16781)
-- Name: template_combinations fk_rails_7c330ecd6e; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_combinations
    ADD CONSTRAINT fk_rails_7c330ecd6e FOREIGN KEY (environment_id) REFERENCES public.environments(id);


--
-- TOC entry 4434 (class 2606 OID 18766)
-- Name: templates fk_rails_8438cd1b43; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT fk_rails_8438cd1b43 FOREIGN KEY (cloned_from_id) REFERENCES public.templates(id) ON DELETE SET NULL;


--
-- TOC entry 4478 (class 2606 OID 18369)
-- Name: job_invocations fk_rails_8642ef3b5e; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_invocations
    ADD CONSTRAINT fk_rails_8642ef3b5e FOREIGN KEY (remote_execution_feature_id) REFERENCES public.remote_execution_features(id);


--
-- TOC entry 4501 (class 2606 OID 18646)
-- Name: host_puppet_facets fk_rails_95698c0c1f; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_puppet_facets
    ADD CONSTRAINT fk_rails_95698c0c1f FOREIGN KEY (puppet_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4460 (class 2606 OID 18529)
-- Name: foreman_tasks_tasks fk_rails_a56904dd86; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreman_tasks_tasks
    ADD CONSTRAINT fk_rails_a56904dd86 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4497 (class 2606 OID 18584)
-- Name: host_facets_reported_data_facets fk_rails_a82ac722f1; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_facets_reported_data_facets
    ADD CONSTRAINT fk_rails_a82ac722f1 FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4491 (class 2606 OID 18194)
-- Name: notification_recipients fk_rails_a8704dfb21; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notification_recipients
    ADD CONSTRAINT fk_rails_a8704dfb21 FOREIGN KEY (notification_id) REFERENCES public.notifications(id);


--
-- TOC entry 4490 (class 2606 OID 18179)
-- Name: notifications fk_rails_b080fb4855; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_rails_b080fb4855 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4487 (class 2606 OID 18007)
-- Name: foreign_input_sets fk_rails_c61c5e136e; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.foreign_input_sets
    ADD CONSTRAINT fk_rails_c61c5e136e FOREIGN KEY (target_template_id) REFERENCES public.templates(id);


--
-- TOC entry 4405 (class 2606 OID 16555)
-- Name: environment_classes fk_rails_c784c62b6c; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.environment_classes
    ADD CONSTRAINT fk_rails_c784c62b6c FOREIGN KEY (puppetclass_id) REFERENCES public.puppetclasses(id);


--
-- TOC entry 4499 (class 2606 OID 18636)
-- Name: host_puppet_facets fk_rails_cadab260b9; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_puppet_facets
    ADD CONSTRAINT fk_rails_cadab260b9 FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4503 (class 2606 OID 18666)
-- Name: hostgroup_puppet_facets fk_rails_d5e8be6d61; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_puppet_facets
    ADD CONSTRAINT fk_rails_d5e8be6d61 FOREIGN KEY (environment_id) REFERENCES public.environments(id);


--
-- TOC entry 4426 (class 2606 OID 18713)
-- Name: hostgroup_classes fk_rails_dcf43436dc; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_classes
    ADD CONSTRAINT fk_rails_dcf43436dc FOREIGN KEY (hostgroup_puppet_facet_id) REFERENCES public.hostgroup_puppet_facets(id);


--
-- TOC entry 4485 (class 2606 OID 17980)
-- Name: job_template_effective_users fk_rails_e515c062ce; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_template_effective_users
    ADD CONSTRAINT fk_rails_e515c062ce FOREIGN KEY (job_template_id) REFERENCES public.templates(id);


--
-- TOC entry 4404 (class 2606 OID 16520)
-- Name: environment_classes fk_rails_e85d3a865e; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.environment_classes
    ADD CONSTRAINT fk_rails_e85d3a865e FOREIGN KEY (environment_id) REFERENCES public.environments(id);


--
-- TOC entry 4425 (class 2606 OID 16603)
-- Name: hostgroup_classes fk_rails_f25fcd3d47; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_classes
    ADD CONSTRAINT fk_rails_f25fcd3d47 FOREIGN KEY (puppetclass_id) REFERENCES public.puppetclasses(id);


--
-- TOC entry 4502 (class 2606 OID 18661)
-- Name: hostgroup_puppet_facets fk_rails_f4182c97c4; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroup_puppet_facets
    ADD CONSTRAINT fk_rails_f4182c97c4 FOREIGN KEY (hostgroup_id) REFERENCES public.hostgroups(id);


--
-- TOC entry 4410 (class 2606 OID 16957)
-- Name: host_classes host_classes_puppetclass_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_classes
    ADD CONSTRAINT host_classes_puppetclass_id_fk FOREIGN KEY (puppetclass_id) REFERENCES public.puppetclasses(id);


--
-- TOC entry 4469 (class 2606 OID 17789)
-- Name: host_status host_status_hosts_host_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.host_status
    ADD CONSTRAINT host_status_hosts_host_id_fk FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4414 (class 2606 OID 17099)
-- Name: hostgroups hostgroups_architecture_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_architecture_id_fk FOREIGN KEY (architecture_id) REFERENCES public.architectures(id);


--
-- TOC entry 4422 (class 2606 OID 17550)
-- Name: hostgroups hostgroups_compute_profile_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_compute_profile_id_fk FOREIGN KEY (compute_profile_id) REFERENCES public.compute_profiles(id);


--
-- TOC entry 4415 (class 2606 OID 17104)
-- Name: hostgroups hostgroups_domain_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_domain_id_fk FOREIGN KEY (domain_id) REFERENCES public.domains(id);


--
-- TOC entry 4416 (class 2606 OID 17109)
-- Name: hostgroups hostgroups_medium_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_medium_id_fk FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4417 (class 2606 OID 17114)
-- Name: hostgroups hostgroups_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4423 (class 2606 OID 17744)
-- Name: hostgroups hostgroups_ptable_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_ptable_id_fk FOREIGN KEY (ptable_id) REFERENCES public.templates(id);


--
-- TOC entry 4418 (class 2606 OID 17124)
-- Name: hostgroups hostgroups_puppet_ca_proxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_puppet_ca_proxy_id_fk FOREIGN KEY (puppet_ca_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4419 (class 2606 OID 17129)
-- Name: hostgroups hostgroups_puppet_proxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_puppet_proxy_id_fk FOREIGN KEY (puppet_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4421 (class 2606 OID 17458)
-- Name: hostgroups hostgroups_realms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_realms_id_fk FOREIGN KEY (realm_id) REFERENCES public.realms(id);


--
-- TOC entry 4420 (class 2606 OID 17134)
-- Name: hostgroups hostgroups_subnet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hostgroups
    ADD CONSTRAINT hostgroups_subnet_id_fk FOREIGN KEY (subnet_id) REFERENCES public.subnets(id);


--
-- TOC entry 4380 (class 2606 OID 17139)
-- Name: hosts hosts_architecture_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_architecture_id_fk FOREIGN KEY (architecture_id) REFERENCES public.architectures(id);


--
-- TOC entry 4392 (class 2606 OID 17555)
-- Name: hosts hosts_compute_profile_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_compute_profile_id_fk FOREIGN KEY (compute_profile_id) REFERENCES public.compute_profiles(id);


--
-- TOC entry 4381 (class 2606 OID 17144)
-- Name: hosts hosts_compute_resource_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_compute_resource_id_fk FOREIGN KEY (compute_resource_id) REFERENCES public.compute_resources(id);


--
-- TOC entry 4382 (class 2606 OID 17154)
-- Name: hosts hosts_hostgroup_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_hostgroup_id_fk FOREIGN KEY (hostgroup_id) REFERENCES public.hostgroups(id);


--
-- TOC entry 4383 (class 2606 OID 17159)
-- Name: hosts hosts_image_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_image_id_fk FOREIGN KEY (image_id) REFERENCES public.images(id);


--
-- TOC entry 4389 (class 2606 OID 17199)
-- Name: hosts hosts_location_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_location_id_fk FOREIGN KEY (location_id) REFERENCES public.taxonomies(id);


--
-- TOC entry 4384 (class 2606 OID 17164)
-- Name: hosts hosts_medium_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_medium_id_fk FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4385 (class 2606 OID 17169)
-- Name: hosts hosts_model_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_model_id_fk FOREIGN KEY (model_id) REFERENCES public.models(id);


--
-- TOC entry 4386 (class 2606 OID 17174)
-- Name: hosts hosts_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4390 (class 2606 OID 17204)
-- Name: hosts hosts_organization_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_organization_id_fk FOREIGN KEY (organization_id) REFERENCES public.taxonomies(id);


--
-- TOC entry 4393 (class 2606 OID 17749)
-- Name: hosts hosts_ptable_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_ptable_id_fk FOREIGN KEY (ptable_id) REFERENCES public.templates(id);


--
-- TOC entry 4387 (class 2606 OID 17184)
-- Name: hosts hosts_puppet_ca_proxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_puppet_ca_proxy_id_fk FOREIGN KEY (puppet_ca_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4388 (class 2606 OID 17189)
-- Name: hosts hosts_puppet_proxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_puppet_proxy_id_fk FOREIGN KEY (puppet_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4391 (class 2606 OID 17453)
-- Name: hosts hosts_realms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_realms_id_fk FOREIGN KEY (realm_id) REFERENCES public.realms(id);


--
-- TOC entry 4450 (class 2606 OID 17209)
-- Name: images images_architecture_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_architecture_id_fk FOREIGN KEY (architecture_id) REFERENCES public.architectures(id);


--
-- TOC entry 4451 (class 2606 OID 17214)
-- Name: images images_compute_resource_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_compute_resource_id_fk FOREIGN KEY (compute_resource_id) REFERENCES public.compute_resources(id);


--
-- TOC entry 4452 (class 2606 OID 17219)
-- Name: images images_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4475 (class 2606 OID 17860)
-- Name: job_invocations job_invocation_targeting_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.job_invocations
    ADD CONSTRAINT job_invocation_targeting_id FOREIGN KEY (targeting_id) REFERENCES public.targetings(id);


--
-- TOC entry 4453 (class 2606 OID 17224)
-- Name: key_pairs key_pairs_compute_resource_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.key_pairs
    ADD CONSTRAINT key_pairs_compute_resource_id_fk FOREIGN KEY (compute_resource_id) REFERENCES public.compute_resources(id);


--
-- TOC entry 4428 (class 2606 OID 17229)
-- Name: lookup_values lookup_values_lookup_key_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.lookup_values
    ADD CONSTRAINT lookup_values_lookup_key_id_fk FOREIGN KEY (lookup_key_id) REFERENCES public.lookup_keys(id);


--
-- TOC entry 4430 (class 2606 OID 17234)
-- Name: media_operatingsystems media_operatingsystems_medium_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.media_operatingsystems
    ADD CONSTRAINT media_operatingsystems_medium_id_fk FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4431 (class 2606 OID 17239)
-- Name: media_operatingsystems media_operatingsystems_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.media_operatingsystems
    ADD CONSTRAINT media_operatingsystems_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4447 (class 2606 OID 17244)
-- Name: nics nics_domain_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.nics
    ADD CONSTRAINT nics_domain_id_fk FOREIGN KEY (domain_id) REFERENCES public.domains(id);


--
-- TOC entry 4448 (class 2606 OID 17249)
-- Name: nics nics_host_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.nics
    ADD CONSTRAINT nics_host_id_fk FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4449 (class 2606 OID 17254)
-- Name: nics nics_subnet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.nics
    ADD CONSTRAINT nics_subnet_id_fk FOREIGN KEY (subnet_id) REFERENCES public.subnets(id);


--
-- TOC entry 4408 (class 2606 OID 17259)
-- Name: operatingsystems_ptables operatingsystems_ptables_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.operatingsystems_ptables
    ADD CONSTRAINT operatingsystems_ptables_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4409 (class 2606 OID 17739)
-- Name: operatingsystems_ptables operatingsystems_ptables_ptable_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.operatingsystems_ptables
    ADD CONSTRAINT operatingsystems_ptables_ptable_id_fk FOREIGN KEY (ptable_id) REFERENCES public.templates(id);


--
-- TOC entry 4412 (class 2606 OID 16962)
-- Name: operatingsystems_puppetclasses operatingsystems_puppetclasses_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.operatingsystems_puppetclasses
    ADD CONSTRAINT operatingsystems_puppetclasses_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4413 (class 2606 OID 16967)
-- Name: operatingsystems_puppetclasses operatingsystems_puppetclasses_puppetclass_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.operatingsystems_puppetclasses
    ADD CONSTRAINT operatingsystems_puppetclasses_puppetclass_id_fk FOREIGN KEY (puppetclass_id) REFERENCES public.puppetclasses(id);


--
-- TOC entry 4440 (class 2606 OID 17274)
-- Name: os_default_templates os_default_templates_operatingsystem_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.os_default_templates
    ADD CONSTRAINT os_default_templates_operatingsystem_id_fk FOREIGN KEY (operatingsystem_id) REFERENCES public.operatingsystems(id);


--
-- TOC entry 4442 (class 2606 OID 17755)
-- Name: os_default_templates os_default_templates_provisioning_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.os_default_templates
    ADD CONSTRAINT os_default_templates_provisioning_template_id_fk FOREIGN KEY (provisioning_template_id) REFERENCES public.templates(id);


--
-- TOC entry 4441 (class 2606 OID 17279)
-- Name: os_default_templates os_default_templates_template_kind_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.os_default_templates
    ADD CONSTRAINT os_default_templates_template_kind_id_fk FOREIGN KEY (template_kind_id) REFERENCES public.template_kinds(id);


--
-- TOC entry 4439 (class 2606 OID 17765)
-- Name: operatingsystems_provisioning_templates os_provisioning_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.operatingsystems_provisioning_templates
    ADD CONSTRAINT os_provisioning_template_id_fk FOREIGN KEY (provisioning_template_id) REFERENCES public.templates(id);


--
-- TOC entry 4456 (class 2606 OID 17448)
-- Name: realms realms_realm_proxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.realms
    ADD CONSTRAINT realms_realm_proxy_id_fk FOREIGN KEY (realm_proxy_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4407 (class 2606 OID 17284)
-- Name: reports reports_host_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_host_id_fk FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4446 (class 2606 OID 18040)
-- Name: subnet_domains subnet_domains_domain_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnet_domains
    ADD CONSTRAINT subnet_domains_domain_id_fk FOREIGN KEY (domain_id) REFERENCES public.domains(id);


--
-- TOC entry 4445 (class 2606 OID 18035)
-- Name: subnet_domains subnet_domains_subnet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnet_domains
    ADD CONSTRAINT subnet_domains_subnet_id_fk FOREIGN KEY (subnet_id) REFERENCES public.subnets(id);


--
-- TOC entry 4400 (class 2606 OID 17299)
-- Name: subnets subnets_dhcp_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnets
    ADD CONSTRAINT subnets_dhcp_id_fk FOREIGN KEY (dhcp_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4403 (class 2606 OID 18230)
-- Name: subnets subnets_discovery_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnets
    ADD CONSTRAINT subnets_discovery_id_fk FOREIGN KEY (discovery_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4401 (class 2606 OID 17304)
-- Name: subnets subnets_dns_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnets
    ADD CONSTRAINT subnets_dns_id_fk FOREIGN KEY (dns_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4402 (class 2606 OID 17309)
-- Name: subnets subnets_tftp_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.subnets
    ADD CONSTRAINT subnets_tftp_id_fk FOREIGN KEY (tftp_id) REFERENCES public.smart_proxies(id);


--
-- TOC entry 4495 (class 2606 OID 18394)
-- Name: table_preferences table_preferences_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.table_preferences
    ADD CONSTRAINT table_preferences_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4473 (class 2606 OID 17842)
-- Name: targeting_hosts targeting_hosts_host_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.targeting_hosts
    ADD CONSTRAINT targeting_hosts_host_id FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4474 (class 2606 OID 17847)
-- Name: targeting_hosts targeting_hosts_targeting_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.targeting_hosts
    ADD CONSTRAINT targeting_hosts_targeting_id FOREIGN KEY (targeting_id) REFERENCES public.targetings(id);


--
-- TOC entry 4471 (class 2606 OID 17824)
-- Name: targetings targetings_bookmark_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.targetings
    ADD CONSTRAINT targetings_bookmark_id FOREIGN KEY (bookmark_id) REFERENCES public.bookmarks(id);


--
-- TOC entry 4472 (class 2606 OID 17829)
-- Name: targetings targetings_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.targetings
    ADD CONSTRAINT targetings_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4455 (class 2606 OID 17314)
-- Name: taxable_taxonomies taxable_taxonomies_taxonomy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.taxable_taxonomies
    ADD CONSTRAINT taxable_taxonomies_taxonomy_id_fk FOREIGN KEY (taxonomy_id) REFERENCES public.taxonomies(id);


--
-- TOC entry 4436 (class 2606 OID 17324)
-- Name: template_combinations template_combinations_hostgroup_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_combinations
    ADD CONSTRAINT template_combinations_hostgroup_id_fk FOREIGN KEY (hostgroup_id) REFERENCES public.hostgroups(id);


--
-- TOC entry 4437 (class 2606 OID 17760)
-- Name: template_combinations template_combinations_provisioning_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_combinations
    ADD CONSTRAINT template_combinations_provisioning_template_id_fk FOREIGN KEY (provisioning_template_id) REFERENCES public.templates(id);


--
-- TOC entry 4484 (class 2606 OID 17896)
-- Name: template_invocation_input_values template_invoc_input_values_template_input_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocation_input_values
    ADD CONSTRAINT template_invoc_input_values_template_input_id FOREIGN KEY (template_input_id) REFERENCES public.template_inputs(id);


--
-- TOC entry 4483 (class 2606 OID 17891)
-- Name: template_invocation_input_values template_invoc_input_values_template_invoc_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocation_input_values
    ADD CONSTRAINT template_invoc_input_values_template_invoc_id FOREIGN KEY (template_invocation_id) REFERENCES public.template_invocations(id);


--
-- TOC entry 4480 (class 2606 OID 17878)
-- Name: template_invocations template_invoc_job_invocation_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocations
    ADD CONSTRAINT template_invoc_job_invocation_id FOREIGN KEY (job_invocation_id) REFERENCES public.job_invocations(id);


--
-- TOC entry 4479 (class 2606 OID 17873)
-- Name: template_invocations template_invoc_template_id; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocations
    ADD CONSTRAINT template_invoc_template_id FOREIGN KEY (template_id) REFERENCES public.templates(id);


--
-- TOC entry 4481 (class 2606 OID 17985)
-- Name: template_invocations template_invocations_hosts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_invocations
    ADD CONSTRAINT template_invocations_hosts_id_fk FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4470 (class 2606 OID 17805)
-- Name: template_inputs templates_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.template_inputs
    ADD CONSTRAINT templates_template_id_fk FOREIGN KEY (template_id) REFERENCES public.templates(id);


--
-- TOC entry 4454 (class 2606 OID 18479)
-- Name: tokens tokens_host_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_host_id_fk FOREIGN KEY (host_id) REFERENCES public.hosts(id);


--
-- TOC entry 4466 (class 2606 OID 17695)
-- Name: user_mail_notifications user_mail_notifications_mail_notification_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.user_mail_notifications
    ADD CONSTRAINT user_mail_notifications_mail_notification_id_fk FOREIGN KEY (mail_notification_id) REFERENCES public.mail_notifications(id);


--
-- TOC entry 4465 (class 2606 OID 17690)
-- Name: user_mail_notifications user_mail_notifications_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.user_mail_notifications
    ADD CONSTRAINT user_mail_notifications_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4432 (class 2606 OID 17384)
-- Name: user_roles user_roles_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fk FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 4429 (class 2606 OID 17394)
-- Name: usergroup_members usergroup_members_usergroup_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.usergroup_members
    ADD CONSTRAINT usergroup_members_usergroup_id_fk FOREIGN KEY (usergroup_id) REFERENCES public.usergroups(id);


--
-- TOC entry 4427 (class 2606 OID 17399)
-- Name: users users_auth_source_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: foreman
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_auth_source_id_fk FOREIGN KEY (auth_source_id) REFERENCES public.auth_sources(id);


-- Completed on 2025-01-19 19:44:59 UTC

--
-- PostgreSQL database dump complete
--

