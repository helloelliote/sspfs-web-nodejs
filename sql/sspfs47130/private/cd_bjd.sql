-- auto-generated definition
CREATE TABLE cd_bjd
(
    bjd_cde  text NOT NULL
        CONSTRAINT cd_bjd_pk
            PRIMARY KEY,
    hjd_nam  text,
    bjd_nam  text,
    hjd_nams text,
    ftr_cde  text,
    geom     geometry(MultiPolygon, 5187)
);

ALTER TABLE cd_bjd
    OWNER TO postgres;

CREATE INDEX cd_bjd_geom_index_4326
    ON cd_bjd USING gist (st_transform(geom, 4326));
