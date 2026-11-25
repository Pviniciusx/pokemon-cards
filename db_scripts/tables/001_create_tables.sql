CREATE TABLE tbl_collections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    collectionSetName VARCHAR(100) NOT NULL,
    releaseDate DATE,
    totalCardsInCollection INTEGER
);

CREATE TABLE tbl_types (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    typeName VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE tbl_stages (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    stageName VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE tbl_cards (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    hp SMALLINT,
    name VARCHAR(80) NOT NULL,
    type_id INTEGER,
    stage_id INTEGER,
    info TEXT,
    attack VARCHAR(60),
    dammage VARCHAR(10),
    weak VARCHAR(20),
    resistence VARCHAR(20),
    retreat VARCHAR(15),
    cardNumberInCollection VARCHAR(15),
    collection_id INTEGER NOT NULL,
    
    CONSTRAINT fk_collection
        FOREIGN KEY (collection_id) 
        REFERENCES tbl_collections(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_type
        FOREIGN KEY (type_id) 
        REFERENCES tbl_types(id)
        ON DELETE SET NULL,

    CONSTRAINT fk_stage
        FOREIGN KEY (stage_id) 
        REFERENCES tbl_stages(id)
        ON DELETE SET NULL
);

CREATE INDEX idx_cards_collection_id ON tbl_cards(collection_id);
CREATE INDEX idx_cards_type_id ON tbl_cards(type_id);
CREATE INDEX idx_cards_stage_id ON tbl_cards(stage_id);