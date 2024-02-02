public class JSON_Parser_deSeri 
{
    Public String JsonString {get;set;}
    Public Map<String,Object> Result {get;set;}
    
    Public JSON_Parser_deSeri()
    {
        Result = new Map<String,Object>();
        JsonString = '{"Name":"Harshal","Marks":[10,20,30],"City":"Hyd"}';    //First Example
        
        JsonString = '{"Message": "Number of Post office(s) found:2","Status": "Success","PostOffice": [{"Name":"New Delhi","Description":null,"BranchType":"HeadPostOffice","DeliveryStatus":"Delivery","Circle":"Delhi","District": "New Delhi","Division": "New Delhi GPO","Region": "Delhi","State": "Delhi","Country": "India","Pincode": "110001"},{"Name": "New Delhi South Ext-II","Description": null,"BranchType": "Sub Post Office","DeliveryStatus": "Non-Delivery","Circle": "Delhi","District": "South Delhi","Division": "New Delhi South","Region": "Delhi","State": "Delhi","Country": "India","Pincode": "110049"}]}'; 
        System.JSONParser jp = JSON.createParser(JsonString);					//Create Parser
        
        While(jp.nextToken()!=Null)												//Create While loop always & check if the parser is success 		
        {
            Result.put(jp.getText(),jp.getCurrentToken());       // First Example
            
            if(jp.getText()=='District'){							
                jp.nextToken();
                String District = jp.getText();
                System.debug(District);
            }
            
            if(jp.getText()=='BranchType'){
                jp.nextToken();
                String BT = jp.getText();
                System.debug(BT);
            }
        }
    }
}