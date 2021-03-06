class CollegesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_college, only: [:show, :edit, :update, :destroy]

  # GET /colleges
  # GET /colleges.json
  def index
    @colleges = College.order(:name).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /colleges/1
  # GET /colleges/1.json
  def show
    @monos = @college.monos.order(:created_at).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /colleges/new
  def new
    @college = College.new
  end

  # GET /colleges/1/edit
  def edit
  end

  # POST /colleges
  # POST /colleges.json
  def create
    @college = College.new(college_params)

    respond_to do |format|
      if @college.save
        format.html { redirect_to @college, notice: "Universidade indexada com sucesso." }
        format.json { render :show, status: :created, location: @college }
      else
        format.html { render :new }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colleges/1
  # PATCH/PUT /colleges/1.json
  def update
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to @college, notice: "Universidade actualizada com sucesso." }
        format.json { render :show, status: :ok, location: @college }
      else
        format.html { render :edit }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colleges/1
  # DELETE /colleges/1.json
  def destroy
    @college.destroy
    respond_to do |format|
      format.html { redirect_to colleges_url, notice: "Universidade eliminada com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_college
    @college = College.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def college_params
    params.require(:college).permit(:name)
  end
end
