$(window).load(function() {
  $("#preloader").fadeOut(200);
});

// var tips = ['bind keyboard letra "toggle profile_reticule 0 1" para alterar entre mira Complexa e Simples', 'utilise o comando <b>/a all</b> para pegar todas as armas.', 'Pressione [P] para pausar a musica, [A] e [D] para mudar ou [W] e [S] para aumentar/diminuir.'];
// setInterval(function() {
//   var r = Math.floor(Math.random() * tips.length);
//   $(".tip-text").fadeOut(200, function() {
//     $(".tip-text").html(tips[r]);
//     $(this).fadeIn(200);
//   });
  
// }, 10000);

$(function(){   
    $(document).keydown(function(objEvent) {        
        if (objEvent.ctrlKey) {          
            if (objEvent.keyCode == 65) {                         

                return false;
            }            
        }        
    });
}); 