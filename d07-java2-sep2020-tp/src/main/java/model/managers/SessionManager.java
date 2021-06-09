/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.managers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
/**
 *
 * @author jlidou
 */
public class SessionManager {
   public static void add(String key, Object value, HttpServletRequest request) {
      getSession(request).setAttribute(key, value);
   }
   
   public static Object get(String key, HttpServletRequest request) {
      Object retour = null;
      retour = getSession(request).getAttribute(key);
      return retour;
   }
   
   public static void destroy(HttpServletRequest request) {
      getSession(request).invalidate();
   }
   
   public static void delete(HttpServletRequest request, String key) {
      getSession(request).removeAttribute(key);
   }

   private static HttpSession getSession(HttpServletRequest request) {
      return request.getSession(true);
   }

}
