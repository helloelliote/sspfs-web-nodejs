-- auto-generated definition
CREATE TABLE e_facility
(
    fac_uid text NOT NULL
        CONSTRAINT e_facility_pk
            PRIMARY KEY,
    fac_nam text,
    mng_nam text,
    own_nam text,
    mng_tel text,
    hzd_uid text,
    hzd_ymd timestamp,
    fac_adm text,
    fac_pid text,
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

ALTER TABLE e_facility
    OWNER TO postgres;

CREATE INDEX e_facility_exm_ymd_index
    ON e_facility USING brin (exm_ymd);

CREATE INDEX e_facility_img_fac
    ON e_facility USING gin (img_fac);

CREATE INDEX e_facility_img_rep
    ON e_facility USING gin (img_rep);

CREATE INDEX e_facility_geom_index
    ON e_facility USING gist (geom);

CREATE INDEX e_facility_geom_index_4326
    ON e_facility USING gist (st_transform(geom, 4326));
