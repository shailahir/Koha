package com.shailahir.apps.koha.config;

import liquibase.integration.spring.SpringLiquibase;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBooleanProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@ConditionalOnBooleanProperty(name = "spring.liquibase.enabled")
public class LiquibaseConfig {

    private final DataSource dataSource;
    private String changeLogFileName;

    public LiquibaseConfig(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Bean
    public SpringLiquibase springLiquibase() {
        SpringLiquibase liquibase = new SpringLiquibase();
        liquibase.setDataSource(dataSource);
        liquibase.setChangeLog(changeLogFileName);

        return liquibase;
    }

    @Value("${spring.liquibase.change-log}")
    public void setChangeLogFileName(String changeLogFileName) {
        this.changeLogFileName = changeLogFileName;
    }
}
