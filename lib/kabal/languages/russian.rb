require 'kabal/languages/language'

class Kabal::Russian < Kabal::Language
  def self.convert(number)
    return single(number) if number >= 0 and number <= 19
    return two_words(number) if number >= 20 and number <= 99
    return three_words(number) if number >= 100 and number <= 999
    ten_powers(number) if number >= 1000
  end

  def self.single(number)
    names[lang]["single"][number]
  end

  def self.two_words(number)
    names[lang]["two_words"][number / 10] + " " + single(number % 10)
  end

  def self.three_words
    names[lang]["three_words"][number / 100] + " " + two_words(number % 100)
  end
end
