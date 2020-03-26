<%@ page import="java.net.InetAddress"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <script src="jquery-3.4.1.min.js"></script>
    <style>
          body {
            padding-top: 5rem;
           }
          .starter-template {
            padding: 3rem 1.5rem;
            text-align: center;
           }
        </style>
    <title>Sampleアプリケーション</title>
</head>
<body>
    <%
        //ホスト名取得
        InetAddress ia = InetAddress.getLocalHost();
        String ip = ia.getHostAddress();       //IPアドレス
        String hostname = ia.getHostName();    //ホスト名
    %>
    <%
        String websphere = "";
        String java_version = "";
        String java_vendor = "";
        String os_name = "";
        String os_version = "";
        String os_arch = "";
        String os_distribution = "";

        try {
            String command = "/opt/ibm/wlp/bin/productInfo version";
            Process process = Runtime.getRuntime().exec(command);
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                                    process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                websphere += line + "<br>";
            }
         } catch (Exception e) {
            e.printStackTrace();
            websphere = "取得出来ませんでした";
         }
         try {
            String[] command = {"/bin/sh", "-c", "cat /etc/os-release | grep -v CODENAME | grep -v URL | grep -v ID | grep -v PRODUCT"};
            Process process = Runtime.getRuntime().exec(command);
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                                    process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                os_distribution += "<br>" + line;
            }
         } catch (Exception e) {
            e.printStackTrace();
            os_distribution = "取得出来ませんでした";
         }
         try {
            java_version = System.getProperty("java.version");
            java_vendor = System.getProperty("java.vendor");
            os_name = System.getProperty("os.name");
            os_version = System.getProperty("os.version");
            os_arch = System.getProperty("os.arch");
         } catch (Exception e) {
            e.printStackTrace();
            os_version = "取得出来ませんでした";
            os_arch = "取得出来ませんでした";
         }
    %>

    <main role="main" class="container">
        <div class="starter-template">
            <h1>Sampleアプリケーションです</h1>
            <p class="lead">このPodの構成情報について</p>
            <table class="table table-striped">
                <tr><td>Podのアドレス</td><td><%=ip%></td></tr>
                <tr><td>Podのホスト名</td><td><%=hostname%></td></tr>
                <tr><td>アプリサーバ</td><td><%=websphere.replaceAll("<br>$", "")%></td></tr>
                <tr><td>Java</td><td><%="バージョン：" + java_version + "<br>ベンダー：" + java_vendor%></td></tr>
                <tr><td>OS</td><td><%="ディストリビューション情報：" + os_distribution + "<br>カーネルバージョン：" + os_version + "<br>アーキテクチャ：" + os_arch%></td></tr>
            </table>
        </div>
    </main>
</body>
</html>