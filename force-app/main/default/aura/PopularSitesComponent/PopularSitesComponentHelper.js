({
	ApexUrlMethod : function(component, int) {
        let apexMethod = component.get("c.imageUrlBase");
        apexMethod.setParams({"idx": int});
        apexMethod.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                if(int == 0){
        			component.set("v.img1Url", response.getReturnValue());
        		} else if(int == 1){
            		component.set("v.img2Url", response.getReturnValue());
        		} else if(int == 2){
            		component.set("v.img3Url", response.getReturnValue());
        		}
            }
        });
        $A.enqueueAction(apexMethod);
        
	}
})