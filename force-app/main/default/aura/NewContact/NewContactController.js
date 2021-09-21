({
    myAction : function(component, event, helper) {
        
    },
    newContact : function(component, event, helper) {
        var firstName = component.find("firstname").get("v.value");
        component.set("v.output", firstName);
        
        let createContact = component.get("c.createContact");
        
        createContact.setParams({
            firstName : component.find("firstname").get("v.value"),
            lastName : component.find("lastname").get("v.value"),
            email : component.find("email").get("v.value"),
            phone : component.find("phone").get("v.value"),
            fax : component.find("fax").get("v.value"),
            country : component.find("country").get("v.value"),
            city : component.find("city").get("v.value"),
            state : component.find("state").get("v.value"),
            street : component.find("street").get("v.value"),
            zip : component.find("zip").get("v.value")
        })
        createContact.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                component.set("v.output", "Success");//might need error checking
            }
        })
        
        $A.enqueueAction(createContact);
    }
})