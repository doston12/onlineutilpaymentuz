package uz.yt.tli.dto;

public class SecurityDto {

    public String username;

    public SecurityDto() {
    }

    public SecurityDto(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
