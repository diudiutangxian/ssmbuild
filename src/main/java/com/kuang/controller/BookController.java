package com.kuang.controller;

import com.kuang.pojo.Books;
import com.kuang.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @RequestMapping("/allBook")
    public String list(Model model) {
        List<Books> list = bookService.queryAllBook();
        model.addAttribute("list", list);
        return "allBook";
    }

    //跳转到增加书籍页面
    @RequestMapping("/toAddBook")
    public String toAddPage(){
        return "addBook";
    }
    // 添加书籍的请求
    @RequestMapping("/addBook")
    public String addBook(Books books){
        System.out.println("addBooks-->" + books);
        bookService.addBook(books);
        // 重定向到 @RequestMapping("/allBook")请求
        return "redirect:/book/allBook";
    }

    // 跳转到修改页面
    @RequestMapping("/toUpdateBook")
    public String toUpdatePage(int id, Model model){
        Books book = bookService.queryBookById(id);
        model.addAttribute("QBook", book);
        return "updateBook";
    }
    @RequestMapping("/updateBook")
    public String updateBook(Books books){
        System.out.println("updateBook=>" + books);
//        books.setBookCounts(books.getBookCounts());
//        books.setBookName(books.getBookName());
//        books.setDetail(books.getDetail());
        bookService.updateBook(books);
        return "redirect:/book/allBook";
    }


}