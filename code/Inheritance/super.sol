// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

contract Mage is Hero(50) {

    function attack(Enemy enemy) public override {
        // Mage-specific logic (spell attack)
        enemy.takeAttack(AttackTypes.Spell);

        // call base Hero logic
        super.attack(enemy);
    }
}

contract Warrior is Hero(200) {

    function attack(Enemy enemy) public override {
        // Warrior-specific logic (brawl attack)
        enemy.takeAttack(AttackTypes.Brawl);

        // call base Hero logic
        super.attack(enemy);
    }
} 
