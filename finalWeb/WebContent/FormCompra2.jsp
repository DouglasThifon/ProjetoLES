<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
	import="finalCore.aplicacao.Resultado, finalDominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Comprar livro</title>
</head>
<body>

	<%
		Resultado resultado = (Resultado) session.getAttribute("resultado");
	%>

	<form action="SalvarLivro" method="post">
		<select style="display:none" id="rdStatus" name="rdStatus">
			<option value="true">Ativos</option>
		</select>
		<table class="table" bordercolor="blue" BORDER="5" >
		<TR>
		      <TH COLSPAN="3"><BR>
		      	<H3>FILTROS</H3>
		      </TH>
   		</TR>
			<tr>
				<td>
				TITULO: <input type="text" id="txtTitulo" name="txtTitulo" /> 
				</td>
				<td>
				AUTOR:<input type="text" id="txtAutor" name="txtAutor" />
				</td>
			</tr>
			<tr>
				<td>
				Ano <input type="text" id="txtAno" name="txtAno"/>
				</td>
				<td>
				Editora <input type="text" id="txtEditora" name="txtEditora">
				</td>
			</tr>
		</table>
		<br><input type="submit" class="btn btn-primary" id="operacao" name="operacao" value="LISTAR" />
	</form>

	


	<%
	
	if(resultado !=null && resultado.getMsg() != null){
		out.print(resultado.getMsg());
	}
	
	%>
<BR>

<TABLE class="table table-sm" bordercolor="blue" BORDER="5"    WIDTH="50%"   CELLPADDING="4" CELLSPACING="3">
   <TR>
      <TH COLSPAN="17"><BR>
      	<H3>Livros</H3>
      </TH>
   </TR>
   <TR>
      <TH>Codigo</TH>
      <TH>Titulo</TH>
      <TH>Autor</TH>
      <TH>Status</TH>
      <TH>Categoria</TH>
      <TH>Ano</TH>
      <TH>Editora</TH>
      <TH>Edicao</TH>
      <TH>ISBN</TH>
      <TH>Paginas</TH>
      <TH>Sinopse</TH>
      <TH>Altura</TH>
      <TH>largura</TH>
      <TH>Peso</TH>
      <TH>Profundidade</TH>
      <TH>Comprar</TH>
   </TR>
   
   <%
   if (resultado != null) {
		List<EntidadeDominio> entidades = resultado.getEntidades();
		StringBuilder sbRegistro = new StringBuilder();
		StringBuilder sbLink = new StringBuilder();
		
		if(entidades != null){
			try
			{
			for (int i = 0; i < entidades.size(); i++) {
				Livro l = (Livro) entidades.get(i);
				sbRegistro.setLength(0);
				sbLink.setLength(0);
				
			//	<a href="nome-do-lugar-a-ser-levado">descri��o</a>
				
				sbRegistro.append("<TR ALIGN='CENTER'>");
				
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());	
				sbRegistro.append(l.getId() == 0 ? ' ' : l.getId());	
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getTitulo());			
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getAutor());		
				sbRegistro.append("</TD>");
				
				/*sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getCategoria());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getSubcategoria());
				sbRegistro.append("</TD>");*/
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getAno());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getEditora());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getEdicao());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getISBN());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getNpaginas());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getSinopse());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getAltura());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getLargura());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getPeso());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getProfundidade());
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD><a class='btn btn-primary' href=SalvarLivro?");
				sbRegistro.append("txtId=");
				sbRegistro.append(l.getId());						
				sbRegistro.append("&");
				sbRegistro.append("operacao=");
				sbRegistro.append("CHECAR");
				sbRegistro.append(">COMPRAR</a></TD>");
				
				sbRegistro.append("</TR>");
				
				out.print(sbRegistro.toString());
				
			}
			}catch(Exception e){
				
			}
		}
	}
   
   %>
</TABLE>
<a class="btn btn-primary" href="http://localhost:8080/finalWeb/FormLivro.jsp">Cadastrar livro</a>
</body>
</html>