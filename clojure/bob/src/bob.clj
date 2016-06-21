(ns bob)

(defn question? [phrase]
    (.endsWith phrase "?"))

(defn silence? [phrase]
  (empty? (.trim phrase)))

(defn shouting? [phrase]
  (and
    (not (= (.toLowerCase phrase) phrase))
    (= (.toUpperCase phrase) phrase)))

(defn response-for [phrase]
  (cond
    (silence? phrase) "Fine. Be that way!"
    (shouting? phrase) "Whoa, chill out!"
    (question? phrase)"Sure."
    :else "Whatever."))
