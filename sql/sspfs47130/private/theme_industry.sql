-- auto-generated definition
CREATE TABLE theme_industry
(
    gid     text NOT NULL
        CONSTRAINT ref_industry_pk
            PRIMARY KEY,
    mnum    text,
    alias   text,
    remark  text,
    ntfdate timestamp,
    temp    text,
    geom    geometry(MultiPolygon, 5187)
);

ALTER TABLE theme_industry
    OWNER TO postgres;
