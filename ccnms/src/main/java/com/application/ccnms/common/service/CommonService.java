package com.application.ccnms.common.service;

import java.util.List;
import java.util.Map;

import com.application.ccnms.digging.dto.DiggingDTO;
import com.application.ccnms.shop.dto.ShopDTO;

public interface CommonService {
	
	public List<DiggingDTO> getDiggingList(Map<String,Object> sortMap)throws Exception;
	public List<DiggingDTO> getHeadList() throws Exception;
	public List<ShopDTO> getRecentShopList() throws Exception;
	public List<ShopDTO> getPopulerShopList() throws Exception;
	public List<ShopDTO> getExchangeShopList() throws Exception;
	public void upThumbsUp(long diggingId)throws Exception;
	public int countThumbsUp(long diggingId) throws Exception;
	public int getAllDiggingCnt() throws Exception;
	public List<DiggingDTO> getDiggingSearch(String search)throws Exception;
	public List<ShopDTO> getShopSearch(String search)throws Exception;
	
}
