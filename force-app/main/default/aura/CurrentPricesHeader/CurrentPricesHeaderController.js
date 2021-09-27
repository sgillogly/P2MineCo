({
    setup : function(component, event, helper) {
        let getData = component.get("c.realData");
        getData.setParams({rows: 1})
        getData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            helper.convertMapToLists(component, metalsMap);
        })
        
        $A.enqueueAction(getData);
        
		helper.nextEntry(component);
	}
})