package com.spring.baemin.web.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = "com.spring.baemin.web")
public class DatabaseConfig {

    @Bean
    public DataSource dataSource() {
        HikariConfig config = new HikariConfig();
        config.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
        config.setUsername("java_web2");
        config.setPassword("202104");

        return new HikariDataSource(config);
    }

}
