package uz.yt.tli.filter;

import com.google.gson.Gson;
import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uz.yt.tli.dto.SecurityDto;
import uz.yt.tli.helper.CookieHelper;

public class BaseFilter extends FilterHelper {

    public BaseFilter(CookieHelper cookie, Gson gson) {
        this.cookie = cookie;
        this.gson = gson;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        SecurityDto security = cookie.get(req, SecurityDto.class);

        if (security != null) {
            cookie.extendAge(req, res);
            chain.doFilter(req, res);
        } else {
            if (req.getMethod().equals("POST")) {
                res.setStatus(500);
                res.getWriter().write("Unauthorized");
            } else {
                res.sendRedirect(req.getContextPath() + "/login");
            }
        }
    }

    @Override
    public void destroy() {

    }

}
