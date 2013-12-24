class AnycdotesController < ApplicationController
  before_action :set_anycdote, only: [:show, :edit, :update, :destroy]

  def index
    @anycdotes = Anycdote.all
  end

  def show
  end
  def new
    @anycdote = Anycdote.new
  end
  def edit
  end

  def create
    @anycdote = Anycdote.new(anycdote_params)

    respond_to do |format|
      if @anycdote.save
        redirect_to @anycdote, notice: 'Anycdote was successfully created.' 
      else
      render action: 'new'
      end
    end
  end

  def update
    respond_to do |format|
      if @anycdote.update(anycdote_params)
        redirect_to @anycdote, notice: 'Anycdote was successfully updated.' 
      else
        render action: 'edit' 
      end
    end
  end

  def destroy
    @anycdote.destroy
      redirect_to anycdotes_url 
    end
  end

  private
    def set_anycdote
      @anycdote = Anycdote.find(params[:id])
    end
    def anycdote_params
      params.require(:anycdote).permit(:title, :story, :location,)
    end
end
