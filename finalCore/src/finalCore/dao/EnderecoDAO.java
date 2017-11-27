package finalCore.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import finalDominio.Endereco;
import finalDominio.EntidadeDominio;

public class EnderecoDAO extends AbstractJdbcDAO{
	public EnderecoDAO() {
		super("clientes", "id_cliente");
	}
	
	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {
		openConnection();
		PreparedStatement pst = null;
		Endereco endereco = (Endereco)entidade;
		
		try {
			connection.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO endereco(preferencial, tipo_Residencia, tipo_Logradouro, logradouro, numero, bairro, CEP, cidade, estado, pais, obs, ID_Cliente, alterador)");
			sql.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			pst = connection.prepareStatement(sql.toString());
			pst.setBoolean(1, endereco.getPreferencial());
			pst.setString(2, endereco.getTipoResidencia());
			pst.setString(3, endereco.getTipoLogradouro());
			pst.setString(4, endereco.getLogradouro());
			pst.setString(5, endereco.getNumero());
			pst.setString(6, endereco.getBairro());
			pst.setString(7, endereco.getCep());
			pst.setString(8, endereco.getCidade());
			pst.setString(9, endereco.getEstado());
			pst.setString(10, endereco.getPais());
			pst.setString(11, endereco.getObservacao());
			pst.setInt(12, endereco.getID_Cliente());
			pst.setString(13, endereco.getAlterador());
			pst.executeUpdate();
			connection.commit();
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();			
		}finally{
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void alterar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		openConnection();
		PreparedStatement pst = null;
		Endereco endereco = (Endereco)entidade;
		
		try {
			connection.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE endereco SET preferencial = ?, tipo_Residencia = ?, tipo_Logradouro = ?, logradouro = ?, numero = ?, bairro = ?, CEP = ?,");
			sql.append("cidade = ?, estado = ?, pais = ?, obs = ?, alterador = ? WHERE ID_Endereco = ?");
			
			pst = connection.prepareStatement(sql.toString());
			pst.setBoolean(1, endereco.getPreferencial());
			pst.setString(2, endereco.getTipoResidencia());
			pst.setString(3, endereco.getTipoLogradouro());
			pst.setString(4, endereco.getLogradouro());
			pst.setString(5, endereco.getNumero());
			pst.setString(6, endereco.getBairro());
			pst.setString(7, endereco.getCep());
			pst.setString(8, endereco.getCidade());
			pst.setString(9, endereco.getEstado());
			pst.setString(10, endereco.getPais());
			pst.setString(11, endereco.getObservacao());
			pst.setString(12, endereco.getAlterador());
			pst.setInt(13, endereco.getId());
			System.out.println(pst);
			pst.executeUpdate();			
			connection.commit();
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();			
		}finally{
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
		Endereco endereco = (Endereco) entidade;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM endereco WHERE 1=1\n");
		if(endereco.getID_Cliente() != 0){
			sb.append(" and ID_Cliente = '" + endereco.getID_Cliente() + "'");
		}
		try{
			openConnection();
			pst = connection.prepareStatement(sb.toString());
			ResultSet rs = pst.executeQuery();
			List<EntidadeDominio> enderecos = new ArrayList<>();
			while(rs.next()){
				Endereco e = new Endereco();
				e.setId(rs.getInt("ID_Endereco"));
				e.setPreferencial(rs.getBoolean("preferencial"));
				e.setTipoResidencia(rs.getString("tipo_residencia"));
				e.setTipoLogradouro(rs.getString("tipo_logradouro"));
				e.setLogradouro(rs.getString("logradouro"));
				e.setNumero(rs.getString("numero"));
				e.setBairro(rs.getString("bairro"));
				e.setCep(rs.getString("CEP"));
				e.setCidade(rs.getString("cidade"));
				e.setEstado(rs.getString("estado"));
				e.setPais(rs.getString("pais"));
				e.setObservacao(rs.getString("obs"));
				e.setID_Cliente(rs.getInt("ID_Cliente"));
				e.setAlterador(rs.getString("alterador"));
				enderecos.add(e);
			}
			return enderecos;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
}
