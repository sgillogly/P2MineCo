({
    newLead : function(component, event, helper) {
        let companyName = component.find("companyName").get("v.value");
        if(companyName != " "){
            component.set("v.leadSaved", true);
        }
        
     }
})