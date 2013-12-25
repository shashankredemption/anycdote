class AnycdotesController < ApplicationController
  before_action :set_anycdote, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @anycdotes = Anycdote.all
  end

  def show
  end
  
  def new
    @anycdote = current_user.anycdotes.build
  end
  
  def edit
  end

  def create
    @anycdote = current_user.anycdotes.build(anycdote_params)
      if @anycdote.save
        redirect_to @anycdote, notice: 'Anycdote was successfully created.' 
      else
      render action: 'new'
      end
  end

  def update
      if @anycdote.update(anycdote_params)
        redirect_to @anycdote, notice: 'Anycdote was successfully updated.' 
      else
        render action: 'edit' 
      end
  end

  def destroy
    @anycdote.destroy
      redirect_to anycdotes_url 
  end

  private
    def set_anycdote
      @anycdote = Anycdote.find(params[:id])
    end

  def correct_user
      @anycdote = current_user.anycdotes.find_by(id: params[:id])
      redirect_to anycdotes_path, notice: "Not authorized to edit this anycdote" if @anycdote.nil?
  end

    def anycdote_params
      params.require(:anycdote).permit(:title, :story, :location,)
    end
end
