package br.emprestes.sitas.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.xfire.spring.AbstractXFireSpringTest;
import org.jdom.Document;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class EchoWebServiceTest extends AbstractXFireSpringTest {

    protected final Log log = LogFactory.getLog(getClass());

    public void setUp() throws Exception {
        super.setUp();
    }
    
    public void testGetWsdl() throws Exception {
        Document doc = getWSDLDocument("Echo");
        //printNode(doc);
        
        assertValid("//xsd:element[@name=\"echo\"]", doc);
        assertValid("//xsd:element[@name=\"echoResponse\"]", doc);
    }
    
    public void testCallEcho() throws Exception {
        Document response =
            invokeService("Echo", "/br/emprestes/sitas/service/echo.xml");
        //printNode(response);
        
        addNamespace("service","http://test.xfire.codehaus.org");
        assertValid("//service:echoResponse/service:out[text()=\"Hello world!\"]",response);


    }

    protected ApplicationContext createContext() {
        return new ClassPathXmlApplicationContext(new String[]{
                "br/emprestes/sitas/service/applicationContext-test.xml",
                "br/emprestes/sitas/service/applicationContext-webservice.xml"});
    }
    

}
