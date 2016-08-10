class Actor < ActiveRecord::Base

  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles

    character_name_array = []
    self.characters.each do |character|
      character_name_array << character.name
    end

    show_name_array =[]
    self.shows.each do |show|
      show_name_array << show.name
    end

    var = character_name_array.zip show_name_array
    var.join(" - ")
    
  end

end
