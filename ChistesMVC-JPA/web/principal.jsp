<%-- 
    Document   : principal
    Created on : 11-ene-2018, 13:28:34
    Author     : Alvaro
--%>

<%@page import="entities.Chiste"%>
<%@page import="entities.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <!-- Iconos !-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      
    </head>

    <body>
        <header><img class="responsive-img" src="img/logo.png"></header>
        <nav></nav>
        <br>
        <div class="container">
            <div class="row">
                <div class="input-field col s4 ">
                <form action="controller.jsp?op=categoria" method="POST" name="fcategoria">
        
            <%
                if(session.getAttribute("listaCategorias")==null){
                    
                }else{
                    
                        List lhl=(List) session.getAttribute("listaCategorias");
                      %>   
    <select name="idCategoria" id="idCategoria" onChange="this.form.submit()">
      <option value="" name="selectCategoria" disabled selected >Choose your option</option>
      <%
          for (int i=0;i<lhl.size();i++){
                          Categoria categoria=(Categoria) lhl.get(i);
                          
          %>
      <option value="<%=i%>" ><%=categoria.getNombre()%></option>
      <%}}%>
    </select>
    <label>Categorías</label>
  
    </form>
    
    </div>
    <div class="col s2"><a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a></div>
    <div class="col s4"><a href="controller.jsp?op=mejores">Mejores</a></div>
            </div>
    
    <% 
    if(request.getAttribute("listaChistes")==null){
    %>
    <p>Hola</p>
    <%
    }else{
    
        List lc = (List) request.getAttribute("listaChistes");
        
        for (int i=0;i<lc.size();i++){
                          Chiste chiste =(Chiste) lc.get(i);
    
    %>
    
        
        <div class="row">
      <div class="col s12 m12">
        <div class="card-panel teal">
          <span class="white-text">
              <%=chiste.getDescripcion()%>
          </span>
        </div>
      </div>
    </div>
        
        
    
    
    <%}} %>
    
    <% 
    if(session.getAttribute("chistesMejores")==null){
    %>
    <p>Hola</p>
    <%
    }else{
    
        List lcm = (List) session.getAttribute("chistesMejores");
        
        for (int i=0;i<lcm.size();i++){
                          Chiste chiste =(Chiste) lcm.get(i);
    
    %>
    
        
        <div class="row">
      <div class="col s12 m12">
        <div class="card-panel teal">
          <span class="white-text">
              <%=chiste.getDescripcion()%>
          </span>
        </div>
      </div>
    </div>
        
        
    
    
    <%}} %>
        </div>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script>
            $(document).ready(function() {
    $('select').material_select();
  });
      </script>
    </body>
  </html>
