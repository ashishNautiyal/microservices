package com.hertz.solar.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.hertz.solar.entity.ScadaConfig;

public interface ScadaConfigRepository extends MongoRepository<ScadaConfig, String> {

}
