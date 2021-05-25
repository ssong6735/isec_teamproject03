package com.spring.baemin.web.food.service;

import com.spring.baemin.web.common.paging.Criteria;
import com.spring.baemin.web.food.domain.Restaurant;
import com.spring.baemin.web.food.repository.FoodMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final FoodMapper foodMapper;

    //게시글 목록 가져오기
    // 1. 페이징 없는 버전
    /*public List<Restaurant> findAll() {
        return foodMapper.findAll();
    }*/
    // 2. 페이징 쿼리 추가 버전
    public List<Restaurant> findAll(Criteria criteria){
        return foodMapper.findAll(criteria);
    }

    //게시글 등록
    public void create(Restaurant restaurant) throws Exception{
        foodMapper.create(restaurant);
    }

    //게시글 내용보기
    public Restaurant more(int restaurantNum) {
        return foodMapper.more(restaurantNum);
    }

    //게시글 수정
    public void  rewrite(Restaurant restaurant) throws Exception {
        foodMapper.rewrite(restaurant);
    }

    //게시글 삭제
    public void  remove(int restaurantNum) {
        foodMapper.remove(restaurantNum);
    }

    // 총 게시물 수 조회
    public int getTotal() {
        return foodMapper.getTotalCount();
    }


}
