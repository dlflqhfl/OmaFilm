package web.main.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        return "jsp/login/register.jsp";
    }
}
