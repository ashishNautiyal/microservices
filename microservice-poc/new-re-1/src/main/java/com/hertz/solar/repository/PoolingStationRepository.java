package com.hertz.solar.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.hertz.solar.entity.PoolingStation;


public interface  PoolingStationRepository extends MongoRepository<PoolingStation, String>  {

}
