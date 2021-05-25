package com.spring.baemin.web.food.domain;

import lombok.Getter;

@Getter
public enum FoodCategory {
    KOREAN_FOOD("한식"),
    CHINA_FOOD("중식"),
    ITALY_FOOD("이태리식"),
    JAPAN_FOOD("일식");

    private String foodName;

    FoodCategory(String foodName) {
        this.foodName = foodName;
    }

    /*
     상수("바꾸고싶은 데이터") 사용할때는 필드가 필요하고
     생성자로 받아서 category.foodName 식으로 뽑아서 사용한다.

     DB에 저장될때는 영어로 들어가게 category
     불러와서 웹에 뿌려줄때는 한글로 보이게 category.foodName
     */

}
