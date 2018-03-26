package finalCore.impl.negocio;

import finalCore.IStrategy;
import finalDominio.EntidadeDominio;
import finalDominio.Livro;

public class ValidadorDadosAtivInativ implements IStrategy{
	@Override
	public String processar(EntidadeDominio entidade) {
		
		if(entidade instanceof Livro){
			Livro livro = (Livro)entidade;
			
			if(livro.getMotivo() == null || livro.getMotivo().trim().equals(""))
				return "� necess�rio informar um motivo!";
			
			if(livro.getStatus() && (livro.getCatAtivacao() == null))
				return "� necess�rio selecionar uma categoria de ativa��o";
			
			if((!livro.getStatus()) && livro.getCatInativacao() == null)
				return "� necessario selecionar uma categoria de inativa��o";
			
		}else{
			return "Deve ser registrado um Livro!";
		}
		
		
		return null;
	}
}