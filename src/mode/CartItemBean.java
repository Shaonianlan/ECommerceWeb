package mode;

/**
 * Created by 10096 on 2018/1/30.
 */
public class CartItemBean {
    private Pet pet;
    private int quantity;
    public CartItemBean(Pet pet , int quantity){
        this.pet = pet;
        this.quantity = quantity;
    }
    public Pet getpet(){
        return pet;
    }
    public void setQuantity(int quantity){
        this.quantity = quantity;
    }
    public int getQuantity(){
        return quantity;
    }
}
