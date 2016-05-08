class Brackets
  VERSION = 1
  PAIRS =
    {
      '[' => ']',
      '{' => '}',
      '(' => ')'
    }

  def self.paired?(string)
    brackets = []
    string.each_char do |bracket|
      if PAIRS.keys.include?(bracket)
        brackets << bracket
      elsif PAIRS.values.include?(bracket)
        return false if brackets.empty?
        return false unless PAIRS[brackets.pop] == bracket
      end
    end
    brackets.empty?
  end
end
