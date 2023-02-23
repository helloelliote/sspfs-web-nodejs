-- auto-generated definition
CREATE TABLE facility_image
(
    pk1 text NOT NULL,
    pk2 text NOT NULL,
    pk3 text NOT NULL,
    pk4 text NOT NULL,
    pk5 text NOT NULL,
    i1  jsonb DEFAULT '[{"url": null, "type": "start"}, {"url": null, "type": "center"}, {"url": null, "type": "end"}, {"url": null, "type": "close"}, {"url": null, "type": "far"}, {"url": null, "type": "side"}]'::jsonb,
    CONSTRAINT facility_image_pk
        PRIMARY KEY (pk1, pk2, pk3, pk4, pk5)
);

COMMENT ON TABLE facility_image IS '시설물에 대한 각종 사진 및 이미지 등록 대장';

ALTER TABLE facility_image
    OWNER TO postgres;

CREATE INDEX facility_image_i1_index
    ON facility_image USING gin (i1);
