CREATE OR REPLACE VIEW vw_cards_detalhados AS
SELECT 
    c.id,
    c.hp,
    c.name,
    t.typeName AS type,
    s.stageName AS stage,
    c.info,
    c.attack,
    c.dammage,
    c.weak,
    c.resistence,
    c.retreat,
    c.cardNumberInCollection,
    col.collectionSetName AS collection,
    col.releaseDate AS collectionReleaseDate,
    col.totalCardsInCollection
FROM tbl_cards c
INNER JOIN tbl_collections col ON c.collection_id = col.id
LEFT JOIN tbl_types t ON c.type_id = t.id
LEFT JOIN tbl_stages s ON c.stage_id = s.id;