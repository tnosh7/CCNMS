package com.application.ccnms.digging.dao;

import java.util.List;

import com.application.ccnms.digging.dto.DiggingDTO;

public interface DiggingDAO {
	public void insertDigging(DiggingDTO diggingDTO) throws Exception ;
	public List<DiggingDTO> selectListDiggingList()throws Exception ;

}