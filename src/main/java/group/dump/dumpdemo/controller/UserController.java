package group.dump.dumpdemo.controller;

import group.dump.bean.annotation.Autowired;
import group.dump.dumpdemo.model.User;
import group.dump.dumpdemo.service.UserService;
import group.dump.filter.annotation.Controller;
import group.dump.filter.annotation.Param;
import group.dump.filter.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Autowired
public class UserController {
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/register")
    public void register(HttpServletResponse response,
                         User user, @Param("again") String again) throws Exception {
        String result = userService.register(user, again);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print(result);
    }

    @RequestMapping("/login")
    public void login(HttpSession session,
                      HttpServletResponse response,
                      User user) throws Exception{
        User us = userService.login(user);
        response.setContentType("text/html;charset=UTF-8");
        if(us == null){
            response.getWriter().print("false");
        }else{
            response.getWriter().print("true");
        }
    }
}
