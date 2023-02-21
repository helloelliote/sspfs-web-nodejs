-- auto-generated definition
CREATE TABLE theme_farm_prom
(
    gid     text NOT NULL
        CONSTRAINT ref_farm_prom_pk
            PRIMARY KEY,
    mnum    text,
    alias   text,
    remark  text,
    ntfdate timestamp,
    geom    geometry(MultiPolygon, 5187)
);

ALTER TABLE theme_farm_prom
    OWNER TO postgres;
