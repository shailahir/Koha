DROP TABLE IF EXISTS account_debit_types_branches;

CREATE TABLE account_debit_types_branches
(
    debit_type_code varchar(80) DEFAULT NULL,
    branchcode      varchar(10) DEFAULT NULL,

    CONSTRAINT account_debit_types_branches_ibfk_1
        FOREIGN KEY (debit_type_code) REFERENCES account_debit_types (code) ON DELETE CASCADE,

    CONSTRAINT account_debit_types_branches_ibfk_2
        FOREIGN KEY (branchcode) REFERENCES branches (branchcode) ON DELETE CASCADE
);

CREATE INDEX account_debit_types_branches_debit_type_code_idx ON account_debit_types_branches (debit_type_code);
CREATE INDEX account_debit_types_branches_branch_code_idx ON account_debit_types_branches (branchcode);