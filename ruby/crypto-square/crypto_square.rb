class Crypto

  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    @message.chars.delete_if do |character|
      character =~ /\W/
    end.map do |char|
      char.downcase
    end.join
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    segments = []
    normalized_message = normalize_plaintext.chars
    square_size = size
    until normalized_message.empty?
      segments << normalized_message.shift(square_size)
    end
    segments.map do |segment|
      segment.join
    end
  end

  def ciphertext
    new_phrase = []
    segments = plaintext_segments.map do |segment|
      segment.chars
    end
    until segments.all? { |segment| segment.empty? }
      segments.each do |segment|
        new_phrase << segment.shift
      end
    end
    new_phrase.delete_if do |character|
      character == nil
    end.join
  end

  def normalize_ciphertext
    normalized = []
    segments = (0..size - 1).to_a
    characters = ciphertext.chars
    segment_size = (characters.length.to_f / segments.length.to_f).ceil
    segments.map do |segment|
      if characters.length % segment_size == 0
        normalized.unshift(characters.pop(segment_size).join)
      else
        normalized.unshift(characters.pop(segment_size - 1).join)
      end
    end
    normalized.join(" ")
  end
end
