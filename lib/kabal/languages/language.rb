require 'kabal/languages/global/fractional_numbers'
require 'kabal/languages/global/natural_numbers'
require 'kabal/languages/global/number_properities'

module Kabal
  class Language
    include Kabal::GlobalRules::NaturalNumbers
    include Kabal::GlobalRules::FractionalNumbers
    include Kabal::GlobalRules::NumberProperities

    def initialize
      @names = Kabal::Config::YamlLoader.yaml_object "languages/#{lang}"
      support_file = Kabal::Config::YamlLoader.yaml_object('support')
      @supports = support_file[:support][lang]
    end

    def convert(number)
      if no_supports? number
        error number
      else
        convert_number number
      end
    end

    def convert_number(number)
      @number_name = nil
      if need_minus? number
        join_with_spaces minus, number_words(-number)
      else
        number_words number
      end
    end

    #COMB THIS SHIT!!!
    def reverse_convert(text)
      words = text.split(' ').reverse
      numbers = []
      words.each_ do |word|
        [:single, :two_words, :ten_powers].each do |key|
          names[key].each do |name|
            if word == name.last
              numbers << name.first
            end
          end
        end
      end
      numbers.join('').to_i
    end

    def number_words(number)
      return natural_number_name number.round if natural? number
      fractional_number_name number if fractional? number
    end

    def error(number)
      if number_is_out_of_the_range? number
        Kabal::Errors::NumberOutRangeError.new
      elsif (!supports_fractional?) && (number % 1 != 0)
        Kabal::Errors::NoSupportForFractionalNumberOnCurrentLanguages.new
      end
    end

    def lang
      languages = Kabal::Config::YamlLoader.yaml_object 'languages'
      @lang = languages[self.to_s.split(':')[-2]]
    end

    def supports_natural?
      @supports[:natural]
    end

    def supports_negative?
      min_value < 0
    end

    def supports_reverse?
      @supports[:reverse]
    end

    def min_value
      eval @supports[:natural][:min]
    end

    def max_value
      eval @supports[:natural][:max]
    end

    def names
      @names[lang]
    end

    def minus
      names[:minus]
    end

    def whole
      names[:whole]
    end

    def dot
      names[:dot]
    end

    def number_order(number)
      ((number.to_s.length - 1) / 3) * 3
    end

    def count(number)
      number / (10**number_order(number))
    end

    def supports_fractional?
      @supports[:fractional]
    end

    def number_is_out_of_the_range?(number)
      number >= max_value || number <= min_value
    end

    def fractional_but_no_support_fractional?(number)
      fractional?(number) && !supports_fractional?
    end

    def no_supports?(number)
      fractional_but_no_support_fractional?(number) || number_is_out_of_the_range?(number)
    end

    def space
      ' '
    end

    def join_with_spaces(*words)
      words.to_a.join space
    end
  end
end
