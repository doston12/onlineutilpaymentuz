package uz.yt.tli.helper;

import org.springframework.util.StringUtils;

public class StringHelper {

    public static String get(Object obj) {
        String text = null;
        if (!StringUtils.isEmpty(obj)) {
            text = String.valueOf(obj);
        }
        return text;
    }

    public static String Trim(String text) {
        if (text != null) {
            text = text.trim();
        }
        return text;
    }

    public static String TrimLowerCase(String text) {
        if (text != null) {
            text = text.trim().toLowerCase();
        }
        return text;
    }

    public static String TrimUpperCase(String text) {
        if (text != null) {
            text = text.trim().toUpperCase();
        }
        return text;
    }

    public static String TrimAllWhitespaces(String text) {
        if (text != null) {
            text = text.replaceAll("\\s", "");
        }
        return text;
    }

    public static String padLeftZeros(String text, int length) {
        if (text != null) {
            text = String.format("%1$" + length + "s", TrimAllWhitespaces(text)).replace(' ', '0');
        }
        return text;
    }

}
