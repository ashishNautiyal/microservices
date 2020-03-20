package com.techprimers.stock.stockservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class StockServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(StockServiceApplication.class, args);
	}

	protected SpringApplicationBuilder configure(SpringApplicationBuilder applicationBuilder) {
		return applicationBuilder.sources(StockServiceApplication.class);
	}
}
