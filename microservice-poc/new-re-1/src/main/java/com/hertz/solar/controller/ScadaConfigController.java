package com.hertz.solar.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hertz.solar.entity.PoolingStation;
import com.hertz.solar.entity.ScadaConfig;
import com.hertz.solar.entity.ScadaConfigration;
import com.hertz.solar.repository.PoolingStationRepository;
import com.hertz.solar.repository.ScadaConfigurationRepository;
import com.hertz.solar.service.ScadaConfigService;

@RestController
public class ScadaConfigController {

	@javax.annotation.Resource
	private PoolingStationRepository poolingStationRepository;

	@javax.annotation.Resource
	private ScadaConfigurationRepository scadaConfigurationRepository;

	@javax.annotation.Resource
	private ScadaConfigService scadaConfigService;
	
	
	
	

	private static final Logger logger = LogManager.getLogger(ScadaConfigController.class.getName());

	@RequestMapping(value = "/scadaConfig", method = RequestMethod.GET)
	public ModelAndView scadaCongig() {
		logger.info("Ashish");
		logger.debug("john");
		List<PoolingStation> poolingStationList = this.poolingStationRepository.findAll();
		List<ScadaConfigration> scadaConfigurationsList = this.scadaConfigurationRepository.findAll();
		ModelAndView model = new ModelAndView();
		model.setViewName("scadaConfig");
		model.addObject("poolingStationList", poolingStationList);
		model.addObject("scadaConfigurationsList", scadaConfigurationsList);
		return model;
	}

	@RequestMapping(value = "/scadaConfig", method = RequestMethod.POST)
	public ResponseEntity<String> saveScadaConfig(@RequestBody ScadaConfig scadaconfig) {
		ScadaConfig scadaconfiguration = null;

		try {
			scadaconfiguration = this.scadaConfigService.saveScadaConfiguration(scadaconfig);

			if (scadaconfiguration != null) {
				return new ResponseEntity<String>("Success", HttpStatus.OK);

			}
		} catch (Exception e) {
			logger.error(e);
			return new ResponseEntity<String>("Fail", HttpStatus.OK);
		}

		return null;

	}
	
	

}
