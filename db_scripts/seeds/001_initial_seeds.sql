INSERT INTO tbl_collections (collectionSetName, releaseDate, totalCardsInCollection)
VALUES
    ('Base Set', '1999-01-09', 102),
    ('Jungle', '1999-06-16', 64),
    ('Fossil', '1999-10-10', 62),
    ('Scarlet & Violet—151', '2023-09-22', 165);

INSERT INTO tbl_types (typeName)
VALUES
    ('Grass'),
    ('Fire'),
    ('Water'),
    ('Lightning'),
    ('Psychic'),
    ('Fighting'),
    ('Darkness'),
    ('Metal'),
    ('Dragon'),
    ('Fairy'),
    ('Colorless');

INSERT INTO tbl_stages (stageName)
VALUES
    ('Basic'),
    ('Stage 1'),
    ('Stage 2'),
    ('VMAX'),
    ('VSTAR'),
    ('ex'),
    ('GX'),
    ('Mega');

INSERT INTO tbl_cards (
    hp,
    name,
    type_id,
    stage_id,
    info,
    attack,
    dammage,
    weak,
    resistence,
    retreat,
    cardNumberInCollection,
    collection_id
)
VALUES
    (
        120,
        'Charizard',
        (SELECT id FROM tbl_types WHERE typeName = 'Fire'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'Spits fire that is hot enough to melt boulders. Known to unintentionally cause forest fires.',
        'Fire Spin',
        '100',
        'Water x2',
        'Fighting -30',
        '3',
        '4/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        100,
        'Blastoise',
        (SELECT id FROM tbl_types WHERE typeName = 'Water'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'A brutal Pokémon with pressurized water jets on its shell. They are used for high-speed tackles.',
        'Hydro Pump',
        '40+',
        'Lightning x2',
        NULL,
        '3',
        '2/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        100,
        'Venusaur',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'The plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.',
        'Solarbeam',
        '60',
        'Fire x2',
        NULL,
        '2',
        '15/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        40,
        'Pikachu',
        (SELECT id FROM tbl_types WHERE typeName = 'Lightning'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'When several of these Pokémon gather, their electricity could build and cause lightning storms.',
        'Thunder Jolt',
        '30',
        'Fighting x2',
        NULL,
        '1',
        '58/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        90,
        'Snorlax',
        (SELECT id FROM tbl_types WHERE typeName = 'Colorless'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'Very lazy. Just eats and sleeps. As its rotund bulk builds, it becomes steadily more slothful.',
        'Body Slam',
        '30',
        'Fighting x2',
        'Psychic -30',
        '4',
        '11/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        80,
        'Gengar',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'Under a full moon, this Pokémon likes to mimic the shadows of people and laugh at their fright.',
        'Dark Mind',
        '30',
        NULL,
        'Fighting -30',
        '1',
        '5/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        330,
        'Charizard ex',
        (SELECT id FROM tbl_types WHERE typeName = 'Fire'),
        (SELECT id FROM tbl_stages WHERE stageName = 'ex'),
        'When Charizard ex is Knocked Out, your opponent takes 2 Prize cards.',
        'Explosive Vortex',
        '330',
        'Water x2',
        NULL,
        '2',
        '006/165',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Scarlet & Violet—151')
    );

    