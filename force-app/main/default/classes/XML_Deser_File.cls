public class XML_Deser_File {
    Public Blob xmlfile {get;set;}
    
    Public Void callMe(){
        List<Account> accounts = new List<Account>();
        
        String xmlString = xmlfile.toString();
        xmlfile = null;
        
        DOM.Document doc = new DOM.Document();
        doc.load(xmlString);
        DOM.XmlNode root = doc.getRootElement();
        List<DOM.XmlNode> branch = root.getChildElements();
        for(DOM.XmlNode eb : branch){
            Account A = new Account();
            A.Name = eb.getAttributeValue('Name',null);
            A.Phone = eb.getAttributeValue('Mobile',null);
            A.Industry = eb.getAttributeValue('ComapnyType',null);
            accounts.add(A);
        }
        insert accounts;
    }
}