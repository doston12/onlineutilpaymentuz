package uz.yt.tli.configs;

import java.sql.SQLException;
import javax.sql.DataSource;

import oracle.jdbc.pool.OracleDataSource;

public class DatabaseConfig {
    
    public static DataSource getDataSource(String user, String password, String url) throws SQLException{
        OracleDataSource source = new OracleDataSource();
        source.setUser(user);
        source.setPassword(password);
        source.setURL(url);
        
        return source;
    }
}
