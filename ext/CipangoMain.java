/**
 * Copyright (c) 2010 Engine Yard, Inc.
 * This source code is available under the MIT license.
 * See the file LICENSE.txt for details.
 */

import java.net.URLClassLoader;
import java.net.URL;
import java.lang.reflect.Method;
import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Arrays;

import org.cipango.Server;

public class CipangoMain implements Runnable {
    public static final String MAIN = "/" + CipangoMain.class.getName().replace('.', '/') + ".class";

    private String[] args;
    private String path, warfile;
    private boolean debug;
    private File webroot;

    public CipangoMain(String[] args) throws Exception {
        this.args = args;
        URL mainClass = getClass().getResource(MAIN);
        this.path = mainClass.toURI().getSchemeSpecificPart();
        this.warfile = mainClass.getFile().replace("!" + MAIN, "").replace("file:", "");
        this.debug = isDebug();
        this.webroot = File.createTempFile("cipango", "webroot");
        this.webroot.delete();
        this.webroot.mkdirs();
        this.webroot = new File(this.webroot, new File(warfile).getName());
        Runtime.getRuntime().addShutdownHook(new Thread(this));
    }

    private URL extractCipangoJar(String name, String path) throws Exception {
        InputStream jarStream = new URL("jar:" + path.replace(MAIN, "/WEB-INF/" + name + ".jar")).openStream();
        File jarFile = File.createTempFile(name , ".jar");
        //jarFile.deleteOnExit();
        FileOutputStream outStream = new FileOutputStream(jarFile);
        try {
            byte[] buf = new byte[4096];
            int bytesRead = 0;
            while ((bytesRead = jarStream.read(buf)) != -1) {
                outStream.write(buf, 0, bytesRead);
            }
        } finally {
            jarStream.close();
            outStream.close();
        }
        debug(name + ".jar extracted to " + jarFile.getPath());
        return jarFile.toURI().toURL();
    }

    private void launchCipango(URL[] jars) throws Exception {
        URLClassLoader loader = new URLClassLoader(jars);
        Class klass = Class.forName("org.cipango.Server", true, loader);
        Server server = (Server)klass.newInstance();
        
        server.start();
    }

    private void start() throws Exception {
        // TODO: DRY those jar names
        launchCipango(new URL[] { 
          extractCipangoJar("cipango-1.0", this.path),
          extractCipangoJar("sip-api-1.1", this.path),
          extractCipangoJar("jetty-6.1.24", this.path),
          extractCipangoJar("jetty-util-6.1.24", this.path),
          extractCipangoJar("servlet-api-2.5-20081211", this.path)
        });
    }

    private void debug(String msg) {
        if (debug) {
            System.out.println(msg);
        }
    }

    private void delete(File f) {
        if (f.isDirectory()) {
            File[] children = f.listFiles();
            for (int i = 0; i < children.length; i++) {
                delete(children[i]);
            }
        }
        f.delete();
    }

    public void run() {
        delete(webroot.getParentFile());
    }

    public static void main(String[] args) {
        try {
            new CipangoMain(args).start();
        } catch (Exception e) {
            System.err.println("error: " + e.toString());
            if (isDebug()) {
                e.printStackTrace();
            }
            System.exit(1);
        }
    }

    private static boolean isDebug() {
        return System.getProperty("warbler.debug") != null;
    }
}

