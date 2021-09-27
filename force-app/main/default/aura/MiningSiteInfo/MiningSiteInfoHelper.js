({
	retrieveMiningSiteInfo : function(component) {
        var siteInfo = component.find("Search1").get("v.value");
		let apexMethod = component.get("c.GetMiningSite");
        apexMethod.setParams({Name:siteInfo});
		apexMethod.setCallback(this, function (response) {
            if (response.getState() == 'SUCCESS') {
                console.log(response.getReturnValue());
				component.set("v.Site", response.getReturnValue());
            }
        });
        $A.enqueueAction(apexMethod);
	}
})