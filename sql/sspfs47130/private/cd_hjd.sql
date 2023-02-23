-- auto-generated definition
CREATE TABLE cd_hjd
(
    hjd_cde text NOT NULL
        CONSTRAINT cd_hjd_pk
            PRIMARY KEY,
    hjd_nam text,
    hjd_dcd text,
    ftr_cde text,
    geom    geometry(MultiPolygon, 5187)
);

ALTER TABLE cd_hjd
    OWNER TO postgres;

CREATE INDEX cd_hjd_geom_index_4326
    ON cd_hjd USING gist (st_transform(geom, 4326));
