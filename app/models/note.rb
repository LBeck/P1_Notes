class Note < ActiveRecord::Base

  # def self.display_all
  #   Note.all.each do |note|
  #     puts note
  #   end
  # end

  def self.display_all
    Note.all.each do |note|
      note.content
    end
  end
  # Remember to create a migration!
end
