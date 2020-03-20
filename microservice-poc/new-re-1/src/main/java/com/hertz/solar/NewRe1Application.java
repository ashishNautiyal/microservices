package com.hertz.solar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@SpringBootApplication
@EnableMongoRepositories(basePackages = { "com.hertz.solar.repository"})
public class NewRe1Application {

	public static void main(String[] args) {
		SpringApplication.run(NewRe1Application.class, args);
	}

}
