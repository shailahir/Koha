DROP TABLE IF EXISTS patron_lists;

CREATE TABLE patron_lists
(
    patron_list_id integer      NOT NULL,
    name           varchar(255) NOT NULL,
    owner          integer      NOT NULL,
    shared         integer DEFAULT 0,

    CONSTRAINT patron_lists_pkey PRIMARY KEY (patron_list_id),

    CONSTRAINT patron_lists_ibfk_1
        FOREIGN KEY (owner)
            REFERENCES borrowers (borrowernumber)
            ON DELETE CASCADE
            ON UPDATE CASCADE

);

CREATE INDEX patron_lists_owner_idx ON patron_lists (owner);

COMMENT
ON COLUMN patron_lists.patron_list_id IS 'unique identifier';

COMMENT
ON COLUMN patron_lists.name IS 'the list name';

COMMENT
ON COLUMN patron_lists.owner IS 'borrowernumber of the list creator';
