-- darkmodern.nvim — colorscheme showcase
-- AI-generated code for colorscheme highlighting demonstration only.
-- No functional guarantees. Not intended for production use.

-- --- Schema ---

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE item_status AS ENUM (
    'active',
    'inactive',
    'archived'
);

CREATE TABLE registries (
    id         UUID        PRIMARY KEY DEFAULT uuid_generate_v4(),
    name       VARCHAR(64) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL    DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL    DEFAULT NOW()
);

CREATE TABLE items (
    id          UUID         PRIMARY KEY DEFAULT uuid_generate_v4(),
    registry_id UUID         NOT NULL REFERENCES registries(id) ON DELETE CASCADE,
    label       VARCHAR(64)  NOT NULL,
    weight      NUMERIC(6,2) NOT NULL CHECK (weight > 0),
    status      item_status  NOT NULL    DEFAULT 'active',
    tags        TEXT[]       NOT NULL    DEFAULT '{}',
    created_at  TIMESTAMPTZ  NOT NULL    DEFAULT NOW(),
    updated_at  TIMESTAMPTZ  NOT NULL    DEFAULT NOW()
);

CREATE INDEX idx_items_registry_id ON items(registry_id);
CREATE INDEX idx_items_status      ON items(status);

-- --- Seed Data ---

INSERT INTO registries (name) VALUES
    ('main'),
    ('staging');

INSERT INTO items (registry_id, label, weight, status, tags)
SELECT
    r.id,
    v.label,
    v.weight,
    v.status::item_status,
    v.tags
FROM registries r
CROSS JOIN (
    VALUES
        ('alpha', 1.50, 'active',   ARRAY['foo', 'bar']),
        ('beta',  2.00, 'active',   ARRAY['bar', 'baz']),
        ('gamma', 0.75, 'inactive', ARRAY['foo'])
) AS v(label, weight, status, tags)
WHERE r.name = 'main';

-- --- Queries ---

/* Fetch all active items with their registry name */
SELECT
    i.id,
    i.label,
    i.weight,
    i.status,
    i.tags,
    r.name        AS registry_name,
    i.created_at
FROM       items      i
INNER JOIN registries r ON r.id = i.registry_id
WHERE  i.status = 'active'
   AND i.weight > 1.0
ORDER BY i.weight DESC, i.label ASC
LIMIT  10 OFFSET 0;

/* Aggregation per registry */
SELECT
    r.name,
    COUNT(*)                                     AS total,
    SUM(i.weight)                                AS total_weight,
    ROUND(AVG(i.weight), 2)                      AS avg_weight,
    ARRAY_AGG(i.label ORDER BY i.weight DESC)    AS labels
FROM       items      i
INNER JOIN registries r ON r.id = i.registry_id
WHERE  i.status != 'archived'
GROUP BY r.name
HAVING COUNT(*) > 0
ORDER BY total_weight DESC;

-- --- View ---

CREATE OR REPLACE VIEW active_items AS
SELECT
    i.id,
    i.label,
    i.weight,
    r.name AS registry_name
FROM       items      i
INNER JOIN registries r ON r.id = i.registry_id
WHERE  i.status = 'active';

-- --- Function ---

CREATE OR REPLACE FUNCTION greet(p_label TEXT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    v_result TEXT;
BEGIN
    SELECT 'Hello, World! — ' || i.label
    INTO   v_result
    FROM   items i
    WHERE  i.label = p_label
    LIMIT  1;

    RETURN COALESCE(v_result, 'Hello, World!');
END;
$$;

SELECT greet('alpha');
