public class PillarPieChartApex {
	@AuraEnabled 
	Public static list<charWrap> getChartData(){
		charWrap cWrap1 = new charWrap();
			cWrap1.dataLabels = new list<string>{'Enviromental', 'Social', 'Economic'};
			cWrap1.dataValues = new list<integer>{50, 33, 17};
            cWrap1.dataText1 = new list<string>{'The environmental pillar often gets the most attention. Companies are focusing on reducing their carbon footprints, packaging waste,','A sustainable business should have the support and approval of its employees, stakeholders, and the community it operates in. The','The economic pillar of sustainability is where most businesses feel they are on firm ground. To be sustainable, a business must be'};
            cWrap1.dataText2 = new list<string>{'water usage, and their overall effect on the environment. Companies have found that having a beneficial impact on the planet can also bring','approaches to securing and maintaining this support vary greatly, but all come down to treating employees fairly and being a good neighbor','profitable. That said, profit cannot trump the other two pillars. In fact, profit at any cost is not at all what the economic pillar is about.'};
            cWrap1.dataText3 = new list<string>{'financial benefits. Lessening the amount of material used in packaging usually reduces the overall cost of such materials, for example.','and community member, both locally and globally.','Activities that fit under the economic pillar include compliance, proper governance, and risk management.'};            
		return new list<charWrap>{cWrap1};
	}
	public class charWrap {
		@AuraEnabled  public list<string> dataLabels;
		@AuraEnabled  public list<integer> dataValues;
        @AuraEnabled  public list<string> dataText1;
        @AuraEnabled  public list<string> dataText2;
        @AuraEnabled  public list<string> dataText3;
		public charWrap(){
			dataLabels = new list<string>();
			dataValues = new list<integer>(); 
            dataText1 = new list<string>();
            dataText2 = new list<string>();
            dataText3 = new list<string>();
		}
	}
}