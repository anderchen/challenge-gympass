require_relative "../views/pilots_view"

class PilotsController
  def initialize
    @view = PilotsView.new
  end

  def index
      all_pilots = Pilot.all
      @view.show_all_pilots(all_pilots)
  end
end