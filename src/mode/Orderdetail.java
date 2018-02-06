package mode;

public class Orderdetail {
  private Long detail_id;
  private Long order_id;
  private Long pet_id;
  private String pet_name;
  private Long quantity;
  private Double pet_price;

  public Long getDetail_id() {
    return detail_id;
  }

  public void setDetail_id(Long detail_id) {
    this.detail_id = detail_id;
  }

  public Long getOrder_id() {
    return order_id;
  }

  public void setOrder_id(Long order_id) {
    this.order_id = order_id;
  }

  public Long getPet_id() {
    return pet_id;
  }

  public void setPet_id(Long pet_id) {
    this.pet_id = pet_id;
  }

  public String getPet_name() {
    return pet_name;
  }

  public void setPet_name(String pet_name) {
    this.pet_name = pet_name;
  }

  public Long getQuantity() {
    return quantity;
  }

  public void setQuantity(Long quantity) {
    this.quantity = quantity;
  }

  public Double getPet_price() {
    return pet_price;
  }

  public void setPet_price(Double pet_price) {
    this.pet_price = pet_price;
  }
}
