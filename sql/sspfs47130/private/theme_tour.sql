-- auto-generated definition
CREATE TABLE theme_tour
(
    gid     text NOT NULL
        CONSTRAINT ref_tour_pk
            PRIMARY KEY,
    mnum    text,
    alias   text,
    remark  text,
    ntfdate timestamp,
    geom    geometry(MultiPolygon, 5187)
);

ALTER TABLE theme_tour
    OWNER TO postgres;
