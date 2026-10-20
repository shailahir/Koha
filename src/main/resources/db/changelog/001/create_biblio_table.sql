DROP TABLE IF EXISTS biblio;

CREATE TABLE biblio
(
    biblionumber    integer    NOT NULL,
    frameworkcode   varchar(4) NOT NULL DEFAULT '',
    author          text                DEFAULT NULL,
    title           text                DEFAULT NULL,
    medium          text                DEFAULT NULL,
    subtitle        text                DEFAULT NULL,
    part_number     text                DEFAULT NULL,
    part_name       text                DEFAULT NULL,
    unititle        text                DEFAULT NULL,
    notes           text                DEFAULT NULL,
    serial          integer             DEFAULT NULL,
    seriestitle     text                DEFAULT NULL,
    copyrightdate   integer             DEFAULT NULL,
    timestamp       timestamp  NOT NULL,
    datecreated     date       NOT NULL,
    abstract        text                DEFAULT NULL,
    opac_suppressed text       NOT NULL DEFAULT 0,

    CONSTRAINT biblio_pk PRIMARY KEY (biblionumber)
);

CREATE INDEX biblio_blbnoidx ON biblio (biblionumber);
CREATE INDEX biblio_suppressedidx ON biblio (opac_suppressed);

COMMENT
ON COLUMN biblio.biblionumber IS 'unique identifier assigned to each bibliographic record';

COMMENT
ON COLUMN biblio.frameworkcode IS 'foreign key from the biblio_framework table to identify which framework was used in cataloging this record';

COMMENT
ON COLUMN biblio.author IS 'statement of responsibility from MARC record (100$a in MARC21)';

COMMENT
ON COLUMN biblio.title IS 'title (without the subtitle) from the MARC record (245$a in MARC21)';

COMMENT
ON COLUMN biblio.medium IS 'medium from the MARC record (245$h in MARC21)';

COMMENT
ON COLUMN biblio.subtitle IS 'remainder of the title from the MARC record (245$b in MARC21)';

COMMENT
ON COLUMN biblio.part_number IS 'part number from the MARC record (245$n in MARC21)';

COMMENT
ON COLUMN biblio.part_name IS 'part name from the MARC record (245$p in MARC21)';

COMMENT
ON COLUMN biblio.unititle IS 'uniform title (without the subtitle) from the MARC record (240$a in MARC21)';

COMMENT
ON COLUMN biblio.notes IS 'values from the general notes field in the MARC record (500$a in MARC21) split by bar (|)';

COMMENT
ON COLUMN biblio.serial IS 'Boolean indicating whether biblio is for a serial';

COMMENT
ON COLUMN biblio.copyrightdate IS 'publication or copyright date from the MARC record';

COMMENT
ON COLUMN biblio.timestamp IS 'date and time this record was last touched';

COMMENT
ON COLUMN biblio.datecreated IS 'the date this record was added to Koha';

COMMENT
ON COLUMN biblio.abstract IS 'summary from the MARC record (520$a in MARC21)';

COMMENT
ON COLUMN biblio.opac_suppressed IS 'whether the record should be suppressed in the OPAC';
