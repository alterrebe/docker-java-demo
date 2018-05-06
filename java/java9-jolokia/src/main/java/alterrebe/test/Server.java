package alterrebe.test;

import java.io.*;
import java.net.InetSocketAddress;

import com.sun.net.httpserver.*;

public class Server {
   private static class MyHandler implements HttpHandler {
       public void handle(HttpExchange t) throws IOException {
           String response = "This is the response\n";
           t.sendResponseHeaders(200, response.length());
           OutputStream os = t.getResponseBody();
           os.write(response.getBytes());
           os.close();
       }
   }

   public static void main(String args[]) throws Exception {
     HttpServer server = HttpServer.create(new InetSocketAddress(8080), 10);
     server.createContext("/", new MyHandler());
     server.setExecutor(null); // creates a default executor
     server.start();
   }
}
