package uz.yt.tli.helper;

import com.sun.org.apache.xml.internal.security.utils.Base64;
import java.net.URLDecoder;
import java.net.URLEncoder;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieHelper {

    private final String key;
    private final Integer maxAge;

    public CookieHelper(String key) {
        this.key = key;
        this.maxAge = 43200; //seconds
    }

    public CookieHelper(String key, Integer maxAge) {
        this.key = key;
        this.maxAge = maxAge;
    }

    public boolean extendAge(HttpServletRequest req, HttpServletResponse res) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().toLowerCase().equals(this.key)) {
                    cookie.setMaxAge(this.maxAge);
                    cookie.setPath("/");
                    res.addCookie(cookie);
                }
            }
        }
        return true;
    }

    public <T extends Object> T get(HttpServletRequest req, Class<T> cls) {
        try {
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().toLowerCase().equals(this.key)) {
                        String a = new String(Base64.decode(URLDecoder.decode(cookie.getValue(), "UTF-8")));
                        return JsonHelper.Convert(a, cls);
                    }
                }
            }
            return null;

        } catch (Exception e) {
            return null;
        }
    }

    public boolean set(HttpServletResponse res, Object obj) {
        try {
            String jsonString = JsonHelper.get(obj);
            String value = URLEncoder.encode(Base64.encode(jsonString.getBytes()), "UTF-8");
            Cookie newCookie = new Cookie(this.key, value);
            newCookie.setPath("/");
            newCookie.setMaxAge(this.maxAge);
            res.addCookie(newCookie);
            return true;

        } catch (Exception e) {
            return false;
        }
    }

    public boolean remove(HttpServletRequest req, HttpServletResponse res) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().toLowerCase().equals(this.key)) {
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    res.addCookie(cookie);
                }
            }
        }
        return true;
    }

    public boolean removeAll(HttpServletRequest req, HttpServletResponse res) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                cookie.setPath("/");
                res.addCookie(cookie);
            }
        }
        return true;
    }

    // function by parameter key
    public boolean extendAge(HttpServletRequest req, HttpServletResponse res, String key) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().toLowerCase().equals(key)) {
                    cookie.setMaxAge(this.maxAge);
                    cookie.setPath("/");
                    res.addCookie(cookie);
                }
            }
        }
        return true;
    }

    public <T extends Object> T get(HttpServletRequest req, String key, Class<T> cls) {
        try {
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().toLowerCase().equals(StringHelper.TrimLowerCase(key))) {
                        return JsonHelper.Convert(new String(Base64.decode(URLDecoder.decode(cookie.getValue(), "UTF-8"))), cls);
                    }
                }
            }
            return null;

        } catch (Exception e) {
            return null;
        }
    }

    public boolean set(HttpServletResponse res, String key, Object obj) {
        try {
            String jsonString = JsonHelper.get(obj);
            String value = URLEncoder.encode(Base64.encode(jsonString.getBytes()), "UTF-8");
            Cookie newCookie = new Cookie(StringHelper.TrimLowerCase(key), value);
            newCookie.setPath("/");
            newCookie.setMaxAge(this.maxAge);
            res.addCookie(newCookie);
            return true;

        } catch (Exception e) {
            return false;
        }
    }

    public boolean remove(HttpServletRequest req, HttpServletResponse res, String key) {
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().toLowerCase().equals(StringHelper.TrimLowerCase(key))) {
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    res.addCookie(cookie);
                }
            }
        }
        return true;
    }

}
