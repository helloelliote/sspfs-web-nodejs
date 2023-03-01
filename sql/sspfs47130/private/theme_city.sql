-- auto-generated definition
CREATE TABLE theme_city
(
    gid     text NOT NULL
        CONSTRAINT ref_city_pk
            PRIMARY KEY,
    mnum    text,
    alias   text,
    remark  text,
    ntfdate timestamp,
    geom    geometry(MultiPolygon, 5187)
);

ALTER TABLE theme_city
    OWNER TO postgres;
