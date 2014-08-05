module Kabal
  module RussianRules
    module Declinations
      def self.name_with_declination(number_name, count)
        if count.to_s.include? 'e'
          count = count.to_s.split('.')[0].to_i
        end
        # FIXME add gem russian
        if number_name[-1, 1] == 'а'
          return number_name if ends_with_one? count
          return number_name[0..4] + 'и' if end_with_two_or_three_of_four? count
          number_name[0..4]
        elsif number_name[-1, 1] == 'я'
          return number_name if ends_with_one? count
          number_name[0..-3] + 'ых'
        else
          return number_name if ends_with_one? count
          return number_name + 'а' if end_with_two_or_three_of_four? count
          number_name + 'ов'
        end
      end

      def self.ends_with_one?(count)
        count.to_s[-1] == '1' && (count % 100) / 10 != 1
      end

      def self.end_with_two_or_three_of_four?(count)
        count.to_s[-1] == '2' || count.to_s[-1] == '3' || count.to_s[-1] == '4'
      end
    end
  end
end
