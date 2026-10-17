package com.shailahir.apps.koha;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableJpaRepositories
@EnableTransactionManagement
@SpringBootApplication
public class KohaApplication {

    static void main(String[] args) {
        SpringApplication.run(KohaApplication.class, args);
    }
}
