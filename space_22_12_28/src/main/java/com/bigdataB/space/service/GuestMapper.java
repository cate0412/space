package com.bigdataB.space.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bigdataB.space.dto.GuestMyDibsDTO;
import com.bigdataB.space.dto.MemberDTO;
import com.bigdataB.space.dto.ReserveDTO;
import com.bigdataB.space.dto.ReserveListDTO;
import com.bigdataB.space.dto.ReviewDTO;
import com.bigdataB.space.dto.ReviewMyListDTO;
import com.bigdataB.space.dto.SpaceDTO;
import com.bigdataB.space.dto.SpaceDibsDTO;
import com.bigdataB.space.dto.SpaceRoomDTO;
import com.bigdataB.space.dto.SpaceTypeDTO;


@Service
public class GuestMapper {

	
	@Autowired
	private  SqlSession sqlSession;
	//예약하기
	public int insertReserve(Map<String, String>map){
		return sqlSession.insert("insertReserve",map);
	}
	//예약취소하기
	public int cancleReserve(int res_no) {
		return sqlSession.update("cancleReserve", res_no);
	}
	//검색을 통한 카테고리 보여주기(방목록)
	public List<SpaceRoomDTO> listCategory(String q){
		System.out.println("q = "+ q);
		return sqlSession.selectList("g_listSpace",q);
	}
	//카테고리 선택을 통한 목록 보여주기(방목록)
	public List<SpaceRoomDTO> listSapceRoom(int cate_no){
		return sqlSession.selectList("g_listCate",cate_no);
	}
	//cato_no를 통한 카테고리 선별
	public SpaceTypeDTO getCate(int cate_no){
		return sqlSession.selectOne("g_getCate",cate_no);
	}
	public SpaceDTO getSpace(int space_no){
		return sqlSession.selectOne("g_getSpace",space_no);
	}
	//카테고리 목록
	public List<SpaceTypeDTO> ListSpaceType(){
		return sqlSession.selectList("g_ListSpaceType");
		
	}
	//방세부 정보 조회
	public SpaceRoomDTO getSpaceRoom(int room_no) {
		return sqlSession.selectOne("g_getSpaceRoom",room_no);
	}
	//예약하기
	public int insertReserve(ReserveDTO rsdto) {
		return sqlSession.insert("insertReserve",rsdto);
	}
	//회원 별 예약 리스트 불러오기
	public List<ReserveListDTO> reserveList(int member_no){
		return sqlSession.selectList("reserveList", member_no);
	}
	//회원 별 예약 상세보기
	public ReserveListDTO reserveView(Map<String,String> map){
		return sqlSession.selectOne("reserveView", map);
	} 
	//리뷰 Insert
	public int reviewInsert(ReviewDTO dto) {
		return sqlSession.insert("reviewInsert", dto);
	}
	//리뷰 List
	public List<ReviewMyListDTO> reviewList(int member_no){
		return sqlSession.selectList("reviewList", member_no);
	}
	//하나의 내 리뷰
	public ReviewDTO myReview(int rev_no) {
		return sqlSession.selectOne("myReview", rev_no);
	}
	//리뷰 수정
	public int reviewEdit(ReviewDTO dto) {
		return sqlSession.update("reviewEdit", dto);
	}
	//리뷰 삭제
	public int reviewDelete(int rev_no) {
		return sqlSession.delete("reviewDelete", rev_no);
	}
	//회원 닉네임 수정
	public int member_nm_edit(MemberDTO mdto) {
		return sqlSession.update("member_nm_edit", mdto);
	}
	//회원 전화번호 수정
	public int member_pno_edit(MemberDTO mdto) {
		return sqlSession.update("member_pno_edit", mdto);
	}
	//회원 비밀번호 수정
	public int passwdUpdate(MemberDTO mdto) {
		return sqlSession.update("passwdUpdate", mdto);
	}
	
	//나의 찜목록 리스트
	public List<GuestMyDibsDTO> myLikeList(int member_no){
		return sqlSession.selectList("myLikeList", member_no);
	}
	//찜하기 확인.
	public List<SpaceDibsDTO> findLike(Map<String, Integer>map){
		 return sqlSession.selectList("findLike",map);
	
	}
	//찜하기
	public int AddLike(Map<String,Integer> map) {
		return sqlSession.insert("AddLike",map);
	}
	//찜 안하기
	public int RemoveLike(Map<String,Integer>map) {
		return sqlSession.delete("RemoveLike",map);
	}
	
	public SpaceRoomDTO roomtime(int room_no) {
		return sqlSession.selectOne("roomtime",room_no);
	}

	public int chkoutReserve(int room_no){
		return sqlSession.update("chkoutReserve", room_no);
	}
	public int insertPayment(Map<String, Integer>map) {
		return sqlSession.insert("insertPayment",map);
	}
	public ReserveDTO getRes_no(Map<String,Object>map) {
		return sqlSession.selectOne("getRes_no",map);
	}
	public List<ReviewDTO> getRoomReviewList(int room_no){
		return sqlSession.selectList("getRoomReviewList",room_no);
	}
	public List<SpaceRoomDTO> ListSpaceRoom(){
		return sqlSession.selectList("ListSpaceRoom");
	}
	
	
	/**
     * Calendar 객체의 날짜를 포맷된 문자열로 반환한다.
     * @param date 입력날짜
     * @param pattern 패턴
     * @return 포맷된 문자열
     */
    public String Calendar2String(Date date, String pattern) {
    	Calendar cal = GregorianCalendar.getInstance();
		cal.setTime(date);
        return Date2String(cal.getTime(), pattern);
    }
    
    /**
     * Date 객체의 날짜를 포맷된 문자열로 반환한다.
     * @param date 입력날짜
     * @param pattern 패턴
     * @return 포맷된 문자열
     */
    public String Date2String(Date date, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern(pattern);

        return sdf.format(date);
    }

}
