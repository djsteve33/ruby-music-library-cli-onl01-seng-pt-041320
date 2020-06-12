class MusicLibraryController

  def initialize(path = "./db/mp3s")
   importer = MusicImporter.new(path)
   importer.import
  end

  def call
    #input = " "
     input = gets.strip
    while input != "exit"
    puts "Welcome to your Music Library!"
    puts "What would you like to do?"
   end
  end
end