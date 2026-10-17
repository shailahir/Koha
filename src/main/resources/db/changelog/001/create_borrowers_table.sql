DROP TABLE IF EXISTS borrowers;

CREATE TABLE borrowers
(
    borrowernumber              BIGINT,
    cardnumber                  VARCHAR(32)          DEFAULT NULL,
    surname                     TEXT                 DEFAULT NULL,
    firstname                   TEXT                 DEFAULT NULL,
    preferred_name              TEXT                 DEFAULT NULL,
    middle_name                 TEXT                 DEFAULT NULL,
    title                       TEXT                 DEFAULT NULL,
    othernames                  TEXT                 DEFAULT NULL,
    initials                    TEXT                 DEFAULT NULL,
    pronouns                    TEXT                 DEFAULT NULL,
    streetnumber                TEXT                 DEFAULT NULL,
    streettype                  TEXT                 DEFAULT NULL,
    address                     TEXT                 DEFAULT NULL,
    address2                    TEXT                 DEFAULT NULL,
    city                        TEXT                 DEFAULT NULL,
    state                       TEXT                 DEFAULT NULL,
    zipcode                     TEXT                 DEFAULT NULL,
    country                     TEXT                 DEFAULT NULL,
    email                       TEXT                 DEFAULT NULL,
    phone                       TEXT                 DEFAULT NULL,
    mobile                      TEXT                 DEFAULT NULL,
    fax                         TEXT                 DEFAULT NULL,
    emailpro                    TEXT                 DEFAULT NULL,
    phonepro                    TEXT                 DEFAULT NULL,
    "B_streetnumber"            TEXT                 DEFAULT NULL,
    "B_streettype"              TEXT                 DEFAULT NULL,
    "B_address"                 TEXT                 DEFAULT NULL,
    "B_address2"                TEXT                 DEFAULT NULL,
    "B_city"                    TEXT                 DEFAULT NULL,
    "B_state"                   TEXT                 DEFAULT NULL,
    "B_zipcode"                 TEXT                 DEFAULT NULL,
    "B_country"                 TEXT                 DEFAULT NULL,
    "B_email"                   TEXT                 DEFAULT NULL,
    "B_phone"                   TEXT                 DEFAULT NULL,
    dateofbirth                 DATE                 DEFAULT NULL,
    branchcode                  VARCHAR(10) NOT NULL DEFAULT '',
    categorycode                VARCHAR(10) NOT NULL DEFAULT '',
    dateenrolled                DATE                 DEFAULT NULL,
    dateexpiry                  DATE                 DEFAULT NULL,
    password_expiration_date    DATE                 DEFAULT NULL,
    date_renewed                DATE                 DEFAULT NULL,
    gonenoaddress               SMALLINT             DEFAULT NULL,
    lost                        SMALLINT             DEFAULT NULL,
    debarred                    DATE                 DEFAULT NULL,
    debarredcomment             VARCHAR(255)         DEFAULT NULL,
    contactname                 TEXT                 DEFAULT NULL,
    contactfirstname            TEXT                 DEFAULT NULL,
    contacttitle                TEXT                 DEFAULT NULL,
    borrowernotes               TEXT                 DEFAULT NULL,
    relationship                VARCHAR(100)         DEFAULT NULL,
    sex                         VARCHAR(1)           DEFAULT NULL,
    password                    VARCHAR(60)          DEFAULT NULL,
    secret                      TEXT                 DEFAULT NULL,
    auth_method                 VARCHAR(20) NOT NULL DEFAULT 'password',
    flags                       BIGINT               DEFAULT NULL,
    userid                      VARCHAR(75)          DEFAULT NULL,
    opacnote                    TEXT                 DEFAULT NULL,
    contactnote                 VARCHAR(255)         DEFAULT NULL,
    sort1                       VARCHAR(80)          DEFAULT NULL,
    sort2                       VARCHAR(80)          DEFAULT NULL,
    altcontactfirstname         TEXT                 DEFAULT NULL,
    altcontactsurname           TEXT                 DEFAULT NULL,
    altcontactaddress1          TEXT                 DEFAULT NULL,
    altcontactaddress2          TEXT                 DEFAULT NULL,
    altcontactaddress3          TEXT                 DEFAULT NULL,
    altcontactstate             TEXT                 DEFAULT NULL,
    altcontactzipcode           TEXT                 DEFAULT NULL,
    altcontactcountry           TEXT                 DEFAULT NULL,
    altcontactphone             TEXT                 DEFAULT NULL,
    smsalertnumber              VARCHAR(50)          DEFAULT NULL,
    sms_provider_id             INTEGER              DEFAULT NULL,
    privacy                     INTEGER     NOT NULL DEFAULT 1,
    privacy_guarantor_fines     SMALLINT    NOT NULL DEFAULT 0,
    privacy_guarantor_checkouts SMALLINT    NOT NULL DEFAULT 0,
    checkprevcheckout           VARCHAR(10) NOT NULL DEFAULT 'inherit',
    updated_on                  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    lastseen                    TIMESTAMP            DEFAULT NULL,
    lang                        VARCHAR(25) NOT NULL DEFAULT 'default',
    login_attempts              INTEGER     NOT NULL DEFAULT 0,
    overdrive_auth_token        TEXT                 DEFAULT NULL,
    anonymized                  SMALLINT    NOT NULL DEFAULT 0,
    autorenew_checkouts         SMALLINT    NOT NULL DEFAULT 1,
    primary_contact_method      VARCHAR(45)          DEFAULT NULL,
    protected                   SMALLINT    NOT NULL DEFAULT 0,
    version                     SMALLINT,

    CONSTRAINT borrowers_pkey
        PRIMARY KEY (borrowernumber),

    CONSTRAINT borrowers_cardnumber_key
        UNIQUE (cardnumber),

    CONSTRAINT borrowers_userid_key
        UNIQUE (userid),

    CONSTRAINT borrowers_auth_method_check
        CHECK (auth_method IN ('password', 'two-factor')),

    CONSTRAINT borrowers_checkprevcheckout_check
        CHECK (checkprevcheckout IN ('yes', 'no', 'inherit')),

    CONSTRAINT borrowers_ibfk_1
        FOREIGN KEY (categorycode)
            REFERENCES categories (categorycode),

    CONSTRAINT borrowers_ibfk_2
        FOREIGN KEY (branchcode)
            REFERENCES branches (branchcode),

    CONSTRAINT borrowers_ibfk_3
        FOREIGN KEY (sms_provider_id)
            REFERENCES sms_providers (id)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

-- Indexes
CREATE INDEX borrowers_categorycode_idx ON borrowers (categorycode);
CREATE INDEX borrowers_branchcode_idx ON borrowers (branchcode);
CREATE INDEX borrowers_surname_idx ON borrowers (surname);
CREATE INDEX borrowers_firstname_idx ON borrowers (firstname);
CREATE INDEX borrowers_othernames_idx ON borrowers (othernames);
CREATE INDEX borrowers_sms_provider_id_idx ON borrowers (sms_provider_id);
CREATE INDEX borrowers_middle_name_idx ON borrowers (middle_name);
CREATE INDEX borrowers_preferred_name_idx ON borrowers (preferred_name);

CREATE INDEX borrowers_sort_order_idx ON borrowers (
                                                    surname, preferred_name, firstname, middle_name, othernames,
                                                    streetnumber, address, address2, city, state, zipcode, country
    );

-- Column comments
COMMENT
ON COLUMN borrowers.borrowernumber IS 'primary key, Koha assigned ID number for patrons/borrowers';

COMMENT
ON COLUMN borrowers.cardnumber IS 'unique key, library assigned ID number for patrons/borrowers';

COMMENT
ON COLUMN borrowers.surname IS 'patron/borrowers last name (surname)';

COMMENT
ON COLUMN borrowers.firstname IS 'patron/borrowers first name';

COMMENT
ON COLUMN borrowers.preferred_name IS 'patron/borrowers preferred name';

COMMENT
ON COLUMN borrowers.middle_name IS 'patron/borrowers middle name';

COMMENT
ON COLUMN borrowers.title IS 'patron/borrowers title, for example: Mr. or Mrs.';

COMMENT
ON COLUMN borrowers.othernames IS 'any other names associated with the patron/borrower';

COMMENT
ON COLUMN borrowers.initials IS 'initials for your patron/borrower';

COMMENT
ON COLUMN borrowers.pronouns IS 'patron/borrower pronouns';

COMMENT
ON COLUMN borrowers.streetnumber IS 'the house number for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.streettype IS 'the street type (Rd., Blvd, etc) for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.address IS 'the first address line for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.address2 IS 'the second address line for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.city IS 'the city or town for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.state IS 'the state or province for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.zipcode IS 'the zip or postal code for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.country IS 'the country for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.email IS 'the primary email address for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.phone IS 'the primary phone number for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.mobile IS 'the other phone number for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.fax IS 'the fax number for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.emailpro IS 'the secondary email address for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers.phonepro IS 'the secondary phone number for your patron/borrowers primary address';

COMMENT
ON COLUMN borrowers."B_streetnumber" IS 'the house number for your patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers."B_streettype" IS 'the street type (Rd., Blvd, etc) for your patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers."B_address" IS 'the first address line for your patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers."B_address2" IS 'the second address line for your patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers."B_city" IS 'the city or town for your patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers."B_state" IS 'the state for your patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers."B_zipcode" IS 'the zip or postal code for your patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers."B_country" IS 'the country for your patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers."B_email" IS 'the patron/borrowers alternate email address';

COMMENT
ON COLUMN borrowers."B_phone" IS 'the patron/borrowers alternate phone number';

COMMENT
ON COLUMN borrowers.dateofbirth IS 'the patron/borrowers date of birth (YYYY-MM-DD)';

COMMENT
ON COLUMN borrowers.branchcode IS 'foreign key from the branches table, includes the code of the patron/borrowers home branch';

COMMENT
ON COLUMN borrowers.categorycode IS 'foreign key from the categories table, includes the code of the patron category';

COMMENT
ON COLUMN borrowers.dateenrolled IS 'date the patron was added to Koha (YYYY-MM-DD)';

COMMENT
ON COLUMN borrowers.dateexpiry IS 'date the patron/borrowers card is set to expire (YYYY-MM-DD)';

COMMENT
ON COLUMN borrowers.password_expiration_date IS 'date the patron/borrowers password is set to expire (YYYY-MM-DD)';

COMMENT
ON COLUMN borrowers.date_renewed IS 'date the patron/borrowers card was last renewed';

COMMENT
ON COLUMN borrowers.gonenoaddress IS 'set to 1 for yes and 0 for no, flag to note that library marked this patron/borrower as having an unconfirmed address';

COMMENT
ON COLUMN borrowers.lost IS 'set to 1 for yes and 0 for no, flag to note that library marked this patron/borrower as having lost their card';

COMMENT
ON COLUMN borrowers.debarred IS 'until this date the patron can only check-in (no loans, no holds, etc.), is a fine based on days instead of money (YYYY-MM-DD)';

COMMENT
ON COLUMN borrowers.debarredcomment IS 'comment on the stop of the patron';

COMMENT
ON COLUMN borrowers.contactname IS 'used for children and professionals to include surname or last name of guarantor or organization name';

COMMENT
ON COLUMN borrowers.contactfirstname IS 'used for children to include first name of guarantor';

COMMENT
ON COLUMN borrowers.contacttitle IS 'used for children to include title (Mr., Mrs., etc) of guarantor';

COMMENT
ON COLUMN borrowers.borrowernotes IS 'a note on the patron/borrowers account that is only visible in the staff interface';

COMMENT
ON COLUMN borrowers.relationship IS 'used for children to include the relationship to their guarantor';

COMMENT
ON COLUMN borrowers.sex IS 'patron/borrowers gender';

COMMENT
ON COLUMN borrowers.password IS 'patron/borrowers Bcrypt encrypted password';

COMMENT
ON COLUMN borrowers.secret IS 'Secret for 2FA';

COMMENT
ON COLUMN borrowers.auth_method IS 'Authentication method';

COMMENT
ON COLUMN borrowers.flags IS 'will include a number associated with the staff members permissions';

COMMENT
ON COLUMN borrowers.userid IS 'patron/borrowers opac and/or staff interface log in';

COMMENT
ON COLUMN borrowers.opacnote IS 'a note on the patron/borrowers account that is visible in the OPAC and staff interface';

COMMENT
ON COLUMN borrowers.contactnote IS 'a note related to the patron/borrowers alternate address';

COMMENT
ON COLUMN borrowers.sort1 IS 'a field that can be used for any information unique to the library';

COMMENT
ON COLUMN borrowers.sort2 IS 'a field that can be used for any information unique to the library';

COMMENT
ON COLUMN borrowers.altcontactfirstname IS 'first name of alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.altcontactsurname IS 'surname or last name of the alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.altcontactaddress1 IS 'the first address line for the alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.altcontactaddress2 IS 'the second address line for the alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.altcontactaddress3 IS 'the city for the alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.altcontactstate IS 'the state for the alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.altcontactzipcode IS 'the zipcode for the alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.altcontactcountry IS 'the country for the alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.altcontactphone IS 'the phone number for the alternate contact for the patron/borrower';

COMMENT
ON COLUMN borrowers.smsalertnumber IS 'the mobile phone number where the patron/borrower would like to receive notices (if SMS turned on)';

COMMENT
ON COLUMN borrowers.sms_provider_id IS 'the provider of the mobile phone number defined in smsalertnumber';

COMMENT
ON COLUMN borrowers.privacy IS 'patron/borrowers privacy settings related to their checkout history';

COMMENT
ON COLUMN borrowers.privacy_guarantor_fines IS 'controls if relatives can see this patrons fines';

COMMENT
ON COLUMN borrowers.privacy_guarantor_checkouts IS 'controls if relatives can see this patrons checkouts';

COMMENT
ON COLUMN borrowers.checkprevcheckout IS 'produce a warning for this patron if this item has previously been checked out to this patron if yes, not if no, defer to category setting if inherit.';

COMMENT
ON COLUMN borrowers.updated_on IS 'time of last change could be useful for synchronization with external systems (among others)';

COMMENT
ON COLUMN borrowers.lastseen IS 'last time a patron has been seen (connected at the OPAC or staff interface)';

COMMENT
ON COLUMN borrowers.lang IS 'lang to use to send notices to this patron';

COMMENT
ON COLUMN borrowers.login_attempts IS 'number of failed login attempts';

COMMENT
ON COLUMN borrowers.overdrive_auth_token IS 'persist OverDrive auth token';

COMMENT
ON COLUMN borrowers.anonymized IS 'flag for data anonymization';

COMMENT
ON COLUMN borrowers.autorenew_checkouts IS 'flag for allowing auto-renewal';

COMMENT
ON COLUMN borrowers.primary_contact_method IS 'useful for reporting purposes';

COMMENT
ON COLUMN borrowers.protected IS 'boolean flag to mark selected patrons as protected from deletion';

