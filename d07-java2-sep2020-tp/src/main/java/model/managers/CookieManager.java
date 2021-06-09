/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.managers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author waugusti
 */
public class CookieManager {

    public static void createCookie(String key, String value, HttpServletResponse response) {
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(60 * 60 * 24);
        response.addCookie(cookie);
    }

    /**
     *
     * @param key
     * @param request
     * @return
     */
    public static Cookie getCookie(String key, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        Cookie c = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(key)) {
                    c = cookie;
                    return c;

                }
            }
        }
        return c;
    }

    public static void deleteCookie(Cookie cookie, HttpServletResponse response) {
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
}
