DROP TABLE IF EXISTS account_credit_types_branches;

CREATE TABLE account_credit_types_branches
(
    credit_type_code varchar(80) DEFAULT NULL,
    branchcode       varchar(10) DEFAULT NULL,

    CONSTRAINT account_credit_types_branches_ibfk_1
        FOREIGN KEY (credit_type_code) REFERENCES account_credit_types (code) ON DELETE CASCADE,

    CONSTRAINT account_credit_types_branches_ibfk_2
        FOREIGN KEY (branchcode) REFERENCES branches (branchcode) ON DELETE CASCADE
);

CREATE INDEX account_credit_types_branches_credit_type_code_idx ON account_credit_types_branches (credit_type_code);
CREATE INDEX account_credit_types_branches_branch_code_idx ON account_credit_types_branches (branchcode);
