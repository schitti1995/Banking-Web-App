package controller;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public abstract class Action {

	public abstract String getName();
	
    public String performGet(HttpServletRequest request) {
        // Normally, we would return null to get a 404 error, but for easier debugging...
        request.setAttribute("message",
                "No implementation of performGet() for action " + getName());
        return "action-error-message.jsp";
    }
    
    public String performPost(HttpServletRequest request) {
        // Normally, we would return null to get a 404 error, but for easier debugging...
        request.setAttribute("message",
                "No implementation of performPost() for action " + getName());
        return "action-error-message.jsp";
    }
    
    private static Map<String, Action> hash = new HashMap<String, Action>();
    
    public static void add(Action a) {
        synchronized (hash) {
            if (hash.get(a.getName()) != null) {
                throw new AssertionError("Two actions with the same name ("
                        + a.getName() + "): " + a.getClass().getName()
                        + " and " + hash.get(a.getName()).getClass().getName());
            }

            hash.put(a.getName(), a);
        }
    }
    
    public static String perform(String name, HttpServletRequest request) {
        Action a;
        synchronized (hash) {
        	    System.out.println("Action: " + name);
            a = hash.get(name);
            System.out.println("Get servlet: " + a);
        }

        if (a == null) {
            // Normally, we would return null to get a 404 error, but for easier debugging...
            request.setAttribute("message",
                    "There is no action registered for \"" + name + "\"");
            return "action-error-message.jsp";
        }

        if ("GET".equals(request.getMethod())) {
            return a.performGet(request);
        }

        if ("POST".equals(request.getMethod())) {
            return a.performPost(request);
        }
        
        // Normally, we would return null to get a 404 error, but for easier debugging...
        request.setAttribute("message",
                "Unexpected HTTP Method (\"" + request.getMethod() + "\") for \"" + name + "\"");
        return "action-error-message.jsp";
    }
}
