package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.StudyDao;
import com.example.model.Criteria;
import com.example.model.PointVO;
import com.example.model.StudyMemberVO;
import com.example.model.StudyVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudyServiceImpl implements StudyService {
	
	// 이제 StudyService 데이터 관련 모두를 Dao에게 위임
	@Autowired
	StudyDao studyDao;
	
	@Override
	public List<StudyVO> getList(Criteria cri) {
		return studyDao.getList(cri);	
  	}
	
	@Override
	public List<Map<String, Object>> getMyStudyList(String id) {
		return studyDao.getMyStudyList(id);
	}
	
	@Override
	public StudyMemberVO add(StudyVO study) {
		
		// 가입코드 생성 로직
		StringBuffer temp = new StringBuffer();
        Random rnd = new Random();
        for (int i = 0; i < 6; i++) {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        
		study.setJoincode(temp.toString());
		int result = studyDao.add(study);
		int sno = studyDao.getStudyNo(study);
		StudyMemberVO studyMember = new StudyMemberVO();
		if (result == 1) {
			studyMember.setSno(sno);
			studyMember.setId(study.getId());
			studyDao.groupJoin(studyMember);
		}
		return studyMember;
	}
	
	@Override
	public void groupJoin(StudyMemberVO studyMember,String code) throws Exception {
		long sno = studyMember.getSno();
		String joincode = studyDao.getJoinCode(sno);
		if (code.equals(joincode)) {
			studyDao.groupJoin(studyMember);
		} else {
			throw new Exception("가입코드가 틀립니다");
		}
	}
	
	@Override
	public boolean isJoin(StudyMemberVO studyMember) {
		int isGroup = studyDao.isJoin(studyMember);
		boolean result = false;
		if ( isGroup > 0 ) {
			result = true;
		}
		return result;
	}
	
	@Override
	public List<StudyMemberVO> getMemberList(long sno) {
		List<StudyMemberVO> studyList = studyDao.getMemberList(sno);
		return studyList;
	}
	
	@Override
	public StudyMemberVO getMemberOne(String id, long sno) {
		
		return studyDao.getMemberOne(id, sno);
	}

	@Override
	public int getTotalCount() {
		return studyDao.getTotalCount();
	}

	@Override
	public StudyVO getOne(long sno) {
		return studyDao.getOne(sno);
	}

	@Override
	public void modify(StudyVO study) {
		studyDao.modify(study);
	}
	
	@Override
	public int delete(String id, long sno) {
		return studyDao.delete(id, sno);
	}
	
	@Override
	public int kickOut(String id, long sno, String kickedId) {
		int result = 0;
		// 현재 접속한 ID가 스터디장 ID와 일치 하는지 체크
		StudyVO study = studyDao.getOne(sno);
		if (id.equals(study.getId())) {
			result = studyDao.kickOut(kickedId, sno);
		}
		
		return result;
	}
	
	@Override
	public int groupOut(String id, long sno) {
		
		return studyDao.kickOut(id, sno);
	}
	
	@Override
	public int pointUp(PointVO point) {
		
		return studyDao.pointUp(point);
	}
	
	@Override
	public int getPoint(long mno) {
		
		return studyDao.getPoint(mno);
	}
	
	@Override
	public List<PointVO> getPointList(long mno) {
		return studyDao.getPointList(mno);
	}

}
