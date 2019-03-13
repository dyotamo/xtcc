class MonosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_mono, only: [:show, :edit, :update, :destroy]

  # GET /monos
  # GET /monos.json
  def index
    @monos = Mono.order(:created_at).reverse_order.paginate(:page => params[:page],
                                                            :per_page => 10)
  end

  # GET /monos/1
  # GET /monos/1.json
  def show
  end

  # GET /monos/new
  def new
    @mono = Mono.new
  end

  # GET /monos/1/edit
  def edit
  end

  # POST /monos
  # POST /monos.json
  def create
    @mono = Mono.new(mono_params)
    @mono.user = current_user

    respond_to do |format|
      if @mono.save
        format.html { redirect_to @mono, notice: "Mono was successfully created." }
        format.json { render :show, status: :created, location: @mono }
      else
        format.html { render :new }
        format.json { render json: @mono.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monos/1
  # PATCH/PUT /monos/1.json
  def update
    @mono.user = current_user
    respond_to do |format|
      if @mono.update(mono_params)
        format.html { redirect_to @mono, notice: "Mono was successfully updated." }
        format.json { render :show, status: :ok, location: @mono }
      else
        format.html { render :edit }
        format.json { render json: @mono.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monos/1
  # DELETE /monos/1.json
  def destroy
    @mono.destroy
    respond_to do |format|
      format.html { redirect_to monos_url, notice: "Mono was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mono
    @mono = Mono.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mono_params
    params.require(:mono).permit(:title, :year, :author, :abstract,
                                 :college_id, :course_id, :document, :user)
  end
end
