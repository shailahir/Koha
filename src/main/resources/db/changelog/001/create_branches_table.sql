DROP TABLE IF EXISTS branches;

CREATE TABLE branches
(
    branchcode       varchar(10) NOT NULL DEFAULT '',
    branchname       text        NOT NULL,
    branchaddress1   text                 DEFAULT NULL,
    branchaddress2   text                 DEFAULT NULL,
    branchaddress3   text                 DEFAULT NULL,
    branchzip        varchar(25)          DEFAULT NULL,
    branchcity       text                 DEFAULT NULL,
    branchstate      text                 DEFAULT NULL,
    branchcountry    text                 DEFAULT NULL,
    branchphone      text                 DEFAULT NULL,
    branchfax        text                 DEFAULT NULL,
    branchemail      text                 DEFAULT NULL,
    branchillemail   text                 DEFAULT NULL,
    branchreplyto    text                 DEFAULT NULL,
    branchreturnpath text                 DEFAULT NULL,
    branchurl        text                 DEFAULT NULL,
    issuing          smallint             DEFAULT NULL,
    branchip         varchar(15)          DEFAULT NULL,
    branchnotes      text                 DEFAULT NULL,
    geolocation      varchar(255)         DEFAULT NULL,
    marcorgcode      varchar(16)          DEFAULT NULL,
    pickup_location  smallint    NOT NULL DEFAULT 1,
    public           smallint    NOT NULL DEFAULT 1,
    opacuserjs       text                 DEFAULT NULL,
    opacusercss      text                 DEFAULT NULL,
    CONSTRAINT branches_pkey PRIMARY KEY (branchcode)
);

COMMENT
ON COLUMN branches.branchcode IS 'a unique key assigned to each branch';

COMMENT
ON COLUMN branches.branchname IS 'the name of your library or branch';

COMMENT
ON COLUMN branches.branchaddress1 IS 'the first address line of for your library or branch';

COMMENT
ON COLUMN branches.branchaddress2 IS 'the second address line of for your library or branch';

COMMENT
ON COLUMN branches.branchaddress3 IS 'the third address line of for your library or branch';

COMMENT
ON COLUMN branches.branchzip IS 'the zip or postal code for your library or branch';

COMMENT
ON COLUMN branches.branchcity IS 'the city or province for your library or branch';

COMMENT
ON COLUMN branches.branchstate IS 'the state for your library or branch';

COMMENT
ON COLUMN branches.branchcountry IS 'the county for your library or branch';

COMMENT
ON COLUMN branches.branchphone IS 'the primary phone for your library or branch';

COMMENT
ON COLUMN branches.branchfax IS 'the fax number for your library or branch';

COMMENT
ON COLUMN branches.branchemail IS 'the primary email address for your library or branch';

COMMENT
ON COLUMN branches.branchillemail IS 'the ILL staff email address for your library or branch';

COMMENT
ON COLUMN branches.branchreplyto IS 'the email to be used as a Reply-To';

COMMENT
ON COLUMN branches.branchreturnpath IS 'the email to be used as Return-Path';

COMMENT
ON COLUMN branches.branchurl IS 'the URL for your library or branch website';

COMMENT
ON COLUMN branches.issuing IS 'unused in Koha';

COMMENT
ON COLUMN branches.branchip IS 'the IP address for your library or branch';

COMMENT
ON COLUMN branches.branchnotes IS 'notes related to your library or branch';

COMMENT
ON COLUMN branches.geolocation IS 'geolocation of your library';

COMMENT
ON COLUMN branches.marcorgcode IS 'MARC Organization Code, see http://www.loc.gov/marc/organizations/orgshome.html, when empty defaults to syspref MARCOrgCode';

COMMENT
ON COLUMN branches.pickup_location IS 'the ability to act as a pickup location';

COMMENT
ON COLUMN branches.public IS 'whether this library should show in the opac';

COMMENT
ON COLUMN branches.opacuserjs IS 'branch specific javascript for the OPAC';

COMMENT
ON COLUMN branches.opacusercss IS 'branch specific css for the OPAC';
