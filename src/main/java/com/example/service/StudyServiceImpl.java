package com.example.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.StudyDao;
import com.example.model.Study;
import com.example.model.StudyMember;
import com.example.util.CUtil;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudyServiceImpl implements StudyService {
	
	// 이제 StudyService 데이터 관련 모두를 Dao에게 위임
	@Autowired
	StudyDao studyDao;
	
	@Override
	public List<Study> getList() {
		return studyDao.getList();	
  	}
	
	@Override
	public StudyMember add(Study study) {
		
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
		StudyMember studyMember = new StudyMember();
		if (result == 1) {
			studyMember.setSno(sno);
			studyMember.setId(study.getId());
			studyDao.groupJoin(studyMember);
		}
		return studyMember;
	}
	
	@Override
	public void groupJoin(StudyMember studyMember,String code) throws Exception {
		long sno = studyMember.getSno();
		String joincode = studyDao.getJoinCode(sno);
		if (code.equals(joincode)) {
			studyDao.groupJoin(studyMember);
		} else {
			throw new Exception("가입코드가 틀립니다");
		}
	}
	
	@Override
	public boolean isJoin(StudyMember studyMember) {
		int isGroup = studyDao.isJoin(studyMember);
		boolean result = false;
		if ( isGroup > 0 ) {
			result = true;
		}
		return result;
	}
	
	@Override
	public List<StudyMember> getMemberList(long sno) {
		List<StudyMember> studyList = studyDao.getMemberList(sno);
		return studyList;
	}

	@Override
	public int getTotalCount() {
		return studyDao.getTotalCount();
	}

	@Override
	public Study getOne(long id) {
		
		return studyDao.getOne(id);
	}

	@Override
	public void delete(long id) {
		studyDao.delete(id);
	}

	@Override
	public void modify(Map<String, Object> param) {
		studyDao.modify(param);
	}
}
