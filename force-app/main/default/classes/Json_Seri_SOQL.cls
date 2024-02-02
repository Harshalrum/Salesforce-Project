public class Json_Seri_SOQL 
{
    public void getAccount()
    {
        System.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        	Try
            {
                List<Account> AccList = [Select Name,Phone From Account Where Phone != Null];
                for(Account Acc : AccList)
                {
                	js.writeStringField('AccountName',Acc.Name);
                    js.writeStringField('Phone',Acc.Phone);
                    js.writeStringField('Status','Success');
                    js.writeNumberField('Code',800);
                }
            }
        	Catch(exception e)
            {
                	js.writeStringField('Status','Failed');
                	js.writeNumberField('Code',600);
            }
        js.writeEndObject();
        String Output = js.getAsString();
        System.debug(Output);
    }
}