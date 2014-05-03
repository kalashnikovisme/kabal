require 'kabal/languages/language'

class Kabal::English < Kabal::Language
  def convert(number)
    return single number if number >= 0 and number <= 19
    return two_words number if number >= 0 and number <= 99
    return three_words number if number >= 100 and number <= 999
    ten_powers number if number >= 100
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

  def three_words(number)
    return two_words number if number <= 99
    number_name = single(number / 100) + " " + names[lang]["ten_powers"][2]
    number_name += " " + two_words(number % 100) if (number % 100 >= 10)
    number_name += " and " + single(number % 100) if (number % 100 < 10)
    number_name
  end

  def ten_powers(number)
    if @number_name.nil?
      @number_name = count_name(number) + " " + names[lang]["ten_powers"][number_order]
    elsif count(number) != 0
      @number_name += count_name(number) + " " + names[lang]["ten_powers"][number_order]
    end
  end

  def number_order(number)
    ((number.to_s.length - 1) / 3) * 3
  end

  def count(number)
    number / (10 ** number_order(number))
  end

  def count_name(number)
    three_words count(number)
  end
end
