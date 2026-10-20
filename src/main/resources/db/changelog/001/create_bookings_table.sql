DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings
(
    booking_id          integer     NOT NULL,
    patron_id           integer     NOT NULL DEFAULT 0,
    biblio_id           integer     NOT NULL DEFAULT 0,
    item_id             integer              DEFAULT NULL,
    pickup_library_id   varchar(10) NOT NULL,
    start_date          timestamp            DEFAULT NULL,
    end_date            timestamp            DEFAULT NULL,
    creation_date       timestamp   NOT NULL,
    modification_date   timestamp   NOT NULL,
    status              varchar(20) NOT NULL DEFAULT 'new',
    cancellation_reason varchar(80)          DEFAULT NULL,

    CONSTRAINT bookings_pk PRIMARY KEY (booking_id),

    CONSTRAINT bookings_status_check
        CHECK (status IN ('new', 'cancelled', 'issued', 'completed')),

    CONSTRAINT bookings_ibfk_1
        FOREIGN KEY (patron_id) REFERENCES borrowers (borrowernumber) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT bookings_ibfk_2
        FOREIGN KEY (biblio_id) REFERENCES biblio (biblionumber) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT bookings_ibfk_3
        FOREIGN KEY (item_id) REFERENCES items (itemnumber) ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT bookings_ibfk_4
        FOREIGN KEY (pickup_library_id) REFERENCES branches (branchcode) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX bookings_patron_id_idx ON bookings (patron_id);
CREATE INDEX bookings_biblio_id_idx ON bookings (biblio_id);
CREATE INDEX bookings_item_id_idx ON bookings (item_id);
CREATE INDEX bookings_pickup_library_id_idx ON bookings (pickup_library_id);

COMMENT
ON COLUMN bookings.booking_id IS 'primary key';

COMMENT
ON COLUMN bookings.patron_id IS 'foreign key from the borrowers table defining which patron this booking is for';

COMMENT
ON COLUMN bookings.biblio_id IS 'foreign key from the biblio table defining which bib record this booking is on';

COMMENT
ON COLUMN bookings.item_id IS 'foreign key from the items table defining the specific item the patron has placed a booking for';

COMMENT
ON COLUMN bookings.pickup_library_id IS 'Identifier for booking pickup library';

COMMENT
ON COLUMN bookings.start_date IS 'the start date of the booking';

COMMENT
ON COLUMN bookings.end_date IS 'the end date of the booking';

COMMENT
ON COLUMN bookings.creation_date IS 'the timestamp for when a booking was created';

COMMENT
ON COLUMN bookings.modification_date IS 'the timestamp for when a booking has been updated';

COMMENT
ON COLUMN bookings.status IS 'current status of the booking';

COMMENT
ON COLUMN bookings.cancellation_reason IS 'optional authorised value BOOKING_CANCELLATION';
