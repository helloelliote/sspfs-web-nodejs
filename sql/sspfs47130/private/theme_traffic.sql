-- auto-generated definition
CREATE TABLE theme_traffic
(
    gid     text NOT NULL
        CONSTRAINT ref_traffic_pk
            PRIMARY KEY,
    mnum    text,
    alias   text,
    remark  text,
    ntfdate timestamp,
    geom    geometry(MultiPolygon, 5187)
);

ALTER TABLE theme_traffic
    OWNER TO postgres;
