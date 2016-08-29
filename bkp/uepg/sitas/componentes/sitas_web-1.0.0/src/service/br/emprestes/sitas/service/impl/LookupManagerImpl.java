package br.emprestes.sitas.service.impl;

import java.util.ArrayList;
import java.util.List;

import br.emprestes.sitas.dao.LookupDao;
import br.emprestes.sitas.model.LabelValue;
import br.emprestes.sitas.model.Role;
import br.emprestes.sitas.service.LookupManager;


/**
 * Implementation of LookupManager interface to talk to the persistence layer.
 *
 * <p><a href="LookupManagerImpl.java.html"><i>View Source</i></a></p>
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
public class LookupManagerImpl extends BaseManager implements LookupManager {
    //~ Instance fields ========================================================

    private LookupDao dao;

    //~ Methods ================================================================

    public void setLookupDao(LookupDao dao) {
        super.dao = dao;
        this.dao = dao;
    }
    /**
     * @see br.emprestes.sitas.service.LookupManager#getAllRoles()
     */
    public List getAllRoles() {
        List roles = dao.getRoles();
        List list = new ArrayList();
        Role role = null;

        for (int i = 0; i < roles.size(); i++) {
            role = (Role) roles.get(i);
            list.add(new LabelValue(role.getName(), role.getName()));
        }

        return list;
    }
}
