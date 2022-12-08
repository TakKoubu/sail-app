class saleCommentsController < ApplicationController
  before_action :set_sale_comment, only: %i[ show edit update destroy ]

  # GET /sale_comments or /sale_comments.json
  def index
    @sale_comments = saleComment.all
  end

  # GET /sale_comments/1 or /sale_comments/1.json
  def show
  end

  # GET /sale_comments/new
  def new
    @sale_comment = saleComment.new
    @sale = sale.find(params[:sale_id])
  end

  # GET /sale_comments/1/edit
  def edit
  end

  # POST /sale_comments or /sale_comments.json
  def create
    sale = sale.find(params[:sale_id])
    sale.sale_comments.build(sale_comment_params)
    # @sale_comment = saleComment.new(sale_comment_params)

    respond_to do |format|
      if sale.save
        format.html { redirect_to sales_url, notice: "sale comment was successfully created." }
        # format.json { render :show, status: :created, location: @sale_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @sale_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_comments/1 or /sale_comments/1.json
  def update
    respond_to do |format|
      if @sale_comment.update(sale_comment_params)
        format.html { redirect_to sale_comment_url(@sale_comment), notice: "sale comment was successfully updated." }
        format.json { render :show, status: :ok, location: @sale_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_comments/1 or /sale_comments/1.json
  def destroy
    @sale_comment.destroy

    respond_to do |format|
      format.html { redirect_to sale_comments_url, notice: "sale comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_comment
      @sale_comment = saleComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_comment_params
      params.require(:sale_comment).permit(:content, :sale_id)
    end
end
