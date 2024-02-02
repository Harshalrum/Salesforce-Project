public class Attachment_Seri_deSeri 
{
    Public void JSONAttachment()
    {
    	// Pull the attachment
        Document D = [Select id,name,body from Document where name = 'Test'];   
        
        /* 
        Serialize the Document
        Complex Serialazation / Dynamic Serialization
        */
        System.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        	js.writeBlobField('Attachment', D.body);
        js.writeEndObject();

        String jsd2 = js.getAsString();
        System.debug(jsd2);
        
        
        /* DeSerialize the Dcument */

        System.JSONParser jp = JSON.createParser(jsd2);
        while (jp.nextToken() != Null) 
        {
            if(jp.getText() == 'Attachment')
            {
                jp.nextToken();
                Blob jdd2 = (Blob) jp.getBlobValue();
                System.debug(jdd2);
                
                // Insert the image in folder
                String imageData = EncodingUtil.base64Encode(jdd2);
                Document DD = New Document();
                DD.Name = 'New_Test2';
                DD.Body = EncodingUtil.base64Decode(imageData);
                DD.FolderId = '0055h00000AzCKz';
                DD.Type = 'jpg';
                insert DD;
            }
        }
    }
}