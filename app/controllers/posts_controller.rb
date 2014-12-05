class PostsController < ApplicationController
  before_action :logged_in_user,  only:    [:create, :destroy]
  before_action :correct_user,    only:    [:edit, :update]

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to current_user, notice: 'Post criado!' }
        format.json { render :show, status: :created, location: @post }
      else
        #format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :type_post_id)
    end
end
