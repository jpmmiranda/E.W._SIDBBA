class InicialController < ApplicationController
  respond_to :js, :html

	def index
  @hash = Gmaps4rails.build_markers(Locai.all) do |telemetry_recording, marker|
     marker.lat telemetry_recording.local_latitude
     marker.lng telemetry_recording.local_longitude
  end
end
	

end
