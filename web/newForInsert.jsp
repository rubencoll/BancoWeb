<%-- 
    Document   : nuevo
    Created on : 07-nov-2013, 10:48:39
    Author     : Ruben Coll Tovar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo</title>
        <link href="css/bootstrap.css" rel="stylesheet" >
        <style type="text/css">
            .cCentrado{
                float:left;
                text-align: center;
                border:1px solid black;
                border-color: blue ;
                width: 300px;
                height: 50px;
                padding-top: 15px;
                border-radius: 20px;
                background-color: skyblue;
            }

            .tablaCentrado{
                width: 1000px;
                border:1px solid black;
                border-color: blue ;
                margin:auto;   
                margin-top:150px;
                background-color: white;
            }

            th {
                background-color: skyblue ;
            }

            body {
                background-image: url('img/texturas_metal.JPG');

            }
        </style>
    </head>
    <body>
        <div class="tablaCentrado">
            <h1>Insertar una Entidad Bancaria</h1>
            <br /><br />
            <form action="insert.jsp">
                <fieldset>
                    <legend>Formulario para Insertar Una nueva Entidad Bancaria</legend>            
                    <label>Codigo</label>
                    <input type="text" placeholder="Codigo de la Entidad." name="codigo">   
                    <br />
                    <br />
                    <label>Nombre</label>
                    <input type="text" placeholder="Nombre de la Entidad." name="nombre">   
                    <br /><br />
                    <label>CIF</label>
                    <input type="text" placeholder="CIF de la Entidad." name="cif">   
                    <br /><br />
                    <select name="tipoEntidadBancaria">
                        <option value="BANCO">BANCO</option>
                        <option value="CAJA_DE_AHORRO">CAJA_DE_AHORRO</option>
                        <option value="COOPERATIVAS_DE_CREDITO">COOPERATIVAS_DE_CREDITO</option>
                        <option value="ESTABLECIMIENTOS_FINANCIEROS_DE_CREDITO">ESTABLECIMIENTOS_FINANCIEROS_DE_CREDITO</option>              
                    </select>
                    <br /><br />
                    &nbsp;&nbsp; <button type="submit" class="btn">Insertar</button> &nbsp;&nbsp; <a href="index.jsp" class="btn" >Volver</a>
                </fieldset>
            </form>
        </div>
    </body>
</html>
