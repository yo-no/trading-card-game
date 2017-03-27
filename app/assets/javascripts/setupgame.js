

// var data;
// var player1;
// var player2;


// function getData(playerOneIndex, playerTwoIndex) {

//   $.get('http://localhost:3000/api/users.json', function(response){     
//     data = response;
//     player1 = new Player(data[playerOneIndex]);
//     player2 = new Player(data[playerTwoIndex]);
//     document.getElementById("player-one-name").innerHTML = player1.name;
//     document.getElementById("player-two-name").innerHTML = player2.name;
//     var player1Stats = document.getElementById("player-one-stats");
//     var player2Health = document.getElementById("player-two-hp");
//     player1Stats.innerHTML = "<span class='glyphicon glyphicon-heart'></span> " + player1.health + " <span class='glyphicon glyphicon-flash'></span> " + player1.mana;
//     player2Health.innerHTML = "<span class='glyphicon glyphicon-heart'></span> " + player2.health;
//     // console.log(player1.hand);
//   });
// };

// function Player(player) {
//         this.name = player["name"];
//         this.health = 30;
//         this.mana = 0;
//         this.manaSlots = 0;
//         this.deck = player["cards"];
//         this.hand = [];
// };


//   Player.prototype = {
//       drawCard: function () {
//          if (this.deck.length === 0) {
//               this.health--; // bleedout rule
//           } else {
//               var cardIndex = Math.floor(Math.random() * this.deck.length);
//               var card = this.deck.splice(cardIndex, 1)[0];
//               if (this.hand.length < 5) { // check against overload rule
//                   this.hand.push(card);
//               }
//           }
//       },

//       playCard: function (card, target) {
//           var player1Stats = document.getElementById("player-one-stats");
//           var player2Health = document.getElementById("player-two-hp");
//           this.mana -= card.cost;
//           player1Stats.innerHTML = "<span class='glyphicon glyphicon-heart'></span> " + this.health + " <span class='glyphicon glyphicon-flash'></span> " + this.mana;
//           this.hand.splice(this.hand.indexOf(card), 1);
//           //if (target === this) { // healing
//            //   target.health = Math.min(target.health += card.attack, 30); // healing caps at the initial value of 30
//           //} else { // attacking
//               //THIS IS WHERE MY ATTACK ANIMATIONs go 
//               target.health -= card.attack;
//               player2Health.innerHTML = "<span class='glyphicon glyphicon-heart'></span> " + target.health;
//               this.updateHand();
//           //}
//       },

//       toString: function () {
//           return this.name + " (Health: " + this.health + ", Mana: " + this.mana + "/" + this.manaSlots + ")";
//       },

//       updateHand: function() {
//         var playerHand = ""
//         for (var i = 0; i < this.hand.length; i++) {
//           var card = this.hand[i];
//           console.log(this.hand[i]);
//           playerHand += "<div class='card' id='card" + card.card_id + "')'>";
//             playerHand += "<div class='front'>";
//               playerHand += "<img src='" + card.medium_image_url + "'>"
//             playerHand += "</div>"   
//           playerHand += "</div>"
//         }
//         document.getElementById('player-one-hand').innerHTML = playerHand;
//       },

//       showInfo: function(card) {
//         console.log(card.description);
//         // element = document.getElementById('card.card_id');
//         // element.style.hidden = true;
//       }
//   };

// function Game(player1, player2) {
//     this.activePlayer = Math.random() >= 0.5 ? player1 : player2;
//     this.opponentPlayer = this.activePlayer === player1 ? player2 : player1;
//     //NEED SOME WAY OF HIGHLIGHTING ACTIVE PLAYER
//     this.winner = undefined;

//     for (var i = 0; i < 3; i++) {
//         this.activePlayer.drawCard();
//         this.opponentPlayer.drawCard();
//     }
//     this.opponentPlayer.drawCard(); // extra card to compensate for not playing first turn
// }

// Game.prototype = {
//     start: function () {
//         while (this.winner === undefined) {
//             this.beginTurn();
//             this.playTurn();
//             this.endTurn();
//         }
//     },

//     beginTurn: function () {
//         this.activePlayer.manaSlots = Math.min(this.activePlayer.manaSlots + 1, 10);
//         this.activePlayer.mana = this.activePlayer.manaSlots;
//         this.activePlayer.drawCard();
//         //here is where i add the cards to the page
//     },

    
//     playTurn: function () {
//       while (hasEnoughManaForCardInHand.call(this)) {
//         attack: function(chosenCard) {
//                   this.activePlayer.playCard(chosenCard, this.opponentPlayer);
//         };

//       },

//         function hasEnoughManaForCardInHand() {
//             var costs = [];
//             for (var i = 0; i < this.activePlayer.hand.length; i++){
//               costs.push(this.activePlayer.hand[i]["cost"]);
//             };
//             return this.activePlayer.mana >= Math.min.apply(Math, costs);
//         }

//     },

//     endTurn: function () {
//         if (this.opponentPlayer.health <= 0) {
//             this.winner = this.activePlayer;
//             window.confirm(this.winner.name + " wins!");
//         } else {
//             switchPlayers.call(this);
//         }

//         function switchPlayers() { // ECMA6: [activePlayer, opponentPlayer] = [opponentPlayer, activePlayer]
//             var tmp = this.activePlayer;
//             this.activePlayer = this.opponentPlayer;
//             this.opponentPlayer = tmp;
//         }
//     }
// };
      


