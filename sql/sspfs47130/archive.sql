CREATE FUNCTION sspfs_update_i1_id()
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE facility_image fi SET i1 = JSONB_SET(i1, '{id}', CONCAT(pk1, pk2, pk3, pk4, pk5));
END;
$$;

UPDATE facility_image fi
SET i1 = JSONB_SET(i1, '{0,id}', CONCAT('"', pk1, pk2, pk3, pk4, pk5, '"')::jsonb);

SELECT CONCAT('"', pk1, pk2, pk3, pk4, pk5, '"')::jsonb
FROM facility_image;

CREATE FUNCTION sspfs_create_image_i1_id() RETURNS integer
    LANGUAGE sql
AS
$$
UPDATE facility_image AS fi
SET i1 =
        (SELECT JSONB_AGG(new_jsonb)
         FROM JSONB_ARRAY_ELEMENTS(fi.i1) target_jsonb,
              LATERAL JSONB_SET(target_jsonb, '{id}',
                                CONCAT('"', fi.pk1, fi.pk2, fi.pk3, fi.pk4, fi.pk5, '"')::jsonb) new_jsonb)
RETURNING 1
$$;

UPDATE facility_image fi
SET i1 = sspfs_update_i1_id(i1, '{id}', CONCAT('"', pk1, pk2, pk3, pk4, pk5, '"')::jsonb);

SELECT sspfs_create_image_i1_id();

SELECT i1::jsonb #>> '{id}'
FROM facility_image;
