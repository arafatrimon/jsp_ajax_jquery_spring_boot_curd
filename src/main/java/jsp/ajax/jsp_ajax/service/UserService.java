package jsp.ajax.jsp_ajax.service;

import jsp.ajax.jsp_ajax.dao.UserDao;
import jsp.ajax.jsp_ajax.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public List<User> getAllUsers(){
        return  userDao.findAll();
    }

    public User saveUser(User user){
        return userDao.save(user);
    }
    public String deleteUser(int id){
         userDao.deleteById(id);
         return "User deleted with id :"+id;
    }

    public Optional<User> getById(int id) {
        return userDao.findById(id);
    }
}
