class StaticController < ApplicationController
  def homepage
    @featured_ads = Ad.featured.limit(10)
  end
end
