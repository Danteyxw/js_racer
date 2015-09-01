function movePlayer(player) {
  return $("#player" + player + "_strip .active").removeClass("active").next().addClass("active");
}

function checkVictory(player, where) {
  if (where.is(":last-child")) {
    winner = $(".players .player" + player).text();
    $(document).unbind("keyup");
    $(".winner").append("<span class='player" + player + "'>" + winner + "</span><br>won!");
    $.post('/game/win', {game: window.location.href, winner: winner}).done(function(data) {
      $(".screen").show();
    });
  }
}

$(document).ready(function() {

  $(document).on("keyup", function(event) {
    var player;

    if (event.keyCode == 81) { // p
      player = "1";
    }
    else if (event.keyCode == 80) { // q
      player = "2";
    }
    var here = movePlayer(player);
    checkVictory(player, here);
  });

});