({
	loadImgs : function(component, event, helper) {
        helper.ApexUrlMethod(component, 0);
        helper.ApexSiteNameMethod(component, 0);
        helper.ApexSiteOreMethod(component, 0);
        helper.ApexUrlMethod(component, 1);
        helper.ApexSiteNameMethod(component, 1);
        helper.ApexSiteOreMethod(component, 1);
        helper.ApexUrlMethod(component, 2);
        helper.ApexSiteNameMethod(component, 2);
        helper.ApexSiteOreMethod(component, 2);
    },
    FireEvent : function(component, event, helper) {
        helper.ProcessFireEvent(component, event);
    }
})