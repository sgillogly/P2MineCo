({
	myAction : function(component, event, helper) {
		
	},
    
    startTimer : function(component, event, helper) {
        let sampleData = component.get("c.sampleData");
        sampleData.setParams({rowsInput: 1})
        sampleData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            var singleMap = new Map();
            var singleList = [];
            for (var key in metalsMap) {
                for (var innerKey in metalsMap[key]) {
                    var entry = key + ": $" + metalsMap[key][innerKey] + " per ton";
                    singleList.push(entry);
                    //singleMap[key] = metalsMap[key][innerKey]
                }
            }
            component.set("v.prices", singleList);
            
        })
        
        $A.enqueueAction(sampleData);
        
		helper.flipSwitch(component);
	}
})