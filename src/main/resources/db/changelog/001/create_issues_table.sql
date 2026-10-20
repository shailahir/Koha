DROP TABLE IF EXISTS issues;

CREATE TABLE issues
(
    issue_id         integer   NOT NULL,
    borrowernumber   integer   NOT NULL,
    issuer_id        integer            DEFAULT NULL,
    itemnumber       integer   NOT NULL,
    booking_id       integer            DEFAULT NULL,
    date_due         timestamp          DEFAULT NULL,
    branchcode       varchar(10)        DEFAULT NULL,
    returndate       timestamp          DEFAULT NULL,
    checkin_library  varchar(10)        DEFAULT NULL,
    lastreneweddate  timestamp          DEFAULT NULL,
    renewals_count   integer   NOT NULL DEFAULT 0,
    unseen_renewals  integer   NOT NULL DEFAULT 0,
    auto_renew       integer            DEFAULT 0,
    auto_renew_error varchar(32)        DEFAULT NULL,
    timestamp        timestamp NOT NULL,
    issuedate        timestamp          DEFAULT NULL,
    onsite_checkout  integer   NOT NULL DEFAULT 0,
    note             text               DEFAULT NULL,
    notedate         timestamp          DEFAULT NULL,
    noteseen         integer            DEFAULT NULL,
    CONSTRAINT issues_pk PRIMARY KEY (issue_id),
    CONSTRAINT issues_booking_id_fk
        FOREIGN KEY (booking_id) REFERENCES bookings (booking_id) ON DELETE SET NULL ON UPDATE CASCADE,

    CONSTRAINT issues_ibfk_1
        FOREIGN KEY (borrowernumber) REFERENCES borrowers (borrowernumber) ON UPDATE CASCADE,

    CONSTRAINT issues_ibfk_2
        FOREIGN KEY (itemnumber) REFERENCES items (itemnumber) ON UPDATE CASCADE,

    CONSTRAINT issues_ibfk_borrowers_borrowernumber
        FOREIGN KEY (issuer_id) REFERENCES borrowers (borrowernumber) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE INDEX issues_issuesborridx ON issues (borrowernumber);
CREATE INDEX issues_itemnumber_idx ON issues (itemnumber);
CREATE INDEX issues_branchcode_idx ON issues (branchcode);
CREATE INDEX issues_bordate_idx ON issues (borrowernumber, timestamp);
CREATE INDEX issues_issues_ibfk_borrowers_borrowernumber_idx ON issues (issuer_id);
CREATE INDEX issues_issues_booking_id_fk_idx ON issues (booking_id);

COMMENT
ON COLUMN issues.issue_id IS 'primary key for issues table';

COMMENT
ON COLUMN issues.borrowernumber IS 'foreign key, linking this to the borrowers table for the patron this item was checked out to';

COMMENT
ON COLUMN issues.issuer_id IS 'foreign key, linking this to the borrowers table for the user who checked out this item';

COMMENT
ON COLUMN issues.itemnumber IS 'foreign key, linking this to the items table for the item that was checked out';

COMMENT
ON COLUMN issues.booking_id IS 'foreign key linking this checkout to the booking it fulfills';

COMMENT
ON COLUMN issues.date_due IS 'datetime the item is due (yyyy-mm-dd hh:mm::ss)';

COMMENT
ON COLUMN issues.branchcode IS 'foreign key, linking to the branches table for the location the item was checked out';

COMMENT
ON COLUMN issues.returndate IS 'date the item was returned, will be NULL until moved to old_issues';

COMMENT
ON COLUMN issues.checkin_library IS 'library the item was checked in at';

COMMENT
ON COLUMN issues.lastreneweddate IS 'date the item was last renewed';

COMMENT
ON COLUMN issues.renewals_count IS 'lists the number of times the item was renewed';

COMMENT
ON COLUMN issues.unseen_renewals IS 'lists the number of consecutive times the item was renewed without being seen';

COMMENT
ON COLUMN issues.auto_renew IS 'automatic renewal';

COMMENT
ON COLUMN issues.auto_renew_error IS 'automatic renewal error';

COMMENT
ON COLUMN issues.timestamp IS 'the date and time this record was last touched';

COMMENT
ON COLUMN issues.issuedate IS 'date the item was checked out or issued';

COMMENT
ON COLUMN issues.onsite_checkout IS 'in house use flag';

COMMENT
ON COLUMN issues.note IS 'issue note text';

COMMENT
ON COLUMN issues.notedate IS 'datetime of issue note (yyyy-mm-dd hh:mm::ss)';

COMMENT
ON COLUMN issues.noteseen IS 'describes whether checkout note has been seen 1, not been seen 0 or doesnt exist null';
