class GistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gist, only: [:edit, :update, :destroy]

  # GET /gists
  # GET /gists.json
  def index
    @gists = Gist.opened
  end

  # GET /gists/1
  # GET /gists/1.json
  def show
    @gist = Gist.find(params[:id])
  end

  # GET /gists/new
  def new
    @gist = current_user.gists.new
  end

  # GET /gists/1/edit
  def edit
  end

  # POST /gists
  # POST /gists.json
  def create
    @gist = current_user.gists.create(gist_params)

    respond_to do |format|
      if @gist.save
        format.html { redirect_to @gist, notice: 'Gist was successfully created.' }
        format.json { render :show, status: :created, location: @gist }
      else
        format.html { render :new }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gists/1
  # PATCH/PUT /gists/1.json
  def update
    respond_to do |format|
      if @gist.update(gist_params)
        format.html { redirect_to @gist, notice: 'Gist was successfully updated.' }
        format.json { render :show, status: :ok, location: @gist }
      else
        format.html { render :edit }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gists/1
  # DELETE /gists/1.json
  def destroy
    @gist.destroy
    respond_to do |format|
      format.html { redirect_to gists_url, notice: 'Gist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gist
      @gist = current_user.gists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gist_params
      params.require(:gist).permit(:description, :content, :private)
    end
end
