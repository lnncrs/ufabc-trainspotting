package br.com.bb.ufabctrainspotting.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import br.com.bb.ufabctrainspotting.model.dao.PrecoDAO;
import br.com.bb.ufabctrainspotting.model.entity.Preco;

@Service
public class GerenciaPreco {
	
	@Autowired
	private PrecoDAO precoDao;
	
	public void gerencia(Preco preco){
		precoDao.save(preco);
	}
	
	public List<Preco> listAll(){

		return this.precoDao.findAll();
	}
}
