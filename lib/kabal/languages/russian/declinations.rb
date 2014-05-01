class Declinations
  def self.name_with_declination(ten_power_name, count)
    if ten_power_name[-1, 1] == "а"
      Russian.p(count, ten_power_name, ten_power_name[0..4] + "и", ten_power_name[0..4])
    else
      Russian.p(count, ten_power_name, ten_power_name + "а", ten_power_name + "ов")
    end
  end
end
