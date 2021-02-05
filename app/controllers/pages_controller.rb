class PagesController < ApplicationController
  def home
    # @event = Event.last
    @event = Event.where("location->>'en' = 'florence'").first
  end
end
