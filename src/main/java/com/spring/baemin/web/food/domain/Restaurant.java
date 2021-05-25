package com.spring.baemin.web.food.domain;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Setter @Getter
@ToString
public class Restaurant {

    private static int sequence;

    private int restaurantNum;
    private String restaurantName;
    private String number;
    private String menus;
    private FoodCategory category;

    public Restaurant() {
        this.restaurantNum = ++sequence;
    }

    public Restaurant(String restaurantName, String number, String menus, FoodCategory category) {
        this();
        this.restaurantName = restaurantName;
        this.number = number;
        this.menus = menus;
        this.category = category;
    }

/*    public Restaurant(ResultSet rs) throws SQLException {
        this.restaurantNum = rs.getInt("res_num");
        this.restaurantName = rs.getString("res_name");
        this.number = rs.getString("tel_number");
        this.menus = rs.getString("menus");
        this.category = FoodCategory.valueOf(rs.getString("category"));
    }*/


}
