package com.eggplant;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/ApiServlet")
public class ApiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String cp = request.getContextPath();
    	
        try {
        	String apiKey = "3f941dde54d64abd9965d67c20921692";
            String apiUrl = "https://openexchangerates.org/api/latest.json?app_id=" + apiKey;
            URL url = new URL(apiUrl);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            StringBuilder apiResponse = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                apiResponse.append(line);
            }
            reader.close();

            Gson gson = new Gson();
            ApiResponse responseObject = gson.fromJson(apiResponse.toString(), ApiResponse.class);

            request.setAttribute("apiResponse", responseObject);

            request.getRequestDispatcher("/eggplant1/exchange.jsp").forward(request, response);

        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().write("Error occurred: " + e.getMessage());
        }
    }
}