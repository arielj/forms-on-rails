class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    if params[:operation] == "preview"
      render :new
    else
      if @post.save
        if params[:operation] == "save_and_add_new"
          redirect_to new_post_url, notice: "Post was successfully created."
        else
          redirect_to post_url(@post), notice: "Post was successfully created."
        end
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.attributes = post_params

    if params[:operation] == "preview"
      render :edit
    else
      if @post.save
        redirect_to post_url(@post), notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
