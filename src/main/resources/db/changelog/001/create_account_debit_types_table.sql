DROP TABLE IF EXISTS account_debit_types;

CREATE TABLE account_debit_types
(
    code                varchar(80) NOT NULL,
    description         varchar(200)         DEFAULT NULL,
    can_be_invoiced     integer     NOT NULL DEFAULT 1,
    can_be_sold         integer     NOT NULL DEFAULT 0,
    default_amount      decimal(28, 6)       DEFAULT NULL,
    is_system           integer     NOT NULL DEFAULT 0,
    archived            integer     NOT NULL DEFAULT 0,
    restricts_checkouts integer     NOT NULL DEFAULT 1,
    CONSTRAINT account_debit_types_pk PRIMARY KEY (code)
);

COMMENT
ON COLUMN account_debit_types.can_be_invoiced IS 'boolean flag to denote if this debit type is available for manual invoicing';

COMMENT
ON COLUMN account_debit_types.can_be_sold IS 'boolean flag to denote if this debit type is available at point of sale';

COMMENT
ON COLUMN account_debit_types.archived IS 'boolean flag to denote if this till is archived or not';

COMMENT
ON COLUMN account_debit_types.restricts_checkouts IS 'boolean flag to denote if the noissuescharge syspref for this debit type is active';
