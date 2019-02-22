class PostsView

  def show_all_pilots(all_pilots)
    all_pilots.each do |pilot|
      puts "#{pilot.pilot_code} - #{pilot.name}"
    end
  end
end