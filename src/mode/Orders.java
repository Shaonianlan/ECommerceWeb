package mode;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Orders {
  private Long order_id;
  private String user_name;
  private Long user_id;
  private String user_address;
  private String user_phone;
  private String order_time;
  private Double order_price;
  private Long order_status;// 1:新订单 2:已核对 3:已发货 4:已收货 5:拒收 6:完成

  List<Orderdetail> orderdetaillist = new ArrayList<Orderdetail>();

  public Orders(){
    order_status = 1L;
    order_price = 0.0;
  }

  public void addOrderdetail(Orderdetail od){
    orderdetaillist.add(od);
    order_price += od.getPet_price() * od.getQuantity();
  }

  public List<Orderdetail> getOrderdetail() {
    return orderdetaillist;
  }

  public Long getOrder_id() {
    return order_id;
  }

  public void setOrder_id(Long order_id) {
    this.order_id = order_id;
    Iterator<Orderdetail> it = orderdetaillist.iterator();
    while(it.hasNext()){
      Orderdetail od = it.next();
      od.setOrder_id(order_id);
    }
  }

  public String getUser_name() {
    return user_name;
  }

  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }

  public String getUser_address() {
    return user_address;
  }

  public void setUser_address(String user_address) {
    this.user_address = user_address;
  }

  public String getUser_phone() {
    return user_phone;
  }

  public void setUser_phone(String user_phone) {
    this.user_phone = user_phone;
  }

  public String getOrder_time() {
    return order_time;
  }

  public void setOrder_time(String order_time) {
    this.order_time = order_time;
  }

  public Double getOrder_price() {
    return order_price;
  }

  public void setOrder_price(Double order_price) {
    this.order_price = order_price;
  }

  public Long getOrder_status() {
    return order_status;
  }

  public void setOrder_status(Long order_status) {
    this.order_status = order_status;
  }

  public Long getUser_id(){ return user_id; }

  public void setUser_id(Long user_id){ this.user_id = user_id; }
}
