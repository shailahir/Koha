DROP TABLE IF EXISTS sms_providers;

CREATE TABLE sms_providers
(
    id     integer      NOT NULL,
    name   varchar(255) NOT NULL,
    domain varchar(255) NOT NULL,
    CONSTRAINT sms_providers_pkey PRIMARY KEY (id),
    CONSTRAINT sms_providers_name_uniq_key UNIQUE (name)
);