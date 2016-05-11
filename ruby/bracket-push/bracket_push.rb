class Brackets
  VERSION = 1
  PAIRS =
    {
      '[' => ']',
      '{' => '}',
      '(' => ')'
    }

  def self.paired?(string)
    leftovers = string.chars.each_with_object([]) do |bracket, brackets|
      if PAIRS.keys.include?(bracket)
        brackets << bracket
      elsif PAIRS.values.include?(bracket)
        return false if brackets.empty?
        return false unless PAIRS[brackets.pop] == bracket
      end
    end
    leftovers.empty?
  end
end
