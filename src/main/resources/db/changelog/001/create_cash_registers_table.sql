DROP TABLE IF EXISTS cash_registers;

CREATE TABLE cash_registers
(
    id             integer     NOT NULL,
    name           varchar(24) NOT NULL,
    description    text        NOT NULL,
    branch         varchar(10) NOT NULL,
    branch_default integer     NOT NULL DEFAULT 0,
    starting_float decimal(28, 6)       DEFAULT NULL,
    archived       integer     NOT NULL DEFAULT 0,
    CONSTRAINT cash_registers_pk PRIMARY KEY (id),
    CONSTRAINT cash_registers_branch_fk
        FOREIGN KEY (branch) REFERENCES branches (branchcode) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX cash_registers_branch_idx ON cash_registers(branch);

COMMENT
ON COLUMN cash_registers.id IS 'unique identifier for each account register';

COMMENT
ON COLUMN cash_registers.name IS 'the user friendly identifier for each account register';

COMMENT
ON COLUMN cash_registers.description IS 'the user friendly description for each account register';

COMMENT
ON COLUMN cash_registers.branch IS 'the foreign key the library this account register belongs';

COMMENT
ON COLUMN cash_registers.branch_default IS 'boolean flag to denote that this till is the branch default';

COMMENT
ON COLUMN cash_registers.starting_float IS 'the starting float this account register should be assigned';

COMMENT
ON COLUMN cash_registers.archived IS 'boolean flag to denote if this till is archived or not';
