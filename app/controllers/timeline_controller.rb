class TimelineController < ApplicationController
	def index
    @events = Sorter.group_by_date
	end
end
