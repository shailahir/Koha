DROP TABLE IF EXISTS items;

CREATE TABLE items
(
    itemnumber                        integer   NOT NULL,
    biblionumber                      integer   NOT NULL DEFAULT 0,
    biblioitemnumber                  integer   NOT NULL DEFAULT 0,
    barcode                           varchar(20)        DEFAULT NULL UNIQUE,
    bookable                          integer            DEFAULT NULL,
    dateaccessioned                   date               DEFAULT NULL,
    booksellerid                      text               DEFAULT NULL,
    homebranch                        varchar(10)        DEFAULT NULL,
    price                             decimal(8, 2)      DEFAULT NULL,
    replacementprice                  decimal(8, 2)      DEFAULT NULL,
    replacementpricedate              date               DEFAULT NULL,
    datelastborrowed                  date               DEFAULT NULL,
    datelastseen                      timestamp          DEFAULT NULL,
    stack                             integer            DEFAULT NULL,
    notforloan                        integer   NOT NULL DEFAULT 0,
    damaged                           integer   NOT NULL DEFAULT 0,
    damaged_on                        timestamp          DEFAULT NULL,
    itemlost                          integer   NOT NULL DEFAULT 0,
    itemlost_on                       timestamp          DEFAULT NULL,
    withdrawn                         integer   NOT NULL DEFAULT 0,
    withdrawn_on                      timestamp          DEFAULT NULL,
    itemcallnumber                    varchar(255)       DEFAULT NULL,
    coded_location_qualifier          varchar(10)        DEFAULT NULL,
    issues                            integer            DEFAULT 0,
    renewals                          integer            DEFAULT NULL,
    localuse                          integer            DEFAULT NULL,
    reserves                          integer            DEFAULT NULL,
    restricted                        integer            DEFAULT NULL,
    itemnotes                         text               DEFAULT NULL,
    itemnotes_nonpublic               text               DEFAULT NULL,
    holdingbranch                     varchar(10)        DEFAULT NULL,
    timestamp                         timestamp NOT NULL,
    deleted_on                        timestamp          DEFAULT NULL,
    location                          varchar(80)        DEFAULT NULL,
    permanent_location                varchar(80)        DEFAULT NULL,
    onloan                            date               DEFAULT NULL,
    cn_source                         varchar(10)        DEFAULT NULL,
    cn_sort                           varchar(255)       DEFAULT NULL,
    ccode                             varchar(80)        DEFAULT NULL,
    materials                         text               DEFAULT NULL,
    uri                               text               DEFAULT NULL,
    itype                             varchar(10)        DEFAULT NULL,
    more_subfields_xml                text               DEFAULT NULL,
    enumchron                         text               DEFAULT NULL,
    copynumber                        varchar(32)        DEFAULT NULL,
    stocknumber                       varchar(80)        DEFAULT NULL,
    new_status                        varchar(32)        DEFAULT NULL,
    exclude_from_local_holds_priority integer            DEFAULT NULL,
    CONSTRAINT items_itemnumber_pk PRIMARY KEY (itemnumber),
    CONSTRAINT items_ibfk_1 FOREIGN KEY (biblioitemnumber) REFERENCES biblioitems (biblioitemnumber) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT items_ibfk_2 FOREIGN KEY (homebranch) REFERENCES branches (branchcode) ON UPDATE CASCADE,
    CONSTRAINT items_ibfk_3 FOREIGN KEY (holdingbranch) REFERENCES branches (branchcode) ON UPDATE CASCADE,
    CONSTRAINT items_ibfk_4 FOREIGN KEY (biblionumber) REFERENCES biblio (biblionumber) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX items_itemstocknumberidx ON items (stocknumber);
CREATE INDEX items_itembinoidx ON items (biblioitemnumber);
CREATE INDEX items_itembibnoidx ON items (biblionumber);
CREATE INDEX items_homebranch_idx ON items (homebranch);
CREATE INDEX items_holdingbranch_idx ON items (holdingbranch);
CREATE INDEX items_itemcallnumber_idx ON items (itemcallnumber);
CREATE INDEX items_items_location_idx ON items (location);
CREATE INDEX items_items_ccode_idx ON items (ccode);
CREATE INDEX items_itype_idx ON items (itype);
CREATE INDEX items_timestamp_idx ON items (timestamp);

COMMENT
ON COLUMN items.itemnumber IS 'primary key and unique identifier added by Koha';

COMMENT
ON COLUMN items.biblionumber IS 'foreign key from biblio table used to link this item to the right bib record';

COMMENT
ON COLUMN items.biblioitemnumber IS 'foreign key from the biblioitems table to link to item to additional information';

COMMENT
ON COLUMN items.barcode IS 'item barcode (MARC21 952$p)';

COMMENT
ON COLUMN items.bookable IS 'nullable boolean value defining whether this this item is available for bookings or not';

COMMENT
ON COLUMN items.dateaccessioned IS 'date the item was acquired or added to Koha (MARC21 952$d)';

COMMENT
ON COLUMN items.booksellerid IS 'where the item was purchased (MARC21 952$e)';

COMMENT
ON COLUMN items.homebranch IS 'foreign key from the branches table for the library that owns this item (MARC21 952$a)';

COMMENT
ON COLUMN items.price IS 'purchase price (MARC21 952$g)';

COMMENT
ON COLUMN items.replacementprice IS 'cost the library charges to replace the item if it has been marked lost (MARC21 952$v)';

COMMENT
ON COLUMN items.replacementpricedate IS 'the date the price is effective from (MARC21 952$w)';

COMMENT
ON COLUMN items.datelastborrowed IS 'the date the item was last checked out/issued';

COMMENT
ON COLUMN items.datelastseen IS 'the date the item was last see (usually the last time the barcode was scanned or inventory was done)';

COMMENT
ON COLUMN items.notforloan IS 'authorized value defining why this item is not for loan (MARC21 952$7)';

COMMENT
ON COLUMN items.damaged IS 'authorized value defining this item as damaged (MARC21 952$4)';

COMMENT
ON COLUMN items.damaged_on IS 'the date and time an item was last marked as damaged, NULL if not damaged';

COMMENT
ON COLUMN items.itemlost IS 'authorized value defining this item as lost (MARC21 952$1)';

COMMENT
ON COLUMN items.itemlost_on IS 'the date and time an item was last marked as lost, NULL if not lost';

COMMENT
ON COLUMN items.withdrawn IS 'authorized value defining this item as withdrawn (MARC21 952$0)';

COMMENT
ON COLUMN items.withdrawn_on IS 'the date and time an item was last marked as withdrawn, NULL if not withdrawn';

COMMENT
ON COLUMN items.itemcallnumber IS 'call number for this item (MARC21 952$o)';

COMMENT
ON COLUMN items.coded_location_qualifier IS 'coded location qualifier(MARC21 952$f)';

COMMENT
ON COLUMN items.issues IS 'number of times this item has been checked out/issued';

COMMENT
ON COLUMN items.renewals IS 'number of times this item has been renewed';

COMMENT
ON COLUMN items.localuse IS 'number of times this item has been recorded as localuse';

COMMENT
ON COLUMN items.reserves IS 'number of times this item has been placed on hold/reserved';

COMMENT
ON COLUMN items.restricted IS 'authorized value defining use restrictions for this item (MARC21 952$5)';

COMMENT
ON COLUMN items.itemnotes IS 'public notes on this item (MARC21 952$z)';

COMMENT
ON COLUMN items.itemnotes_nonpublic IS 'non-public notes on this item (MARC21 952$x)';

COMMENT
ON COLUMN items.holdingbranch IS 'foreign key from the branches table for the library that is currently in possession item (MARC21 952$b)';

COMMENT
ON COLUMN items.timestamp IS 'date and time this item was last altered';

COMMENT
ON COLUMN items.deleted_on IS 'date/time of deletion';

COMMENT
ON COLUMN items.location IS 'authorized value for the shelving location for this item (MARC21 952$c)';

COMMENT
ON COLUMN items.permanent_location IS 'linked to the CART and PROC temporary locations feature, stores the permanent shelving location';

COMMENT
ON COLUMN items.onloan IS 'defines if item is checked out (NULL for not checked out, and due date for checked out)';

COMMENT
ON COLUMN items.cn_source IS 'classification source used on this item (MARC21 952$2)';

COMMENT
ON COLUMN items.cn_sort IS 'normalized form of the call number (MARC21 952$o) used for sorting';

COMMENT
ON COLUMN items.ccode IS 'authorized value for the collection code associated with this item (MARC21 952$8)';

COMMENT
ON COLUMN items.materials IS 'materials specified (MARC21 952$3)';

COMMENT
ON COLUMN items.uri IS 'URL for the item (MARC21 952$u)';

COMMENT
ON COLUMN items.itype IS 'foreign key from the itemtypes table defining the type for this item (MARC21 952$y)';

COMMENT
ON COLUMN items.more_subfields_xml IS 'additional 952 subfields in XML format';

COMMENT
ON COLUMN items.enumchron IS 'serial enumeration/chronology for the item (MARC21 952$h)';

COMMENT
ON COLUMN items.copynumber IS 'copy number (MARC21 952$t)';

COMMENT
ON COLUMN items.stocknumber IS 'inventory number (MARC21 952$i)';

COMMENT
ON COLUMN items.new_status IS 'new value, you can put whatever free-text information. This field is intended to be managed by the automatic_item_modification_by_age cronjob.';

COMMENT
ON COLUMN items.exclude_from_local_holds_priority IS 'Exclude this item from local holds priority';
