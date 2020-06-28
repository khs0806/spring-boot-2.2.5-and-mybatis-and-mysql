package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ReplyDao;
import com.example.model.ReplyVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired 
	private ReplyDao replyDAO;
	// 댓글 조회
	@Override
	public List<ReplyVO> readReply(int sno) throws Exception {
		return replyDAO.readReply(sno);
	}
	// 댓글 작성
	@Override
	public void writeReply(ReplyVO reply) throws Exception {
		replyDAO.writeReply(reply);
	}
	// 댓글 수정
	@Override
	public void updateReply(ReplyVO reply) throws Exception {
		replyDAO.updateReply(reply);
	}
	// 댓글 삭제
	@Override
	public void deleteReply(int no) throws Exception {
		replyDAO.deleteReply(no);
	}
	// 댓글 상세 보기	
	@Override
	public ReplyVO selectReply(int no) throws Exception {
		ReplyVO vo = replyDAO.selectReply(no);
		return vo;
	}
}
