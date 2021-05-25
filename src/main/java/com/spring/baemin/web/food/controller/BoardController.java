package com.spring.baemin.web.food.controller;

import com.spring.baemin.web.common.paging.Criteria;
import com.spring.baemin.web.common.paging.PageMaker;
import com.spring.baemin.web.food.domain.ModifyRestaurant;
import com.spring.baemin.web.food.domain.Restaurant;
import com.spring.baemin.web.food.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
//@RequiredArgsConstructor
@CrossOrigin
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService ;
    @Autowired
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    //입점 매점 목록 요청
    // 1. 페이징 없는 버전
    /*@GetMapping("/list")
    public String boardList(Model model) {
        List<Restaurant> resList = boardService.findAll();
        model.addAttribute("list", resList);
        return "/board/list";
    }*/
    // 2. 페이징 추가 버전
    @GetMapping("/list")
    public String list(Criteria criteria, Model model) {
        model.addAttribute("list", boardService.findAll(criteria));
        // 페이지 정보를 만들어서 jsp 에게 보내기
        model.addAttribute("pageMaker", new PageMaker(criteria, boardService.getTotal()));
        return "/board/list";
    }

    //매점 등록 화면 요청
    @GetMapping("/write")
    public String write() {
        return "/board/write";
    }

    //매점 등록 처리 요청
    @PostMapping("/write")
    public String write(Restaurant restaurant) {
//        log.info("restaurant: " + restaurant);
        try {
            boardService.create(restaurant);
        } catch (Exception e) {
            return "/board/write";
        }
        return "redirect:list";
    }

    //매점 정보 상세보기 요청
    @GetMapping("/content")
    public String content(int restaurantNum, Model model) {
        Restaurant content = boardService.more(restaurantNum);
        model.addAttribute("restaurant", content);
        return "/board/content";
    }

    //매점 정보 수정하기 화면요청
    @GetMapping("/modify")
    public String modify(int restaurantNum, Model model) {
        model.addAttribute("restaurant", boardService.more(restaurantNum));
        return "/board/modify";
    }

    //매점 정보 수정 처리요청
    @PostMapping("/modify")
    public String modify(ModifyRestaurant modRestaurant) {
        // 원본데이터를 찾아서 수정데이터로 변경하는 로직(서비스에 넣어주는게 좋다)
        Restaurant restaurant = boardService.more(modRestaurant.getRestaurantNum());
        restaurant.setRestaurantName(modRestaurant.getRestaurantName());
        restaurant.setNumber(modRestaurant.getNumber());
        restaurant.setMenus(modRestaurant.getMenus());
        restaurant.setCategory(modRestaurant.getCategory());
        try {
            boardService.rewrite(restaurant);
        } catch (Exception e) {
            return "redirect:/board/modify?restaurantNum=" + modRestaurant.getRestaurantNum();
        }
        return "redirect:/board/content?restaurantNum=" + modRestaurant.getRestaurantNum();
    }

    //등록 매점 삭제 요청
    @GetMapping("/delete")
    public String delete(int restaurantNum) {
        boardService.remove(restaurantNum);
        return "redirect:/board/list";
    }

}
