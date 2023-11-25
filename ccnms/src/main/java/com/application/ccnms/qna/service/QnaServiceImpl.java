package com.application.ccnms.qna.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.ccnms.qna.dao.QnaDAO;
import com.application.ccnms.qna.dto.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public List<QnaDTO> getMyQnaList(String userId) throws Exception {
		return qnaDAO.selectListMyQnaList(userId);
	}
	@Override
	public List<Map<String,Object>> getQnaList(String userId) throws Exception {
		return qnaDAO.selectListQnaList(userId);
	}
	@Override
	public void addQna(QnaDTO qnaDTO) throws Exception {
		 qnaDAO.insertQna(qnaDTO);
	}

	@Override
	public void setQnaCnt(long prouductCd) throws Exception {
		qnaDAO.updateQnaCnt(prouductCd);
	}

	@Override
	public void updateQnaReply(QnaDTO qnaDTO) throws Exception {
		qnaDAO.updateReply(qnaDTO);
	}
	@Override
	public void removeQnaList(int[] removeQnaCd) throws Exception {
		qnaDAO.deleteQnaList(removeQnaCd);
	}

}