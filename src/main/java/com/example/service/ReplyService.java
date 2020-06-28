package com.example.service;

import java.util.List;

import com.example.model.ReplyVO;


public interface ReplyService {
	// 댓글 조회
	public List<ReplyVO> readReply(int sno) throws Exception;
	// 댓글 작성
	public void writeReply(ReplyVO reply) throws Exception;
	// 댓글 수정
	public void updateReply(ReplyVO reply) throws Exception;
	// 댓글 삭제
	public void deleteReply(int no) throws Exception;
	// 댓글 상세 보기
	public ReplyVO selectReply(int no) throws Exception;
}
