function movePlayer(player) {
  return $("#player" + player + "_strip .active").removeClass("active").next().addClass("active");
}

function checkVictory(player, where) {
  if (where.is(":last-child")) {
    if (confirm("Player " + player + " won, restart?")) {
      location.reload();
    }
  }
}

$(document).ready(function() {

  $(document).on("keyup", function(event) {
    if (event.keyCode == 81) { // p
      checkVictory("1", movePlayer("1"));
    }
    else if (event.keyCode == 80) { // q
      checkVictory("2", movePlayer("2"));
    }
  });

});