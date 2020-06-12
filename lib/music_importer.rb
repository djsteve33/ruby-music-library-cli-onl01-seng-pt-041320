class MusicImporter
  attr_reader :path, :files
  
  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
  def files
    @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "")}
  end
  
  def import 
    files.each do |file_name|Song.create_from_filename(file_name)
    end
  end
  
end