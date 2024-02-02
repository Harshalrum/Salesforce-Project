public class Json_Seri_1 
{
	public void CreateJson(String Na, String Ph, String Ind)
    {
        System.JSONGenerator js = JSON.createGenerator(true);				//Step 1 - Create JSON Generator
        js.writeStartObject();												//Step 2 - Start writing to JSON
        try
        {
        	Account A = New Account();
            A.Name = Na;
            A.Phone = Ph;
            A.Industry = Ind;
            Insert A;
            
            js.writeStringField('Status','Success');						//Step 3 - Write to JSON as per requirement
            js.writeIdField('AccId',A.Id);
            js.writeStringField('Msg','Account Created Successfully');
            js.writeNumberField('Code',100);
        }
        catch(exception e)
        {
            js.writeStringField('Status','Failed');
            js.writeStringField('Msg',e.getMessage());
            js.writeNumberField('Code',200);
        }
        js.writeEndObject();												//Step N - End writing to JSON 
        String Result = js.getAsString();									//Step - Get the Final Output
        System.debug(Result);												//Step - Display the output
    }
}