({
	helperMethod : function() {
		
	},
    
    flipSwitch : function(component) {
        this.updateContent(component);
		this.waitingTimeId = setTimeout($A.getCallback(() => this.flipSwitch(component)), 4000);
	},
    
    updateContent : function(component) {
        var count = component.get("v.current") + 1;
        if (count > 5) {
            count = count - 5;
        }
        component.set("v.current", count);
        var tempList = component.get("v.prices");
        component.set("v.content", tempList[count]);
	},
})