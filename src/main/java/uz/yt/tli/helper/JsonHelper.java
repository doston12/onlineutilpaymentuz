package uz.yt.tli.helper;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.List;

public class JsonHelper {

    public static ObjectMapper GetMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        return mapper;
    }

    public static String get(Object obj) throws IOException {
        ObjectMapper mapper = GetMapper();
        String json = mapper.writeValueAsString(obj);
        return json;
    }

    // BYTE 
    public static <T extends Object> T Convert(byte[] json, Class<T> cls) throws IOException {
        return GetMapper().readValue(json, cls);
    }

    public static <T extends Object> List<T> ConvertList(byte[] json, Class<T> cls) throws IOException {
        ObjectMapper mapper = GetMapper();
        JavaType type = mapper.getTypeFactory().constructParametricType(List.class, cls);
        return mapper.readValue(json, type);
    }

    // STRING
    public static <T extends Object> T Convert(String json, Class<T> cls) throws IOException {
        return GetMapper().readValue(json, cls);
    }

    public static <T extends Object> List<T> ConvertList(String json, Class<T> cls) throws IOException {
        ObjectMapper mapper = GetMapper();
        JavaType type = mapper.getTypeFactory().constructParametricType(List.class, cls);
        return mapper.readValue(json, type);
    }

    // OBJECT
    public static String ConvertToString(Object obj) throws JsonProcessingException {
        return GetMapper().writeValueAsString(obj);
    }

}
