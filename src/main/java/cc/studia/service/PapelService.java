package cc.studia.service;

import cc.studia.entity.Papel;

public interface PapelService {
	public Papel ver(int id);
	public Papel findRoleByName(String theRoleName);
}
