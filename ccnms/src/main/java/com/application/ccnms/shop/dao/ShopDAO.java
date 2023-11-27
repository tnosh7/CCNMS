package com.application.ccnms.shop.dao;

import java.util.List;

import com.application.ccnms.qna.dto.QnaDTO;
import com.application.ccnms.shop.dto.ShopDTO;

public interface ShopDAO {
	public List<ShopDTO> selectListProductList() throws Exception ;
	public void insertProduct(ShopDTO shopDTO) throws Exception ;
	public List<ShopDTO> selectListLatestList() throws Exception ;
	public List<ShopDTO> selectListSortLatestList(String sort) throws Exception ;
	public List<ShopDTO> selectListSortList(String sort) throws Exception ;
	public ShopDTO selectOneProductDetail(long productCd) throws Exception ;
	public void updateReadCnt(long productCd) throws Exception ;
	public List<ShopDTO> selectListbestSort(String bestSort) throws Exception ;
	public List<QnaDTO> selectListQnaList(long productCd) throws Exception; 
}
