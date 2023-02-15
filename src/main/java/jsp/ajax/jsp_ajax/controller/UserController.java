package jsp.ajax.jsp_ajax.controller;

import jsp.ajax.jsp_ajax.model.User;
import jsp.ajax.jsp_ajax.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/form")
    public String userForm(Model model) {
        model.addAttribute("user", new User());
        return "create-user";
    }

    @GetMapping("/list")
    @ResponseBody
    public List<User> getAllUsers(){
        List<User> userList=userService.getAllUsers();
        return userList;
    }
    @GetMapping("/getUser/{id}")
    @ResponseBody
    public User getById(@PathVariable int id ) throws ParseException {
      User user =   userService.getById(id).get();

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formatter.format(new SimpleDateFormat("yyyy-MM-dd").parse(user.getDateOfBirth()));
        user.setDateOfBirth(strDate);

       return user;

    }

    @PostMapping("/save")
    @ResponseBody
    public String saveUser(@ModelAttribute("user")User user, ModelMap modelMap){
        userService.saveUser(user);
        return null;
    }

    @PostMapping("/update")
    @ResponseBody
    public String updateUser(@ModelAttribute("user")User user, ModelMap modelMap){
        userService.saveUser(user);
        modelMap.put("successMsg","User updated successfully Successfully");
        return "updated";
    }

   @GetMapping("/delete/{id}")
    @ResponseBody
    public String deleteUser(@PathVariable int id){
        userService.deleteUser(id);
        return "deleted";
   }

   @ModelAttribute("certificateList")
    public Map<Integer,String> certificateList(){
        Map<Integer,String> certificateList=new HashMap<>();
       certificateList.put(1,"SSC");
       certificateList.put(2,"HSC");
       certificateList.put(3,"BSC");
       certificateList.put(4,"MSC");
       return certificateList;
   }

   @ModelAttribute("designationList")
    public Map<Integer,String> designationList(){
       Map<Integer,String> designationList=new HashMap<>();
       designationList.put(1,"Admin");
       designationList.put(2,"H. Dept");
       designationList.put(3,"T. Lead");
       designationList.put(4,"User");
       return designationList;
   }


    @ModelAttribute("genderList")
    public Map<Integer,String> genderList(){
        Map<Integer,String> genderList=new HashMap<>();
        genderList.put(1,"Male");
        genderList.put(2,"Female");
        genderList.put(3,"Others");
        return genderList;
    }
}
