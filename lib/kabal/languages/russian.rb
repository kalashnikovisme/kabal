require 'kabal/languages/language'
require 'kabal/languages/russian/declinations'

class Kabal::Russian < Kabal::Language
  def convert(number)
    #FIXME find way to get min and max from yml file
    raise NumberOutRangeError.message if number < 0 or number >= 10 ** 102
    #FIXME switch case next lines
    return single(number) if number >= 0 and number <= 19
    return two_words(number) if number >= 20 and number <= 99
    return three_words(number) if number >= 100 and number <= 999
    ten_powers(number) if number >= 1000
  end

  def single(number)
    if @feminine_name_for_thousands
      @feminine_name_for_thousands = false
      return names[lang]["single_feminine"][count(number) % 10]
    end
    names[lang]["single"][number]
  end

  def two_words(number)
    return single number if number <= 19
    number_name = names[lang]["two_words"][number / 10]
    number_name += " " + single(number % 10) if (number % 10 != 0)
    number_name
  end

  def three_words(number)
    return two_words number if number / 100 == 0
    number_name = names[lang]["three_words"][number / 100]
    return number_name += " " + two_words(number % 100) if (number % 100 >= 20)
    return number_name += " " + single(number % 100) if (number % 100 != 0)
    number_name
  end

  def ten_powers(number)
    #FIXME find better way
    return names[lang]["ten_powers"][100] if number_is_google? number
    less_thousands number if number_is_thousands? number
    return @number_name if number_is_thousands? number
    create_number_name number
    ten_powers(number % (10 ** number_order(number)))
  end

  def number_order(number)
    ((number.to_s.length - 1) / 3) * 3
  end

  def count(number)
    number / (10 ** number_order(number))
  end

  def create_number_name(number)
    if @number_name.nil?
      @number_name = count_name(number) + " " + Declinations.name_with_declination(names[lang]["ten_powers"][number_order(number)], count(number))
    elsif count(number) != 0
      @number_name += " " + count_name(number) + " " + Declinations.name_with_declination(names[lang]["ten_powers"][number_order(number)], count(number))
    end
  end

  def less_thousands(number)
    unless number == 0
      @number_name += " " + three_words(number % 1000)
    end
  end

  def number_is_thousands?(number)
    number_order(number) < 3
  end

  def count_name(number)
    #FIXME number.to_S[-4] not good
    @feminine_name_for_thousands = (number.to_s[-4] == "1" or number.to_s[-4] == "2") and count(number) and count(number) / 10 != 1 and number_order(number) == 3
    three_words count(number)
  end

  def number_is_google?(number)
    count(number) == 10 and number_order(number) == 99
  end
end
