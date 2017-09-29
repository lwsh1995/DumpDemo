package group.dump.dumpdemo.service;

import group.dump.bean.annotation.Autowired;
import group.dump.dumpdemo.dao.UserDao;
import group.dump.dumpdemo.model.User;

@Autowired
public class UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public String register(User user, String again){
        return userDao.register(user,again);
    }

    public User login(User user) {
        return userDao.login(user);
    }

}
