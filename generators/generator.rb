module Generator
  def templates_path
    "#{File.dirname(__FILE__)}/templates/"
  end
  def gem_root
    File.dirname(__FILE__).gsub(/generators/, '')
  end
end
