require_relative "../views/pilots_view"

class PilotsController
  def initialize
    @view = PilotsView.new
  end

  def index
      all_pilots = Pilot.all
      @view.show_all_pilots(all_pilots)
  end

  # def create
  #   # DO NOT WRITE SQL QUERIES
  #   # TODO: create a post
  #   post = Post.create(title: @view.ask_new_post_title.to_s, url: @view.ask_new_post_url.to_s)
  #   post.save
  # end

  # def update
  #   # DO NOT WRITE SQL QUERIES
  #   # TODO: update a post
  #   index
  #   post = Post.find(@view.ask_post_index)

  #   case @view.ask_what_column_update
  #   when "title"
  #     post.title = @view.user_update_column.to_s
  #     post.save
  #   when "url"
  #     post.url = @view.user_update_column.to_s
  #     post.save
  #   end
  # end

  # def destroy
  #   # DO NOT WRITE SQL QUERIES
  #   # TODO: destroy a post
  #   index
  #   post = Post.find(@view.ask_post_index)
  #   post.destroy
  # end

  # def upvote
  #   # DO NOT WRITE SQL QUERIES
  #   # TODO: increment the `votes` column for a post
  #   index
  #   post = Post.find(@view.ask_post_index)

  #   post.votes.nil? ? post.votes = 1 : post.votes += 1
  #   post.save
  # end
end