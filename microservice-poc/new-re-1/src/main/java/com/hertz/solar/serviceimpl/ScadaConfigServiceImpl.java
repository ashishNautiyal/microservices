package com.hertz.solar.serviceimpl;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hertz.solar.entity.ScadaConfig;
import com.hertz.solar.repository.ScadaConfigRepository;
import com.hertz.solar.service.ScadaConfigService;

@Service("scadaConfigService")
public class ScadaConfigServiceImpl implements ScadaConfigService {

	private static final Logger logger = LogManager.getLogger(ScadaConfigServiceImpl.class.getName());

	@Resource
	ScadaConfigRepository scadaConfigRepository;

	@Override
	public ScadaConfig saveScadaConfiguration(ScadaConfig scadaconfig) {
		ScadaConfig scadaconfiguration = null;
		try {
			scadaconfiguration = scadaConfigRepository.save(scadaconfig);
		} catch (Exception e) {
			logger.error(e);
		}
		// TODO Auto-generated method stub
		return scadaconfiguration;
	}

}
