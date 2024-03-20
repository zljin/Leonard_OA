import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DemoTest {

    public static void main(String[] args) throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d1 = df.parse("2004-03-26 23:30:24");
        Date d2 = df.parse("2004-03-26 13:35:24");
        long diff = d1.getTime() - d2.getTime();//这样得到的差值是毫秒级别
        long hours = diff / (1000 * 60 * 60);
        System.out.println(hours);
    }
}
