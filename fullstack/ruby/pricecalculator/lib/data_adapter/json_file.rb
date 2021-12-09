require 'json'

module DataAdapter
  class JSONFile
    def self.parse(file_path)
      file = File.read(file_path)
      JSON.parse(file)
    end
  end
end
