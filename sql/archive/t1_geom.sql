CREATE INDEX t1_geom_geom_index
    ON t1_geom
        USING gist (geom);

CREATE INDEX t1_geom_geom_index_4326
    ON t1_geom
        USING gist (ST_Transform(geom, 4326));