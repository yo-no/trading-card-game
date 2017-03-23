function Player(name) {
    this.name = name;
    this.health = 30;
    this.mana = 0;
    this.manaSlots = 0;
    this.deck = [0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 7, 8];
    this.hand = [];
}

Player.prototype = {
    drawCard: function () {
        if (this.deck.length === 0) {
            this.health--; // bleedout rule
        } else {
            var cardIndex = Math.floor(Math.random() * this.deck.length);
            var card = this.deck.splice(cardIndex, 1)[0];
            if (this.hand.length < 5) { // check against overload rule
                this.hand.push(card);
            }
        }
    },
    playCard: function (card, target) {
        this.mana -= card;
        this.hand.splice(this.hand.indexOf(card), 1);
        if (target === this) { // healing
            target.health = Math.min(target.health += card, 30); // healing caps at the initial value of 30
        } else { // attacking
            target.health -= card;
        }
    },
    toString: function () {
        return this.name + " (Health: " + this.health + ", Mana: " + this.mana + "/" + this.manaSlots + ")";
    }
};