public class XML_Dynamic {
    public String xmlString {get;set;}
    public String xmlString2 {get;set;}
    
    // Example 1
    public XML_Dynamic(){
        List<Account> acc = [Select Name,Phone,Industry from Account where Phone != Null AND Industry != Null LIMIT 5];
        DOM.Document doc = New DOM.Document();
        DOM.XmlNode root = doc.createRootElement('Account',null,null);
        for(Account EA : acc){
            DOM.XmlNode branch = root.addChildElement('Account',null,null);
            branch.setAttribute('Name', EA.Name);
            branch.setAttribute('Mobile', EA.Phone);
            branch.setAttribute('Company Name', EA.Industry);
        }
        xmlString = doc.toXmlString();
    }
    
    // Example 2
    Public void ABCD(){
        List<Account> acc = [Select Name,Phone,Industry, (Select LastName, FirstName, Email From Contacts Where FirstName != Null AND Email != Null) from Account where Phone != Null AND Industry != Null LIMIT 5];
        DOM.Document doc = New DOM.Document();
        DOM.XmlNode root = doc.createRootElement('Account',null,null);
        for(Account EAC : acc){
            DOM.XmlNode branch = root.addChildElement('Account',null,null);
            branch.setAttribute('Name', EAC.Name);
            branch.setAttribute('Mobile', EAC.Phone);
            branch.setAttribute('Company Name', EAC.Industry);
            if(EAC.contacts.size() > 0){
                DOM.XmlNode branch2 = branch.addChildElement('Contact',null,null);
                for(Contact EC : EAC.contacts)
                {
                    DOM.XmlNode twig = branch2.addChildElement('Contact',null,null);
                    twig.setAttribute('FirstName', EC.FirstName);
                    twig.setAttribute('LastName', EC.LastName);
                    twig.setAttribute('Email', EC.Email);
                }
            }
        }
        xmlString2 = doc.toXmlString();
    }
}