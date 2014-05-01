require 'kabal/languages/language'

class Kabal::Russian < Kabal::Language
  def convert(number)
    return single(number) if number >= 0 and number <= 19
    return two_words(number) if number >= 20 and number <= 99
    return three_words(number) if number >= 100 and number <= 999
    ten_powers(number) if number >= 1000
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
    if number / 100 == 0
      return two_words number
    end
    number_name = names[lang]["three_words"][number / 100]
    return number_name += " " + two_words(number % 100) if (number % 100 >= 20)
    return number_name += " " + single(number % 100) if (number % 100 != 0)
    number_name
  end

  def ten_powers(number)
    #FIXME find better way
    number_order = ((number.to_s.length - 1) / 3) * 3
    if number_order < 3
      unless number == 0
        @number_name += " " + three_words(number % 1000)
      end
      return @number_name
    end
    count = number / (10 ** number_order)
    if number_is_google?(number_order, count)
      return names[lang]["ten_powers"][100]
    end
    if @number_name.nil?
      @number_name = count_name(count, number_order) + " " + name_with_declination(count, names[lang]["ten_powers"][number_order])
    elsif count != 0
      @number_name += " " + count_name(count, number_order) + " " + name_with_declination(count, names[lang]["ten_powers"][number_order])
    end
    ten_powers(number % (10 ** number_order))
  end

  def count_name(count, number_order)
    #FIXME find better way
    if (count % 10 == 1 or count % 10 == 2) and number_order == 3
      names[lang]["single_feminine"][count]
    else
      three_words count
    end
  end

  def name_with_declination(count, ten_power_name)
    if ten_power_name[-1, 1] == "а"
      Russian.p(count, ten_power_name, ten_power_name[-1, 1] = "и", ten_power_name[0..4])
    else
      Russian.p(count, ten_power_name, ten_power_name + "а", ten_power_name + "ов")
    end
  end

  def number_is_google?(number_order, count)
    count == 10 and number_order == 99
  end
end
