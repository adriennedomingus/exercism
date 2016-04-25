(ns anagram
  (:require [clojure.string :refer [lower-case]]))

(defn anagram? [word possibility]
  (and
    (= (sort (lower-case word)) (sort (lower-case possibility)))
    (not (= (lower-case word) (lower-case possibility)))))


(defn anagrams-for [word possibilities]
  (filter (partial anagram? word) possibilities))
