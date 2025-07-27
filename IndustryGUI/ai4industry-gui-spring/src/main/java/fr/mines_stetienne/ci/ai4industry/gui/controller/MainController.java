package fr.mines_stetienne.ci.ai4industry.gui.controller;


import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * @author YoucTagh
 */
@RestController
@RequestMapping(path = "/")
public class MainController {

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity getState(@RequestHeader("Authorization") String authorisation) throws IOException {
        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();

        Request request = new Request.Builder()
                .url("https://ci.mines-stetienne.fr/simu-backdoor/")
                .method("GET", null)
                .addHeader("Authorization", authorisation)
                .build();

        Response execute = client.newCall(request)
                .execute();


        ResponseEntity responseEntity = ResponseEntity
                .ok()
//                .header("Access-Control-Allow-Origin", "http://localhost:3000")
//                .header("Access-Control-Allow-Methods", "POST, PUT, PATCH, GET, DELETE, OPTIONS")
//                .header("Access-Control-Allow-Headers", "*")
//                .header("Access-Control-Allow-Credentials", "true")
                .body(execute.body().string());

        return responseEntity;
    }


}
