$(document).on "ajax:beforeSend" , "#emails-form" , ()->
    $("#email-info").html "Pedido en proceso"
$(document).on "ajax:success" , "#emails-form" , (e,data,estado,xhr)->
    $("#email-info").html "Pedido en proceso"
$(document).on "ajax:error" , "#emails-form" , (e,data,estado,xhr)->
    $("#email-info").html data.responseJSON.email[0]