({
	openTab : function(component, event, helper) {
		component.set("v.currentTab", event.getParam("tab"));
	},
    
    tabClicked : function(component, event, helper) {
        var currentTarget = event.getSource();
        var newTab = currentTarget.get("v.name");
        component.set("v.currentTab", newTab);
	}
})