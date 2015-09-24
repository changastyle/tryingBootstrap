function openFormulario(wraper)
{
    console.log($("#" + wraper).innerHeight());
    if( $("#" + wraper).innerHeight() > 50)
    {
       $("#" + wraper).css("height","50px"); 
    }
    else
    {
        $("#" + wraper).css("height","calc(100% - 134px)");
    }
}
function changePage(container)
{
    page = $(container).data("page");
    console.log("changePage TO: " + page);
    //console.log( "SIZE: "+    $(".li").size() );
    
    $(".li").each(function(index,element)
    {
        $(element).removeClass("active");
    });
    
    $.ajax(
    {url: page,
        beforeSend: function (xhr) 
        {
            
        },
        success: function (data, textStatus, jqXHR) 
        {
            
            $("#wraperContenidoPrincipal").html(data);
        }
    });  
}
function barraBusquedaKeyPress(barra)
{
    textoActual = $(barra).val();
    console.log("barraBusquedaKeyPress: " + textoActual);
}
function gotoHome()
{
    window.location="./";
}
function gridcheckboxs()
{
    $(".gridCheckboxs").each(function(index,element)
    {
        console.log(element);
        row = $(element).data("row");
        console.log(element + " -> " + row);
        if(  $(element).prop('checked')==true )
        {
            console.log("CHECKED ->" + row);
            $("#" +  row).addClass("checkboxChecked");
            //$("#" +  row).addClass("success");
        }
        else
        {
            $("#" +  row).removeClass("checkboxChecked");
            //$("#" +  row).removeClass("success");
        }
    });
}
$(document).ready(function()
{
    cuanto = 0;
    cuanto = $("#wraperContenidoPrincipal").innerHeight() + 230;
    $("#principal").css("height", cuanto + "px");
    
    changePage( $("#liReady") );


});