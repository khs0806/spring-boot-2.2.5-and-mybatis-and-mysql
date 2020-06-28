package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.model.ReplyVO;

@Mapper
public interface ReplyDao {
	// 댓글 목록
	public List<ReplyVO> readReply(int sno) throws Exception;
	// 댓글 작성
	public void writeReply(ReplyVO replyVO) throws Exception;
	// 댓글 수정
	public void updateReply(ReplyVO replyVO) throws Exception;
	// 댓글 삭제
	public void deleteReply(int rno) throws Exception;
	// 댓글 상세 보기
	public ReplyVO selectReply(int rno) throws Exception;
}
