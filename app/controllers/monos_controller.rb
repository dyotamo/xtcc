class MonosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_mono, only: [:show, :edit, :update, :destroy]

  # GET /monos
  def index
    if Mono.column_names.include?(params[:sort])
      sort = params[:sort]
    else
      sort = :created_at
    end

    @monos = Mono.order(sort)
      .reverse_order
      .paginate(:page => params[:page], :per_page => 20)
  end

  # GET /monos/1
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
  def create
    @mono = Mono.new(mono_params)

    respond_to do |format|
      if @mono.save
        # Remove requisition object
        Requisition.find_by(url: @mono.url).destroy
        format.html { redirect_to @mono, notice: "Monografia indexada com sucesso." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /monos/1
  def update
    respond_to do |format|
      if @mono.update(mono_params)
        format.html { redirect_to @mono, notice: "Monografia actualizada com sucesso." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /monos/1
  def destroy
    @mono.destroy
    respond_to do |format|
      format.html { redirect_to monos_url, notice: "Monografia eliminado com sucesso." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mono
    @mono = Mono.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mono_params
    params.require(:mono).permit(:title, :year, :author, :abstract, :url,
                                 :college_id, :course_id)
  end
end
