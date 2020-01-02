package uz.yt.tli.configs;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import uz.yt.tli.helper.CookieHelper;

@Configuration
@ComponentScan("uz.yt.tli")
@EnableWebMvc
@PropertySource(value = {"classpath:application.properties"})
public class MVCConfig extends WebMvcConfigurerAdapter {

    @Autowired
    Environment environment;
    
    final String cookieName = "tli_auth";

    @Bean
    public UrlBasedViewResolver setupViewResolver() {
        UrlBasedViewResolver resolver = new UrlBasedViewResolver();
        resolver.setPrefix("/WEB-INF/jsp/");
        resolver.setSuffix(".jsp");
        resolver.setViewClass(JstlView.class);
        return resolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations("/resources/");
    }

    @Bean
    public DataSource getTLIDataSource() throws SQLException {
        return DatabaseConfig.getDataSource(environment.getProperty("spring.datasource.username"), environment.getProperty("spring.datasource.password"), environment.getProperty("spring.datasource.url"));
    }

    @Bean
    public Gson gson(){
        GsonBuilder gsonBuilder = new GsonBuilder().setDateFormat("yyyy.MM.dd HH:mm:ss").disableHtmlEscaping().setPrettyPrinting();
        return gsonBuilder.create();
    }

    @Bean
    public CookieHelper cookie(){
        // default cookie time 1800 (30 minuts)
        return new CookieHelper(cookieName, 1800);
    }
}
