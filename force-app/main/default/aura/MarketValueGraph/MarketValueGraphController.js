({
    setup : function(component, event, helper) {
        
        let sampleData = component.get("c.sampleData");
        sampleData.setParams({rows: 5})
        sampleData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            helper.chartSetup(component, metalsMap);
        })
        
        $A.enqueueAction(sampleData);
      },
    
    fakeData : function(component, event, helper) {
        component.set("v.content", "changed content");
        
        let sampleData = component.get("c.sampleData");
        sampleData.setParams({rows: 5})
        sampleData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            helper.chartSetup(component, metalsMap);
        })
        
        $A.enqueueAction(sampleData);
        
    },
    
    actualData : function(component, event, helper) { component.set("v.content", "loading");
        //helper.getData(this, component.get("c.realData"), 15);
        
        let realData = component.get("c.realData");
        realData.setParams({rows: 15});
        realData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            helper.chartSetup(component, metalsMap);
        })
        
        $A.enqueueAction(realData);
    }
})