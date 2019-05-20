$(document).ready ->
  $('#amount, #source_currency, #target_currency').change ->
      if $("#amount").val() != ""
        $.ajax '/convert',
            type: 'GET'
            dataType: 'json'
            data: {
                    source_currency: $("#source_currency").val(),
                    target_currency: $("#target_currency").val(),
                    amount: $("#amount").val()
                  }
            error: (jqXHR, textStatus, errorThrown) ->
              alert textStatus
            success: (data, text, jqXHR) ->
              $('#result').val(data.converted)
          return false;
  $('#reverse').click ->
    old_source = $("#source_currency").val()
    old_target = $("#target_currency").val()
    $("#source_currency").val(old_target)
    $("#target_currency").val(old_source)
