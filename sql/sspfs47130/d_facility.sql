-- auto-generated definition
CREATE TABLE d_facility
(
    fac_uid text NOT NULL
        CONSTRAINT d_facility_pk
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
    ben_txt text,
    cat_cde text,
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

ALTER TABLE d_facility
    OWNER TO postgres;

CREATE INDEX d_facility_exm_ymd_index
    ON d_facility USING brin (exm_ymd);

CREATE INDEX d_facility_img_fac
    ON d_facility USING gin (img_fac);

CREATE INDEX d_facility_img_rep
    ON d_facility USING gin (img_rep);

CREATE INDEX d_facility_geom_index
    ON d_facility USING gist (geom);

CREATE INDEX d_facility_geom_index_4326
    ON d_facility USING gist (st_transform(geom, 4326));
