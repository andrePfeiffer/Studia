package cc.studia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cc.studia.dao.PapelDAO;
import cc.studia.entity.Papel;

@Service
public class PapelServiceImpl implements PapelService {

	@Autowired
	private PapelDAO papelDAO;
	
	@Override
	@Transactional
	public Papel ver(int id) {
		return papelDAO.ver(id);
	}

	@Override
	@Transactional
	public Papel findRoleByName(String theRoleName) {
		return papelDAO.findRoleByName(theRoleName);
	}

}
