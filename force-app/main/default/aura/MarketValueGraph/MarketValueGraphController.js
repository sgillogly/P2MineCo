({
    setup : function(component, event, helper) {
        
        let sampleData = component.get("c.realData");
        sampleData.setParams({rows: 15})
        sampleData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            helper.chartSetup(component, metalsMap, null);
            component.set("v.content", "");
        })
        
        $A.enqueueAction(sampleData);
      },
    
    fakeData : function(component, event, helper) {
        /*
        component.set("v.content", "changed content");
        
        let sampleData = component.get("c.sampleData");
        sampleData.setParams({rows: 5})
        sampleData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            helper.chartSetup(component, metalsMap, null);
        })
        
        $A.enqueueAction(sampleData);
        */
        component.set("v.content", "eventing");
        let fireEvent = component.getEvent("metalDetail");
        fireEvent.setParams({"product" : "Gold"});
        fireEvent.setParams({"tab" : "Business"});
        fireEvent.fire();
        
    },
    
    actualData : function(component, event, helper) {
        component.set("v.content", "Loading " + event.getParam("product") + "...");
        //helper.getData(this, component.get("c.realData"), 15);
        
        let realData = component.get("c.realData");
        realData.setParams({rows: 15});
        realData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            helper.chartSetup(component, metalsMap, event.getParam("product"));
            component.set("v.content", "");
        })
        
        $A.enqueueAction(realData);
    }
})