$(function () {
    $("#Searchdoctor").on('keyup', function () {
        var input = $(this).val();
        var id = $('#Searchdoctor').val();
        var disCode = $.trim($('#disciplin_cd').val());
        var hfc = $('#hfcID').val();
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#match101').html('<img src="img/LoaderIcon.gif" />'); // Loader icon apprears in the <div id="match"></div>
            var data = {name: input, hfc: hfc, dis: disCode};
            $.ajax({
                type: "POST",
                url: "search/SearchDoctor_.jsp", // call the php file ajax/tuto-autocomplete.php
                data: data, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success
                    console.log(data);
                    console.log(dataBack);
                    $('#match101').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDoctor li').on('click', function () { // When click on an element in the list
                        $('#Searchdoctor').val($(this).text()); // Update the field with the new element
                        $('#match101').text(''); // Clear the <div id="match"></div>
                        //searchHFCcode();
                    });
                },
                error: function () { // if error
                    $('#match101').text('Problem!');
                }
            });
        } else {
            $('#match101').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }
    });
});