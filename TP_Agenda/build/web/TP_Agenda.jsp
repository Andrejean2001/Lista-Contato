<%@page import="java.util.ArrayList"%>
<%@page import="TP_Agenda.TP_Agenda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

  ArrayList<User> userList = (ArrayList) application.getAttribute("userList");

  if (userList == null) {
    userList = new ArrayList();

    
    application.setAttribute("userList", userList);
  }

  if (request.getParameter("add") != null) {
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");

    userList.add(new User(nome, email, telefone));
    response.sendRedirect(request.getRequestURI());
  }

  if (request.getParameter("remove") != null) {
    int i = Integer.parseInt(request.getParameter("i"));
    
    userList.remove(i);
    response.sendRedirect(request.getRequestURI());
  }
%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contatos</title>
  </head>
  <body>
    <h1>Lista de contatos</h1>
    <h2>Adicionar contatos</h2>

    <form method="get">
      <label for="nome">Nome: </label>
      <input type="text" required="true" name="nome" id="nome" /> <br/>

      <label for="email">Email: </label>
      <input type="email" required="true" name="email" id="email" /> <br/>

      <label for="telefone">Telefone: </label>
      <input type="text" required="true" name="telefone" id="telefone" /> <br/>

      <button type="submit" name="add">Adicionar</button>
</form>

    <%
      if (userList.size() > 0) {%>
        <table border="1">
          <tr>
            <th>Índice</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>-</th>
          </tr>

          <%
            for (int i = 0;
                    i < userList.size();
                    i++) {%>

          <% User user = userList.get(i);%>
          <tr>
            <td><%= i + 1%></td>
            <td><%= user.getNome()%></td>
            <td><%= user.getEmail()%></td>
            <td><%= user.getTelefone()%></td>
            <td>
              <form>
                <button type="submit" name="remove">Remover</button>
                <input type="hidden" name="i" value="<%= i%>"/>
              </form>
            </td>
          </tr>
          <%}%>
        </table>
    <%} else {
        out.println("<h2>Sem contatos</h2>");
      }
    %>
  </body>
</html>