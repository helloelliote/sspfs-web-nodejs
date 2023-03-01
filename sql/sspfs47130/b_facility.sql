-- auto-generated definition
CREATE TABLE b_facility
(
    fac_uid text NOT NULL
        CONSTRAINT b_facility_pk
            PRIMARY KEY,
    fac_nam text,
    mng_nam text,
    own_nam text,
    mng_tel text,
    hzd_uid text,
    hzd_ymd timestamp,
    fac_adm text,
    fac_pid text,
    pos_nam text,
    fac_adu text,
    fac_adl text,
    fac_len numeric,
    fac_wid numeric,
    ben_txt text,
    sub_cnt integer,
    sub_txt text,
    fun_cde selection[] DEFAULT '{}'::selection[],
    pos_cde selection[] DEFAULT '{}'::selection[],
    exm_opi text,
    exm_ymd timestamp,
    exm_nam text,
    exm_chk selection,
    img_fac jsonb,
    img_rep jsonb,
    geom    geometry
);

ALTER TABLE b_facility
    OWNER TO postgres;

CREATE INDEX b_facility_exm_ymd_index
    ON b_facility USING brin (exm_ymd);

CREATE INDEX b_facility_img_fac
    ON b_facility USING gin (img_fac);

CREATE INDEX b_facility_img_rep
    ON b_facility USING gin (img_rep);

CREATE INDEX b_facility_geom_index
    ON b_facility USING gist (geom);

CREATE INDEX b_facility_geom_index_4326
    ON b_facility USING gist (st_transform(geom, 4326));
