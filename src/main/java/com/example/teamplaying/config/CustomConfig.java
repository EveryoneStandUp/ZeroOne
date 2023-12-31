package com.example.teamplaying.config;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;

import javax.sql.DataSource;

@Configuration
@EnableMethodSecurity
public class CustomConfig {

    @Value("${aws.accessKeyId}")
    private String accessKey;

    @Value("${aws.secretAccessKey}")
    private String secretKey;

    @Value("${aws.s3.bucketUrl}")
    private String bucketUrl;

    @Autowired
    private ServletContext application;

    @PostConstruct
    public void init() {
        application.setAttribute("bucketUrl", bucketUrl);
    }

    @Bean
    public S3Client s3client() {

        AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKey, secretKey);
        AwsCredentialsProvider provider = StaticCredentialsProvider.create(credentials);


        S3Client s3client = S3Client.builder().credentialsProvider(provider).region(Region.AP_NORTHEAST_2).build();

        return s3client;

    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityfilterchain(HttpSecurity http) throws Exception {
        // csrf 보안을 사용하지 않겠다는 것
        http.csrf().disable();

        http.formLogin().loginPage("/login").defaultSuccessUrl("/main");
        // 로그아웃 페이지 설정
        http.logout().logoutUrl("/logout").logoutSuccessUrl("/main");

        return http.build();
    }


}
