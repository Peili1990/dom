package org.nv.dom.util;

import javax.servlet.http.Cookie;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

public class CookiesUtil {
      
    public static void addCookie(String name, String value, int age, HttpServletResponse response) {  
        Cookie cookies = new Cookie(name, value);  
        cookies.setPath("/");  
        cookies.setMaxAge(age);  
        response.addCookie(cookies);  
    }  
    
    public static void addCookie(String name, String value, HttpServletResponse response) {  
       addCookie(name, value, 60*60*24, response);  
    }  
    
    public static String getCookieValue(HttpServletRequest request, String cookieName) {  
        if (cookieName != null) {  
            Cookie cookie = getCookie(request, cookieName);  
            if(cookie!=null){  
                return cookie.getValue();  
            }  
        }  
        return "";  
    }  
      
    public static Cookie getCookie(HttpServletRequest request, String cookieName){  
        Cookie[] cookies = request.getCookies();  
        Cookie cookie = null;  
        try {  
            if (cookies != null && cookies.length > 0) {  
                for (int i = 0; i < cookies.length; i++) {  
                    cookie = cookies[i];  
                    if (cookie.getName().equals(cookieName)) {  
                        return cookie;  
                    }  
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return cookie;  
    }  
      
    public static boolean deleteCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) {  
        if (cookieName != null) {  
            Cookie cookie = getCookie(request, cookieName);  
            if(cookie!=null){  
                cookie.setMaxAge(0);//如果0，就说明立即删除  
                cookie.setPath("/");//不要漏掉  
                response.addCookie(cookie);  
                return true;  
            }  
        }  
        return false;  
    }  

}
