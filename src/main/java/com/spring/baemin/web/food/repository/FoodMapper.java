package com.spring.baemin.web.food.repository;

import com.spring.baemin.web.common.paging.Criteria;
import com.spring.baemin.web.food.domain.Restaurant;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

// 마이바티스 SQL 인터페이스
@Mapper // 이 인터페이스와 resources 밑에 있는 xml 과 연동
public interface FoodMapper {

    //게시글 목록 가져오기
    // 1. 페이징 없는 버전
    List<Restaurant> findAll();
    // 2. 페이징 쿼리 추가 버전
    List<Restaurant> findAll(Criteria criteria);
    // 3. 검색 쿼리 추가 버전
    List<Restaurant> getSearchFindAll(Criteria criteria);

    //게시글 등록
    void create(Restaurant restaurant);

    //게시글 내용보기
    Restaurant more(int restaurantNum);

    //게시글 수정
    void rewrite(Restaurant restaurant);

    //게시글 삭제
    void remove(int restaurantNum);

    // 총 게시물 수 조회
    int getTotalCount(Criteria criteria);
}
