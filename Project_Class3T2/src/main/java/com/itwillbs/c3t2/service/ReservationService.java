package com.itwillbs.c3t2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.ReservationMapper;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationMapper mapper;
	

}
