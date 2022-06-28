$(function () {
    function display(bool) {
        if (bool) {
            $("#container").slideDown(400);
            $("#startscreen ").slideDown(400);
            $("#info").hide()
            $("#info2").hide()
            $("#info3").hide()
            $("#info4").hide()
            $("#done").hide()



            

            
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));
            return
        }
    };
    $("#start").click(function () {
        
       $("#startscreen").fadeOut(400)
       $("#info").fadeIn(500)
       $("#warn").hide()

       document.getElementById('firstname').value = ''
       document.getElementById('lastname').value = ''
       document.getElementById('age').value = ''
       document.getElementById('why').value = ''
       document.getElementById('gender').value = ''
       document.getElementById('Phonenumber').value = ''
       document.getElementById('DiscordName').value = ''
       document.getElementById('why2').value = ''
       document.getElementById('WhyShouldWeChooseYou').value = ''







    })


    var first = document.getElementById('firstname')
    var last = document.getElementById('lastname')
    var age = document.getElementById('age')
    var why = document.getElementById('why')
    var gender = document.getElementById('gender')
    var Phonenumber = document.getElementById('Phonenumber')
    var DiscordName = document.getElementById('DiscordName')
    var why2 = document.getElementById('why2')
    var WhyShouldWeChooseYou = document.getElementById('WhyShouldWeChooseYou')
    var Howlong = document.getElementById('Howlong')
    var experiences = document.getElementById('experiences')
    var pd1 = document.getElementById('pd1')
    var pd2 = document.getElementById('pd2')
    var pd2 = document.getElementById('pd3')


        $(".sumbit").click(function() {
                if($(first , last , age , why , gender ,Phonenumber).val() === '') {
                    $("#warn").fadeIn(400)
                    return
                    
                } else{
       
          
              
            
                $("#warn").fadeOut(400)
                $("#info4").fadeOut(400)
                $("#info3").fadeOut(400)
                $("#info2").fadeOut(400)
                $("#info1").fadeOut(400)
                $("#info").fadeOut(400)
                $("#done").fadeIn(400)
                $.post(
                    `http://${GetParentResourceName()}/name`,
                  JSON.stringify({
                    plate: $("#firstname").val(),     
                    lastname: $("#lastname").val(),
                    age: $("#age").val(),
                    why: $("#why").val(),
                    gender: $("#gender").val(),
                    Phonenumber: $("#Phonenumber").val(),
                    DiscordName: $("#DiscordName").val(),
                    why2: $("#why2").val(),
                    WhyShouldWeChooseYou: $("#WhyShouldWeChooseYou").val(),
                    Howlong: $("#Howlong").val(),
                    whitlist: $("#whitlist").val(),
                    experiences: $("#experiences").val(),
                    pd1: $("#pd1").val(),
                    pd2: $("#pd2").val(),
                    pd3: $("#pd3").val(),
                  })
                );
            }
        
    })



    
    $("#next").click(function () {
        
        $("#info").fadeOut(400)
        $("#info2").fadeIn(500)
        $("#warn").hide()
 
        document.getElementById('Howlong').value = ''
        document.getElementById('whitlist').value = ''
        document.getElementById('experiences').value = ''
        document.getElementById('pd1').value = ''
 
 
 
 
 
 
 
    })

    $("#back").click(function () {
        
        $("#info2").fadeOut(400)
        $("#info").fadeIn(500)
        $("#warn").hide()
 
        document.getElementById('firstname').value = ''
        document.getElementById('lastname').value = ''
        document.getElementById('age').value = ''
        document.getElementById('why').value = ''
        document.getElementById('gender').value = ''
        document.getElementById('Phonenumber').value = ''
        document.getElementById('DiscordName').value = ''
        document.getElementById('why2').value = ''
        document.getElementById('WhyShouldWeChooseYou').value = ''
 
 
 
 
 
 
 
    })

    $("#dick").click(function () {
        
        $("#info2").fadeOut(400)
        $("#info3").fadeIn(500)
        $("#warn").hide()
 
        document.getElementById('pd2').value = ''
        document.getElementById('pd3').value = ''
 
 
 
 
 
 
 
    })

    $("#nick").click(function () {
        
        $("#info3").fadeOut(400)
        $("#info2").fadeIn(500)
        $("#warn").hide()
 
        document.getElementById('firstname').value = ''
        document.getElementById('lastname').value = ''
        document.getElementById('age').value = ''
        document.getElementById('why').value = ''
        document.getElementById('gender').value = ''
        document.getElementById('Phonenumber').value = ''
        document.getElementById('DiscordName').value = ''
        document.getElementById('why2').value = ''
        document.getElementById('WhyShouldWeChooseYou').value = ''
 
 
 
 
 
 
 
    })

    $(".exit").click(function() {

        $("#container").slideUp();
        setTimeout(function(){
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));

        },400);


        return
    })
    




        
    

        
    

})
