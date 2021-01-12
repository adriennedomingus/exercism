<?php

/*
This is only a SKELETON file for the "Hamming" exercise. It's been provided as a
convenience to get you started writing code faster.

Remove this comment before submitting your exercise.
*/

function distance(string $strandA, string $strandB) : int
{   
    $distance = 0;

    if ($strandA == $strandB) {
        return $distance;
    }

    if (strlen($strandA) != strlen($strandB)){
        throw new InvalidArgumentException(('DNA strands must be of equal length.'));
    }

    $arrayStrandA = str_split($strandA);
    $arrayStrandB = str_split($strandB);

    foreach($arrayStrandA as $key=>$value) {
        if ($value != $arrayStrandB[$key]) {
            $distance += 1;
        }
    }
    return $distance;

}
