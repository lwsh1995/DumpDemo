package group.dump.dumpdemo.controller;

import com.alibaba.fastjson.JSON;
import group.dump.dumpdemo.model.User;
import group.dump.web.annotation.*;

@Controller
@RequestMapping("/test")
public class UserController {

    @ResponseBody
    @RequestMapping("/testAjax")
    public String testAjax(@RequestModel User user) {
        return JSON.toJSONString(user);
    }

    @RequestMapping("/testReturnUrl")
    public String testReturnUrl(@RequestParam("username") String username, @RequestParam(value = "tel", required = false, defaultValue = "110") String tel) {
        System.out.println(username);
        System.out.println(tel);
        return "/success.html";
    }
}
