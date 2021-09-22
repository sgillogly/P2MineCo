({
    myAction : function(component, event, helper) {
        
    },
    
    setup : function(component, event, helper) {
        
        let sampleData = component.get("c.sampleData");
        sampleData.setParams({rowsInput: 5})
        sampleData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            var metalsList = helper.populateMetalsList(metalsMap);
            component.set("v.metals", metalsList);
            
            
            var element = component.find("chart").getElement();
            var ctx = element.getContext("2d");
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: helper.populateLabels(5),
                    datasets: helper.populateDatasets(metalsMap)
                }, 
                options: {
                    responsive: false
                }
            });
        })
        
        $A.enqueueAction(sampleData);
      },
    
    fakeData : function(component, event, helper) {
        component.set("v.content", "changed content");
        
        let sampleData = component.get("c.sampleData");
        sampleData.setParams({rowsInput: 5})
        sampleData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            var metalsList = helper.populateMetalsList(metalsMap);
            component.set("v.metals", metalsList);
        })
        
        $A.enqueueAction(sampleData);
        
    },
    
    actualData : function(component, event, helper) { component.set("v.content", "loading");
        
        let realData = component.get("c.realData");
        realData.setParams({rowsInput: 15});
        realData.setCallback(this, function(response) {
            var metalsMap = response.getReturnValue();
            var metalsList = helper.populateMetalsList(metalsMap);
            component.set("v.metals", metalsList);
            component.set("v.content", "complete");
            
            
            var element = component.find("chart").getElement();
            var ctx = element.getContext("2d");
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: helper.populateLabels(15),
                    datasets: helper.populateDatasets(metalsMap)
                }, 
                options: {
                    responsive: false
                }
            });
        })
        
        $A.enqueueAction(realData);
    }
})