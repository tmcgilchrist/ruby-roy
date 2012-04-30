module Roy
  module Source
    def self.bundled_path
      File.expand_path("../bundled-roy.js", __FILE__)
    end
  end
end
