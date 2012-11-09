class CommentController < ApplicationController
  def index
    @titulo = "Comentarios"
    @comments = Comment.find_by_post_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comment/new
  # GET /comment/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # POST /comment
  # POST /comment.json
  def create
    @comment = Comment.new

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comentario was successfully created.' }
        format.json { render json: @comment, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
