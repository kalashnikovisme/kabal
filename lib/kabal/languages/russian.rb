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
    if number / 10 == 0
      return single number
    end
    number_name = names[lang]["two_words"][number / 10]
    number_name += " " + single(number % 10) if (number % 10 != 0)
    number_name
  end

  def self.three_words(number)
    if number / 100 == 0
      return two_words number
    end
    number_name = names[lang]["three_words"][number / 100]
    return number_name += " " + two_words(number % 100) if (number % 100 >= 20)
    return number_name += " " + single(number % 100) if (number % 100 != 0)
    number_name
  end

  def self.ten_powers(number)
    #FIXME find better way
    number_order = ((number.to_s.length - 1) / 3) * 3
    number_name = count_name(number) + " " + names[lang]["ten_powers"][number_order]
    number_name += " " + three_words(number % 1000) if (number % 1000 >= 100)
  end

  def self.count_name(number)
    #FIXME find better way
    number_order = ((number.to_s.length - 1) / 3) * 3
    count = number / (10 ** number_order)
    if (count % 10 == 1 or count % 10 == 2) and number_order == 3
      names[lang]["single_feminine"][count]
    else
      three_words count
    end
  end
end
