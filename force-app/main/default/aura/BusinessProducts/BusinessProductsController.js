({
	gotoProducts : function(component, event, helper) {        
        let fireEvent = $A.get("e.c:MineCoTabClicked");
        fireEvent.setParams({"product" : event.target.name});
        fireEvent.setParams({"tab" : "Business"});
        fireEvent.fire();
    },
    
    reload : function(component, event, helper) {
		let getProducts = component.get("c.getProducts");
        getProducts.setCallback(this, function(response) {
            var productsList = [];
            var productsMap = response.getReturnValue();
            for (var key in productsMap) {//convert map to list of singleton maps
                productsList.push({value:productsMap[key], key:key});
            }
            component.set("v.itemsList", productsList);
        })
        
        $A.enqueueAction(getProducts);
	}
})