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

$(document).ready(function()
{
    cuanto = 0;
    cuanto = $("#wraperContenidoPrincipal").innerHeight() + 230;
    $("#principal").css("height", cuanto + "px");
});