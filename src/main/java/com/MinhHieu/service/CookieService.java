package com.MinhHieu.service;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class CookieService {
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse resp;

	public Cookie create(String name, String value, int day) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(60 * 60 * day);
		cookie.setPath("/");
		resp.addCookie(cookie);
		return cookie;
	}

	public Cookie get(String name) {
		Cookie[] cookie = req.getCookies();
		if (cookie != null) {
			for (Cookie c : cookie) {
				if (c.getName().equalsIgnoreCase(name))
					return c;

			}
		}
		return null;
	}
}
