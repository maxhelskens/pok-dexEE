/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pokéapi_client;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Max
 */
public class Pokéapi_Client {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        Pokéapi_Client http = new Pokéapi_Client();
        http.sendGet();
    }
    
    // HTTP GET request
    private void sendGet() throws Exception {

            String url = "http://pokeapi.co/api/v2/pokemon/1/";

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            // optional default is GET
            con.setRequestMethod("GET");

            //add request header
            con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11");

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
            }
            in.close();

            
            JSONObject jsonObj = new JSONObject(response.toString());
            //NAME
            System.out.println("Name: " + jsonObj.getString("name"));
            //ABILITIES
            JSONArray abilities = jsonObj.getJSONArray("abilities");
            System.out.println("Abilities:");
            for (int i=0; i<abilities.length(); i++) {
                JSONObject ability = abilities.getJSONObject(i);
                System.out.println("    "  + (i+1) + " - " + ability.getJSONObject("ability").getString("name"));
            }
            //TYPES
            JSONArray types = jsonObj.getJSONArray("types");
            System.out.println("Types:");
            for (int i=0; i<types.length(); i++) {
                JSONObject type = types.getJSONObject(i);
                System.out.println("    "  + (i+1) + " - " + type.getJSONObject("type").getString("name"));
            }
            //STATS
            JSONArray stats = jsonObj.getJSONArray("stats");
            System.out.println("Stats:");
            for (int i=0; i<stats.length(); i++) {
                JSONObject stat = stats.getJSONObject(i);
                System.out.println("    "  + stat.getJSONObject("stat").getString("name") + " = " + stat.getInt("base_stat"));
            }
            //height
            System.out.println("Height: " + (float)jsonObj.getInt("height")/10 + "m");
            //weight
            System.out.println("Weight: " + (float)jsonObj.getInt("weight")/10 + "Kg");
            //Sprite
            System.out.println("SpriteURL: " + jsonObj.getJSONObject("sprites").getString("front_default"));
            

    }
}
