class Declinations
  def self.name_with_declination(ten_power_name, count)
    if ten_power_name[-1, 1] == "а"
      return ten_power_name if ends_with_one? count
      return ten_power_name[0..4] + "и" if end_with_two_or_three_of_four? count
      ten_power_name[0..4]
    else
      return ten_power_name if ends_with_one? count
      return ten_power_name + "а" if end_with_two_or_three_of_four? count
      ten_power_name + "ов"
    end
  end

  def self.ends_with_one?(count)
    count.to_s[-1] == "1"
  end

  def self.end_with_two_or_three_of_four?(count)
    count.to_s[-1] == "2" or count.to_s[-1] == "3" or count.to_s[-1] == "4"
  end
end
