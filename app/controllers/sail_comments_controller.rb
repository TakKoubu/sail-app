class SailCommentsController < ApplicationController
  before_action :set_sail_comment, only: %i[ show edit update destroy ]

  # GET /sail_comments or /sail_comments.json
  def index
    @sail_comments = SailComment.all
  end

  # GET /sail_comments/1 or /sail_comments/1.json
  def show
  end

  # GET /sail_comments/new
  def new
    @sail_comment = SailComment.new
    @sail = Sail.find(params[:sail_id])
  end

  # GET /sail_comments/1/edit
  def edit
  end

  # POST /sail_comments or /sail_comments.json
  def create
    sail = Sail.find(params[:sail_id])
    sail.sail_comments.build(sail_comment_params)
    # @sail_comment = SailComment.new(sail_comment_params)

    respond_to do |format|
      if sail.save
        format.html { redirect_to sails_url, notice: "Sail comment was successfully created." }
        # format.json { render :show, status: :created, location: @sail_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @sail_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sail_comments/1 or /sail_comments/1.json
  def update
    respond_to do |format|
      if @sail_comment.update(sail_comment_params)
        format.html { redirect_to sail_comment_url(@sail_comment), notice: "Sail comment was successfully updated." }
        format.json { render :show, status: :ok, location: @sail_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sail_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sail_comments/1 or /sail_comments/1.json
  def destroy
    @sail_comment.destroy

    respond_to do |format|
      format.html { redirect_to sail_comments_url, notice: "Sail comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sail_comment
      @sail_comment = SailComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sail_comment_params
      params.require(:sail_comment).permit(:content, :sail_id)
    end
end
