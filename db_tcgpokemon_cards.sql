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
        60,
        'Mewtwo',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'A scientist created this Pokémon after years of horrific gene-splicing and DNA engineering experiments.',
        'Psychic',
        '10+',
        'Psychic x2',
        NULL,
        '3',
        '10/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        90,
        'Gyarados',
        (SELECT id FROM tbl_types WHERE typeName = 'Water'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'Rarely seen in the wild. Huge and vicious, it is capable of destroying entire cities in a rage.',
        'Dragon Rage',
        '50',
        'Grass x2',
        'Fighting -30',
        '3',
        '6/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        80,
        'Alakazam',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'Its brain can outperform a supercomputer. Its intelligence quotient is said to be 5000.',
        'Confuse Ray',
        '30',
        'Psychic x2',
        NULL,
        '3',
        '1/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        100,
        'Machamp',
        (SELECT id FROM tbl_types WHERE typeName = 'Fighting'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'Using its amazing muscles, it throws powerful punches that can knock its victim clear over the horizon.',
        'Seismic Toss',
        '60',
        'Psychic x2',
        NULL,
        '3',
        '8/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        120,
        'Chansey',
        (SELECT id FROM tbl_types WHERE typeName = 'Colorless'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'A rare and elusive Pokémon that is said to bring happiness to those who manage to catch it.',
        'Double-edge',
        '80',
        'Fighting x2',
        'Psychic -30',
        '1',
        '3/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        80,
        'Ninetales',
        (SELECT id FROM tbl_types WHERE typeName = 'Fire'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'Very smart and very vengeful. Grabbing one of its many tails could result in a 1000-year curse.',
        'Fire Blast',
        '80',
        'Water x2',
        NULL,
        '1',
        '12/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        90,
        'Zapdos',
        (SELECT id FROM tbl_types WHERE typeName = 'Lightning'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'A legendary bird Pokémon said to appear from clouds while dropping enormous lightning bolts.',
        'Thunder',
        '60',
        NULL,
        'Fighting -30',
        '3',
        '16/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        40,
        'Charmander',
        (SELECT id FROM tbl_types WHERE typeName = 'Fire'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'Obviously prefers hot places. If it gets caught in the rain, steam is said to spout from the tip of its tail.',
        'Ember',
        '30',
        'Water x2',
        NULL,
        '1',
        '46/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        40,
        'Squirtle',
        (SELECT id FROM tbl_types WHERE typeName = 'Water'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'After birth, its back swells and hardens into a shell. It powerfully sprays foam from its mouth.',
        'Bubble',
        '10',
        'Lightning x2',
        NULL,
        '1',
        '63/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        40,
        'Bulbasaur',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'A strange seed was planted on its back at birth. Thus, a plant sprouted and now this Pokémon grows with it.',
        'Leech Seed',
        '20',
        'Fire x2',
        NULL,
        '1',
        '44/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        70,
        'Scyther',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'With ninja-like agility and speed, it can create the illusion that there is more than one of it.',
        'Slash',
        '30',
        'Fire x2',
        'Fighting -30',
        '0',
        '10/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        70,
        'Jolteon',
        (SELECT id FROM tbl_types WHERE typeName = 'Lightning'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'It accumulates negative ions from the atmosphere to blast out 10000-volt lightning bolts.',
        'Pin Missile',
        '20x',
        'Fighting x2',
        NULL,
        '1',
        '4/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        80,
        'Vaporeon',
        (SELECT id FROM tbl_types WHERE typeName = 'Water'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'Lives close to water. Its long tail is ridged with a fin that is often mistaken for a mermaid''s.',
        'Water Gun',
        '30+',
        'Lightning x2',
        NULL,
        '1',
        '12/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        70,
        'Flareon',
        (SELECT id FROM tbl_types WHERE typeName = 'Fire'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'When storing thermal energy in its body, its temperature could soar to over 1600 degrees.',
        'Flamethrower',
        '60',
        'Water x2',
        NULL,
        '1',
        '3/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        80,
        'Dragonite',
        (SELECT id FROM tbl_types WHERE typeName = 'Colorless'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'An extremely rarely seen marine Pokémon. Its intelligence is said to match that of humans.',
        'Slam',
        '40x',
        NULL,
        'Fighting -30',
        '1',
        '4/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        80,
        'Articuno',
        (SELECT id FROM tbl_types WHERE typeName = 'Water'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'A legendary bird Pokémon that is said to appear to doomed people who are lost in icy mountains.',
        'Blizzard',
        '50',
        NULL,
        'Fighting -30',
        '2',
        '2/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        70,
        'Moltres',
        (SELECT id FROM tbl_types WHERE typeName = 'Fire'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'Known as the legendary bird of fire. Every flap of its wings creates a dazzling flash of flames.',
        'Dive Bomb',
        '80',
        NULL,
        'Fighting -30',
        '2',
        '12/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        80,
        'Lapras',
        (SELECT id FROM tbl_types WHERE typeName = 'Water'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'A Pokémon that has been overhunted almost to extinction. It can ferry people across water.',
        'Water Gun',
        '10+',
        'Lightning x2',
        NULL,
        '2',
        '10/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        330,
        'Blastoise ex',
        (SELECT id FROM tbl_types WHERE typeName = 'Water'),
        (SELECT id FROM tbl_stages WHERE stageName = 'ex'),
        'When Blastoise ex is Knocked Out, your opponent takes 2 Prize cards.',
        'Twin Cannons',
        '140x',
        'Lightning x2',
        NULL,
        '3',
        '009/165',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Scarlet & Violet—151')
    ),
    (
        340,
        'Venusaur ex',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'ex'),
        'When Venusaur ex is Knocked Out, your opponent takes 2 Prize cards.',
        'Dangerous Toxwhip',
        '150',
        'Fire x2',
        NULL,
        '4',
        '003/165',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Scarlet & Violet—151')
    );


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
        90,
        'Nidoking',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'Uses its powerful tail in battle to smash, constrict, then break the prey''s bones.',
        'Thrash',
        '30+',
        'Psychic x2',
        NULL,
        '3',
        '11/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        70,
        'Hitmonchan',
        (SELECT id FROM tbl_types WHERE typeName = 'Fighting'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'While apparently doing nothing, it fires punches in lightning fast volleys that are impossible to see.',
        'Special Punch',
        '40',
        'Psychic x2',
        NULL,
        '2',
        '7/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        90,
        'Poliwrath',
        (SELECT id FROM tbl_types WHERE typeName = 'Water'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'An adept swimmer at both the front crawl and breast stroke. Easily overtakes the best human swimmers.',
        'Water Gun',
        '30+',
        'Grass x2',
        NULL,
        '3',
        '13/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        80,
        'Raichu',
        (SELECT id FROM tbl_types WHERE typeName = 'Lightning'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'Its long tail serves as a ground to protect itself from its own high-voltage power.',
        'Thunder',
        '60',
        'Fighting x2',
        NULL,
        '1',
        '14/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        60,
        'Magneton',
        (SELECT id FROM tbl_types WHERE typeName = 'Lightning'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'Formed by several Magnemites linked together. They frequently appear when sunspots flare up.',
        'Selfdestruct',
        '80',
        'Fighting x2',
        NULL,
        '1',
        '9/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        80,
        'Arcanine',
        (SELECT id FROM tbl_types WHERE typeName = 'Fire'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'A Pokémon that has been admired since the past for its beauty. It runs agilely as if on wings.',
        'Flamethrower',
        '50',
        'Water x2',
        NULL,
        '3',
        '23/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        70,
        'Electabuzz',
        (SELECT id FROM tbl_types WHERE typeName = 'Lightning'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'Normally found near power plants, they can wander away and cause major blackouts in cities.',
        'Thunderpunch',
        '30+',
        'Fighting x2',
        NULL,
        '2',
        '20/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        50,
        'Magmar',
        (SELECT id FROM tbl_types WHERE typeName = 'Fire'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'Its body always burns with an orange glow that enables it to hide perfectly among flames.',
        'Flamethrower',
        '50',
        'Water x2',
        NULL,
        '2',
        '36/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        60,
        'Onix',
        (SELECT id FROM tbl_types WHERE typeName = 'Fighting'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'As it grows, the stone portions of its body harden to become similar to a diamond, but colored black.',
        'Rock Throw',
        '10',
        'Grass x2',
        NULL,
        '3',
        '56/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        50,
        'Gastly',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'Almost invisible, this gaseous Pokémon cloaks the target and puts it to sleep without notice.',
        'Sleeping Gas',
        NULL,
        NULL,
        'Fighting -30',
        '0',
        '50/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        60,
        'Haunter',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'Because of its ability to slip through block walls, it is said to be from another dimension.',
        'Hypnosis',
        NULL,
        NULL,
        'Fighting -30',
        '1',
        '29/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        60,
        'Kadabra',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'It emits special alpha waves from its body that induce headaches just by being close by.',
        'Super Psy',
        '50',
        'Psychic x2',
        NULL,
        '3',
        '32/102',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Base Set')
    ),
    (
        90,
        'Kangaskhan',
        (SELECT id FROM tbl_types WHERE typeName = 'Colorless'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'The infant rarely ventures out of its mother''s protective pouch until it is 3 years old.',
        'Comet Punch',
        '20x',
        'Fighting x2',
        'Psychic -30',
        '3',
        '5/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        90,
        'Nidoqueen',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'Its hard scales provide strong protection. It uses its hefty bulk to execute powerful moves.',
        'Mega Punch',
        '50',
        'Psychic x2',
        NULL,
        '3',
        '7/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        80,
        'Pidgeot',
        (SELECT id FROM tbl_types WHERE typeName = 'Colorless'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'When hunting, it skims the surface of water at high speed to pick off unwary prey such as Magikarp.',
        'Hurricane',
        '30',
        'Lightning x2',
        'Fighting -30',
        '0',
        '8/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        60,
        'Pinsir',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'If it fails to crush the victim in its pincers, it will swing it around and toss it hard.',
        'Guillotine',
        '50',
        'Fire x2',
        NULL,
        '1',
        '9/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        80,
        'Wigglytuff',
        (SELECT id FROM tbl_types WHERE typeName = 'Colorless'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'The body is soft and rubbery. When angered, it will suck in air and inflate itself to an enormous size.',
        'Do the Wave',
        '10+',
        'Fighting x2',
        'Psychic -30',
        '2',
        '16/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        70,
        'Vileplume',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'The larger its petals, the more toxic pollen it contains. Its big head is heavy and hard to hold up.',
        'Petal Dance',
        '40x',
        'Fire x2',
        NULL,
        '2',
        '15/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        40,
        'Mr. Mime',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'If interrupted while it is miming, it will slap around the offender with its broad hands.',
        'Meditate',
        '10+',
        'Psychic x2',
        NULL,
        '1',
        '6/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        50,
        'Eevee',
        (SELECT id FROM tbl_types WHERE typeName = 'Colorless'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'Its genetic code is irregular. It may mutate if it is exposed to radiation from element stones.',
        'Quick Attack',
        '10+',
        'Fighting x2',
        'Psychic -30',
        '1',
        '51/64',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Jungle')
    ),
    (
        60,
        'Aerodactyl',
        (SELECT id FROM tbl_types WHERE typeName = 'Fighting'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'A ferocious, prehistoric Pokémon that goes for the enemy''s throat with its serrated saw-like fangs.',
        'Wing Attack',
        '30',
        'Grass x2',
        'Fighting -30',
        '2',
        '1/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        50,
        'Ditto',
        (SELECT id FROM tbl_types WHERE typeName = 'Colorless'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'Capable of copying an enemy''s genetic code to instantly transform itself into a duplicate of the enemy.',
        'Transform',
        NULL,
        'Fighting x2',
        'Psychic -30',
        '1',
        '3/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        60,
        'Hitmonlee',
        (SELECT id FROM tbl_types WHERE typeName = 'Fighting'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Basic'),
        'When in a hurry, its legs lengthen progressively. It runs smoothly with extra long, loping strides.',
        'High Jump Kick',
        '50',
        'Psychic x2',
        NULL,
        '1',
        '7/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        70,
        'Hypno',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'When it locks eyes with an enemy, it will use a mix of PSI moves such as Hypnosis and Confusion.',
        'Dark Mind',
        '30',
        'Psychic x2',
        NULL,
        '2',
        '8/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        60,
        'Kabutops',
        (SELECT id FROM tbl_types WHERE typeName = 'Fighting'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 2'),
        'Its sleek shape is perfect for swimming. It slashes prey with its claws and drains the body fluids.',
        'Razor Sickle',
        '50',
        'Grass x2',
        NULL,
        '1',
        '9/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        70,
        'Muk',
        (SELECT id FROM tbl_types WHERE typeName = 'Grass'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'Thickly covered with a filthy, vile sludge. It is so toxic, even its footprints contain poison.',
        'Sludge',
        '30',
        'Psychic x2',
        NULL,
        '2',
        '13/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        70,
        'Raichu',
        (SELECT id FROM tbl_types WHERE typeName = 'Lightning'),
        (SELECT id FROM tbl_stages WHERE stageName = 'Stage 1'),
        'If the electrical pouches in its cheeks become fully charged, both ears will stand straight up.',
        'Gigashock',
        '30',
        'Fighting x2',
        NULL,
        '1',
        '14/62',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Fossil')
    ),
    (
        260,
        'Alakazam ex',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'ex'),
        'When Alakazam ex is Knocked Out, your opponent takes 2 Prize cards.',
        'Dimensional Hand',
        '120',
        'Darkness x2',
        'Fighting -30',
        '1',
        '065/165',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Scarlet & Violet—151')
    ),
    (
        210,
        'Zapdos ex',
        (SELECT id FROM tbl_types WHERE typeName = 'Lightning'),
        (SELECT id FROM tbl_stages WHERE stageName = 'ex'),
        'When Zapdos ex is Knocked Out, your opponent takes 2 Prize cards.',
        'Multishot Lightning',
        '120',
        'Lightning x2',
        'Fighting -30',
        '0',
        '145/165',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Scarlet & Violet—151')
    ),
    (
        180,
        'Mew ex',
        (SELECT id FROM tbl_types WHERE typeName = 'Psychic'),
        (SELECT id FROM tbl_stages WHERE stageName = 'ex'),
        'When Mew ex is Knocked Out, your opponent takes 2 Prize cards.',
        'Genome Hacking',
        NULL,
        'Darkness x2',
        'Fighting -30',
        '0',
        '151/165',
        (SELECT id FROM tbl_collections WHERE collectionSetName = 'Scarlet & Violet—151')
    );


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


