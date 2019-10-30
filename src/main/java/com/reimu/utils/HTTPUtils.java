package com.reimu.utils;

import javax.servlet.http.HttpServletRequest;

public class HTTPUtils {
	/**
	 * 从request获取登录的IP
	 */
	public static String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
 
	/**
	 *  判断是否为ajax请求
	 */
	public static boolean isAjaxRequest(HttpServletRequest request) {
		if (request.getHeader("accept")!= null && request.getHeader("accept").indexOf("application/json") > -1) {
			return true;
		}
		return false;
	}
 
}