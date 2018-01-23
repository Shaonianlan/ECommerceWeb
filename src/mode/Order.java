package mode;

public class Order {
  private Long order_id;
  private String user_name;
  private String pet_name;
  private String order_time;
  private String user_address;
  private Double order_price;
  private String user_phone;

  public Long getOrder_id() {
    return order_id;
  }

  public void setOrder_id(Long order_id) {
    this.order_id = order_id;
  }

  public String getUser_name() {
    return user_name;
  }

  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }

  public String getPet_name() {
    return pet_name;
  }

  public void setPet_name(String pet_name) {
    this.pet_name = pet_name;
  }

  public String getOrder_time() {
    return order_time;
  }

  public void setOrder_time(String order_time) {
    this.order_time = order_time;
  }

  public String getUser_address() {
    return user_address;
  }

  public void setUser_address(String user_address) {
    this.user_address = user_address;
  }

  public Double getOrder_price() {
    return order_price;
  }

  public void setOrder_price(Double order_price) {
    this.order_price = order_price;
  }

  public String getUser_phone() {
    return user_phone;
  }

  public void setUser_phone(String user_phone) {
    this.user_phone = user_phone;
  }
}
