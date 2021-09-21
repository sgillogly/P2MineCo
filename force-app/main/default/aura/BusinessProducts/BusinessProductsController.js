({
	myAction : function(component, event, helper) {
		
	},
    reload : function(component, event, helper) {
		let getProducts = component.get("c.getProducts");
        component.set("v.content", "loading");
        getProducts.setCallback(this, function(response) {
            component.set("v.content", "complete");
            var productsList = [];
            var productsMap = response.getReturnValue();
            for (var key in productsMap) {
                component.set("v.content", "not empty");
                productsList.push({value:productsMap[key], key:key});
            }
            component.set("v.itemsList", productsList);
            
        })
        
        $A.enqueueAction(getProducts);
	}
})