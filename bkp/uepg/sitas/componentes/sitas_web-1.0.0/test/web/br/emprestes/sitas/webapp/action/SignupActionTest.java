package br.emprestes.sitas.webapp.action;

import br.emprestes.sitas.Constants;
import br.emprestes.sitas.model.User;
import br.emprestes.sitas.service.UserManager;

import com.dumbster.smtp.SimpleSmtpServer;

public class SignupActionTest extends BaseStrutsTestCase {
    
    public SignupActionTest(String name) {
        super(name);
    }

    public void testExecute() throws Exception {
        setRequestPathInfo("/signup");

        SimpleSmtpServer server = SimpleSmtpServer.start(2525);
        
        addRequestParameter("username", "self-registered");
        addRequestParameter("password", "Password1");
        addRequestParameter("confirmPassword", "Password1");
        addRequestParameter("firstName", "First");
        addRequestParameter("lastName", "Last");
        addRequestParameter("addressForm.city", "Denver");
        addRequestParameter("addressForm.province", "Colorado");
        addRequestParameter("addressForm.country", "USA");
        addRequestParameter("addressForm.postalCode", "80210");
        addRequestParameter("email", "self-registered@raibledesigns.com");
        addRequestParameter("website", "http://raibledesigns.com");
        addRequestParameter("passwordHint", "Password is one with you.");
        actionPerform();

        // verify an account information e-mail was sent
        server.stop();
        assertTrue(server.getReceivedEmailSize() == 1);
        
        verifyForward("mainMenu");
        verifyNoActionErrors();

        // verify that success messages are in the request
        assertTrue(getSession().getAttribute(Constants.REGISTERED) != null);
        
        UserManager userMgr = (UserManager) ctx.getBean("userManager");
        User user = userMgr.getUserByUsername("self-registered");
        userMgr.removeUser(user.getId().toString());
    }
}
