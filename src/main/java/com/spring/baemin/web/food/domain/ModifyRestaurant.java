package com.spring.baemin.web.food.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class ModifyRestaurant {

    private int restaurantNum; // 매점번호
    private String restaurantName; // 매점명
    private String number; // 연락처
    private String menus; // 메뉴
    private FoodCategory category; // 카테고리

}
