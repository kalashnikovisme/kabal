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
    number_name = names[lang]["two_words"][number / 10]
    number_name += " " + single(number % 10) if (number % 10 != 0)
    number_name
  end

  def self.three_words(number)
    number_name = names[lang]["three_words"][number / 100]
    return number_name += " " + two_words(number % 100) if (number % 100 >= 20)
    return number_name += " " + single(number % 100) if (number % 100 != 0)
    number_name
  end
end
