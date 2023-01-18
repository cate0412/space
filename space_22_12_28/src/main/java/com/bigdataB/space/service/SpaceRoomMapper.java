package com.bigdataB.space.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bigdataB.space.dto.SpaceRoomDTO;

@Service
public class SpaceRoomMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<SpaceRoomDTO>listRoom(int start, int end, int space_no){
		Map<String,Integer>map=new Hashtable<>();
		map.put("start",start);
		map.put("end",end);
		map.put("space_no", space_no);
		return sqlSession.selectList("listRoom",map);
	}
	
	public  int insertRoom(SpaceRoomDTO srdto){
		return sqlSession.insert("insertRoom",srdto);
	}
	
	public int deleteRoom(int room_no) {
		return sqlSession.delete("deleteRoom",room_no);
	}
	
	public int updateRoom(SpaceRoomDTO srdto) {
		return sqlSession.update("updateRoom",srdto);
		}

	public SpaceRoomDTO getRoom(int room_no) {
		return sqlSession.selectOne("getRoom", room_no);
	}
	public int getRoomCount(int space_no) {
		return sqlSession.selectOne("getRoomCount", space_no);	
	}
	public String getSpace_nm(int space_no) {
		return sqlSession.selectOne("getSpace_nm",space_no);
	}
}
