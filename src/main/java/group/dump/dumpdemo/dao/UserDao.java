package group.dump.dumpdemo.dao;

import group.dump.bean.annotation.Autowired;
import group.dump.dumpdemo.model.User;
import group.dump.orm.Session;
import group.dump.proxy.annotation.After;
import group.dump.proxy.annotation.Aspect;
import group.dump.proxy.annotation.Before;
import group.dump.proxy.annotation.Pointcut;

import java.util.List;


@Autowired
@Aspect
public class UserDao {
    public String register(User user, String again){
        if(user.getPassword().equals(again)){
            List<User> list = Session.getSession().selectBysql("username = ?",User.class,user.getUsername());
            if(list.size()!=0){
                return "exist";
            }else {
                Session.getSession().save(user);
                return "true";
            }
        }else {
            return "notsame";
        }
    }

    @Pointcut
    public User login(User user){
        List<User> list = Session.getSession().selectBysql("username = ? and password = ?",User.class,user.getUsername(),user.getPassword());
        if(list.size()!=0){
            return list.get(0);
        }else {
            return null;
        }
    }

    @Before
    public void before(User user){
        System.out.println(user.getUsername()+"正在登录");
    }

    @After
    public void after(User user){
        System.out.println("After login()");
    }
}
