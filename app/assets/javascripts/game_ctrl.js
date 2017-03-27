(function() {
  "use strict";

  angular.module("app").controller("gameCtrl", function($scope, $http){
    $scope.setup = function() {
      getData();
    };

  function Player(player) {
      this.name = player["name"];
      this.health = 30;
      this.mana = 1;
      this.manaSlots = 1;
      this.deck = player["cards"];
      this.hand = [];
      this.avatar = player["medium_avatar_url"];
      this.large_avatar = player["large_avatar_url"];

  };

  Player.prototype = {
      drawCard: function () {
         if (this.deck.length === 0) {
              this.health--; // bleedout rule
              this.updateStats;
          } else {
              var cardIndex = Math.floor(Math.random() * this.deck.length);
              var card = this.deck.splice(cardIndex, 1)[0];
              if (this.hand.length < 5) { // check against overload rule
                  this.hand.push(card);
                  $scope.hand = this.hand;
              }
          }
      },

      playCard: function (card, target) {
          this.mana -= card.cost;
          this.hand.splice(this.hand.indexOf(card), 1);
          $scope.attackCard = card;
          
              //THIS IS WHERE MY ATTACK ANIMATIONs go 
              angular.element(attackModal).modal("show");
              attackAnimation();
              target.health -= card.attack;
              $scope.hand = this.hand;

      },

      // toString: function () {
      //     return this.name + " (Health: " + this.health + ", Mana: " + this.mana + "/" + this.manaSlots + ")";
      // }
  };

  function Game(player1, player2) {
    this.activePlayer = Math.random() >= 0.5 ? player1 : player2;
    this.opponentPlayer = this.activePlayer === player1 ? player2 : player1;
    //NEED SOME WAY OF HIGHLIGHTING ACTIVE PLAYER
    this.winner = undefined;

    for (var i = 0; i < 3; i++) {
        this.activePlayer.drawCard();
        this.opponentPlayer.drawCard();
    }
  }

  Game.prototype = {

    endTurn: function () {
        if (this.opponentPlayer.health <= 0) {
            this.winner = this.activePlayer;
            window.confirm(this.winner.name + " wins!");
        } else {
            switchPlayers.call(this);
        }

        function switchPlayers() { // ECMA6: [activePlayer, opponentPlayer] = [opponentPlayer, activePlayer]
            var tmp = this.activePlayer;
            this.activePlayer = this.opponentPlayer;
            this.opponentPlayer = tmp;
            this.activePlayer.manaSlots = Math.min(this.activePlayer.manaSlots + 1, 10);
            this.activePlayer.mana = this.activePlayer.manaSlots;
            this.activePlayer.drawCard();
        }
    }
  };

    function getData() {
      $http.get('/api/users.json').then(function(response){
        $scope.users = response.data;

        var opponent = new Player(response.data[2]);
        $scope.opponent = opponent;


        var player = new Player(response.data[3]);
        $scope.player = player;
        
        $scope.hand = player.hand;
        
        $scope.game = new Game(player, opponent);
        
      });
    }

    window.scope = $scope;
  });

}());