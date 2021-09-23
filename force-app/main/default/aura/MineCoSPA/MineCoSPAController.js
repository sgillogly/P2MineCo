({
	myAction : function(component, event, helper) {
		
	},
    
    tabClicked : function(component, event, helper) {
        var currentTarget = event.getSource();
        var newTab = currentTarget.get("v.name");
        component.set("v.currentTab", newTab);
		/*var tabClickedEvent = component.getEvent("tabClickedEvent");
        tabClickedEvent.setParams({tab: "temp"});//need to reference tab that fired event
        tabClickedEvent.fire();*/
	}
})