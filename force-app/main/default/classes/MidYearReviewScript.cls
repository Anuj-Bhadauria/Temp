public class MidYearReviewScript {
    /*
    List<Personal_Annual_Objectives__c> personalObjective = new List<Personal_Annual_Objectives__c>();
    List<Annual_Summary_Self_Assessment__c> annualList = [Select Year__c, (Select id, Personal_Annual_Objective__c, name from Personal_Objectives__r where name = 'Administrative Responsibilities') from Annual_Summary_Self_Assessment__c Where Year__c = '2019'];
    
    for(Annual_Summary_Self_Assessment__c annual : annualList){
        for(Personal_Annual_Objectives__c personalObj : annual.Personal_Objectives__r){
            personalObj.Personal_Annual_Objective__c = 'Compliance with company policies and practices (absence management, training, timesheets and expenses). In particular undertake any mandatory annual training / certifications required for your role (i.e. maintenance exams, GDPR / Anti-Bribery / Diversity trailheads) and ensure completion of timesheets and expenses within the relevant required timeframes.';
            personalObjective.add(personalObj);
        }
    }
    if(personalObjective.size() >0){
        update personalObjective;
    }
    
    
    
    List<Personal_Annual_Objectives__c> personalObjective = new List<Personal_Annual_Objectives__c>();
    List<Annual_Summary_Self_Assessment__c> annualList = [Select Year__c, (Select id, Personal_Annual_Objective__c, name from Personal_Objectives__r where name = 'Organisational Responsibilities') from Annual_Summary_Self_Assessment__c Where Year__c = '2019'];
    for(Annual_Summary_Self_Assessment__c annual : annualList){
        for(Personal_Annual_Objectives__c personalObj : annual.Personal_Objectives__r){
            personalObj.Personal_Annual_Objective__c = 'Keep abreast of current and revised standard processes and tools / best practice required to undertake your role and adopt these consistently (referring to Positive Knowledge as required)';
            personalObjective.add(personalObj);
        }
    }
    if(personalObjective.size() >0){
        update personalObjective;
    }
    
    
    List<Personal_Annual_Objectives__c> personalObjective = new List<Personal_Annual_Objectives__c>();
    List<Annual_Summary_Self_Assessment__c> annualList = [Select Year__c, (Select id, Personal_Annual_Objective__c, name from Personal_Objectives__r where name = 'Services Goals') from Annual_Summary_Self_Assessment__c Where Year__c = '2019'];
    String str = 'living';
    for(Annual_Summary_Self_Assessment__c annual : annualList){
        for(Personal_Annual_Objectives__c personalObj : annual.Personal_Objectives__r){
            
            personalObj.name = 'Company Values';
            personalObj.Personal_Annual_Objective__c = 'Demonstrate that in your role you are driving the business forward, '+' '+ '\''+ str + '\'' +' the company values and helping it to achieve its objective of profitability.';
            personalObjective.add(personalObj);
        }
    }
    if(personalObjective.size() >0){
        update personalObjective;
    }
    */
    
    /*
    -----------------Optimum Course-----------
    TEXT( 
    FLOOR( 
    ROUND((( Course_Length__c / VALUE(TEXT(Speed__c )) ) * 60),1) / 60 
    ) 
    ) + '.' + 
    TEXT( 
    MOD(ROUND((( Course_Length__c / VALUE(TEXT(Speed__c ))) * 60),0) , 60) 
    )
    */
}