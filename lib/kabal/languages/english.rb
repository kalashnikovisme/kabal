require 'kabal/languages/language'

class Kabal::English < Kabal::Language
  def convert(number)
    return single number if number >= 0 and number <= 19
    return two_words number if number >= 0 and number <= 99
  end

  def single(number)
    names[lang]["single"][number]
  end

  def two_words(number)
    return single number if number <= 19
    number_name = names[lang]["two_words"][number / 10]
    number_name += " " + single(number % 10) if (number % 10 != 0)
    number_name
  end
end
