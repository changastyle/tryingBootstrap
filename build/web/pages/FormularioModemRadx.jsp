<% model.ModemRadx modemSugerido = controller.Controller.modemRadxSugerido(); %>
<form role="form" action="ActionFormularioModemRadx.jsp" method="post"  onsubmit="verificarFormularioModemRadx()">
    <div class="form-group">
        <label for="usuarioADSL">Usuario ADSL:</label>
        <input type="text" class="form-control" id="usuarioADSL" name='usuarioADSL' required value='<%= modemSugerido.getUsuarioADSL() %>'>
    </div>
    <div class="form-group">
        <label for="direccionIP">Direccion IP:</label>
        <input type="text" class="form-control" id="direccionIP" name='direccionIP' required value='<%= modemSugerido.getDireccionIP() %>'>
    </div>
    <div class="form-group">
        <label for="descripcion">Observaciones:</label>
        <input type="text" class="form-control" id="descripcion" name='descripcion' required>
    </div>
    <div class="checkbox">
        <label><input type="checkbox" name="habilitado" checked> Habilitado?</label>
    </div>
    <input type="submit" class="btn btn-primary" value='Agregar Modem'>
</form>