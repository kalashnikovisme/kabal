require 'kabal/languages/language'

class Kabal::English < Kabal::Language
  def convert_number(number)
    if need_minus? number
      minus + " " + number_words(-number)
    else
      number_words number
    end
  end
  def number_words(number)
    return single number if number >= 0 and number <= 19
    return two_words number if number >= 0 and number <= 99
    return three_words number if number >= 100 and number <= 999
    ten_powers number if number >= 100
  end
  def natural_number_name(number)
    #FIXME switch case next lines
    return single(number) if number >= 0 and number <= 19
    return two_words(number) if number >= 20 and number <= 99
    return three_words(number) if number >= 100 and number <= 999
    ten_powers(number) if number >= 1000
  end

  def single(number)
    names["single"][number]
  end

  def two_words(number)
    return single number if number <= 19
    number_name = names["two_words"][number / 10]
    number_name += " " + single(number % 10) if (number % 10 != 0)
    number_name
  end

  def three_words(number)
    return two_words number if number <= 99
    number_name = single(number / 100) + " " + names["ten_powers"][2]
    number_name += " " + two_words(number % 100) if (number % 100 >= 10)
    number_name += " and " + single(number % 100) if (number % 100 < 10)
    number_name
  end

  def ten_powers(number)
    less_thousands number if number_is_thousands? number
    return @number_name if number_is_thousands? number
    create_number_name number
    ten_powers number % (10 ** number_order(number))
  end

  def create_number_name(number)
    if @number_name.nil?
      @number_name = count_name(number) + " " + names["ten_powers"][number_order(number)]
    elsif count(number) != 0
      @number_name += " " + count_name(number) + " " + names["ten_powers"][number_order(number)]
    end
  end

  def count_name(number)
    three_words count(number)
  end

  def less_thousands(number)
    @number_name += " and" if number < 100
    @number_name += " " + three_words(number % 1000) unless number == 0
  end
end
