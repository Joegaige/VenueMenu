/**
 Written By: Mario Townes
 Written On: 4/21/2019
 
 This class is designed to hold specializations for items.
 */

public class Specialization: Codable{
    public let name: String         //Name of the specialization - Constant
    public let price: Float         //Price of the specialization - Constant
    public let picture: String?     //String name of the image this should link to - Constant
    public var status: Bool         //Boolean if the specialization is selected or not.
    
    public init(name: String, price: Float, picture: String?, status: Bool){
        self.name = name
        self.price = price
        self.picture = picture
        self.status = status
    }
    
    /**
     This will return the value of the specialization.  If the item is on, it will return the price.
     Otherwise, it will return zero.  That way we don't have to check the status of each specialization,
     we can just get the price of all of them and add it up later.
     */
    public func GetPrice() -> Float{
        if(self.status)
        {
            return self.price
        }
        else
        {
            return 0.00
        }
    }
    
    public func SwitchStatus(){
        self.status = !self.status
    }
}
