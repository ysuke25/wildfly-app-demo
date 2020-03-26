import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.UnknownHostException;

//手っ取り早くJSP側で全て処理させているのでこちらの処理は画面上反映していません
//デバッグ用途として使用しているので削除しても可です
public class Smaple {

    public static void main(String args[]) throws UnknownHostException {

        //ホスト名取得
        InetAddress ia = InetAddress.getLocalHost();
        String ip = ia.getHostAddress();       //IPアドレス
        String hostname = ia.getHostName();    //ホスト名
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
    }
}
