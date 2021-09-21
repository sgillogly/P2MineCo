({
    myAction : function(component, event, helper) {
        
    },
    chartSetup : function(component, event, helper) {
    	component.set("v.content", "changed content");
        
        let sampleData = component.get("c.sampleData");
        sampleData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            var metalsList = helper.populateMetalsList(metalsMap);
            component.set("v.metals", metalsList);
                               })
        
        $A.enqueueAction(sampleData);
	},
    
        actualData : function(component, event, helper) {
    	component.set("v.content", "loading");
        
        let realData = component.get("c.realData");
        realData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            var metalsList = helper.populateMetalsList(metalsMap);
            component.set("v.metals", metalsList);
            component.set("v.content", "complete");
                               })
        
        $A.enqueueAction(realData);
	}
 })