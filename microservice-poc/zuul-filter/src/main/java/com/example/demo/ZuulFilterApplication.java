package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@EnableZuulProxy
@EnableDiscoveryClient
@SpringBootApplication
public class ZuulFilterApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZuulFilterApplication.class, args);
	}

	/*
	 * @Bean public CorsFilter corsFilter() {
	 * 
	 * UrlBasedCorsConfigurationSource source = new
	 * UrlBasedCorsConfigurationSource(); CorsConfiguration config = new
	 * CorsConfiguration(); config.setAllowCredentials(true); //
	 * config.addAllowedOrigin("http://domain1.com"); //
	 * config.setAllowedOrigins(Arrays.asList("https://example.com"));
	 * config.addAllowedOrigin("*"); config.addAllowedHeader("*");
	 * config.addAllowedMethod("GET"); config.addAllowedMethod("PUT");
	 * source.registerCorsConfiguration("/**", config); return new
	 * CorsFilter(source); }
	 */

}
