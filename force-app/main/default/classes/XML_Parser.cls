public class XML_Parser 
{
    Public String xmlString {get;set;}
    Public String parseData {get;set;}
    
    Public Void ConvertMe()
    {
        DOM.Document doc = New DOM.Document();						//Step 1 - Create DOM/XML Doc
        doc.load(xmlString);										//Step 2 - Load the revieved XML String to the Doc
        DOM.XmlNode root = doc.getRootElement();					//Step 3 - Get Root
        parseData = root.getName();									//Step 3.1 - Get Root Name - Optional
        List<DOM.XmlNode> childs = root.getChildElements();			//Step 4 - Get Root Element/Sub Root
        for(DOM.XmlNode ec : childs)								//Step 5 - Run loop on each root element
        {
            parseData = parseData + '\n' + ec.getName();			//Step 6 - for each root element get the label
            parseData = parseData + ' : ' + ec.getText();			//step 6 - for each root element get the Data
        }
    }
}