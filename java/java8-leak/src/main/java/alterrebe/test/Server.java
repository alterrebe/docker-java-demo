package alterrebe.test;

import java.io.*;
import java.net.InetSocketAddress;
import java.util.*;

import com.sun.net.httpserver.*;

public class Server {
   static final int LEAK_IN_MB = 20; 

   private static class MyHandler implements HttpHandler {
       private List<ByteArrayInputStream> trail = new ArrayList<ByteArrayInputStream>();

       public void handle(HttpExchange t) throws IOException {
           String response = "This is the response\n";
           t.sendResponseHeaders(200, response.length());
           OutputStream os = t.getResponseBody();
           os.write(response.getBytes());
           os.close();

           // Imitate a memory leak:
           byte [] buf = new byte[ LEAK_IN_MB * 1024 * 1024 ];
           trail.add( new ByteArrayInputStream(buf) );
       }
   }

   public static void main(String args[]) throws Exception {
     HttpServer server = HttpServer.create(new InetSocketAddress(8080), 10);
     server.createContext("/", new MyHandler());
     server.setExecutor(null); // creates a default executor
     server.start();
   }
}
