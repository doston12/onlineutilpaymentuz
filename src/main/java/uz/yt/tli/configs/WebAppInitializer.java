package uz.yt.tli.configs;

import com.google.gson.Gson;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import uz.yt.tli.filter.BaseFilter;
import uz.yt.tli.helper.CookieHelper;

public class WebAppInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext container) throws ServletException {
        AnnotationConfigWebApplicationContext dispatcherServlet = new AnnotationConfigWebApplicationContext();
        dispatcherServlet.register(MVCConfig.class);

        dispatcherServlet.setServletContext(container);
        dispatcherServlet.refresh();

        CookieHelper cookie = (CookieHelper) dispatcherServlet.getBean("cookie");
        final Gson gson = (Gson) dispatcherServlet.getBean("gson");

        ServletRegistration.Dynamic servlet = container.addServlet("dispatcher", new DispatcherServlet(dispatcherServlet));
        servlet.addMapping("/");
        servlet.setLoadOnStartup(1);

        FilterRegistration.Dynamic filter = container.addFilter("BaseFilter", new BaseFilter(cookie, gson));
        filter.setInitParameter("forceEncoding", "true");

        filter.addMappingForUrlPatterns(null, true, "/index/*");
        filter.addMappingForUrlPatterns(null, true, "/appendix/*");
        filter.addMappingForUrlPatterns(null, true, "/land/*");
        filter.addMappingForUrlPatterns(null, true, "/rate/*");
    }

}
