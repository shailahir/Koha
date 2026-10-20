DROP TABLE IF EXISTS account_credit_types;

CREATE TABLE account_credit_types
(
    code                  varchar(80) NOT NULL,
    description           varchar(200)         DEFAULT NULL,
    can_be_added_manually integer     NOT NULL DEFAULT 1,
    credit_number_enabled integer     NOT NULL DEFAULT 0,
    is_system             integer     NOT NULL DEFAULT 0,
    archived              integer     NOT NULL DEFAULT 0,
    CONSTRAINT account_credit_types_pkey PRIMARY KEY (code)
);

COMMENT
ON COLUMN account_credit_types.credit_number_enabled IS 'Is autogeneration of credit number enabled for this credit type';

COMMENT
ON COLUMN account_credit_types.archived IS 'boolean flag to denote if this till is archived or not';
