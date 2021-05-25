package com.spring.baemin.web.api;


import com.spring.baemin.web.food.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@Log4j2
@RequiredArgsConstructor
@RequestMapping("")
public class BoardApiController {

    private final BoardService scoreService;

//    @GetMapping()

}
