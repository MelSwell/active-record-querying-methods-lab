class Show < ActiveRecord::Base

  def self.highest_rating
    ratings = Show.all.map { |show| show.rating }
    ratings.sort { |show_a, show_b| show_b <=> show_a }.first
  end

  def self.most_popular_show
    Show.all.select { |show| show.rating == self.highest_rating }.first
  end

  def self.lowest_rating
    ratings = Show.all.map { |show| show.rating }
    ratings.sort { |show_a, show_b| show_a <=> show_b }.first
  end

  def self.least_popular_show
    Show.all.select { |show| show.rating == self.lowest_rating }.first
  end

  def self.ratings_sum
    Show.all.map { |show| show.rating }.sum
  end

  def self.popular_shows
    Show.all.select { |show| show.rating > 5 }
  end

  def self.shows_by_alphabetical_order
    Show.all.sort { |show_a, show_b| show_a.name <=> show_b.name }
  end

end