class StaticPagesController < ApplicationController

  before_action :get_tour_images
  before_action :get_background_image

  def home
  end

  def about
  end

  def reviews
  end

  def tours
  end

  def blog
  end

  def get_tour_images
    places = ['ahilya', 'andaman', 'assam', 'baku', 'borneo', 'hampi',
              'iceland', 'japan', 'mandu', 'orissa', 'samarkand', 'saputara']
    @tour_images = places.map { |place| "tours/#{place}.jpg" }
    @tour_captions = places.map{ |place| place.capitalize }
  end

  def get_background_image
    @background_image = "earth.jpg"
  end



end
