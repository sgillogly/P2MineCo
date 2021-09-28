({
	retrieveMineData : function(component) {
        var action = component.get("c.getMineData");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var chart2Data = response.getReturnValue();
                var labelSet=[];
                var dataSet=[];
                chart2Data.forEach(function(key){
                    labelSet.push(key.Name);
                    dataSet.push(key.Carbon_Footprint);
                });
                if(!$A.util.isEmpty(chart2Data)){
                    console.log(chart2Data);
                    var canvas2 = document.getElementById("colorCanvas2")
                    var myChart2 = new Chart(canvas2, {
                        type: 'bar',
                        data: {
                            labels: labelSet,
                            datasets: [{
                                data: dataSet,
	                            backgroundColor: "#65c800",
                            }]
                        },
                        options: {
                            responsive: true,
                            title: {
                                display: true,
                                position: 'top', 
                            },
                            legend: {
                                display: false,
                            },
                            scales: {
                                yAxes: [{
                                    display: true,
                                    scaleLabel: {
                                        display: true,
                                        fontColor: "#000000",
                                        labelString: 'Carbon Footprint (tons)',
                                    },
                                    ticks: {
                                        beginAtZero: true,
                                        min: 0,
                                        fontColor: "#000000",
                                    },
                                    gridLines: {
        								color: '#000000',
    								},
                                }],
                                xAxes: [{
                                    ticks:{
                                        fontColor: "#000000", 
                                    } ,
                                    gridLines: {
        								color: '#000000',
    								},
                                }],
                            },
                        },
                    });
                    console.log(myChart2);
                }
            }
        });
        $A.enqueueAction(action);
	}
})