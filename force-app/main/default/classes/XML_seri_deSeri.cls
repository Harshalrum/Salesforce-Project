public class XML_seri_deSeri 
{
    public String xmlString{get;set;}
    
    public XML_seri_deSeri()
    {
        DOM.Document doc = new DOM.Document();		//Step1 - Create XML Document
        //DOM.XmlNode root = doc.createRootElement('Employee','https://rupom.in','rc');		//Step2 - Create the root
        DOM.XmlNode root = doc.createRootElement('Company',null,null);
        DOM.XmlNode trunk = root.addChildElement('Employee',null,null); 	//Step3 - add trunk/childElement
        DOM.XmlNode trunk1 = root.addChildElement('Employee1',null,null);
        DOM.XmlNode branches = trunk.addChildElement('Work',null,null);
        branches.addTextNode('Harshal');									//Step4 - add node
        xmlString = doc.toXmlString();				//Step -- Give the output XML (give the plant)
    }
}