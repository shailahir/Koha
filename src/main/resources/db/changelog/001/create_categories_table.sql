DROP TABLE IF EXISTS categories;

CREATE TABLE categories
(
    categorycode                           varchar(10)  NOT NULL DEFAULT '',
    description                            text                  DEFAULT NULL,
    enrolmentperiod                        smallint              DEFAULT NULL,
    enrolmentperioddate                    date                  DEFAULT NULL,
    password_expiry_days                   smallint              DEFAULT NULL,
    upperagelimit                          smallint              DEFAULT NULL,
    dateofbirthrequired                    smallint              DEFAULT NULL,
    enrolmentfee                           decimal(28, 6)        DEFAULT NULL,
    overduenoticerequired                  smallint              DEFAULT NULL,
    hidelostitems                          smallint     NOT NULL DEFAULT 0,
    category_type                          varchar(1)   NOT NULL DEFAULT 'A',
    BlockExpiredPatronOpacActions          varchar(128) NOT NULL DEFAULT 'follow_syspref_BlockExpiredPatronOpacActions',
    default_privacy                        varchar(10)  NOT NULL DEFAULT 'default',
    checkprevcheckout                      varchar(10)  NOT NULL DEFAULT 'inherit',
    can_place_ill_in_opac                  smallint     NOT NULL DEFAULT 1,
    can_be_guarantee                       smallint     NOT NULL DEFAULT 0,
    reset_password                         smallint              DEFAULT NULL,
    change_password                        smallint              DEFAULT NULL,
    min_password_length                    smallint              DEFAULT NULL,
    require_strong_password                smallint              DEFAULT NULL,
    force_password_reset_when_set_by_staff smallint              DEFAULT NULL,
    exclude_from_local_holds_priority      smallint              DEFAULT NULL,
    noissuescharge                         integer               DEFAULT NULL,
    noissueschargeguarantees               integer               DEFAULT NULL,
    noissueschargeguarantorswithguarantees integer               DEFAULT NULL,
    enforce_expiry_notice                  smallint     NOT NULL DEFAULT 0,
    self_renewal_enabled                   smallint     NOT NULL DEFAULT 0,
    self_renewal_availability_start        smallint              DEFAULT NULL,
    self_renewal_fines_block               integer               DEFAULT NULL,
    self_renewal_if_expired                smallint              DEFAULT 0,
    self_renewal_failure_message           text                  DEFAULT NULL,
    self_renewal_information_message       text                  DEFAULT NULL,

    CONSTRAINT categories_default_privacy_check
        CHECK (default_privacy IN ('default', 'never', 'forever')),

    CONSTRAINT categories_checkprevcheckout_check
        CHECK (checkprevcheckout IN ('yes', 'no', 'inherit')),

    CONSTRAINT categories_pkey PRIMARY KEY (categorycode)
);

COMMENT
ON COLUMN categories.categorycode IS 'unique primary key used to identify the patron category';

COMMENT
ON COLUMN categories.description IS 'description of the patron category';

COMMENT
ON COLUMN categories.enrolmentperiod IS 'number of months the patron is enrolled for (will be NULL if enrolmentperioddate is set)';

COMMENT
ON COLUMN categories.enrolmentperioddate IS 'date the patron is enrolled until (will be NULL if enrolmentperiod is set)';

COMMENT
ON COLUMN categories.password_expiry_days IS 'number of days after which the patron must reset their password';

COMMENT
ON COLUMN categories.upperagelimit IS 'age limit for the patron';

COMMENT
ON COLUMN categories.dateofbirthrequired IS 'the minimum age required for the patron category';

COMMENT
ON COLUMN categories.enrolmentfee IS 'enrollment fee for the patron';

COMMENT
ON COLUMN categories.overduenoticerequired IS 'are overdue notices sent to this patron category (1 for yes, 0 for no)';

COMMENT
ON COLUMN categories.hidelostitems IS 'are lost items shown to this category (1 for yes, 0 for no)';

COMMENT
ON COLUMN categories.category_type IS 'type of Koha patron (Adult, Child, Professional, Organizational, Statistical, Staff)';

COMMENT
ON COLUMN categories.BlockExpiredPatronOpacActions IS 'specific actions expired patrons of this category are blocked from performing or if the BlockExpiredPatronOpacActions system preference is to be followed';

COMMENT
ON COLUMN categories.default_privacy IS 'Default privacy setting for this patron category';

COMMENT
ON COLUMN categories.checkprevcheckout IS 'produce a warning for this patron category if this item has previously been checked out to this patron if "yes", not if "no", defer to syspref setting if "inherit".';

COMMENT
ON COLUMN categories.can_place_ill_in_opac IS 'can this patron category place interlibrary loan requests';

COMMENT
ON COLUMN categories.can_be_guarantee IS 'if patrons of this category can be guarantees';

COMMENT
ON COLUMN categories.reset_password IS 'if patrons of this category can do the password reset flow';

COMMENT
ON COLUMN categories.change_password IS 'if patrons of this category can change their passwords in the OAPC';

COMMENT
ON COLUMN categories.min_password_length IS 'set minimum password length for patrons in this category';

COMMENT
ON COLUMN categories.require_strong_password IS 'set required password strength for patrons in this category';

COMMENT
ON COLUMN categories.force_password_reset_when_set_by_staff IS 'if patrons of this category are required to reset password after being created by a staff member';

COMMENT
ON COLUMN categories.exclude_from_local_holds_priority IS 'Exclude patrons of this category from local holds priority';

COMMENT
ON COLUMN categories.noissuescharge IS 'define maximum amount outstanding before checkouts are blocked';

COMMENT
ON COLUMN categories.noissueschargeguarantees IS 'define maximum amount that the guarantees of a patron in this category can have outstanding before checkouts are blocked';

COMMENT
ON COLUMN categories.noissueschargeguarantorswithguarantees IS 'define maximum amount that the guarantors with guarantees of a patron in this category can have outstanding before checkouts are blocked';

COMMENT
ON COLUMN categories.enforce_expiry_notice IS 'enforce the patron expiry notice for this category';

COMMENT
ON COLUMN categories.self_renewal_enabled IS 'allow self renewal for this category';

COMMENT
ON COLUMN categories.self_renewal_availability_start IS 'how long before the patron expiry date self-renewal should be made available (overrides system default of NotifyBorrowerDeparture)';

COMMENT
ON COLUMN categories.self_renewal_fines_block IS 'the amount owed in fines before self renewal is blocked (overrides system default of noissuescharge)';

COMMENT
ON COLUMN categories.self_renewal_if_expired IS 'how long after expiry a patron can self renew their account';

COMMENT
ON COLUMN categories.self_renewal_failure_message IS 'the message to display if self renewal is not successful';

COMMENT
ON COLUMN categories.self_renewal_information_message IS 'the message to display before the self renewal process starts';
