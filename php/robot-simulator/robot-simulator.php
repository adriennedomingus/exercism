<?php

class Robot {
    const DIRECTION_NORTH = [0, 1];
    const DIRECTION_EAST = [1, 0];
    const DIRECTION_SOUTH = [0, -1];
    const DIRECTION_WEST = [-1, 0];

    function __construct($position, $direction) {
        $this->position = $position;
        $this->direction = $direction;
    }

    function turnRight() {
        switch($this->direction) {
            case self::DIRECTION_NORTH : $this->direction = self::DIRECTION_EAST; break;
            case self::DIRECTION_EAST : $this->direction = self::DIRECTION_SOUTH; break;
            case self::DIRECTION_SOUTH : $this->direction = self::DIRECTION_WEST; break;
            case self::DIRECTION_WEST : $this->direction = self::DIRECTION_NORTH; break;
        }
        return $this;
    }

    function turnLeft() {
        switch($this->direction) {
            case self::DIRECTION_NORTH : $this->direction = self::DIRECTION_WEST; break;
            case self::DIRECTION_EAST : $this->direction = self::DIRECTION_NORTH; break;
            case self::DIRECTION_SOUTH : $this->direction = self::DIRECTION_EAST; break;
            case self::DIRECTION_WEST : $this->direction = self::DIRECTION_SOUTH; break; 
        }
        return $this;
    }

    function advance() {
        $this->position[0] += $this->direction[0];
        $this->position[1] += $this->direction[1];
        return $this;
    }

    function instructions($instructions){
        foreach(str_split($instructions) as $instruction) {
            switch($instruction) {
                case "A" : $this->advance(); break;
                case "L" : $this->turnLeft(); break;
                case "R" : $this->turnRight(); break;
                default : throw new InvalidArgumentException;
            }
        }
    }
}






