# A record that represents a Product.
#
# + code - Code used to identify the product
# + name - Product Name
# + quantity - Quantity included in the product
public type Product record {|
    readonly int code;
    string name;
    string quantity;
|};

# A table with a list of Products uniquely identified using the code.
public type ProductInventory table<Product> key(code);

// This is a sample data set in the defined inventory.
ProductInventory inventory = table [
            {code: 1,  name: "Milk", quantity: "1l"},
            {code: 2, name: "Bread", quantity: "500g"},
            {code: 3, name: "Apple", quantity: "750g"}
        ];

# This client represets a product.
#
# + productCode - An int code used to identify the product.
public client class ProductClient {
    public int productCode;

    public function init(int productCode) {
        self.productCode = productCode;
    }
}

// The Client which represents the product with the code `1` (i.e. "Milk").
ProductClient productClient = new (1);

# Get the name of the product represented by the ProductClient.
#
# + return - The name of the product
public function getProductName() returns string?{
    if (inventory.hasKey(productClient.productCode)){
        Product? product = inventory.get(productClient.productCode);
        if(product is Product){
                return product.name;
        }
    }
 }