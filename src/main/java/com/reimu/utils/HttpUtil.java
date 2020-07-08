package com.reimu.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.io.IOException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * httputil
 * 
 * @author lvchaohua
 *
 */
public class HttpUtil {

	private final static Logger logger = LogManager.getLogger(HttpUtil.class);

	/**
	 * http get请求
	 * 
	 * @param url
	 *            请求地址
	 * @param params
	 *            请求参数
	 * @return
	 */
	public static String get(String url, Map<String, Object> params) {
		CloseableHttpResponse response = null;
		CloseableHttpClient httpClient = null;
		try {
			if (params != null && !params.isEmpty()) {
				url = url + "?";
				for (Iterator<String> iterator = params.keySet().iterator(); iterator.hasNext();) {
					String key = iterator.next();
					String temp = key + "=" + params.get(key) + "&";
					url = url + temp;
				}
				url = url.substring(0, url.length() - 1);
			}
			HttpGet httpGet = new HttpGet(url);
			httpClient = createWrapClient();
			RequestConfig config = RequestConfig.custom().setConnectionRequestTimeout(10000).setConnectTimeout(10000)
					.setSocketTimeout(10000).build();

			httpGet.setConfig(config);
			response = httpClient.execute(httpGet);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				return EntityUtils.toString(entity, "UTF-8");
			}
		} catch (Exception e) {
			logger.error("get request error " + e);
		} finally {
			try {
				if (response != null) {
					response.close();
				}
				if (httpClient != null) {
					httpClient.close();
				}
			} catch (IOException e) {
			}
		}
		return "";
	}


	/**
	 * 生成忽略不信任证书的客户端
	 * @return
	 */
	public static CloseableHttpClient createWrapClient() {
		try {
			SSLContext ctx = SSLContext.getInstance("TLS");
			X509TrustManager tm = new X509TrustManager() {
				@Override
				public X509Certificate[] getAcceptedIssuers() {
					return null;
				}
				@Override
				public void checkClientTrusted(X509Certificate[] arg0,
											   String arg1) throws CertificateException {
				}
				@Override
				public void checkServerTrusted(X509Certificate[] arg0,
											   String arg1) throws CertificateException {
				}
			};
			ctx.init(null, new TrustManager[] { tm }, null);
			SSLConnectionSocketFactory ssf = new SSLConnectionSocketFactory(ctx, NoopHostnameVerifier.INSTANCE);
			CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(ssf).build();
			return httpclient;
		} catch (Exception ex) {
			logger.error("create httpclient error " + ex);
			return HttpClients.createDefault();
		}
	}

	/**
	 * http post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param params
	 *            请求参数
	 * @return
	 */
	public static String post(String url, Map<String, Object> params) {
		CloseableHttpResponse response = null;
		CloseableHttpClient httpClient = null;
		try {
			HttpPost httpPost = new HttpPost(url);
			List<NameValuePair> parameters = new ArrayList<NameValuePair>();
			for (Iterator<String> iterator = params.keySet().iterator(); iterator.hasNext();) {
				String key = iterator.next();
				parameters.add(new BasicNameValuePair(key, params.get(key).toString()));
			}
			UrlEncodedFormEntity uefEntity = new UrlEncodedFormEntity(parameters, "UTF-8");
			httpPost.setEntity(uefEntity);
			RequestConfig config = RequestConfig.custom().setConnectionRequestTimeout(10000).setConnectTimeout(10000)
					.setSocketTimeout(10000).build();
			httpPost.setConfig(config);
			httpClient = createWrapClient();
			response = httpClient.execute(httpPost);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				return EntityUtils.toString(entity, "UTF-8");
			}
		} catch (Exception e) {
			logger.error("post request error " + e);
			throw new RuntimeException(e);
		} finally {
			try {
				response.close();
				httpClient.close();
			} catch (IOException e) {
			}

		}
		return "";
	}

	/**
	 * http post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param params
	 *            请求参数
	 * @return
	 */
	public static String post(String url, String params) {
		CloseableHttpResponse response = null;
		CloseableHttpClient httpClient = null;
		try {
			HttpPost httpPost = new HttpPost(url);
			StringEntity sEntity = new StringEntity(params,"UTF-8");
			httpPost.setEntity(sEntity);
			RequestConfig config = RequestConfig.custom().setConnectionRequestTimeout(10000).setConnectTimeout(10000)
					.setSocketTimeout(10000).build();
			httpPost.setConfig(config);
			httpClient = createWrapClient();
			response = httpClient.execute(httpPost);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				return EntityUtils.toString(entity, "UTF-8");
			}
		} catch (Exception e) {
			logger.error("post request error " + e);
			throw new RuntimeException(e);
		} finally {
			try {
				if (response != null) {
                    response.close();
                }
				if (httpClient != null){
					httpClient.close();
				}
			} catch (IOException e) {
			}

		}
		return "";
	}

	public static String postJson(String url, String json) {
		final RequestBuilder postBuilder = RequestBuilder.post(url);
		postBuilder.setCharset(ContentType.APPLICATION_JSON.getCharset());
		final StringEntity entity = new StringEntity(json, ContentType.APPLICATION_JSON);
		postBuilder.setEntity(entity);
		return send0(postBuilder);
	}
	private static String send0(final RequestBuilder requestBuilder) {
		String responseText = null;
		CloseableHttpClient httpClient = createWrapClient();
		CloseableHttpResponse response = null;
		try {
			response = httpClient.execute(requestBuilder.build());
			if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
				org.apache.http.HttpEntity entity = response.getEntity();
				if (entity != null) {
					responseText = EntityUtils.toString(entity, ContentType.APPLICATION_JSON.getCharset());
				}
			}
		} catch (Exception e) {
			logger.error("", e);
		} finally {
			try {
				response.close();
			} catch (Exception e) {
				logger.warn("", e);
			}
		}
		return responseText;
	}
}
