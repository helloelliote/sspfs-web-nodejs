-- auto-generated definition
CREATE TABLE theme_farm_rep
(
    gid     text NOT NULL
        CONSTRAINT ref_farm_rep_pk
            PRIMARY KEY,
    mnum    text,
    alias   text,
    remark  text,
    ntfdate timestamp,
    geom    geometry(MultiPolygon, 5187)
);

ALTER TABLE theme_farm_rep
    OWNER TO postgres;
