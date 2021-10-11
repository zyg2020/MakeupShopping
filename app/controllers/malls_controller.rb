class MallsController < ApplicationController
  before_action :set_mall, only: %i[show edit update destroy]

  # GET /malls or /malls.json
  def index
    @malls = Mall.paginate(page: params[:page], per_page: 20)
  end

  # GET /malls/1 or /malls/1.json
  def show; end

  # GET /malls/new
  def new
    @mall = Mall.new
  end

  # GET /malls/1/edit
  def edit; end

  # POST /malls or /malls.json
  def create
    @mall = Mall.new(mall_params)

    respond_to do |format|
      if @mall.save
        format.html { redirect_to @mall, notice: "Mall was successfully created." }
        format.json { render :show, status: :created, location: @mall }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /malls/1 or /malls/1.json
  def update
    respond_to do |format|
      if @mall.update(mall_params)
        format.html { redirect_to @mall, notice: "Mall was successfully updated." }
        format.json { render :show, status: :ok, location: @mall }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /malls/1 or /malls/1.json
  def destroy
    @mall.destroy
    respond_to do |format|
      format.html { redirect_to malls_url, notice: "Mall was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mall
    @mall = Mall.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mall_params
    params.require(:mall).permit(:name, :city, :lat, :lng)
  end
end
