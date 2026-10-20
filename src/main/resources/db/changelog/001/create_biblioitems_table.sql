DROP TABLE IF EXISTS biblioitems;

CREATE TABLE biblioitems
(
    biblioitemnumber      integer   NOT NULL,
    biblionumber          integer   NOT NULL DEFAULT 0,
    volume                text               DEFAULT NULL,
    number                text               DEFAULT NULL,
    itemtype              varchar(10)        DEFAULT NULL,
    isbn                  text               DEFAULT NULL,
    issn                  text               DEFAULT NULL,
    ean                   text               DEFAULT NULL,
    publicationyear       text               DEFAULT NULL,
    publishercode         text               DEFAULT NULL,
    volumedate            date               DEFAULT NULL,
    volumedesc            text               DEFAULT NULL,
    collectiontitle       text               DEFAULT NULL,
    collectionissn        text               DEFAULT NULL,
    collectionvolume      text               DEFAULT NULL,
    editionstatement      text               DEFAULT NULL,
    editionresponsibility text               DEFAULT NULL,
    timestamp             timestamp NOT NULL,
    illus                 text               DEFAULT NULL,
    pages                 text               DEFAULT NULL,
    notes                 text               DEFAULT NULL,
    size                  text               DEFAULT NULL,
    place                 text               DEFAULT NULL,
    lccn                  text               DEFAULT NULL,
    url                   text               DEFAULT NULL,
    cn_source             varchar(10)        DEFAULT NULL,
    cn_class              varchar(30)        DEFAULT NULL,
    cn_item               varchar(10)        DEFAULT NULL,
    cn_suffix             varchar(10)        DEFAULT NULL,
    cn_sort               varchar(255)       DEFAULT NULL,
    agerestriction        varchar(255)       DEFAULT NULL,
    totalissues           integer            DEFAULT NULL,
    CONSTRAINT biblioitems_pk PRIMARY KEY (biblioitemnumber),
    CONSTRAINT biblioitems_ibfk_1
        FOREIGN KEY (biblionumber) REFERENCES biblio (biblionumber) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX biblioitems_bibinoidx ON biblioitems (biblioitemnumber);
CREATE INDEX biblioitems_bibnoidx ON biblioitems (biblionumber);
CREATE INDEX biblioitems_itemtype_idx ON biblioitems (itemtype);
CREATE INDEX biblioitems_isbn_idx ON biblioitems (isbn);
CREATE INDEX biblioitems_issn_idx ON biblioitems (issn);
CREATE INDEX biblioitems_ean_idx ON biblioitems (ean);
CREATE INDEX biblioitems_publishercode_idx ON biblioitems (publishercode);
CREATE INDEX biblioitems_timestamp_idx ON biblioitems (timestamp);

COMMENT
ON COLUMN biblioitems.biblioitemnumber IS 'primary key, unique identifier assigned by Koha';

COMMENT
ON COLUMN biblioitems.biblionumber IS 'foreign key linking this table to the biblio table';

COMMENT
ON COLUMN biblioitems.itemtype IS 'biblio level item type (MARC21 942$c)';

COMMENT
ON COLUMN biblioitems.isbn IS 'ISBN (MARC21 020$a)';

COMMENT
ON COLUMN biblioitems.issn IS 'ISSN (MARC21 022$a)';

COMMENT
ON COLUMN biblioitems.publishercode IS 'publisher (MARC21 260$b and 264$b)';

COMMENT
ON COLUMN biblioitems.volumedesc IS 'volume information (MARC21 362$a)';

COMMENT
ON COLUMN biblioitems.illus IS 'illustrations (MARC21 300$b)';

COMMENT
ON COLUMN biblioitems.pages IS 'number of pages (MARC21 300$a)';

COMMENT
ON COLUMN biblioitems.size IS 'material size (MARC21 300$c)';

COMMENT
ON COLUMN biblioitems.place IS 'publication place (MARC21 260$a and 264$a)';

COMMENT
ON COLUMN biblioitems.lccn IS 'library of congress control number (MARC21 010$a)';

COMMENT
ON COLUMN biblioitems.url IS 'url (MARC21 856$u)';

COMMENT
ON COLUMN biblioitems.cn_source IS 'classification source (MARC21 942$2)';

COMMENT
ON COLUMN biblioitems.cn_sort IS 'normalized version of the call number used for sorting';

COMMENT
ON COLUMN biblioitems.totalissues IS 'target audience/age restriction from the bib record (MARC21 521$a)';
