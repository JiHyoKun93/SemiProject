package com.eggplant;


	
	import java.io.BufferedReader;
	import java.io.IOException;
	import java.io.InputStreamReader;
	import java.net.HttpURLConnection;
	import java.net.URL;

	public class Api {
	    public static void main(String[] args) {
	        try {
	            // API 호출을 위한 URL 생성
	            String apiKey = "e78a6663e27b412eb4336a1d6ea24794";
	            String apiUrl = "https://openexchangerates.org/api/latest.json?app_id=" + apiKey;
	            URL url = new URL(apiUrl);

	            // HttpURLConnection을 사용하여 API 호출
	            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	            connection.setRequestMethod("GET");

	            // API 응답 받기
	            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	            String line;
	            StringBuilder response = new StringBuilder();
	            while ((line = reader.readLine()) != null) {
	                response.append(line);
	            }
	            reader.close();

	            // API 응답 처리
	            System.out.println(response.toString());

	            // 응답 데이터를 JSON 파싱하여 활용할 수 있습니다.
	            // Gson, Jackson 등의 라이브러리를 사용하여 JSON을 자바 객체로 변환할 수 있습니다.

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	}


