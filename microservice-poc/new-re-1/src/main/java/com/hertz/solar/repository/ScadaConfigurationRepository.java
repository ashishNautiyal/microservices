package com.hertz.solar.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.hertz.solar.entity.ScadaConfigration;


@Repository("scadaConfigurationRepository")
public interface ScadaConfigurationRepository extends MongoRepository<ScadaConfigration, String>  {
	
	

}
