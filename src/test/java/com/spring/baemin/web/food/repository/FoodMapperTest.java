package com.spring.baemin.web.food.repository;

import com.spring.baemin.web.common.paging.Criteria;
import com.spring.baemin.web.food.domain.FoodCategory;
import com.spring.baemin.web.food.domain.Restaurant;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FoodMapperTest {

    @Autowired
    private FoodMapper mapper;

    @Test
    void create() {
        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurantName("진짜루23");
        restaurant.setNumber("010-1112-33332");
        restaurant.setMenus("ㄷㄹ허ㅜㅑㄴㅇㅍ2ㄴ알");
        restaurant.setCategory(FoodCategory.CHINA_FOOD);

//        System.out.println(restaurant.getCategory().getFoodName());
        mapper.create(restaurant);
    }

    @Test
    void remove() {
        mapper.remove(3);
    }

    @Test
    void more() {
        Restaurant restaurant;
        restaurant = mapper.more(5);
        System.out.println(restaurant);
    }

    @Test
    void rewrite() {
        Restaurant restaurant = new Restaurant();
        restaurant.setMenus("변경변경변경 블라블라블라~~~~~");
        restaurant.setRestaurantNum(5);
        mapper.rewrite(restaurant);
    }

    @Test
    void findAll() {
        List<Restaurant> resList = mapper.findAll();
        for (Restaurant restaurant : resList) {
            System.out.println(restaurant);
        }

    }


    @Test
    @DisplayName("50개의 게시글을 등록해야 한다.")
    void bulkInsert() {
        for (int i = 1; i <= 100 ; i++) {
            Restaurant restaurant = new Restaurant();
            restaurant.setRestaurantName("매점명" + i);
            restaurant.setNumber("연락처" + i);
            restaurant.setMenus("테스트 내용 블라블라" + i);
            double rn = Math.random();
            if (rn > 0.75) {
                restaurant.setCategory(FoodCategory.CHINA_FOOD);
            } else if (rn > 0.5) {
                restaurant.setCategory(FoodCategory.KOREAN_FOOD);
            } else if (rn > 0.25) {
                restaurant.setCategory(FoodCategory.ITALY_FOOD);
            } else {
                restaurant.setCategory(FoodCategory.JAPAN_FOOD);
            }

            mapper.create(restaurant);
        }
    }

    @Test
    @DisplayName("페이지 정보에 따른 게시물을 조회해야 한다.")
    void pagingTest1() {
        System.out.println("====================================================================");
        Criteria criteria = new Criteria(1, 10);
        for (Restaurant restaurant : mapper.findAll(criteria)) {
            System.out.println(restaurant);
        }
        System.out.println("====================================================================");
    }

    @Test
    @DisplayName("제목으로 검색된 게시물 리스트를 반환해야 한다.")
    void searchByTitleTest() {
        Criteria criteria = new Criteria();
        criteria.setPage(1);
        criteria.setAmount(10);
        criteria.setKeyword("20");
        criteria.setType("resName");

        System.out.println("==============================================================");
        for (Restaurant restaurant : mapper.getSearchFindAll(criteria)) {
            System.out.println(restaurant);
        }
        System.out.println("==============================================================");
    }
}